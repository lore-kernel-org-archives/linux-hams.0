From: =?iso-8859-1?Q?G=E9rard?= Parat / F6FGZ <f6fgz@free.fr>
Subject: Re: MFJ 1270B(TNC-2) And Linux 2.4.18 kiss
Date: Sun, 21 Dec 2003 17:20:31 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3FE5C84F.71561B20@free.fr>
References: <Pine.LNX.4.58.0312202315590.30907@jazzy_earth_dragon.net> <3FE5B4D0.20206@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Bernard Pidoux F6BVP a =E9crit :

> Jeremiah KD7DMP wrote:
>
> > Hello all,
> >
> > I have a little prob, I have been try to get my MFJ TNC-2 to talk t=
o my
> > Slackware(2.4.18 kernel) box in kiss mode for a while. The prob is =
that I
> > can not getting it to transmit, After doing kissattach I can recive
> > traffic by using listen, but when I go to transmit using call I get
> > nothing. I know that TNC works becuase i had it all working and hum=
ming a
> > long before, but I don't rember How I got it to work.
> >
> > Any ideas..?
> >
> > thanks and 73
> > de
> > Jeremiah
> > KD7DMP
>
> It could be a problem of ax port.
> Be sure to call via axport name defined into axports file first param=
eter.
>
> However, for your information, on two PC of different generation boar=
ds
> (Pentium II CPUs) I have been using successfully for years two 2 port=
s
> KPC9612 in kiss mode with kernel 2.2. But I have never been able to r=
un
> AX25 correctly with any 2.4 kernels. I always experienced interrupts
> problems and kernel oops and finally Linux halted. And one of the
> symptoms was that Call did not work !

Hello,

Successfully using KPC9612 and kernel 2.4.18 but *WITHOUT* fpac which h=
anged
the system. Otherwise, 2.4.18 runs well with lot of annoying messages i=
nto
syslog and message of that kind:
Dec 21 17:12:45 f6fgz kernel: NET: 5 messages suppressed
The cause is due to listen. Don't use it and you will be happy.
My config:
CONFIG_HAMRADIO=3Dy
CONFIG_AX25=3Dm
CONFIG_NETROM=3Dm
CONFIG_ROSE=3Dm (not used)
CONFIG_MKISS=3Dm

My script:
/usr/sbin/mkiss -s 19200 -l /dev/ttyS1 /dev/ptyp1 /dev/ptyp2
/usr/sbin/mkiss -s 19200 -l /dev/ttyS0 /dev/ptyp3 /dev/ptyp4
/usr/sbin/kissattach -m 256 /dev/ttyp1 vhf  f6fgz
/usr/sbin/kissattach -m 256 /dev/ttyp2 uhf1 f6fgz
/usr/sbin/kissattach -m 256 /dev/ttyp3 uhf2 f6fgz
/usr/sbin/kissattach -m 256 /dev/ttyp4 uhf3 f6fgz

/etc/ax25/axports:
vhf F6FGZ-4 19200 255 2
uhf1 F6FGZ-3 19200 255 7
uhf2 F6FGZ-5 19200 255 4
uhf3 F6FGZ-6 19200 255 7

And I use Xnet v1.36 along with a local WLAN.

--
73 G=E9rard F6FGZ



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
