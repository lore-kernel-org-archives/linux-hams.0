From: =?ISO-8859-1?Q?=22R=E9mi?= Chateauneu" <ravioli@softhome.net>
Subject: Re: soundmodem / "SIOCSIFFLAGS no such device"
Date: Thu, 20 Feb 2003 22:41:11 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <b33hmu$nsm$1@main.gmane.org>
References: <b2veij$79l$1@main.gmane.org> <20030220120526.GA28160@silly.cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-hams@vger.kernel.org



Hamish Moffatt <hamish@cloud.net.au> a =E9crit dans le message :
20030220120526.GA28160@silly.cloud.net.au...
> > For the setup, I first do a 'rmmod' of all modules related to the s=
ound
card.
> > Then setserial /dev/ttyS0 uart none port 0 irq 0
>
> Looks good. Only 'uart none' is needed btw.
>
> > To find the irq and dma parameters of the sound card :
> > modprobe -c | grep irq
>
> Didn't know that.
I did not know any other way that this one I found on the web. What els=
e
could I do ?
Maybe these values are bad ?

> > modprobe hdlcdrv
> > insmod soundmodem mode=3D"sbc:afsk1200" iobase=3D0x220 irq=3D7 dma=3D=
1
> > sethdlc -p -i sm0 mode sbc:afsk1200 io 0x200 irq 7 dma 1 serio 0x3f=
8
>
> Two things. Firstly no need to provide the same information twice
> (module parameters AND sethdlc); I just use sethdlc. Secondly the
> address you have to sethdlc is different - 0x200 vs 0x220. Could be y=
our
problem.
Mistyping, sorry. Thaks for the info.

>
> > And the final :
> > ifconfig sm0 hw ax25 X1ABC up
>
> Should also assign a dummy IP address.
So, I typed :
ifconfig sm0 hw ax25 X870 192.3.1.2
=3D=3D=3D>>> SIOCSIFFLAGS: No such device

> Is your sound card SB-compatible?
How can I know that, please ?

Maybe I rmmod'ed too many modules ?

Another problem. If I type
rmmod soundmodem

I get the error :
'segmentation fault'

> You could also try the user-space (non kernel) soundmodem driver. It
> uses your existing sound card drivers although not all cards are
supported.
Great ! Where is it ? What is its name ?

Thanks a lot !!




-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
