From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Kernel 2.6 Oddness
Date: Wed, 14 Jul 2004 23:26:49 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1089836809.1302.59.camel@oh2bns.ampr.org>
References: <Pine.LNX.4.44.0407131420280.5237-100000@bucket.k5di.com>
	 <40F58DD3.7080600@utoronto.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40F58DD3.7080600@utoronto.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Wed, 2004-07-14 at 22:47, Dave Stubbs wrote:

> Recently I upgraded to kernel 2.6 and updated 
> a bunch of other packages, and now node won't allow connections any 
> more.  It says "rsconfig:  port rose not active  

This is only a warning. Edit the rsports file and remove all
rose port definitions.

> *** configuration 
> error" and then quits.

Node should print the real cause of this to the system logs.
Check /var/log/messages for starters.

-- 
Tomi Manninen / OH2BNS / KP20ME04

