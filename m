From: "Wilbert Knol" <w.knol@niwa.cri.nz>
Subject: Re: Kernel recommendations for AX.25?
Date: Sun, 28 Apr 2002 19:03:50 +1200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3CCC4796.32020.20D425D7@localhost>
References: <20020426204957.GA2930@oz.net>
Reply-To: w.knol@niwa.cri.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020426204957.GA2930@oz.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bob Nielsen <nielsen@oz.net>, linux-hams@vger.kernel.org


> I'm about to build up a new machine for shack use (Duron 800 CPU,
> Chaintek mainboard with VIA Apollo KT133 chipset, 128 MB) and was
> wondering what kernel would be the best choice for use with AX.25
> networking.  I run 2.4.18 on one of my boxes without AX.25 and it seems
> pretty stable, but I recall seeing some messages about potential
> problems with either AX.25 or some of the device drivers.  The changes
> in the 2.4 series seem to still be coming at a fast clip.

I installed 2.4.18 a few days ago over 2.4.8, and have been impressed, 
so far.

A lot of funnies to do with AX25 have disappeared (and a new one has 
appeared: the suspected parport problem :-)

But if you are using KISS TNCs, 2.4.18 would have my vote. My 
impression is, that it is more stable and possibly a little faster (the latter 
may be to do with the change from ext2 to reiser, however)

I am busy patching up to 19-pre7, trying to get to the bottom of the picpar 
problem....I want my 70 cm 9k6 port back.

Wilbert, ZL2BSJ

