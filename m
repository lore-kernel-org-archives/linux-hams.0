From: =?iso-8859-1?q?G=FCnther_Montag?= <Safaridoktor@compuserve.de>
Subject: new version: hf 0.8
Date: Sun, 11 Feb 2007 10:07:28 +0000 (UTC)
Message-ID: <200702142142.41660.Safaridoktor@compuserve.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Date: Wed, 14 Feb 2007 21:42:41 +0100
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Hello friends

Version 0.8 of hf is released.
(the linux multimode program with "historic" fsk modes like opactor 1=20
amtor and gtor, rtty, mt63).
More stable I hope.=20
The cw-elbug is nice.=20
It uses the pc speaker, because the soundcard reacts too slow.
Chose a serial in the config menu / general,=20
=463, then click into the rx window.


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

=46rom Change Log:
by G=FCnther Montag=20

V.0.8  of 15.02.2007
I am back again after timeout
I do it slowly... (because my family & job is Nr. 1)
I now see: so much cryptic things due to historicy growth...
I tried to de-cryptify.
hfkernel:
hardware detect! Should now find out if '-n' (no mmap, no DMA)
option is needed, and if RDTSC not working ('-R' option).
CW:
The elbug decodes now your own keying.
PC speaker output. Sounds nice.
I moved from inb/outb to IOCTL's so it works not only on pentiums.
Docs:=20
Simplified.
man hf and hfterm is now the same.
Howtos have been shortened. I removed old rubbish.
start script:=20
The hf start script starts now only hfterm, and hfterm starts=20
hfkernel.
hfkernel has no mode running at start. The modes are controlled by=20
hfterm only.
Newer kernels (2.6...) do a different thread handling.
hfkernel and hfterm have both to be started with the prefix=20
LD_ASSUME_KERNEL=3D2.2.5
I worked this into the hf start script.
Configuration:
Now /etc/hf.conf is obsolete.
All configuration is done from within hfterm's config menu.
The calibration programs reffreq and dcf77rx now write their outoput=20
into
/usr/etc/calibrations. They have to be taken by hand into hfterm's=20
config menu.
Cleared makefiles and configure.ac.
Now only one configure.ac in the main dir.
=46ixes:
Integrated parts of Diane's patch for free BSD, thanks!
Many bugfixes, as usual.
Especially in changing modes, now it seems to give less crashes.=20
Anyway, do not click too often, do not change modes while=20
transmitting!
MT63:=20
I switched back to Pawel's original soundcard approach=20
(half duplex only, switches between read and write)=20
because my glue to Tom's full-duplex code resulted in hangs sometimes.
At the same time Diane corrected this glue in his patch=20
so now 2 versions of code (patched 0.7.3 versus 0.8) can be compared.

hardware detect: (MMAP error) is still a 1 problem sometimes
(because some soundcards do not tell the truth...)
If fsk modes do not run:
Enter the option
'-n'
into the config menu/General/kerneloptions.

Have a lot of fun !!!

73 de G=FCnther dl4mge=20

--=20
G=FCnther Montag
Safaridoktor@compuserve.de
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
