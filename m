From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Re: Hamlib: "ppdev0: claim the port first"
Date: Wed, 27 Jul 2005 15:14:52 +1200
Message-ID: <200507271514.52065.w.knol@niwa.co.nz>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Wednesday 27 July 2005 14:30, Jonathan Lassoff wrote:
> Howdy. I'm trying to use hamlib to control an Icom IC-746 with a
> homebrew TTL to RS232 level converter. The level converter works
> great on my dekstop's DB9 RS-232 serial port, but not on my
> laptop's DB25 RS-232 parallel port.

A level converter designed to work with EIA232 ports won't work on a
parallel port. They are different beasts with different voltage
levels and pin-outs.

In any case: as far as I know, Hamlib does not supports rig control
via a parallel port.

> Both run the same Debian Sarge
> release with very similar sets of software packages. The problem
> I'm having is that when any application tries to use the parallel
> port, ppdev gets angry. The specific error in the message log is:
> "ppdev0: claim the port first"

Check that the parport is enabled in the BIOS of your laptop, and
 that it is set to bi-directional instead of the old legacy
 unidirectional mode,  if you plan to use it as such.

Make sure the ppdev module is loaded:
 su -c lsmod | grep ppdev
It looks like it is.

Then make sure no other userland applications ( cwdaemon, line
printing, zip drives etc etc)  have laid claim over the parport.

The Hamlib packages on Debian Sarge work well - even the Perl
 bindings are there.

Hope this helps.


Wilbert, ZL2BSJ
