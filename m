From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: [PATCH] FBB & linux 2.6
Date: Sat, 14 Feb 2004 00:02:33 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040214000233.L220@jeroen.pe1rxq.ampr.org>
References: <20040213202807.F220@jeroen.pe1rxq.ampr.org> <20040213215430.H220@jeroen.pe1rxq.ampr.org> <1076705415.1298.68.camel@oh2bns.ampr.org> <200402132336.10230.eb5esx@eb5esx.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200402132336.10230.eb5esx@eb5esx.ampr.org>; from eb5esx@eb5esx.ampr.org on Fri, Feb 13, 2004 at 23:36:09 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ruben Navarro Huedo <eb5esx@eb5esx.ampr.org>
Cc: Tomi Manninen <oh2bns@sral.fi>, Linux-hams List <linux-hams@vger.kernel.org>, Linux FBB List <xfbb@f6fbb.org>

On 2004.02.13 23:36:09 +0100 Ruben Navarro Huedo wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Trying to apli the patch here:
> 
> linux:/usr/src# patch -p0 <./fbb703.linux2.6.diff
> patching file fbbsrc.703c/src/console.c
> Hunk #1 FAILED at 893.
> Hunk #2 FAILED at 929.
> 2 out of 2 hunks FAILED -- saving rejects to file 
> fbbsrc.703c/src/console.c.rej
> linux:/usr/src# ls -l fbbsrc.70
> fbbsrc.703c  fbbsrc.704j
> linux:/usr/src# ls -l fbbsrc.703c
> lrwxr-xr-x    1 root     src            13 feb 13 20:54 fbbsrc.703c -> 
> ./fbbsrc.704j
> linux:/usr/src#
> 
> How have you applied it?

Go into the tree you want to patch and use -p1 instead of -p0

Jeroen

