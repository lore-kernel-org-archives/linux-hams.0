From: Ruben Navarro Huedo <eb5esx@eb5esx.ampr.org>
Subject: Re: [PATCH] hamradio driver fixes
Date: Mon, 19 Jan 2004 23:51:17 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200401192351.18965.eb5esx@eb5esx.ampr.org>
References: <20040119223235.E211@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040119223235.E211@jeroen.pe1rxq.ampr.org>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

will be this patch in 2.6.2?

Thank's.

El Lunes, 19 de Enero de 2004 22:32, Jeroen Vreeken escribi=F3:
> Hi,
>
> This is a patch that fixes some problems in the hamradio drivers in 2=
=2E6.1
> Part is a resent that was probably lost during the holiday season.
> The fixes include:
>
> + scc.c usage of rtnl lock and register_netdev.
> + scc.c properly initialize timers.
> + remove cli() call in 6pack.c (The line of code that was 'protected'
> couldn't have needed it anyway)
> + fix init of reused devices and remove cli()
>
> The only thing remaining is a call to cli() in the dmascc driver, I d=
on't
> know what exactly it aims to protect....
>
> Jeroen

- --=20
(Del lat. anus).
   1. m. Orificio en que remata el conducto digestivo y por el cual se
   expele el excremento.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFADF9l0S5G8AO3zN8RAurkAKCGflZE5SiOjHCQ3Qq3GVS7FKDPCgCfetwd
Zwf6TP6MmI8vNSLCfsKun84=3D
=3Dibm9
-----END PGP SIGNATURE-----

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
