From: Richard Adams <pa3gcu@zeelandnet.nl>
Subject: Re: soundmodem and fedora c3
Date: Tue, 8 Mar 2005 21:07:02 +0100
Message-ID: <200503082107.02361.pa3gcu@zeelandnet.nl>
References: <BAY104-F33C8680A7BC732DF8330068B500@phx.gbl> <422DECD3.3050901@cox.net>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
In-Reply-To: <422DECD3.3050901@cox.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeff Camp <jcamp2@cox.net>
Cc: linux-hams@vger.kernel.org

On Tuesday 08 March 2005 19:20, Jeff Camp wrote:
> Ron, I had the same problem with FC3 and soundmodem.  I solved it by
> enabling MKISS support (CONFIG_MKISS) and rebuilding the kernel.  The
> AX25 stuff was already there, but MKISS was not enabled by default.  =
It
> works great now.

I dont want to be a wet ass, however my fedora core kernel has=20
# CONFIG_HAMRADIO is not set
which in turn means that there is no support for hamradio in fedora ker=
nels at=20
all, that is if i see it correctly.

To make it clear, my kernel is 2.6.9-1.681_FC3 which i do belive was up=
dated=20
by up2date.

=46uther more i can see no support for AX25 in other kernels from fedor=
a.

On another note if i am correct, to configure mkiss in =B4make menuconf=
ig=B4 one=20
needs to check the box
 Device Drivers
-> Networing Support
Then check
 [ ] Amateur Radio support  --->=20

Considering my .config file did not include an asterisk in that box i p=
resume=20
that Fedore does not supply kernels with AX25 at all.

Or am i incorrect in saying this.???

Also to make it quite clear i dont use a soundmodem so i cannot really=20
conribute anything else to this thread, i just thought it worth mention=
ing.
Hope you dont mind.

> 73,
> Jeff
> N0WJP
>
> Ron- VE3DTT wrote:
> > Thanks to all who responded to my query.
> >
> > I am aware that 'soundmodem' is usermode software but I tried loadi=
ng
> > the modules anyway, out of desperation.
> >
> > 'make menuconfig' suggests that ax.25 is hard coded in my kernel.
> >
> > I have this sample of an 'axport' file which addresses 'sm0':
> >
> > "sm0 KA1FSB-8 1200 255 2 145.630 Mhz "Wellesley, MA" 1200
> > bps soundmodem"
> >
> > but it doesn't help.  I've tried many variations on sample
> > configurations with negative results.
> >
> > 'xastir' will allow me to bring up a 'kiss' device on any port I ch=
oose
> > but none communicate with soundmodem. The xastir manual tells me to=
 use
> > ax25.
> >
> > 'Listen' informs me that my ax25 ports aren't active.
> >
> > --
> > "Windows:  Microsoft's tax on computer illiterates." -- WE7U
> >
> > I, reluctantly, must include myself among the computer illiterate a=
nd
> > when I discovered that 'soundmodem' is available for windows  I
> > downloaded 'soundmodem', 'flexnet32' and 'paxon' and was decoding
> > packets within 15 minutes start to finish. In view of the time it t=
akes
> > to get anything up and running with Linux, I'm inclined to counter =
that,
> > perhaps,
> >
> > Linux is Life's tax on those of us who don't have one.
> >
> > It has to be it's own reward. I'll keep trying things until somethi=
ng
> > works.
> >
> > Thanks again,
> > Ron
> > 73 VE3DTT
> >
> >
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-ham=
s" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
