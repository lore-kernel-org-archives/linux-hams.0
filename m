From: Mike Markowski <mm@UDel.Edu>
Subject: Re: gMFSK/hamlib/parport
Date: Thu, 19 Feb 2004 11:58:56 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040219165856.GD14329@strauss.udel.edu>
References: <20040218152745.GD16991@strauss.udel.edu> <1077135120.1270.67.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1077135120.1270.67.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-hams List <linux-hams@vger.kernel.org>

First, thanks to everyone for the very helpful responses.
I'll try them tonight after work and see how it goes.

On Wed 18-Feb-04 at 1512 EST, Tomi Manninen wrote:
> On Wed, 2004-02-18 at 17:27, Mike Markowski wrote:
> 
> > 	Feature request:
> > 	- Are there any patches that allow gMFSK to use
> > 	  a parport for PTT?  If not, I'll be glad to look into
> > 	  possibly re-using the parport code from soundmodem-0.7.
> 
> There is no direct support available. Like Stephane said, hamlib
> can control PTT through the parport.

As far as I know (which isn't much!), there isn't a hamlib config
file.  It seems that rigctl lets you test hamlib but doesn't let
you create a permanent file with settings.  If that's true, I need to
set the PTT device in gMFSK.

So to specify /dev/parport0 as the PTT device, would I in gMSFK
first set Settings/Preferences/Devices/PTT to /dev/parport0
and then enable PTT in the hamlib menu??  I have a feeling I'm
missing something...

	Thanks again,
	Mike  AB3AP
