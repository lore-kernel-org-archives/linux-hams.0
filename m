From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: transparent internet via radio
Date: Mon, 25 Aug 2003 15:06:06 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030825150606.A17749@pull.privacy.nb.ca>
References: <1061769408.1126.98.camel@fluid.redwork.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1061769408.1126.98.camel@fluid.redwork.net>; from agilmore@shaw.ca on Sun, Aug 24, 2003 at 04:56:49PM -0700
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: A Gilmore <agilmore@shaw.ca>
Cc: linux-hams@vger.kernel.org

On Sun, Aug 24, 2003 at 04:56:49PM -0700, A Gilmore wrote:
> Having always had high-speed internet available, I have never looked
> into radio technology before.  However, I have been asked recently if
> providing internet to a number of locations (varying between 10-50km
> 
> So I started looking into radio.  I will have one LAN with broadband
> internet, and remote LANs without any internet access.  The idea is to
> 
> Is this feasible?  Can speed be in the 28kbps or better range? 
> Generally how much would the radio equipment cost?  Is providing
> transparent internet by these means difficult, regarding routing and
> interfacing the protocols?

Are you a licensed amateur radio (ham) operator? You don't mention
a callsign, and some of your questions seem quite basic regarding
VHF & higher propagation, which suggests perhaps you are not.

Amateur radio in Canada and elsewhere has content restrictions and
is for non-commercial usage, which are not agreeable to most people's
general Internet usage. So for general wireless Internet access,
I suspect that the amateur radio solution is not the best general
solution.

I would suggest looking into license-free/exempt "WiFi" or 802.11(b)
wireless ethernet. These are low cost (cheaper than a commercial TNC
in most cases) devices provide low power (often 100mW) 2.4 GHz
(microwave) with speeds up to 11Mbps (802.11b) or higher (802.11g).
With a clear line of sight, and a small directional antenna
you can easily get a stable connection over 10km or more.

I would not recommend consumer oriented 802.11b for a Wireless ISP
(WISP) as they tend to have serious issues scaling, and the
license-free status means you must tolerate intereference.

See BC Wireless for more Canadian specific information:
<http://www.bcwireless.net/>

-ve1mct
