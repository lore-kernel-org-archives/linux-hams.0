From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: [PATCH] hamradio driver fixes
Date: Tue, 20 Jan 2004 00:06:45 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040120000645.G211@jeroen.pe1rxq.ampr.org>
References: <20040119223235.E211@jeroen.pe1rxq.ampr.org> <400C6945.1020903@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <400C6945.1020903@ccr.jussieu.fr>; from pidoux@ccr.jussieu.fr on Tue, Jan 20, 2004 at 00:33:25 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: Jeroen Vreeken <pe1rxq@amsat.org>, linux-hams@vger.kernel.org, jgarzik@pobox.com, ralf@linux-mips.org

On 2004.01.20 00:33:25 +0100 Bernard Pidoux wrote:
> Hi,
>=20
> Thanks and congratuations Jeroen.
> I applied the patch and it cured the problems of kernel panic when=20
> removing mkiss module driver after performing a kissattach.
>=20
> Just for your information, there was two warnings during scc.c=20
> compilation :
> line 1201 and 1279 warning comparison is always true due to limited=20
> range of data type.

Are you sure about the line numbers and the file? I can't find anything
like that in scc.c in either 2.6.0, 2.6.1 or 2.6.1 with my patch.
I also don't get that warning.

> I am using ax25, mkiss, rose and netrom drivers.
>=20
> There is still a similar problem left when removing rose module drive=
r=20
> after and only after attaching a rose port with rsattach.
>=20
> I give the Call Trace :
> free_module + 0x44/0x90
> sys_delete_module + 0x133/0x1a0
> do_munmap + 0xfs/0x150
> sys_munmap + 0x34/0x60
> syscall_call =B00x7/0xb

I am not a Rose user myself so my knowledge of it is very limited...
I will take a look at it and see if I see something wrong.

Jeroen

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
