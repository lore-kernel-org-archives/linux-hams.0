From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: ax25ipd configuration problem
Date: Mon, 17 Nov 2003 21:07:01 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200311172107.01132.pa3gcu@zeelandnet.nl>
References: <3FB7E02D.D5CC7D78@free.fr>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3FB7E02D.D5CC7D78@free.fr>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?q?G=E9rard=20Parat=20=2F=20F6FGZ?= <f6fgz@free.fr>, Linux-Hams <linux-hams@vger.kernel.org>

On Sunday 16 November 2003 21:38, G=E9rard Parat / F6FGZ wrote:
> Hello,
>
> I tried to setup a high speed AX25 tunnel using our brand new wlan ne=
twork
> without success.
> The problem is the following answer:
>
> [root@f6fgz root]# ax25ipd -l 3
> fetching tty device parameters: Invalid argument
>
> My ax25ipd.conf:
> socket ip
> mode tnc
> device /dev/ttyp4
> speed 19200
> loglevel 0
> broadcast QST-0 NODES-0
> route f6fkq delta.localnet
>
> My kiss stuffs:
> mkiss -s 19200 -l /dev/ttyS1 /dev/ptyp1 /dev/ptyp2
> mkiss -s 19200 -l /dev/ttyS0 /dev/ptyp3 /dev/ptyp4
> kissattach -m 256 /dev/ttyp1 vhf  f6fgz
> kissattach -m 512 /dev/ttyp2 uhf1 f6fgz
> kissattach -m 256 /dev/ttyp3 uhf2 f6fgz
> kissattach -m 256 /dev/ttyp4 uhf3 f6fgz
>
> All AX interfaces are up and running since years with this config. On=
ly new
> ax25ipd add-on won't work.

Without sounding stupid,  a pty/tty is a "pair" used together, so if yo=
u use=20
mkiss to attach one side (/dev/ptyp4) and klissattach to attach the oth=
erside=20
(/dev/ttyp4) then how can you attach ax25ipd with /dev/ttyp4 as well.??
Or am i missing something here.

> What's wrong ? Thanks for your help.
>
> BTW, photos of the wlan on http://f6fgz.free.fr/HamLan (29 km and a s=
teady
> 80 kb/s !)
>
> --
> 73 G=E9rard F6FGZ

--=20
If the Linux community is a bunch of theives because they
try to imitate windows programs, then the Windows community
is built on organized crime.

Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
