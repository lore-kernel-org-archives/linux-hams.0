From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: gMFSK/hamlib/parport
Date: Thu, 19 Feb 2004 19:28:56 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1077211736.1283.1.camel@oh2bns.ampr.org>
References: <20040218152745.GD16991@strauss.udel.edu>
	 <1077135120.1270.67.camel@oh2bns.ampr.org>
	 <20040219165856.GD14329@strauss.udel.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040219165856.GD14329@strauss.udel.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Markowski <mm@UDel.Edu>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

On Thu, 2004-02-19 at 18:58, Mike Markowski wrote:

> On Wed 18-Feb-04 at 1512 EST, Tomi Manninen wrote:
> > On Wed, 2004-02-18 at 17:27, Mike Markowski wrote:
> > 
> > > 	Feature request:
> > > 	- Are there any patches that allow gMFSK to use
> > > 	  a parport for PTT?  If not, I'll be glad to look into
> > > 	  possibly re-using the parport code from soundmodem-0.7.
> > 
> > There is no direct support available. Like Stephane said, hamlib
> > can control PTT through the parport.
> 
> As far as I know (which isn't much!), there isn't a hamlib config
> file.  It seems that rigctl lets you test hamlib but doesn't let
> you create a permanent file with settings.  If that's true, I need to
> set the PTT device in gMFSK.

Umm... You're right. There is no support in gMFSK for setting the
required hamlib options for this. I should have engaged my brain 
before posting...

-- 
Tomi Manninen / OH2BNS / KP20ME04

