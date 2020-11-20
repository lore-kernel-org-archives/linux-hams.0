From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v5 net] rose: Fix Null pointer
 dereference in rose_send_frame()
Date: Fri, 20 Nov 2020 10:06:12 -0800
Message-ID: <20201120100612.62d9d770@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20201115114448.GA40574@Thinkpad>
        <20201119191043.28813-1-anmol.karan123@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605895574;
        bh=5QsJhiNlDYF6e5+XXwRtT9R/LRbCv501uDAH0fgcN0Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KYlbryWpufKcNB1iYssy8CcD1+/3Gqqh2EdgFmZ9rTm6f4AXmNUy1gjQvi6APx9PN
         r1AmcaO7XP5Y1fOxjaLen/tWVjpFkEzsN+vCD9HbgGQJ5gIbMizYt3/SxLds3QVXjh
         6sY9n3QbkPvlEyGj3Ok3Z22jd+4VvnGPpHqfme3w=
In-Reply-To: <20201119191043.28813-1-anmol.karan123@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anmol Karn <anmol.karan123@gmail.com>
Cc: ralf@linux-mips.org, davem@davemloft.net, saeed@kernel.org, gregkh@linuxfoundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, syzkaller-bugs@googlegroups.com, syzbot+a1c743815982d9496393@syzkaller.appspotmail.com

On Fri, 20 Nov 2020 00:40:43 +0530 Anmol Karn wrote:
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
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
> Tested-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3
> Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>

Applied to net, thanks!
