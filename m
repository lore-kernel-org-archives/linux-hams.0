From: Robert =?iso-8859-1?q?Steinh=E4u=DFer?= <robert@steinhaeusser.com>
Subject: Re: Strange AXIP / AX25 Frames
Date: Tue, 7 Jan 2003 15:16:53 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200301071516.56542.robert@steinhaeusser.com>
References: <Pine.LNX.4.44.0301072207280.12010-100000@zl2bsj.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0301072207280.12010-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Wilbert Knol wrote:
> > 9: fm [invalid] to [invalid] via 90gGB7-2* M0GB7-3* [invalid] [invalid]*
> > [invalid] gGB7BM 0GB7CR [invalid] ctl [invalid]0^ [DAMA]
>
> Kernel 2.4.20 & latest AX25 apps, lib, tools. TNC-2 in KISS-mode.

KISS mode normally has no checksumming, so any stray HF will mess up the data 
on your serial line between TNC and PC. Use shielded cabling and SMACK or 
RMNC-CRC-KISS or (even better for numerous reasons) 6PACK.

73, Robert DL1NC/N9KBK
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+GuFYo4a8ramwUd8RAtZ3AJ4qUdrcGRAtM2/m9AhUmNvMoMiQrwCeKYS+
NwjKGKT00PWmICX4E/8Jlhg=
=M5q3
-----END PGP SIGNATURE-----

