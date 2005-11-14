From: Jacques Chion <Jacques.Chion@wanadoo.fr>
Subject: last kernel version 2.6.15-rc1
Date: Mon, 14 Nov 2005 21:40:08 +0100 (CET)
Message-ID: <Pine.LNX.4.44.0511142129390.4380-100000@cwoux2.cerise.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-hams@vger.kernel.org


Good eveneing or morning,

has somebody tried the last version of the kernel (rc1 of 2.6.15) ?

I know it's only a release candidate, but i like experimentation.

I use soundmodem and mkiss and i have no problems to receive packets wi=
th this kernel.
But when i use the program 'call' from ax25-apps, my system freezes
and i have the message :


Nov 12 08:59:14 cwoux3 kernel: mkiss: sm0: Trying crc-smack
Nov 12 08:59:14 cwoux3 kernel: scheduling while atomic: call/0x00000100=
/3093
Nov 12 08:59:14 cwoux3 kernel:  [<c03679e2>] schedule+0x4f2/0x5a6
Nov 12 08:59:14 cwoux3 kernel:  [<c0365ad9>] ax25_connect+0x44b/0x494
Nov 12 08:59:14 cwoux3 kernel:  [<c01d1d7c>] copy_from_user+0x34/0x78
Nov 12 08:59:14 cwoux3 kernel:  [<c01163c6>] default_wake_function+0x0/=
0x12
Nov 12 08:59:14 cwoux3 kernel:  [<c02f3cdc>] sys_connect+0x7c/0x9c
Nov 12 08:59:14 cwoux3 kernel:  [<c026db9b>] write_chan+0x0/0x1ea
Nov 12 08:59:14 cwoux3 kernel:  [<c02f47f4>] sys_socketcall+0xca/0x2a3
Nov 12 08:59:14 cwoux3 kernel:  [<c01541c4>] sys_write+0x4b/0x74
Nov 12 08:59:14 cwoux3 kernel:  [<c0102913>] sysenter_past_esp+0x54/0x7=
5

I tried to compile again the ax25-apps, but i get always the same messa=
ge.
With the kernel 2.6.14 all is running perfectly.

Any ideas ?

Best 73's.
Jim

--=20
=466CWO
Quelques HOWTO en fran=E7ais: http://perso.wanadoo.fr/jacques.chion/



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
