From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Re: gMFSK/hamlib/parport
Date: Thu, 19 Feb 2004 08:15:04 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0402190810380.25041-100000@zl2bsj.ampr.org>
References: <20040218152745.GD16991@strauss.udel.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040218152745.GD16991@strauss.udel.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Markowski <mm@UDel.Edu>
Cc: Linux Hams <linux-hams@vger.kernel.org>


> 	Bug report (but maybe in hamlib):
> 	- I'm using an ICOM 706 MkIIg with hamlib on ttyS0 and
> 	  PTT to "none" in gMFSK just for the sake of seeing how
> 	  gMFSK uses hamlib.  When I rotate the rig's tuning knob,
> 	  gMFSK works for a bit nicely updating the spectrum freqs,
> 	  but then I get a "Protocol error" and hamlib is disabled.

Try turning off what Icom calls "transceive mode" in the rig.

Having this mode on causes the rig to announce frequency data as you
tune around. It causes bus collisions with Hamlib packets, resulting
in a protocol errors.

Wilbert, ZL2BSJ

