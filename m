From: Anmol Karn <anmol.karan123@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: rose: Fix Null pointer
 dereference in rose_send_frame()
Date: Thu, 15 Oct 2020 19:40:12 +0530
Message-ID: <20201015141012.GB77038@Thinkpad>
References: <20201015001712.72976-1-anmol.karan123@gmail.com>
 <20201015051225.GA404970@kroah.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aT/El/Gn9neHvZZa/+9NtdmwjsbnakBhZHDByWNqGyw=;
        b=BNSxMPGkXPupxt3UFTpBo9CCOJOAFIXlAE7ATUBEzeF+Q3f5qZWm3G/Nv3rNGX5D8+
         ZhH59Q/TWJX8QmM1PClQq4PU5tS9hticmSRCwXGyL7W50NiK1K9X1otuXEIIlVIS1KUP
         c7V8gmqtIgMMZJugVmA9+PpgAtU3iW9UUaXDx59USDLehgNO1+hyNHtEKXhhdRavDWHB
         LttvXd8TkTod160mb24X6WoGKqOB1vflsdcROKt5r7sY1/BgfADkLG7KgAcapfgpJc8V
         ke+SdeS7bPizwOMnfQz16w8LTPHMzpsPOj97IXJD2EWzGygCvDL6INqqysepHGsgOhfD
         zPGQ==
Content-Disposition: inline
In-Reply-To: <20201015051225.GA404970@kroah.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org, syzbot+a1c743815982d9496393@syzkaller.appspotmail.com, linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org

On Thu, Oct 15, 2020 at 07:12:25AM +0200, Greg KH wrote:
> On Thu, Oct 15, 2020 at 05:47:12AM +0530, Anmol Karn wrote:
> > In rose_send_frame(), when comparing two ax.25 addresses, it assigns rose_call to 
> > either global ROSE callsign or default port, but when the former block triggers and 
> > rose_call is assigned by (ax25_address *)neigh->dev->dev_addr, a NULL pointer is 
> > dereferenced by 'neigh' when dereferencing 'dev'.
> > 
> > - net/rose/rose_link.c
> > This bug seems to get triggered in this line:
> > 
> > rose_call = (ax25_address *)neigh->dev->dev_addr;
> > 
> > Prevent it by checking NULL condition for neigh->dev before comparing addressed for 
> > rose_call initialization.
> > 
> > Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com 
> > Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3 
> > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> > ---
> > I am bit sceptical about the error return code, please suggest if anything else is 
> > appropriate in place of '-ENODEV'.
> > 
> >  net/rose/rose_link.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> > index f6102e6f5161..92ea6a31d575 100644
> > --- a/net/rose/rose_link.c
> > +++ b/net/rose/rose_link.c
> > @@ -97,6 +97,9 @@ static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
> >  	ax25_address *rose_call;
> >  	ax25_cb *ax25s;
> >  
> > +	if (!neigh->dev)
> > +		return -ENODEV;
> 
> How can ->dev not be set at this point in time?  Shouldn't that be
> fixed, because it could change right after you check this, right?
> 
> thanks,
> 
> greg k-h

Hello Sir,

Thanks for the review,
After following the call trace i thought, if neigh->dev is NULL it should
be checked, but I will figure out what is going on with the crash reproducer,
and I think rose_loopback_timer() is the place where problem started. 

Also, I have created a diff for checking neigh->dev before assigning ROSE callsign
, please give your suggestions on this.


diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
index f6102e6f5161..2ddd5e559442 100644
--- a/net/rose/rose_link.c
+++ b/net/rose/rose_link.c
@@ -97,10 +97,14 @@ static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
        ax25_address *rose_call;
        ax25_cb *ax25s;
 
-       if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
-               rose_call = (ax25_address *)neigh->dev->dev_addr;
-       else
-               rose_call = &rose_callsign;
+       if (neigh->dev) {
+               if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
+                       rose_call = (ax25_address *)neigh->dev->dev_addr;
+               else
+                       rose_call = &rose_callsign;
+       } else {
+               return -ENODEV;
+       }
 
        ax25s = neigh->ax25;
        neigh->ax25 = ax25_send_frame(skb, 260, rose_call, &neigh->callsign, neigh->digipeat, neigh->dev);
 


Thanks,
Anmol
