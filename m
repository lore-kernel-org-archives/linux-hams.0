From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: Linux 2.6.3 ... Where are mkiss and 6pack?
Date: Thu, 19 Feb 2004 00:35:15 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040219003515.K231@jeroen.pe1rxq.ampr.org>
References: <200402182229.30123@www.cabodesantapola.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200402182229.30123@www.cabodesantapola.org>; from eb5esx@eb5esx.ampr.org on Wed, Feb 18, 2004 at 22:29:29 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ruben Navarro Huedo <eb5esx@eb5esx.ampr.org>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

On 2004.02.18 22:29:29 +0100 Ruben Navarro Huedo wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hello friends:
> linux-2.6.3 has been released, but...Where are 6pack and mkiss?
> I don't find them...
> I can see bpq, Baycom...etc... but not 6pack or mkiss.

Somebody decided that they are not SMP safe...
If you deselect 'Select only drivers expected to compile cleanly' in the
'Code maturity level options' you will get the 6pack and mkiss drivers
back.

In other words someone has to go over the mkiss and 6pack code and make it
smp safe.

btw my last 6pack patch is NOT yet in 2.6.3 so you will have to apply that
manually.

Jeroen

