From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Netromd ssid-0 broadcasts being ignored
Date: Sat, 16 May 2015 08:50:03 -0700
Message-ID: <5557672B.1060501@trinnet.net>
References: <iKOuAuAoraVVFwCg@skywaves.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <iKOuAuAoraVVFwCg@skywaves.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Hello Paul,

Are you using the CVS version of the "Official AX.25" sources?   If so, 
this is a known issue and why VE7FET put together his repo with help 
from Bernard F6BVP.   Read this URL to understand some of the key 
differences:


https://code.google.com/p/linuxax25/
--
In the linux-ax25.org source, the ax25_ntoa function in axutils.c was 
changed so that it mangles callsigns. Specifically, if the callsign has 
a SSID of -0, it strips it.

. . .

NOTE: It appears (as of Nov 2014), that this bad behaviour of the 
Official Source may have been reverted. Patches have been noted in the 
Official Source that seem to get rid of stripping the SSID-0
--


Check out https://code.google.com/p/linuxax25/w/list to understand some 
of the other current differences between the two repos.  I personally 
have been running the VE7FET version of AX25 app/lib/tools with good luck.

--David
KI6ZHD
