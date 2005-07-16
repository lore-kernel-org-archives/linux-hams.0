From: "Stewart Wilkinson" <g0lgs@gb7lgs.co.uk>
Subject: RE: Gateway matters...routing matters!
Date: Sat, 16 Jul 2005 22:53:47 +0100
Message-ID: <OMEGIMHHANGHDCMEGEJCOELICCAA.g0lgs@gb7lgs.co.uk>
References: <42D97588.3050509@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42D97588.3050509@libero.it>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


> I'm able to set the default route to USCD.EDU: ip route add 44.0.0.0/8 
> via 128.54.16.18 dev tunl0 onlink

> root@arimodena:/etc# route add -net 44.134.8.0 netmask 255.255.255.0 dev 
> tunl0 gw 134.43.26.1
> SIOCADDRT: Network is unreachable
> root@arimodena:/etc#

I think you need:

	ip route add 44.134.8.0/24 via 134.43.26.1 dev tunl0 onkink

--
Stewart G0LGS

