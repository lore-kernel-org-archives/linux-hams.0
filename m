From: Thomas Osterried <thomas@osterried.de>
Subject: bugfix: linux kernel-ax25: fm [invalid] to [invalid] ctl SABM+
Date: Sat, 17 May 2003 17:41:18 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030517154118.GA30168@osterried.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-Hams@vger.kernel.org

hello,

i traced down the following problem with kernel-ax25.

the problem
-----------

normal mode is DG. if ax25rtd is running, the configured mode-VC route =
will
be used for answering my ping.

listen -a shows the following errnous behaviour:
  bpq0: fm DL9SAU-1 to DK0CCC-12 ctl UI^ pid=3DCC(IP) len 84
  IP: len 84 44.130.36.91->44.128.2.3 ihl 20 ttl 254 prot ICMP
  ICMP: type Echo Request id 0 seq 0
  0000  .P=C6>.................... !"#$%&'()*+,-./0123456789:;<=3D>?
  bpq0: fm [invalid] to [invalid] ctl SABM+

netstat -a:
  Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
  *          *          bpq0    SABM SENT    000/000  0       0


the source code
----------------

let's take a look at /usr/src/linux/net/ax25/ax25_ip.c:

int ax25_rebuild_header(struct sk_buff *skb)
{
        struct sk_buff *ourskb;
        unsigned char *bp  =3D skb->data;
        ax25_address *src, *dst;

	[..]
        dst =3D (ax25_address *)(bp + 1);
        src =3D (ax25_address *)(bp + 8);

        if (arp_find(bp + 1, skb))
                return 1;
	[..]

        if (bp[16] =3D=3D AX25_P_IP) {
                if (route->ip_mode =3D=3D 'V' || (route->ip_mode =3D=3D=
 ' ' && ax25_dev->values[AX25_VALUES_IPDEFMODE])) {
			[..]
                        ax25_address src_c;
                        ax25_address dst_c;
		=09
                        if ((ourskb =3D skb_copy(skb, GFP_ATOMIC)) =3D=3D=
 NULL) {
                                kfree_skb(skb);
                                restore_flags(flags);
                                return 1;
                        }
			[..]
			// now we have a private skb copy in ourskb

			kfree_skb(skb);
			// now skb is freed.
			// this affekts skb->data and thus also the pointers
			// dst and src assigned to it

			src_c =3D *src;
			dst_c =3D *dst;
			// src_c and dst_c will now refer to a free'd memory segment, which =
may contain a random value

			[..]
                        ax25_send_frame(ourskb, ax25_dev->values[AX25_V=
ALUES_PACLEN], &src_c, &dst_c, route->digipeat, dev);
		=09
			// now sending the bogous SABM


bugfix
------

*** ax25_ip.c.orig	Fri Oct 12 23:22:49 2001
--- ax25_ip.c	Sat May 17 17:01:06 2003
***************
*** 161,168 ****
 =20
  			kfree_skb(skb);
 =20
! 			src_c =3D *src;
! 			dst_c =3D *dst;
 =20
  			skb_pull(ourskb, AX25_HEADER_LEN - 1);	/* Keep PID */
  			ourskb->nh.raw =3D ourskb->data;
--- 161,172 ----
 =20
  			kfree_skb(skb);
 =20
! 			// dl9sau: bugfix
! 			//   after kfree_skb(), dst and src which were pointer to bp which=
 is part of skb->data would not be valid anymore
! 			//   hope that after skb_pull(ourskb, ..) our dsc_c and src_c will=
 not become invalid
! 			bp  =3D ourskb->data;
! 			dst_c =3D *(ax25_address *)(bp + 1);
! 			src_c =3D *(ax25_address *)(bp + 8);
 =20
  			skb_pull(ourskb, AX25_HEADER_LEN - 1);	/* Keep PID */
  			ourskb->nh.raw =3D ourskb->data;


final test:
-----------
bpq0: fm DL9SAU-1 to DK0CCC-12 ctl UI^ pid=3DCC(IP) len 84
IP: len 84 44.130.36.91->44.128.2.3 ihl 20 ttl 254 prot ICMP
ICMP: type Echo Request id 0 seq 0
0000  =D9U=C6>.%.................. !"#$%&'()*+,-./0123456789:;<=3D>?
bpq0: fm DK0CCC-12 to DL9SAU-1 ctl SABM+
bpq0: fm DL9SAU-1 to DK0CCC-12 ctl UA-
bpq0: fm DK0CCC-12 to DL9SAU-1 ctl I00^ pid=3DCC(IP) len 84
IP: len 84 44.128.2.3->44.130.36.91 ihl 20 ttl 64 prot ICMP
ICMP: type Echo Reply id 0 seq 0
0000  =D9U=C6>.%.................. !"#$%&'()*+,-./0123456789:;<=3D>?
bpq0: fm DL9SAU-1 to DK0CCC-12 ctl RR1v



affected kernels are 2.2.x and 2.4.x.

some time ago i diskussed a problem with kernel oopses due to corrupted
ax25 control blocks. maybe it was caused by this bug. Brian <n1uro>
reported that the oopses went away after he turned off ax25rtd.


73,

	- thomas  dl9sau

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
