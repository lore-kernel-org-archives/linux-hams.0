From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: Document request - ROSE protocol specification
Date: Wed, 14 Mar 2007 23:27:21 +0000
Message-ID: <45F884D9.2050500@rns-stearn.demon.co.uk>
References: <45F87682.8010206@rns-stearn.demon.co.uk> <20070314223636.GK31960@vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20070314223636.GK31960@vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Folkert van Heusden wrote:

> Would you please also consider integrating all this work into tcpdump?
> Because as far as I know wireshark is for x11.

You can build and run tshark which is the terminal version of wireshark.

I have a patch for tcpdump that contains the changes to support:
	AX.25
	AX.25 ARP
	Netrom
	Flexnet (such as it is)
	ROSE (such as it is)

I will release that at the same time as the wireshark one.  The full set of 
patches is:
	libpcap - for protocol 3 (AX.25) capture
	tcpdump
	wireshark

I originally started by adding to tcpdump as it is a simpler system and I could 
then use the experience gained when porting to wireshark.

-- 
Regards
	Richard
