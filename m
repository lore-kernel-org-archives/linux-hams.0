From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: linux kernel-ax25 - some patches
Date: Mon, 15 Feb 2016 15:00:36 +0100
Message-ID: <20160215140035.GF24276@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams-owner@vger.kernel.org

Hello,

I'd like to suggest the following patches to the linux kernel ax25.


If the MTU of the iface is > 256, then AX.25 segmentation feature is available.
Currently, AX.25 segmentation is only available for AX25_I (I-Frames), i.E. IP mode VC (aka as ka9q fragmentation).


1. AX.25 segmentation on I-Frames
---------------------------------

If the iface has an mtu of 256, it's not segmented and passes normally through the iface.

# axparms  --route  add bpq2 dl9sau-15  --ipmode V

# 228 bytes payload + 8 bytes icmp + 20 bytes IP = 256

 
$ ping -s 228 -c1 44.128.128.10
bpq2: fm DL9SAU to DL9SAU-15 ctl I00^ pid=CC(IP) len 256
IP: len 256 44.128.128.1->44.128.128.10 ihl 20 ttl 64 DF prot ICMP
ICMP: type Echo Request id 8042 seq 1
0000  Y}.V............................ !"#$%&'()*+,-./0123456789:;<=>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  ....................................


Now, we switch the mtu of the iface to 1500:

# ifconfig bpq1 mtu 1500

$ ping -c1 -s 1200  44.128.128.10
PING 44.128.128.10 (44.128.128.10) 1200(1228) bytes of data.

bpq2: fm DL9SAU to DL9SAU-15 ctl I36^ pid=8(segment) len 255  First seg; remain
4
IP: len 1228 44.128.128.1->44.128.128.10 ihl 20 ttl 64 DF prot ICMP
ICMP: type Echo Request id 6151 seq 1
0000  ...V....uj...................... !"#$%&'()*+,-./0123456789:;<=>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  .................................


Problem: We see that the length of the packet is 255 instead of 256.
The segmenter uses the value "paclen" for the segmentation size.

Patch:

--- net/ax25/ax25_out.c.orig     2016-02-14 00:03:57.000000000 +0100
+++ net/ax25/ax25_out.c  2016-02-14 00:04:08.000000000 +0100

@@ -134,7 +134,7 @@ void ax25_output(ax25_cb *ax25, int pacl
                        skb_pull(skb, 1); /* skip PID */
                        ka9qfrag = 0;
                } else {
-                       paclen -= 2;    /* Allow for fragment control info */
+                       paclen -= 1;    /* Allow for fragment control info */
                        ka9qfrag = 1;
                }

Argue:

The skb holds the PID in the first position, follewed by the payload.
The routine that builds the ax25-packet takes the first byte and puts it in the PID header-field.

If segmentation should take place, two bytes are prepended: AX25_P_SEGMENT (for the later PID header field) and the fragment-number, which becomes the first byte in the ax25 data packet.
At the first segment-frame, the PID (i.E. 0xCC at IP) becomes part of of the payload (behind the fragment-number).
But that additional byte is now regarded as normal payload (length of payload += 1).
Then, this whole payload is split over multibple packets. These packets need one byte left in front for the fragmentation number. => We have to assume packlen -=1 (not -= 2).


Prove:

$ ping -s 227 -c1 44.128.128.10
PING 44.128.128.10 (44.128.128.10) 227(255) bytes of data.

bpq2: fm DL9SAU to DL9SAU-15 ctl I21^ pid=CC(IP) len 255 
IP: len 255 44.128.128.1->44.128.128.10 ihl 20 ttl 64 DF prot ICMP
ICMP: type Echo Request id 3885 seq 1
0000  5..V............................ !"#$%&'()*+,-./0123456789:;<=>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  ...................................

$ ping -s 228 -c1 44.128.128.10
PING 44.128.128.10 (44.128.128.10) 228(256) bytes of data.

bpq2: fm DL9SAU to DL9SAU-15 ctl I32^ pid=CC(IP) len 256 
IP: len 256 44.128.128.1->44.128.128.10 ihl 20 ttl 64 DF prot ICMP
ICMP: type Echo Request id 3886 seq 1
0000  H..V.....f...................... !"#$%&'()*+,-./0123456789:;<=>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  ....................................

$ ping -s 229 -c1 44.128.128.10
bpq2: fm DL9SAU to DL9SAU-15 ctl I00^ pid=8(segment) len 256  First seg; remain 1
IP: len 257 44.128.128.1->44.128.128.10 ihl 20 ttl 64 DF prot ICMP
ICMP: type Echo Request id 3888 seq 1
0000  Y..V............................ !"#$%&'()*+,-./0123456789:;<=>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  ..................................
bpq2: fm DL9SAU to DL9SAU-15 ctl I01+ pid=8(segment) len 4  remain 0
0000  ...

$ ping -s 230 -c1 44.128.128.10
PING 44.128.128.10 (44.128.128.10) 230(258) bytes of data.

bpq2: fm DL9SAU to DL9SAU-15 ctl I12^ pid=8(segment) len 256  First seg; remain 1
IP: len 258 44.128.128.1->44.128.128.10 ihl 20 ttl 64 DF prot ICMP
ICMP: type Echo Request id 3889 seq 1
0000  m..V....B....................... !"#$%&'()*+,-./0123456789:;<=>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  ..................................
bpq2: fm DL9SAU to DL9SAU-15 ctl I13+ pid=8(segment) len 5  remain 0
0000  ....


For PID text, the alignment of 256 was correct, because they're just cut'ed in pieces, and are not sent with PID_SEGMENT and thus have no extra prepended segment number byte.



2. AX.25 segmentation in the UI-Frame case
------------------------------------------

2.1 Data coming from the userspcace via syscall sendto()
--------------------------------------------------------

The data sent on the interfaces may exceed the MTU of the interface.
Since no AX.25 segmenter is implemented for AX25_UI frames, an additional check is needed: not only check against dev->mtu but also check against the paclen.  [AX25_I frames will go to ax25_output in this function and handled correctly]

# ifconfig bpq2 mtu 256
# strace -esendto beacon -s bpq2 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
sendto(3, "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"..., 1280, 0, {sa_family=AF_AX25, sa_data="\222\210\212\234\250@\0AC\211\0\0\0\0"}, 72) = -1 EMSGSIZE (Message too long)
+++ exited with 1 +++


Now, we configure the MTU of the iface to 1500:
# ifconfig bpq2 mtu 1500

bpq2: fm DL9SAU to IDENT ctl UI^ pid=F0(Text) len 1280 
0000  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0040  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0080  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
00C0  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0100  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0140  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0180  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
01C0  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0200  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0240  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0280  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
02C0  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0300  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0340  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0380  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
03C0  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0400  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0440  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0480  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
04C0  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa


=> The packet leaving the interface is too large.


Patch:


 diff -Naupr af_ax25.c{.orig,}
--- net/ax25/af_ax25.c.orig      2015-11-18 11:08:46.000000000 +0100
+++ net/ax25/af_ax25.c   2016-02-15 09:12:21.000000000 +0100
@@ -1466,7 +1466,16 @@ static int ax25_sendmsg(struct kiocb *io
                goto out;
        }

-       if (len > ax25->ax25_dev->dev->mtu) {
+       if (len > ax25->ax25_dev->dev->mtu ||
+               (sk->sk_type == SOCK_DGRAM && len > ax25->paclen)) {
+               /* DL9SAU - added the second part of the check:
+                  On I-Frames, ax25_output() is called below, which brings us
+                  to the ax25 segmenter. AX.25 segmentation is currently only
+                  implemented for I-frames.
+                  On UI-Frames, nothing can help the size to packlen (no
+                  segmentation strategy). Thus, too large packets would leave
+                  the iface. We throw away messages with length > paclen.
+                */
                err = -EMSGSIZE;
                goto out;
        }


Prove:
strace beacon ...
sendto(3, "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"..., 1280, 0, {sa_family=AF_AX25, sa_data="\250\212b\246\250@\0\301\344\244\0\0\0\0"}, 72) = -1 EMSGSIZE (Message too long)
+++ exit

=> No packet is sent to the iface if data is > paclen. Error-code to the userspace is the same as in the mtu 256.


I'm not 100% sure, but as far as I understand the AX25 protocol spec, AX25 layer segmentation is also valid for UI frames.
It may be worth to think about.
My guess it was not implemented is: it's harder to do. Timeouts for waiting of would have to be implemented.


2.2 IP-packets coming from the ip stack
---------------------------------------

When the ip stack sends data, the mtu of the iface is the only relevant factor.
On IP Mode VC, segmentation could take place if mtu is > 256 => segments are filled up to paclen (as discussed above). => No problem. It's implemented in ax25_rebuild_header().
On IP Mode DG, there's no AX25_UI segmenter implemented.

Unfortunately, I see no good way to handle this.
We're just called via ax25_hard_header() (.create) and ax25_rebuild_header() (.rebuild) from the IP stack and get the packet aligned to MAX MTU of the iface.

Even worse, ax25_rebuild_header() has no capability to signal the ip_layer (that sent us that big packet as it is) that something went wrong.
ax25_hard_harder() has also no capability to signal upward.


Here's the problematic packet:

# ifconfig bpq2 mtu 1500
$ ping -c1 -s 1200  44.128.128.10 
PING 44.128.128.10 (44.128.128.10) 1200(1228) bytes of data.
bpq2: fm DL9SAU to DL9SAU-15 ctl UI pid=CC(IP) len 1228 

IP: len 1228 44.128.128.1->44.128.128.10 ihl 20 ttl 64 DF prot ICMP
ICMP: type Echo Request id 6091 seq 1
0000  i..V....Vd...................... !"#$%&'()*+,-./0123456789:;<=>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  ................................................................
0100  ................................ !"#$%&'()*+,-./0123456789:;<=>?
0140  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0180  ................................................................
01C0  ................................................................
0200  ................................ !"#$%&'()*+,-./0123456789:;<=>?
0240  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0280  ................................................................
02C0  ................................................................
0300  ................................ !"#$%&'()*+,-./0123456789:;<=>?
0340  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0380  ................................................................
03C0  ................................................................
0400  ................................ !"#$%&'()*+,-./0123456789:;<=>?
0440  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0480  ................................................



FIRST approach:

--- net/ax25/ax25_ip.c.orig      2015-11-18 11:08:46.000000000 +0100
+++ net/ax25/ax25_ip.c   2016-02-15 00:41:33.000000000 +0100
@@ -186,6 +186,12 @@ int ax25_rebuild_header(struct sk_buff *
                        goto put;
                }
        }
+       if (skb->len > AX25_HEADER_LEN + ax25_dev->values[AX25_VALUES_PACLEN]) {
+               /* dl9sau: throw away too large packet (due to the paclen, not dev->mtu (that's why they arrive here. Larger MTU has to be possible in order to be able to have ax25 sementation feature). Affects only AX25_UI (no ax25 segmenter implemented) as well as AX25_I (for packets other than IP; IP Mode VC has gone already above to the ax25 segmenter (via ax25_send_frame() -> ax25_output() ) )
+                 Unfortunately, there's no clean way to signal upward that something failed.
+               */
+               goto put;
+       }

        bp[7]  &= ~AX25_CBIT;
        bp[7]  &= ~AX25_EBIT;


Prove:
oversized packet is silently discarded. listen -a shows nothing. Nothing is reported to the sending userspace program.




SECOND approach (not nice, but looks good):


--- net/ax25/ax25_ip.c.orig      2015-11-18 11:08:46.000000000 +0100
+++ net/ax25/ax25_ip.c   2016-02-15 14:25:11.000000000 +0100
@@ -186,6 +186,33 @@ int ax25_rebuild_header(struct sk_buff *
                        goto put;
                }
        }
+       if (skb->len > AX25_HEADER_LEN + ax25_dev->values[AX25_VALUES_PACLEN]) {
+               /* DL9SAU: throw away too large packet (due to the paclen
+                    (not: dev->mtu (that's the reason that brought us here).
+                    Larger MTU has to be possible in order to be able to have
+                    the ax25 sementation feature).
+                   Affects only AX25_UI (no ax25 segmenter implemented) as well
+                  as portions of AX25_I (for packets other than IP).
+                  IP Mode VC has gone already above to the ax25 segmenter
+                  (via ax25_send_frame() -> ax25_output() ).
+                  Unfortunately, there's no clean way to signal upward that
+                  something failed.
+                  A workaround is the icmp_send() in IP mode DG.
+               */
+               if (bp[16] == AX25_P_IP) {
+                       /* compiler did not like #include <net/icmp.h> */
+extern void icmp_send(struct sk_buff *skb_in, int type, int code, __be32 info);
+#define ICMP_DEST_UNREACH       3       /* Destination Unreachable      */
+#define ICMP_FRAG_NEEDED        4       /* Fragmentation Needed/DF set  */
+                       /* cut off our ax25 header; moves skb start back to
+                          the IP payload
+                        */
+                       skb_pull(skb, AX25_HEADER_LEN);
+                       icmp_send(skb, ICMP_DEST_UNREACH, ICMP_FRAG_NEEDED, htonl(ax25_dev->values[AX25_VALUES_PACLEN]));
+               }
+               /* then throw away the packet */
+               goto put;
+       }

        bp[7]  &= ~AX25_CBIT;
        bp[7]  &= ~AX25_EBIT;



Prove:

# tcpdump -vv -e -ni lo icmp &

$ ping -s 229 -c1 44.128.128.10
PING 44.128.128.10 (44.128.128.10) 229(257) bytes of data.
From 44.128.128.1 icmp_seq=1 Frag needed and DF set (mtu = 256)

--- 44.128.128.10 ping statistics ---
1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms
$ 

14:20:06.694999 00:00:00:00:00:00 > 00:00:00:00:00:00, ethertype IPv4 (0x0800), length 299: (tos 0xc0, ttl 64, id 2392, offset 0, flags [none], proto ICMP (1), length 285)
    44.128.128.1 > 44.128.128.1: ICMP 44.128.128.10 unreachable - need to frag (mtu 256), length 265
        (tos 0x0, ttl 64, id 50720, offset 0, flags [DF], proto ICMP (1), length 257)
    44.128.128.1 > 44.128.128.10: ICMP echo request, id 4720, seq 1, length 237



That second approach is ugly but cewl? ;)



3. IP fragmentation in Mode DG and VC
-------------------------------------


MTU of interface is 256 (== paclen).

=> IP layer fragmentation occurs, rather then segmentation.
That's ok. We can argue AX25-layer-segmentation on IP Mode VC is more efficient. But I think that would be tricky because the IP layer has already taken a decision to ip-layer-fragment, due to the iface MTU. But that's another story.

My observation:

# ifconfig bpq2 mtu 256

AX_UI:

$ ping -s 229 -c1 44.128.128.10
PING 44.128.128.10 (44.128.128.10) 229(257) bytes of data.

bpq2: fm DL9SAU to DL9SAU-15 ctl UI pid=CC(IP) len 252 
IP: len 252 44.128.128.1->44.128.128.10 ihl 20 ttl 64 id 49324 offs 0 MF prot ICMP
ICMP: type Echo Request id 5110 seq 1
0000  ...V............................ !"#$%&'()*+,-./0123456789:;<=>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  ................................
bpq2: fm DL9SAU to DL9SAU-15 ctl UI pid=CC(IP) len 25 
IP: len 25 44.128.128.1->44.128.128.10 ihl 20 ttl 64 id 49324 offs 232
0000  .....

AX_I:

# axparms  --route  add bpq2 dl9sau-15  --ipmode V

ping -s 229 -c1 44.128.128.10
PING 44.128.128.10 (44.128.128.10) 229(257) bytes of data.
bpq2: fm DL9SAU to DL9SAU-15 ctl SABM+ 
bpq2: fm DL9SAU-15 to DL9SAU ctl UA- 
bpq2: fm DL9SAU to DL9SAU-15 ctl I00^ pid=CC(IP) len 252 
IP: len 252 44.128.128.1->44.128.128.10 ihl 20 ttl 64 id 52882 offs 0 MF prot ICMP
ICMP: type Echo Request id 5113 seq 1
0000  ...V............................ !"#$%&'()*+,-./0123456789:;<=>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  ................................
bpq2: fm DL9SAU to DL9SAU-15 ctl I01+ pid=CC(IP) len 25 
IP: len 25 44.128.128.1->44.128.128.10 ihl 20 ttl 64 id 52882 offs 232
0000  .....

=> On both, Mode VC and Mode DG, the IP fragmentation makes packets 252 bytes long.
IP packets with length of 256 pass the interface with len 256, which is correct.

This is a ping with full ip+payload-size of 256:
$ ping -s 228 -c1 44.128.128.10
PING 44.128.128.10 (44.128.128.10) 228(256) bytes of data.
bpq2: fm DL9SAU to DL9SAU-15 ctl UI pid=CC(IP) len 256 
IP: len 256 44.128.128.1->44.128.128.10 ihl 20 ttl 64 DF prot ICMP
ICMP: type Echo Request id 5164 seq 1
0000  ...V....W....................... !"#$%&'()*+,-./0123456789:;<=>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  ....................................


I've dig'ed deep in the code, but I have not found what causes the fragmentation-routinges build packets of the size of 252 instead of 256.

Anyone has a solution for this?


vy 73,
	- Thomas  dl9sau

