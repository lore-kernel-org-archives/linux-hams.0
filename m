From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: Packet duplication in kernels 2.6 onwards
Date: Wed, 20 May 2015 13:33:42 +0100
Message-ID: <555C7F26.7030006@rns-stearn.demon.co.uk>
References: <5547BACC.7000709@rns-stearn.demon.co.uk> <55483EB3.6070600@trinnet.net> <5558FA02.5070308@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5558FA02.5070308@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

I think I have got to the bottom of this issue.  The good news is that it is
not a bug in the AX25 protocol or driver code, the bad news is that it is
the result of an architectural change in the kernel.

One correction to my original post, the duplication is on receive not
transmit.

In kernels upto and including 2.4 where an AX25 payload was IP or ARP the
packet was handed off by calling the ip or arp protocol driver directly.
In kernels 2.6 onwards after adjusting the packet details the payload is
handed back to the network interface for that interface to reroute the
packet into the IP or ARP protocol drivers.

A couple of code fragments:

from 2.4.37.11:
net/ax25/ax25_in.c
287                          case AX25_P_IP:
288                                  skb_pull(skb,2);                /* drop PID/CTRL */
289                                  skb->h.raw    = skb->data;
290                                  skb->nh.raw   = skb->data;
291                                  skb->dev      = dev;
292                                  skb->pkt_type = PACKET_HOST;
293                                  skb->protocol = htons(ETH_P_IP);
294                                  ip_rcv(skb, dev, ptype);        /* Note ptype here is 
the wrong one, fix me later */
295                                  break;
296

from 2.6.32.65:
net/ax25/ax25_in.c
244                  case AX25_P_IP:
245                          skb_pull(skb,2);                /* drop PID/CTRL */
246                          skb_reset_transport_header(skb);
247                          skb_reset_network_header(skb);
248                          skb->dev      = dev;
249                          skb->pkt_type = PACKET_HOST;
250                          skb->protocol = htons(ETH_P_IP);
251                          netif_rx(skb);
252                          break;

I was able to revert kernel 2.6.32.65 to the 2.4 method as ip_rcv & arp_rcv still
exist and it was a simple matter to expose the functions (exporting the symbols and
adding to the header files).  Once reverted the duplicated packets in the 2.6 kernel
disappeared.

All the testing has been done using virtual machines linked by a virtual serial link.
Testing was done to establish connections using AX25-UI, AX25-VC, NETROM, ROSE IP/ICMP,
IP/UDP & IP/TCP.
The first setup was of two 2.4.37.11 kernels.
The second setup was of one 2.4.37.11 kernel and one 2.6.32.65 kernel.
The third setup was of one 2.4.37.11 kernel and one 3.2.69 kernel.

For the first setup no duplicates were seen at any point.

For the second setup, duplicates of received packets were seen on the 2.6 kernel
wherever IP was involved. No duplicates were seen on the 2.4 kernel.

For the third setup, duplicates of received packets were seen on the 3.2 kernel
wherever IP was involved. No duplicates were seen on the 2.4 kernel.

These duplicate packets are seen by both "listen" and libpcap (and thus tcpdump or
wireshark).  From the protocol analysis point of view any kernel 2.6 onwards is
suspect where encapsulated protocols, such as IP-over-AX25, are concerned.

Notably NETROM and ROSE are not affected, this may be related to the manner in
which those protocols "register" their handlers with AX25.  The AX25 protocol
driver considers AX25_P_TEXT, AX25_P_SEGMENT, AX25_P_IP or AX25_P_ARP as
"internal" protocols (ax25/ax25_iface.c).  The solution may be to "register"
IP & ARP with AX25 although how to achieve this I can not immediate see.

The above explains why the amateur radio protocols work however when one starts
to look at the packets analytically what is seen at the network interface
for IP & ARP is false.

Of course I could have it totally wrong.

-- 
Regards
	Richard
