From: Jacques Chion <Jacques.Chion@wanadoo.fr>
Subject: soundmodem and kernel 2.6.12
Date: Sun, 19 Jun 2005 05:41:55 +0200 (CEST)
Message-ID: <Pine.LNX.4.44.0506190529240.2936-100000@cwoux2.cerise.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Hello all,

i am using soundmodem for long times without problems (the software, no=
t the old module).
When i saw the new kernel 2.6.12, i tried it, of course.

And the result was :
-soundmodemconfig works always
-soundmodem does not work, claiming a problem about TIOCSETD.

After looking what can be wrong, i saw that the problem came from mkiss=
=2Ec
in drivers/net/hamradio. So, i took the file mkiss.c coming from the=20
"old" kernel 2.6.11.12 and recompile the kernel 2.6.12.
And now all is OK.
Of course, i made a diff between the two mkiss.c, but i am a dummy
in programming. Is there an expert to say how to modify
soundmodem so that we ca use the original kernel 2.6.12 ?

Best 73

Jim F6CWO

--=20
Quelques HOWTO en fran=E7ais: http://perso.wanadoo.fr/jacques.chion/


-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
