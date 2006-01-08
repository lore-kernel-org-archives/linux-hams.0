From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: 2.6.15 ax25 system lockup with kissattach
Date: Sun, 08 Jan 2006 01:09:50 +0100
Message-ID: <43C0584E.6060109@ccr.jussieu.fr>
References: <008401c6124f$7ceed0e0$3849a8c0@lan.w1nr.net> <20060107004231.GB12765@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060107004231.GB12765@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: "Mike McCarthy, W1NR" <mike@w1nr.net>, linux-hams@vger.kernel.org

Hi Ralf,

Without your patch, running Mandriva Linux 2006 with 2.6.15 kernel on a=
=20
Pentium IV Xeon would freeze immediately when loading mkiss driver.

After the patch was applied and mkiss module compiled and driver=20
installed, there is no more problem here.

However, the kernel was compiled with no forced preemption model and=20
without SMP option. I will do it soon an report if any change.

Thank you for the nice job you are doing on AX25 stuff.

73 de Bernard, f6bvp

http://f6bvp.free
http://f6bvp.org (mirror)

-----------

Ralf Baechle DL5RB a =E9crit :
> On Thu, Jan 05, 2006 at 06:26:43PM -0500, Mike McCarthy, W1NR wrote:
>=20
>=20
>>That's all folks.  System locked up hard.  Caps lock and scroll lock =
lights
>>flashing.  System needs a hard reset.
>>
>>2.6.14-5 appears to be fine.  Tried recompiled tools and libraries as=
 well.
>>Others report similar problems on Debian systems with 2.6.15 kernel a=
s well.
>=20
>=20
> Can you try below patch?  It fixes a locking bug which was affecting =
only
> preemptable or SMP kernels until the recent rewrite of the locking co=
de.
>=20
> 73 de DL5RB op Ralf
>=20
> --
> Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
>=20
>  drivers/net/hamradio/mkiss.c |    1 +
>  1 files changed, 1 insertion(+)
>=20
> Index: net.git/drivers/net/hamradio/mkiss.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- net.git.orig/drivers/net/hamradio/mkiss.c
> +++ net.git/drivers/net/hamradio/mkiss.c
> @@ -515,6 +515,7 @@ static void ax_encaps(struct net_device=20
>  			count =3D kiss_esc(p, (unsigned char *)ax->xbuff, len);
>  		}
>    	}
> +	spin_unlock_bh(&ax->buflock);
> =20
>  	set_bit(TTY_DO_WRITE_WAKEUP, &ax->tty->flags);
>  	actual =3D ax->tty->driver->write(ax->tty, ax->xbuff, count);
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
