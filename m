From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: newbie soundmodem question about mic vs line input
Date: Fri, 13 Feb 2004 20:39:34 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1076697574.1290.50.camel@oh2bns.ampr.org>
References: <20040213100203.62bbe780.washer@trlp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040213100203.62bbe780.washer@trlp.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

Hi,

> 1) Under linux, are the mic and line inputs mixed, or do they 
> have seperate devices to open?

It's one device, with the input (recording) device selected by 
ioctls.

> 2) I can play with the mic/line/speaker/etc gains using aumix.. 
> Does this have any effect on soundmodem, or does it set the gain 
> using ioctls, etc.

Soundmodem does not touch the sound card mixer settings nor does 
it change the input selection. These must be set with a regular
mixer application. I use gmix.

> 3) The mic jack appears to be mono, where as the line jack appears 
> to be stereo. Does soundmodem have any options to listen to the two 
> channels seperately? i.e. I'd like to do APRS on one channel, 
> and packet on another, but I fear that /dev/dsp is a mix. Is this 
> correct? 

Whether recording is stereo or mono (usually mono == left channel)
is again selected with ioctls. Soundmodem sets the device for
mono input and output.

-- 
Tomi Manninen / OH2BNS / KP20ME04

