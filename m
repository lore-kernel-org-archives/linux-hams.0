From: "Henk Remijn" <hremijn@zeelandnet.nl>
Subject: RE: Problem...
Date: Tue, 25 Mar 2003 07:41:50 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <GMEHKCCPLOCMPOLBMKICCEJNDOAA.hremijn@zeelandnet.nl>
References: <03031815501301.03692@unix.pa3gcu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <03031815501301.03692@unix.pa3gcu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pontus Falk <pfalk@ax25.org>
Cc: linux-hams@vger.kernel.org

Pontus,

With lsmod you can check if modules are loaded.

1. I would not use 2.4.18, this was is buggy. Try a later kernel.
But this has nothing to do with your problem now.

2. Try to build as much drivers as modules, especially the ham radio ones.

If nothing is going to work, you might consider switching to debian. This
distro has ham-radio enabled by default. No kernel recompiling necessary.

73, Henk PA5KT

> -----Original Message-----
> From: linux-hams-owner@vger.kernel.org
> [mailto:linux-hams-owner@vger.kernel.org]On Behalf Of pa3gcu
> Sent: dinsdag 18 maart 2003 16:50
> To: Pontus Falk
> Cc: linux-hams@vger.kernel.org
> Subject: Re: Problem...
>
>
> On Monday 17 March 2003 22:09, Pontus Falk wrote:
>
> > > cat /usr/src/linux/.config | grep MKISS
> > > You should get CONFIG_MKISS=m or CONFIG_MKISS=y if you get
> > > # CONFIG_MKISS is not set
> > > that means you dont have mkiss at all.
> >
> > Yes, I have CONFIG_MKISS=y in /usr/src/linux/.config. But, I have
> > CONFIG_HAMRADIO=m if that is any problem. I don't know where to set this
> > to y in menuconfig... When I try to set it manually and recompile the
> > kernel I get an error message...
>
> Why not do it the other way round, compile tham all as modules.
>
> > Pontus
> >
>
> --
> Regards Richard
> pa3gcu@zeelandnet.nl
> http://people.zeelandnet.nl/pa3gcu/
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


