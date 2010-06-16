From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: Linux Packet Interface Hardware
Date: Thu, 17 Jun 2010 01:49:16 +0300
Message-ID: <20100616224916.GP898@mea-ext.zmailer.org>
References: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com>
 <4C183169.3060206@radagast.org>
 <alpine.LNX.2.00.1006160534330.14107@wapiti.we7u.net>
 <4C195062.7050401@radagast.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4C195062.7050401@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Platt <dplatt@radagast.org>
Cc: linux-hams@vger.kernel.org

On Wed, Jun 16, 2010 at 03:29:54PM -0700, Dave Platt wrote:
...
> > Thanks all for the ideas/input.  I think the BPQether driver best fits
> > what I was hoping to find, except for the fact that it doesn't exist
> > off-the-shelf yet....
> 
> I agree - an interesting idea.
... 
> The Cypress microcontrollers with the EZ-USB stack could be
> suitable targets.  These have the ability to have their firmware
> downloaded by the host over USB each time they plug in and
> enumerate... easy updating, no need to burn EEPROMs or flash
> firmware directly into the chips.  High-end PIC micros could
> be another workable choice.

While the idea of "load the firmware at boot" is great idea during
development, it becomes not-so-great in deployment.

I would prefer flashing in the production firmware, and possibly
supplying a way to re-flash it if necessary, but never playing
development mode games with users.

Even with windows we are seeing that 2-3 years down the road the
old drivers / firmware loads  become non-functional when windows
versions change.   It is always better to use abstractions that
do not need any sort of device driver disks on any platform, and
the way to achieve that is preferrably not subscribing on OS vendors
driver integration program.

What if your modem has ethernet?  No way to upload firmware thru
USB then.  (BPQether over ethernet...)

73 de Matti, OH2MQK
