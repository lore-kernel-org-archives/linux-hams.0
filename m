From: Andrew Bates <abates@omeganetserv.com>
Subject: Re: transparent internet via radio
Date: Sun, 24 Aug 2003 18:14:40 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F4954F0.5050400@omeganetserv.com>
References: <1061769408.1126.98.camel@fluid.redwork.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1061769408.1126.98.camel@fluid.redwork.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: A Gilmore <agilmore@shaw.ca>
Cc: linux-hams@vger.kernel.org

Adrien,

You should investigate using wireless ethernet (802.11b).  Several of 
the 802.11b channels are in the Amateur spectrum.  Also, the equipment 
is widely available and quite afordable.  By utilizing yagi or parabolic 
antennas and good transcievers, you should be able to achieve a 15 mile 
distance while maintaining at least 1mbps or better.

Of course, one of the drawbacks is that 802.11b requires nearly a 
line-of-site path as 2ghz signals are easily reflected or absorbed by 
obstructions.

Hope this helps!
Andrew/KB0LND

A Gilmore wrote:

>Having always had high-speed internet available, I have never looked
>into radio technology before.  However, I have been asked recently if
>providing internet to a number of locations (varying between 10-50km
>away from central computer lab) is possible.  Neither dial-up or
>broadband is accessible in these locations.
>
>So I started looking into radio.  I will have one LAN with broadband
>internet, and remote LANs without any internet access.  The idea is to
>put a TNC equipped linux gateway at each remote location, to tunnel
>TCP/IP over AX.25 to the central LAN with broadband, and route the
>TCP/IP from there.
>
>Is this feasible?  Can speed be in the 28kbps or better range? 
>Generally how much would the radio equipment cost?  Is providing
>transparent internet by these means difficult, regarding routing and
>interfacing the protocols?
>
>Sorry if these questions are vague or overly simple, Id just like to
>know if this is possible before I spend the next several days
>researching it.  Most of the information I have found so far, has been
>out-dated, and mostly focused on using TCP/IP to carry AX.25, rather
>then the vice-versa.
>Adrien
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  
>

