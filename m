From: Anmol karn <anmol.karan123@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: rose: Fix Null pointer
 dereference in rose_send_frame()
Date: Sun, 8 Nov 2020 00:32:11 +0530
Message-ID: <CAC+yH-ZCcL=D-ExzXSedRWL2Jq5DY-1tRqP82MjhnBpuKbtONA@mail.gmail.com>
References: <20201105155600.9711-1-anmol.karan123@gmail.com> <20201107185654.4339-1-anmol.karan123@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=soRNlc/K6cVluQ0+VaeOOXxw2r7plkvcC+reHxKQUx4=;
        b=bsKVuUwXgaCLddOnkSoCSlZQdNoGIm5R9XzwGw4xELX/hCS4M3IHaDAXT1Kq5gfTmq
         yI5wo4MevNnQkkFUgvSP57zaP48d6vpbrCpenDjCDuGcNvjbECT7yhwXKJeCzUC+y1rY
         SWHHMolvi1R2mpcQ2vqDR5VaLnpnbkDObMWz59mhHEaw/aoxBC++LT99MNWNgrgKLDbI
         u62GipruMVYvivCT7vMRsTGV7OjcKYlAUM5MRsCaFvXgIevCl1h8rueTe0/fv61rXK1l
         ygXSXvdIvKJdo/WE4kcXbP/XeRTCUFLrmysh3G5endpMgEI9IHIaJ0bPQM4SOFa0nSID
         Aryg==
In-Reply-To: <20201107185654.4339-1-anmol.karan123@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Saeed Mahameed <saeed@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, netdev <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, syzkaller-bugs@googlegroups.com, syzbot <syzbot+a1c743815982d9496393@syzkaller.appspotmail.com>

Hello,

Sorry for this wrong subject(It should be v3 instead of v2),
please ignore this patch.

I will send a new one with the corrected subject.

Thanks,
Anmol

On Sun, Nov 8, 2020 at 12:27 AM Anmol Karn <anmol.karan123@gmail.com> wrote:
>
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
> ---
> Changes in v3:
>         - Corrected checkpatch warnings and errors (Suggested-by: Saeed Mahameed <saeed@kernel.org>)
>         - Added "Fixes:" tag (Suggested-by: Saeed Mahameed <saeed@kernel.org>)
> Changes in v2:
>         - Added NULL check in rose_loopback_timer() (Suggested-by: Greg KH <gregkh@linuxfoundation.org>)
>
>  net/rose/rose_loopback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
> index 7b094275ea8b..2c51756ed7bf 100644
> --- a/net/rose/rose_loopback.c
> +++ b/net/rose/rose_loopback.c
> @@ -96,7 +96,8 @@ static void rose_loopback_timer(struct timer_list *unused)
>                 }
>
>                 if (frametype == ROSE_CALL_REQUEST) {
> -                       if ((dev = rose_dev_get(dest)) != NULL) {
> +                       dev = rose_dev_get(dest);
> +                       if (rose_loopback_neigh->dev && dev) {
>                                 if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
>                                         kfree_skb(skb);
>                         } else {
> -
> 2.29.2
>
