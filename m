From: Jacques Chion <Jacques.Chion@wanadoo.fr>
Subject: Re: AX-25 software that works on Fedora Core 4?
Date: Sun, 21 Aug 2005 12:05:57 +0200 (CEST)
Message-ID: <Pine.LNX.4.44.0508211157320.12419-100000@cwoux2.cerise.fr>
References: <20050820172614.GB2828@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050820172614.GB2828@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: Scott Weis <kb2ear@kb2ear.net>, linux-hams@vger.kernel.org

Le Aug 20, Ralf Baechle DL5RB =E9crivait :

> On Sat, Aug 20, 2005 at 06:22:04PM +0100, Ralf Baechle DL5RB wrote:
>=20
> Damn rush before running out of the door.  I missed to attach the cha=
nge
> to a second file, so below the complete patch.
>=20
>   Ralf
>=20

Great work !

I applied the patch to the mkiss.c of the kernel-2.6.12.5.
Now i can use again the ax25 and kiss mode without problems.
Only two small problems :

-the patch you have sent by mail refuse to apply after line 885, but i =
finished by hand, and no problem to compile.
-soundmodem, that i use, is complaining about SIOCSIFHADDR, but it seem=
s to work properly.

So, thank you and again, great job !


--=20
=466CWO
Quelques HOWTO en fran=E7ais: http://perso.wanadoo.fr/jacques.chion/


-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
