From: "Charles Blackburn" <charlesb@otcgaming.net>
Subject: Inverting the parallel port pins
Date: Mon, 16 May 2005 23:23:04 +0100
Message-ID: <00a401c55a65$d4b84510$0500a8c0@gamemachine>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: 'Linux Parport list' <linux-parport@lists.infradead.org>
Cc: linux-hams@vger.kernel.org

I'm sending this to both lists on the off chance that someone may be
able to help..


I have managed to get the soundmodem (user-mode) wokring now under
2.6.11 (latest knoppix installed to HD), but the problem comes in that
the radio is constantly keyed up.

It seems that the data0 pin on parport0 is being held high by something
and I cant work out what.

I've searched through the archives going back the past year or so and
there have been several messages on the linux--hams one about this same
subject.

Basically what I'm asking, is there any way to invert the pin on the
parallel port in the user-mode soundmodem driver? It was metioned by
someone that there should be an option in sethdlc, but the problem is,
sethdlc doesn=92t work with the user-mode soundmodem.

Hopefully someone can help (btw the interface works fine under windows
:( )

Regards and 73
Charles - 2E0GOM
ARICC UK Co-Ordinator - http://www.aricc.org
Kirklees RAYNET - http://www.kirkleesraynet.org.uk

--=20
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.308 / Virus Database: 266.11.8 - Release Date: 10/05/2005
=20

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
