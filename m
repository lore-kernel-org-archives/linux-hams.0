From: Michael Melanson <ve3mtm@sympatico.ca>
Subject: Re: Re: transparent internet via radio
Date: Sun, 24 Aug 2003 21:42:17 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030825014218.RLND3027.tomts9-srv.bellnexxia.net@[209.226.175.22]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: A Gilmore <agilmore@shaw.ca>
Cc: linux-hams@vger.kernel.org


> 
> From: Andrew Bates <abates@omeganetserv.com>
> Date: 2003/08/24 Sun PM 08:14:40 EST
> To: A Gilmore <agilmore@shaw.ca>
> CC: linux-hams@vger.kernel.org
> Subject: Re: transparent internet via radio
> 
> Adrien,
> 
> You should investigate using wireless ethernet (802.11b).  Several of 
> the 802.11b channels are in the Amateur spectrum.  Also, the equipment 
> is widely available and quite afordable.  By utilizing yagi or parabolic 
> antennas and good transcievers, you should be able to achieve a 15 mile 
> distance while maintaining at least 1mbps or better.
> 
> Of course, one of the drawbacks is that 802.11b requires nearly a 
> line-of-site path as 2ghz signals are easily reflected or absorbed by 
> obstructions.
> 
> Hope this helps!
> Andrew/KB0LND
> 
> A Gilmore wrote:
> 
> >Having always had high-speed internet available, I have never looked
> >into radio technology before.  However, I have been asked recently if
> >providing internet to a number of locations (varying between 10-50km
> >away from central computer lab) is possible.  Neither dial-up or
> >broadband is accessible in these locations.
> >
> >So I started looking into radio.  I will have one LAN with broadband
> >internet, and remote LANs without any internet access.  The idea is to
> >put a TNC equipped linux gateway at each remote location, to tunnel
> >TCP/IP over AX.25 to the central LAN with broadband, and route the
> >TCP/IP from there.
> >
> >Is this feasible?  Can speed be in the 28kbps or better range? 
> >Generally how much would the radio equipment cost?  Is providing
> >transparent internet by these means difficult, regarding routing and
> >interfacing the protocols?
> >
> >Sorry if these questions are vague or overly simple, Id just like to
> >know if this is possible before I spend the next several days
> >researching it.  Most of the information I have found so far, has been
> >out-dated, and mostly focused on using TCP/IP to carry AX.25, rather
> >then the vice-versa.
> >Adrien
> >
> >-
> >To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> >the body of a message to majordomo@vger.kernel.org
> >More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >  
> >
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

As for the transparent routing, this is certainly possible. It's called IP Masquerading in Linux and it's a form of NAT (Network Address Translation). I have a nearly identical setup going, using DSL instead of a wireless link, but other than the link, the two are the same. There is a good HOWTO at this URL:

http://www.ibiblio.org/pub/Linux/docs/HOWTO/other-formats/html_single/IP-Masquerade-HOWTO.html

It is geared towards a setup like mine using DSL, but it should be trivial to change it

Cheers,
Michael VE3MTM
73 33

