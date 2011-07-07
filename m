From: "Bernard, f6bvp" <f6bvp@free.fr>
Subject: Question with axudp
Date: Thu, 07 Jul 2011 15:31:44 +0200
Message-ID: <4E15B540.2030307@free.fr>
References: <4B2CD772.1030106@upmc.fr> <4B2D1025.1020106@gmail.com> <4B2E6729.1090102@free.fr> <4B507FAA.8010007@free.fr> <20100115203654.GA3084@del.dom.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20100115203654.GA3084@del.dom.local>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Thoelen <kd1zd@rtcubed.org>
Cc: linux-hams@vger.kernel.org

Hello Robert,

You have probably noticed that you can define different routes in 
ax25ipd.conf according to SSIDs values with SSID zero as a wild card, 
i.e. all SSIDs destinations will be routed via this address. For example :

#
route f6bvp-9 192.168.0.64 udp 10094 b
route f6bvp-8 192.168.0.64 udp 10094
route f6bvp-14 192.168.0.64 udp 10094
# F4BWT-0 = joker
route f4bwt-0 62.147.157.243 udp 10093 b
route kd4yal-0 kd4yal.servebbs.org udp 10093 b
route f6gov-0 f6gov.no-ip.org udp 10093 b

Note that parameter b will allow NetRom broadcast through this route.

You may also play with the verbose and min_obs parameter values in 
/etc/ax25/nrbroadcast
With min_obs equal to 255 and verbose = 0 for a specific HF port there 
will be minimal broadcast.

73 de Bernard, f6bvp


> List:       linux-hams
> Subject:    Question with axudp
> From:       Robert Thoelen <kd1zd () rtcubed ! org>
> Date:       2011-07-05 23:30:55
> Message-ID: CAAynhLMhGVDiVsAugsWSOLTRkrw6OeXRYeyKJEdUVaHMmE0rZQ () mail ! gmail ! com

I have a system running UROnode, and I have a couple of internet
links.  I want to create a virtual machine in a data center to run
UROnode and have my internet axudp links connect to that system.
Then, I can use one connection from my home station via axudp to
connect to the virtual machine.  The purpose behind this is among
other reasons to keep netrom broadcasts from cluttering my RF node.

Anyway, the virtual machine seems to be working well and is
broadcasting its netrom node to the home system.   I'm having trouble
getting the home system to send packets back to the virtual machine.

My question is:  if I use a few ssids with my callsign, will that
cause ax25ipd from routing another ssid with my call?  The virtual
machine is kd1zd-9, and the home system uses kd1zd-3 to kd1zd-7.

What could be causing the home system to not send packets out to the
virtual machine?  The other axudp links in the .conf file work fine.

Thanks,
Bob
