From: Stewart Wilkinson <g0lgs@gb7lgs.co.uk>
Subject: Netrom Changes in G8PZT's Xrouter Software.
Date: Thu, 29 Aug 2002 00:25:49 +0000 (GMT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0208282345050.25137-100000@gb7lgs.ampr.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi,

Having spoken to Paula (G8PZT) tonight, she informs me that the next
release of her Xrouter (V1.77) which is due out in a few days, implements
addtional NETROM FrameType (0x07) which for Xrouter is effectively a
NETROM <DM> frame. (As I understand it, this gets over a few problems with
NETROM not noticing a distant router has rebooted and so can't handle
traffic on L3/L4 sessions that were open before the reboot, much more
quickly that simply waiting for the L4 Retry setting to be exceeded).

This is in addtion to her existing releases using the NR_PROTOEXT Frame
Type (0x00) which also causes problems with pre 2.4.18 Kernels.

From my look at the Kernel source code it appears that 2.4.18 (at least
2.4.18-8.1mdk) & the 2.4.19 Kernels will happily ignore this new
frametype, but 2.4.17 and earlier will NOT, and this may lead to erratic
behaviour of the Linux NETROM Stack.

As a possible workaround for the 2.4.17 Kernel, I have modified the
nr_rx_frame function in af_netrom.c by replacing the lines:

#ifdef CONFIG_INET
        /*
         * Check for an incoming IP over NET/ROM frame.
         */
        if (frametype == NR_PROTOEXT && circuit_index == NR_PROTO_IP && 
circuit_id == NR_PROTO_IP) {
                skb_pull(skb, NR_NETWORK_LEN + NR_TRANSPORT_LEN);
                skb->h.raw = skb->data;

                return nr_rx_ip(skb, dev);
        }
#endif

with the lines:

        /*
        * Check for Protocol Extensions (G8PZT)
        */
        if( frametype == NR_PROTOEXT ) {

                #ifdef CONFIG_INET
                /*
                 * Check for an incoming IP over NET/ROM frame.
                 */
                if (circuit_index == NR_PROTO_IP && circuit_id == NR_PROTO_IP) {
                        skb_pull(skb, NR_NETWORK_LEN + NR_TRANSPORT_LEN);
                        skb->h.raw = skb->data;

                        return nr_rx_ip(skb, dev);
                }
                #endif

                /* Ignore anything not Understood */
                return(0);
        }

        /*
        * Ignore G8PZT's NETROM <DM> and other Unknown Frame Types
        */
        if( frametype >= 0x07 ) {
                return(0);
        }


However this modification is as yet untested. (I've not even booted the
system from the re-built kernel yet, and I don't have the pre-release 1.77
Xrouter software to test it against.

-- 
Stewart (G0LGS)
g0lgs@gb7lgs.co.uk

