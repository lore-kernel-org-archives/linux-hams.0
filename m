From: Dennis Boone <drb@msu.edu>
Subject: Re: transparent internet via radio
Date: Mon, 25 Aug 2003 10:41:30 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E19rIXk-00045p-00@yagi.h-net.msu.edu>
References: <20030825150606.A17749@pull.privacy.nb.ca>  <1061769408.1126.98.camel@fluid.redwork.net>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Mon, 25 Aug 2003 15:06:06 BST.)
             <20030825150606.A17749@pull.privacy.nb.ca> 
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 >  > Having always had high-speed internet available, I have never looked
 >  > into radio technology before.  However, I have been asked recently if
 >  > providing internet to a number of locations (varying between 10-50km

 >  > Is this feasible?  Can speed be in the 28kbps or better range?
 >  > Generally how much would the radio equipment cost?  Is providing
 >  > transparent internet by these means difficult, regarding routing and
 >  > interfacing the protocols?

 > Amateur radio in Canada and elsewhere has content restrictions and is
 > for non-commercial usage, which are not agreeable to most people's
 > general Internet usage. So for general wireless Internet access, I
 > suspect that the amateur radio solution is not the best general
 > solution.

However it is certainly feasible to use similar or identical gear on a
licensed commercial frequency.  Kantronics and other amateur packet
manufacturers make most of their money selling to commercial
entities.

Since the gear is sold for these purposes, presumably it is possible
to get a business band license for point-to-point data circuits.  I
should think it would be relatively simple to get 56k data rates over
circuits of the length described, assuming terrain cooperates, on
VHF-low or -high frequencies.  In the U.S., for example, there have
been packet networks spanning a number of southeastern states,
e.g. SEDAN.  Needed equipment would be a mast or tower at each
location, beam antennas at most locations (perhaps a vertical at the
central point), data radios, modems capable of the desired speed,
license, and a fair amount of knowledge to integrate it all.

 > I would suggest looking into license-free/exempt "WiFi" or 802.11(b)
 > wireless ethernet. These are low cost (cheaper than a commercial TNC
 > in most cases) devices provide low power (often 100mW) 2.4 GHz
 > (microwave) with speeds up to 11Mbps (802.11b) or higher (802.11g).
 > With a clear line of sight, and a small directional antenna you can
 > easily get a stable connection over 10km or more.

But he specified up to 50 km, which is probably NOT feasible with
802.x technology, at least without relay stations.

Dennis Boone
KB8ZQZ
