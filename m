From: Brett Mueller <wa7v@wa7v.com>
Subject: Re: Problems using MKISS
Date: Wed, 14 Mar 2007 13:09:17 -0700
Message-ID: <45F8566D.10206@wa7v.com>
References: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stephen Brown Jr wrote the following on 03/11/2007 17:05:
> I am trying to share a KISS tnc on a serial port for APRS and MKISS
> seems to be the way to do it, but I can't get it work for whatever
> reason. I have two machines, Im using AXIP to carry traffic back and
> forth between them. Here is my setup:
> 
> Debian linux "Sarge" 3.1 using stock 2.4 kernel (this the box the TNC
> is located on)
> KISS mode TNC on /dev/ttyS4, AX25 and MKISS modules loaded and working
> Ran mkiss -s 9600 /dev/ttyS4 /dev/ptyp0, then ran kissattach
> /dev/ttyp0 aprs 192.168.1.6, port successfully binds to ax0

Is your TNC a single or dual port unit?  Maybe it doesn't matter, but it
looks like your mkiss command is lacking a second pseudo-tty specification.
If your TNC is single port, perhaps using "rxecho" would work better for your
situation than mkiss?  I have several apps sharing a TNC on my BBS; only one
of them is actually attached to the TNC, but the others talk AX.25 "directly"
through the TNC via rxecho on the appropriate shared interfaces.

Hope this helps somehow...

73,

Brett, WA7V


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFF+FZt+/Ps1x4JxWYRAlsaAKCqUAcQK1wV1+viSNeulgv5yr6WTgCeKVBd
PYa51okbm3dcWlSR3VDTEfk=
=Ld5g
-----END PGP SIGNATURE-----
