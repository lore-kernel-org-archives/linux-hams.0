From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: [PATCH] hamradio driver fixes
Date: Mon, 19 Jan 2004 23:33:25 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <400C6945.1020903@ccr.jussieu.fr>
References: <20040119223235.E211@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040119223235.E211@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: linux-hams@vger.kernel.org, jgarzik@pobox.com, ralf@linux-mips.org

Hi,

Thanks and congratuations Jeroen.
I applied the patch and it cured the problems of kernel panic when=20
removing mkiss module driver after performing a kissattach.

Just for your information, there was two warnings during scc.c=20
compilation :
line 1201 and 1279 warning comparison is always true due to limited=20
range of data type.

I am using ax25, mkiss, rose and netrom drivers.

There is still a similar problem left when removing rose module driver=20
after and only after attaching a rose port with rsattach.

I give the Call Trace :
free_module + 0x44/0x90
sys_delete_module + 0x133/0x1a0
do_munmap + 0xfs/0x150
sys_munmap + 0x34/0x60
syscall_call =B00x7/0xb

Hope this will help.

73 de Bernard, F6BVP

-------------------

Jeroen Vreeken wrote:
> Hi,
>=20
> This is a patch that fixes some problems in the hamradio drivers in 2=
=2E6.1
> Part is a resent that was probably lost during the holiday season.
> The fixes include:
>=20
> + scc.c usage of rtnl lock and register_netdev.
> + scc.c properly initialize timers.
> + remove cli() call in 6pack.c (The line of code that was 'protected'
> couldn't have needed it anyway)
> + fix init of reused devices and remove cli()
>=20
> The only thing remaining is a call to cli() in the dmascc driver, I d=
on't
> know what exactly it aims to protect....
>=20
> Jeroen


-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
