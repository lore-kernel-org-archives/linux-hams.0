From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v4 net] rose: Fix Null pointer
 dereference in rose_send_frame()
Date: Sat, 14 Nov 2020 11:18:38 -0800
Message-ID: <20201114111838.03b933af@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20201110194518.GA97719@Thinkpad>
        <20201111165954.14743-1-anmol.karan123@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605381519;
        bh=XeWIoRdu3Vh6vI8C5YoHUTBLPxwLTyEekVkd5XX4N2g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UbQG5JPNXscaruzdvVD5th4tLGHg9bWZta0FCSu4QF/WeN+J2imau9P98bqPcy2fX
         Z5xZbgoFjBK6OgW6DAv62jQav1sBqqTkQpai33lY7+lE+Zm3Url9ztLgKDwOHN2Yep
         0uLtgQu8frIHbM8+yZ9GHdHamVrJvV61SgzzuyGk=
In-Reply-To: <20201111165954.14743-1-anmol.karan123@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anmol Karn <anmol.karan123@gmail.com>
Cc: ralf@linux-mips.org, davem@davemloft.net, saeed@kernel.org, gregkh@linuxfoundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, syzkaller-bugs@googlegroups.com, syzbot+a1c743815982d9496393@syzkaller.appspotmail.com

On Wed, 11 Nov 2020 22:29:54 +0530 Anmol Karn wrote:
> rose_send_frame() dereferences `neigh->dev` when called from
> rose_transmit_clear_request(), and the first occurrence of the
> `neigh` is in rose_loopback_timer() as `rose_loopback_neigh`,
> and it is initialized in rose_add_loopback_neigh() as NULL.
> i.e when `rose_loopback_neigh` used in rose_loopback_timer()
> its `->dev` was still NULL and rose_loopback_timer() was calling
> rose_rx_call_request() without checking for NULL.
> 
> - net/rose/rose_link.c
> This bug seems to get triggered in this line:
> 
> rose_call = (ax25_address *)neigh->dev->dev_addr;
> 
> Fix it by adding NULL checking for `rose_loopback_neigh->dev`
> in rose_loopback_timer().
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
> Tested-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3
> Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>

> diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
> index 7b094275ea8b..6a71b6947d92 100644
> --- a/net/rose/rose_loopback.c
> +++ b/net/rose/rose_loopback.c
> @@ -96,10 +96,12 @@ static void rose_loopback_timer(struct timer_list *unused)
>  		}
> 
>  		if (frametype == ROSE_CALL_REQUEST) {
> -			if ((dev = rose_dev_get(dest)) != NULL) {
> +			dev = rose_dev_get(dest);
> +			if (rose_loopback_neigh->dev && dev) {
>  				if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
>  					kfree_skb(skb);
>  			} else {
> +				dev_put(dev);
>  				kfree_skb(skb);
>  			}
>  		} else {

This is still not correct. With this code dev_put() could be called with
NULL, which would cause a crash.

There is also a dev_put() missing if rose_rx_call_request() returns 0.

I think that this is the correct code:

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 7b094275ea8b..ff252ef73592 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -96,11 +96,22 @@ static void rose_loopback_timer(struct timer_list *unused)
 		}
 
 		if (frametype == ROSE_CALL_REQUEST) {
-			if ((dev = rose_dev_get(dest)) != NULL) {
-				if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
-					kfree_skb(skb);
-			} else {
+			if (!rose_loopback_neigh->dev) {
 				kfree_skb(skb);
+				continue;
+			}
+
+			dev = rose_dev_get(dest);
+			if (!dev) {
+				kfree_skb(skb);
+				continue;
+			}
+
+			if (rose_rx_call_request(skb, dev, rose_loopback_neigh,
+						 lci_o) == 0) {
+				dev_put(dev);
+				kfree_skb(skb);
 			}
 		} else {
 			kfree_skb(skb);

Please test this and resubmit it if it works.
