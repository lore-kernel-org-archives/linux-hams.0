From: Ben Stienstra <b.stienstra@xs4all.nl>
Subject: Re: conversd-saupp
Date: Tue, 20 Sep 2011 11:10:36 +0200 (CEST)
Message-ID: <alpine.LNX.2.02.1109201106030.2190@archlinux.home>
References: <1990DAF0-D2C0-4DFF-89F2-E3099F8A7010@xs4all.nl> <alpine.DEB.1.10.1109201006490.25239@nagano.cz>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.1109201006490.25239@nagano.cz>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Ladislav Vaiz <spam@nagano.cz>
Cc: linux-hams@vger.kernel.org

> try to force channel number with convers argument -c. As far as
> I remember, channel 0 is disabled for security reason. Don't ask me why, I'm 
> not convers guru :-)

I'm not using axconv right now. I've configured conversd to listen to the 
AX.25 device.

I have now:
DefaultChan     137
BanZero 0

On the command line (localhost with convers command) it directly logs me 
into channel 137. But on the AX.25 side i still only receive the lines 
below.

*
* Access to channel 0 has been removed from this server.
*

It must be something else i'm overlooking. Just using a Alix3d3 board 
(i386) with Voyage Linux (Debian).
