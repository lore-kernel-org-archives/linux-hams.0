From: f6bvp <f6bvp@free.fr>
Subject: Re: [Patch] rose_route_frame() NULL pointer dereference kernel panic
Date: Wed, 2 Mar 2016 13:30:57 +0100
Message-ID: <56D6DD01.9050504@free.fr>
References: <56C9D727.7070109@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <56C9D727.7070109@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, 'f6bvp' <f6bvp@free.fr>

Hi All,

I further investigated the null pointer bug After David Miller on
linux-netdev noticed rose_route_frame() being called by
rose_xmit() with an explicit NULL argument.

Here is the explanation :

When rose_route_frame() is called by rose_xmit() with
NULL *ax25 argument the following comparison (rose_route.c , line 883)

if (ax25cmp(&ax25->dest_addr, &rose_neigh->callsign) == 0 &&

always has a pointer dereference leading to a kernel panic.

I noticed, using a few printk, that during rose normal operations
rose_xmit() was never called when ax25ipd sends an UDP frame.
Otherwise, this bug would have been found earlier.
It is only because FPAC application asked for a connection to an
address without defined route and gateway that rose_xmit() was activated.

I am not sure I understood well the purpose of the NULL second argument.
I only guess it was intended to have ax25->dest_addr empty in order
to make the comparison with all possible rose_neigh->callsign always false.

I built the following patch in order to obtain the same result without 
NULL pointer.

--- a/net/rose/rose_dev.c       2016-02-25 21:01:36.000000000 +0100
+++ b/net/rose/rose_dev.c  2016-03-01 14:08:29.911389078 +0100
@@ -101,13 +101,16 @@ static netdev_tx_t rose_xmit(struct sk_b
  {
         struct net_device_stats *stats = &dev->stats;
         unsigned int len = skb->len;
+       struct ax25_cb ax25;

+       memset(&ax25, 0, sizeof(struct ax25_cb));
+
         if (!netif_running(dev)) {
                 printk(KERN_ERR "ROSE: rose_xmit - called when iface is 
down\n");
                 return NETDEV_TX_BUSY;
         }

-       if (!rose_route_frame(skb, NULL)) {
+       if (!rose_route_frame(skb, &ax25)) {
                 dev_kfree_skb(skb);
                 stats->tx_errors++;
                 return NETDEV_TX_OK;

After this patch is applied, the following was captured

[ 1786.971744] NET: Registered protocol family 3
[ 1786.990288] mkiss: AX.25 Multikiss, Hans Albas PE1AYX
[ 1786.991179] mkiss: ax0: crc mode is auto.
[ 1786.991585] IPv6: ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
[ 1789.270858] NET: Registered protocol family 11
[ 1792.286229] mkiss: ax0: Trying crc-smack
[ 1792.287588] mkiss: ax0: Trying crc-flexnet
[ 1792.287650] rose_route : unknown neighbour or device *
[ 1792.290174] rose_route : unknown neighbour or device *
[ 1802.304145] rose_route : unknown neighbour or device *
[ 1802.305516] rose_route : unknown neighbour or device *
[ 1818.496876] IPv4: martian source 255.255.255.255 from 44.168.19.17, 
on dev enp4s0
[ 1818.498115] ll header: 00000000: ff ff ff ff ff ff 00 0c 42 91 13 ab 
08 00        ........B.....
[ 1822.368122] rose_route : unknown neighbour or device *
[ 1822.369566] rose_route : unknown neighbour or device *

It shows that rose_route_frame() is then correctly identifying a wrong 
neighbour
and returns a 0 result, avoiding any dereference pointer.
Consequently the kernel is then reporting a martian source.

Correcting the network wrong configuration by adding an IP address, a 
route and a gateway
suppressed further martian source message.

I am just waiting for above code acceptation before I commit the patch.

Bernard, f6bvp

