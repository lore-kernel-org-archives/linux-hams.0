From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: linux kernel-ax25 - some patches
Date: Thu, 18 Feb 2016 14:58:10 +0100
Message-ID: <20160218135810.GA24846@x-berg.in-berlin.de>
References: <20160215140035.GF24276@x-berg.in-berlin.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160215140035.GF24276@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello,

a small update: Please disregard my oservation #3.

Explanation:

IP framents have, by protocol standard, a size of n * 8  (8 is a fixed
defined blocksize).

IP header is not part of the fragmentation blocks (of course) and counts 20.

=> division (256-20)/8.0 = 29.5 has a rest => length of packet:
   29*8+20 = 252. That's the observed value.

Btw, on netrom, the rest is 0 (netrom overhead 20 => netrom iface mtu 236):
(236-20)/8.0 = 27.0
=> Netrom payload with IP fragmented packets match exact the mtu length.

vy 73,
	- Thomas  dl9sau


On Mon, Feb 15, 2016 at 03:00:36PM +0100, Thomas Osterried wrote:
[..] 
> 3. IP fragmentation in Mode DG and VC
> -------------------------------------
> 
> 
> MTU of interface is 256 (== paclen).
> 
[..]
> # ifconfig bpq2 mtu 256
> 
> bpq2: fm DL9SAU to DL9SAU-15 ctl I00^ pid=CC(IP) len 252 
> IP: len 252 44.128.128.1->44.128.128.10 ihl 20 ttl 64 id 52882 offs 0 MF prot ICMP
> ICMP: type Echo Request id 5113 seq 1
> 0000  ...V............................ !"#$%&'()*+,-./0123456789:;<=>?
> 0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
> 0080  ................................................................
> 00C0  ................................
> bpq2: fm DL9SAU to DL9SAU-15 ctl I01+ pid=CC(IP) len 25 
> IP: len 25 44.128.128.1->44.128.128.10 ihl 20 ttl 64 id 52882 offs 232
> 0000  .....
> 
> => On both, Mode VC and Mode DG, the IP fragmentation makes packets 252 bytes long.
> IP packets with length of 256 pass the interface with len 256, which is correct.
[..]

