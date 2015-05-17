From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: Packet duplication in kernels 2.6 onwards
Date: Sun, 17 May 2015 21:28:50 +0100
Message-ID: <5558FA02.5070308@rns-stearn.demon.co.uk>
References: <5547BACC.7000709@rns-stearn.demon.co.uk> <55483EB3.6070600@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <55483EB3.6070600@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

David Ranch wrote:
>   Hello Richard,
> 
> Can you give us some more details?  Are the duplicates on every packet?  Is this 
> RX or TX duplicates  Only some?  Is this unproto or connected?  Are you using a 
> HW TNC or a SW TNC?
> I'm using the 3.17.5 kernel w/o issues.

Refined the conditions a little.

	1) Only occurs on ax25 packets containing IP payloads
	2) Occurs in both UI and VC packets
	3) Only occurs on packets being sent
	4) Does not appear to be sent "to air" by mkiss module,
	   i.e. the duplicate packet does not appear on the serial line.
	5) Is visible in "listen" output

I discovered this as I am documenting the amateur radio protocols in
wireshark.  It was also reported to Ubuntu (thank you Patrick) by
Ugo Poddine.  In the discussion on the Ubuntu bug report it would appear
that this is known about, hence my posting here to see what was known.
Apparently nothing.


Other things raised by this, in the process of rebuilding my test system
I discovered that the ROSE kernel module did not unload correctly (actually
not at all).  I traced this to the device usage counts not being maintained
correctly.  I have a patch for this if anybody wants it.

-- 
Regards
	Richard

