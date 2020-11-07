From: Anmol Karn <anmol.karan123@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 net] rose: Fix Null pointer
 dereference in rose_send_frame()
Date: Sat, 7 Nov 2020 13:50:41 +0530
Message-ID: <20201107082041.GA2675@Thinkpad>
References: <20201105155600.9711-1-anmol.karan123@gmail.com>
 <b97dc3f0843cc2b7d7674dbd467ad5ba40824ba3.camel@kernel.org>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZP1wEjjNoJ7pwTRn6B7L6e9GaH7pRaX0MhMHLuNUUzM=;
        b=unNAAEgdoUDKN/F2HuUqnEzWeq0STic/TxA0q/cExK2sDKNpEFMRHH+AyP8SomR7qi
         mVH3I9f5Wryxp+VM5xhVudErsG94nCnVOrm5Bf4o+iSekbwLekB2Wtgpm0jvDMFRbFEj
         C4G7DEvjz5s8uUqqZ2B4j4+d/ix/X5+kiCuIPJK/sMNaRz9Vy59aMNEXoMWYVI+Yyrhb
         PFyZuIPPJFOb/asp0TA3SNbeHnQn35zYipjt0w9eQL9ztTHCmCzPNVj+k7CtGVNmdU0i
         oLQvC5tiqAAVJgchqDcoHzCTiWv8gz3SFvbU2whwgNBHUwZ82I52hIXNHKrUhxli88EK
         eDrQ==
Content-Disposition: inline
In-Reply-To: <b97dc3f0843cc2b7d7674dbd467ad5ba40824ba3.camel@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeed@kernel.org>
Cc: ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, gregkh@linuxfoundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, syzkaller-bugs@googlegroups.com, syzbot+a1c743815982d9496393@syzkaller.appspotmail.com

Hello Sir,

On Fri, Nov 06, 2020 at 01:04:27PM -0800, Saeed Mahameed wrote:
> On Thu, 2020-11-05 at 21:26 +0530, Anmol Karn wrote:
> > rose_send_frame() dereferences `neigh->dev` when called from
> > rose_transmit_clear_request(), and the first occurance of the `neigh`
> > is in rose_loopback_timer() as `rose_loopback_neigh`, and it is
> > initialized
> > in rose_add_loopback_neigh() as NULL. i.e when `rose_loopback_neigh`
> > used in 
> > rose_loopback_timer() its `->dev` was still NULL and
> > rose_loopback_timer() 
> > was calling rose_rx_call_request() without checking for NULL.
> > 
> > - net/rose/rose_link.c
> > This bug seems to get triggered in this line:
> > 
> > rose_call = (ax25_address *)neigh->dev->dev_addr;
> > 
> > Fix it by adding NULL checking for `rose_loopback_neigh->dev` in
> > rose_loopback_timer(). 
> > 
> > Reported-and-tested-by: 
> > syzbot+a1c743815982d9496393@syzkaller.appspotmail.com 
> > Link: 
> > https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3
> >  
> > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> 
> missing proper fixes tag.
> 
> > ---
> >  net/rose/rose_loopback.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
> > index 7b094275ea8b..cd7774cb1d07 100644
> > --- a/net/rose/rose_loopback.c
> > +++ b/net/rose/rose_loopback.c
> > @@ -96,7 +96,7 @@ static void rose_loopback_timer(struct timer_list
> > *unused)
> >  		}
> >  
> >  		if (frametype == ROSE_CALL_REQUEST) {
> > -			if ((dev = rose_dev_get(dest)) != NULL) {
> > +			if (rose_loopback_neigh->dev && (dev =
> > rose_dev_get(dest)) != NULL) {
> >  				if (rose_rx_call_request(skb, dev,
> > rose_loopback_neigh, lci_o) == 0)
> >  					kfree_skb(skb);
> >  			} else {
> 
> check patch is not happy:
> 
> WARNING:TYPO_SPELLING: 'occurance' may be misspelled - perhaps
> 'occurrence'?
> #7: 
> rose_transmit_clear_request(), and the first occurance of the `neigh`
> 
> ERROR:ASSIGN_IN_IF: do not use assignment in if condition
> #36: FILE: net/rose/rose_loopback.c:99:
> +                       if (rose_loopback_neigh->dev && (dev =
> rose_dev_get(dest)) != NULL) {
> 
> total: 1 errors, 1 warnings, 0 checks, 8 lines checked
> 
> 

Thank you for your review will rectify these and send another version.

Thanks,
Anmol
