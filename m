From: Jacques Chion <Jacques.Chion@wanadoo.fr>
Subject: Re: last kernel version 2.6.15-rc1
Date: Tue, 15 Nov 2005 21:17:32 +0100 (CET)
Message-ID: <Pine.LNX.4.44.0511152108070.4483-100000@cwoux2.cerise.fr>
References: <20051115110710.GA2731@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20051115110710.GA2731@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Le Nov 15, Ralf Baechle DL5RB =E9crivait :

=2E......................................
>=20
> Is this a preemptable kernel?
>=20
=2E.......................................
yes, the kernel was compiled with the option CONFIG_PREEMPT_VOLUNTARY=3D=
y

i tried also with the option CONFIG_PREEMPT_NONE=3Dy
and i have the same problem.
To be complete, after the message is ent yesterday,
some seconds after i have another like that :

kernel BUG at kernel/timer.c:469!
invalid operand: 0000 [#1]
Modules linked in: nfsd exportfs lockd sunrpc ...(and various modules a=
bout sound)
CPU: 0
EIP: 0060:[c01213c3] Not tainted VLI
=2E........................

and other things that i must copy by hand, because not recorded.
On another hand, i received a message from oh1mrr telling he has no pro=
blem
with this kernel.
So the solution i think is in my garden.. But where ?

Best 73.

--=20
=466CWO
Quelques HOWTO en fran=E7ais: http://perso.wanadoo.fr/jacques.chion/


-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
