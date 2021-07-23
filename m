From: Dave van der Locht <d.vanderlocht@gmail.com>
Subject: Re: Status of the stuck sockets bugs.
Date: Fri, 23 Jul 2021 10:50:01 +0200
Message-ID: <CAH4uzPPvUSjy0wq2Cnp0sC6sK4Tpm9YUUHB9TJj=Ps+gnwn_4A@mail.gmail.com>
References: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
 <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
 <YPp7qeWGSW/s4TI6@linux-mips.org> <CAH4uzPMp_4bwPf0+tjviM=5aDVGLRKfz+fC_gVybujwKriF48A@mail.gmail.com>
 <CAH4uzPOuGD939KgYW5Rwn2or_xNtpo=TuAcCS6dbhrJ7GdZyQQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=4oGnpkH77iQH5tX1qwBstuGldIFRe2XIP/NmT4BdprA=;
        b=mU7xeAM3E8bnwrGFozdCkdG9zvIEAmXGLBraDXjrGpTcbEYL/YCgeYRQZxnVf4oJX2
         vlkaeCf3nUzsTqKO9t6lqzOY84M9viXQEmTg9n47hz4M40SOOCREKsZ6+0/R1/DCsNda
         C+2zOTmZeYJdK/cBDia9MzX9MkNT8SNqjPfjHKlRLRhMGlZFzxWe36xz6YCTFZtKP9/m
         IjdU19eBvnsmA+ZyZ952zdvuvnh6XqOAFKouy16bI+5fin71y8QwWzDcVzi7E4XNqkj+
         gviKTvACs2g6AbREkzJPM7OOz7wV9LdQltyDqbfSiPvZon6HhCTuLQIFmRxJEs68K/Ph
         tVPQ==
In-Reply-To: <CAH4uzPOuGD939KgYW5Rwn2or_xNtpo=TuAcCS6dbhrJ7GdZyQQ@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Excuse me, missed the filename in the patch file. It's in /net/ax25/ax25_subr.c.

Kind regards,
Dave van der Locht

Op vr 23 jul. 2021 om 10:44 schreef Dave van der Locht
<d.vanderlocht@gmail.com>:
>
> Ralf;
>
> Below is the thing / patch Marius did, spread, and which seems to
> resolve the issue 100% without any side effects.
> Replicating the issue can be done fairly easy, without the patch I've
> never seen AX.25 sockets getting closed after NETROM disconnects from
> kernel 4.4 or 4.9 and up.
>
> Maybe you're willing to give it a review and nail this one. I've heard
> this particular patch was provided and rejected for several times and
> I know many HAMs are waiting for a solution (or already given up on
> it).
> But when you're telling not to be aware about this particular patch
> I'm wondering if the rumours are true.
>
> Thanks for the clarification / info on this one Ralf!
>
> @@ -287,5 +287,7 @@
>                 }
>                 bh_unlock_sock(ax25->sk);
>                 local_bh_enable();
> +       } else {
> +               ax25_destroy_socket(ax25);
>         }
>  }
>
> Kind regards,
> Dave van der Locht
>
> Op vr 23 jul. 2021 om 10:19 schreef Ralf Baechle <ralf@linux-mips.org>:
> >
> > On Thu, Jul 22, 2021 at 07:42:18PM +0200, Dave van der Locht wrote:
> >
> > > Is anybody able to tell me more / give answers to questions about this issue?
> > >
> > > Kind regards,
> > > Dave van der Locht
> > >
> > > Op di 29 jun. 2021 om 19:32 schreef Dave van der Locht
> > > <d.vanderlocht@gmail.com>:
> > > >
> > > > Hello,
> > > >
> > > > Is there any news about the well known bug regarding sockets getting
> > > > stuck in LISTENING state?
> > > >
> > > > Some years ago (already) Marius Petrescu YO2LOJ wrote a patch for the
> > > > ax25_subr.c file which seems to work very well and solves the issue.
> > > > But it's really annoying having to patch the kernel with each update
> > > > again.
> > > >
> > > > What about that patch, I've heard it was rejected several times for
> > > > some reason? But can't find info regarding that.
> > > > What can be done - or who is able - to get rid of this bug and get it
> > > > fixed in the kernel?
> >
> > I wasn't even aware of these patches and an internet search didn't turn
> > up anything.  Fortunately it turned out I have friends who happen to
> > know Marius so who pointed me at his "patches" really quickly.
> >
> > And they were not even patches but a broken out net/ax25 directory from
> > a Debian kernel with random changes.  That said, while the way these
> > changes were hidden away and present leaves space for improvments,
> > technically they appear to have benefit, so I'm now working through
> > them.
> >
> >   Ralf
