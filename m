From: Walter R Fletcher <fletcher@uwyo.edu>
Subject: Re: netrom
Date: Sun, 14 Apr 2002 18:23:42 -0600 (MDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.GSO.4.10.10204141802280.15175-100000@asuwlink.uwyo.edu>
References: <Pine.LNX.4.21.0204142353110.365-100000@Consulate.UFP.CX>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0204142353110.365-100000@Consulate.UFP.CX>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: Riley Williams <rhw@InfraDead.Org>
Cc: M Taylor <mctylr@privacy.nb.ca>, Shane Deering <vk3bvp@qsl.net>, Linux Ham Radio <linux-hams@vger.kernel.org>



All,

From the 12 Dec 2001 list of AMPR IP address coordinators:

# 44.128 is reserved for testing.  Do not use for operational networks.
# You may safely assume that any packets with 44.128 addresses are bogons
# unless you are using them for some sort of testing.

     44.128.x.y may be allocated for 44.x.y.z internal testing but
what happens to them depends on the net 44 routers being set up
properly such that they dispose of the test packets.  Using the
10.x.y.z addresses gives you a certainty that if your test packets
inadvertantly leak out of the 44.x.y.z net, they will promptly and
safely be dropped.  Either way would be using the addresses for what
they were intended of course.  It's a matter of making things happen
that are proper and predictable, hence good network etiquette.

--  Reid


  Reid Fletcher / WB7CJO
  Senior Systems Analyst / Unix Systems Administrator
  Department of Geology and Geophysics                  P. O. Box 3006
  University of Wyoming                                 1-307-766-6227
  Laramie,  WY   82071                  Internet:  Fletcher @ UWyo.Edu

On Sun, 14 Apr 2002, Riley Williams as an addendum to others, wrote:
 
> > Please do not randomly used a 44. address without allocation.
> > 44.135.96/24 is Ottawa, Ontario, Canada (ve3), so I suspect that you
> > do not have it allocated to you (having a vk callsign I assume you
> > are not operating in Canada).
> > 
> > Use a non-routable Private IP (RFC 1918) such as 10.0.0.1.
> 
> Alternatively, I understand that 44.128.* addresses are reserved for
> testing as well, and can be freely used as a result.
> 
> Perhaps somebody could clarify that for me though?
> 
> Best wishes from Riley.


