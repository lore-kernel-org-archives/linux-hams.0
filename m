From: Bob Nielsen <nielsen@oz.net>
Subject: Re: transparent internet via radio
Date: Sun, 24 Aug 2003 19:58:38 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030825025838.GC9693@n7xy.net>
References: <1061769408.1126.98.camel@fluid.redwork.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1061769408.1126.98.camel@fluid.redwork.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

See the AX25-HOWTO for information on tcp/ip over AX.25.  

The WA4DSY modem will do 56 kbps (http://www.paccomm.com).  It operates
at 29 MHz and must be used with a transverter for the appropriate band. 
Some hams in Slovenia have designed high speed equipment, see
http://hamradio.si/hid.html for some links.


On Sun, Aug 24, 2003 at 04:56:49PM -0700, A Gilmore wrote:
> Having always had high-speed internet available, I have never looked
> into radio technology before.  However, I have been asked recently if
> providing internet to a number of locations (varying between 10-50km
> away from central computer lab) is possible.  Neither dial-up or
> broadband is accessible in these locations.
> 
> So I started looking into radio.  I will have one LAN with broadband
> internet, and remote LANs without any internet access.  The idea is to
> put a TNC equipped linux gateway at each remote location, to tunnel
> TCP/IP over AX.25 to the central LAN with broadband, and route the
> TCP/IP from there.
> 
> Is this feasible?  Can speed be in the 28kbps or better range? 
> Generally how much would the radio equipment cost?  Is providing
> transparent internet by these means difficult, regarding routing and
> interfacing the protocols?
> 
> Sorry if these questions are vague or overly simple, Id just like to
> know if this is possible before I spend the next several days
> researching it.  Most of the information I have found so far, has been
> out-dated, and mostly focused on using TCP/IP to carry AX.25, rather
> then the vice-versa.
> Adrien
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Bob Nielsen, N7XY                          n7xy (at) n7xy.net
Bainbridge Island, WA                      http://www.n7xy.net
 
