From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: AX25 in libpcap, tcpdump & ethereal
Date: Thu, 10 Nov 2005 21:29:33 +0000
Message-ID: <4373BBBD.10505@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070706090903070300020306"
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org

This is a multi-part message in MIME format.
--------------070706090903070300020306
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

For the foolhardy, desperate or those who just like to live dangerously.

To play with this you will need to be comfortable with using tar, patch
& make at the very least and using Linux. The system I am using is a
Slackware 8.1 install (kernel 2.4.31)

Attached is a patch that adds AX.25 to:
	libpcap  - recognition and capture
	tcpdump  - decoding AX.25, to a limited extent
		 - decoding an ARP payload
		 - decoding a TCP/IP payload
	ethereal - dissection of AX.25
		 - dissection of an TCP/IP payload

All others are treated as having no L3 protocol and printed in hex
and ascii.

The patch is against:
	libpcap-0.9.3
	tcpdump-3.9.3
	ethereal-0.10.12

This is an alpha release. The libpcap and tcpdump are unchanged (apart
from being distributed as separate files) to my previous release.

My testing is limited to vanilla AX.25 over non-radio mkiss serial link
carrying IP.

To build these patched versions:
     1.  Download libpcap, tcpdump & ethereal sources
     2.  create a directory to work in (I use /usr/src/modified)
     3.  cd into that directory
     4.  unpack the sources into this directory
     5.  save the patches into this directory
     6.  apply each patch by running:
         patch -p1 < <package name>.patch
     7.  cd into libpcap-0.9.3
     8.  run:
	 ./configure
     9.  run:
	 make
     10. cd into tcpdump-3.9.3
     11. run:
	 ./configure
     12. run:
	 make
     13. cd into ethereal-0.10.12
     14. run:
	 ./autogen.sh
     15. run:
	 ./configure
     16. run:
	 make

To use tcpdump cd into the tcpdump directory and run:
	./tcpdump -eni <ax.25 interface name>

To use ethereal cd into the ethereal directory and run:
	./ethereal

To use either of the tools you will need to be logged in as root
as both tools access network interfaces and root priviledges are
need for that.

Currently there is no way to filter on AX.25 addresses. That I will
endevour to add as one of the next features.

I am again looking for testing against all the various AX.25 network
interfaces and checking that the decode is correct. Remember that
tcpdump, in general, does not do protocol analysis, only printing
of the protocol headers. Ethereal does allow for close study of the
protocol but only after capture.

The format of the tcpdump decode is not finalised, suggestions are
welcomed. The format needs to be concise but informative to someone
conversant with the protocol.

In both tcpdump and ethereal I have used existing functions to
decode ARP & IP packets. In ethereal there is a dissector for "xdlc"
that I have used to decode the control field, it appears to give the
correct answers but a more extended check is needed.

Others taking up the testing challenge is important. I not keen on
taking this much further without proving the current work is producing
correct decodes.

-- 
Regards
	Richard


--------------070706090903070300020306
Content-Type: text/plain;
 name="libpcap_ax25-0.0.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libpcap_ax25-0.0.patch"

*** original/libpcap-0.9.3/pcap.c	Thu Jul  7 03:04:35 2005
--- modified/libpcap-0.9.3/pcap.c	Tue Sep  6 23:07:47 2005
***************
*** 373,378 ****
--- 373,379 ----
          DLT_CHOICE(DLT_JUNIPER_ES, "Juniper Encryption Services PIC"),
          DLT_CHOICE(DLT_JUNIPER_MONITOR, "Juniper Passive Monitor PIC"),
          DLT_CHOICE(DLT_JUNIPER_SERVICES, "Juniper Advanced Services PIC"),
+ 	DLT_CHOICE(DLT_AX25, "AX.25"),
  	DLT_CHOICE_SENTINEL
  };
  
*** original/libpcap-0.9.3/gencode.c	Thu Jul 14 17:01:46 2005
--- modified/libpcap-0.9.3/gencode.c	Tue Sep  6 23:06:10 2005
***************
*** 1198,1203 ****
--- 1198,1209 ----
  		off_nl = -1;
  		off_nl_nosnap = -1;
  		return;
+ 
+ 	case DLT_AX25:
+ 		off_linktype = -1;
+ 		off_nl = -1;
+ 		off_nl_nosnap = -1;
+ 		return;
  	}
  	bpf_error("unknown data link type %d", linktype);
  	/* NOTREACHED */

--------------070706090903070300020306
Content-Type: text/plain;
 name="tcpdump_ax25-0.0.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="tcpdump_ax25-0.0.patch"

*** original/tcpdump-3.9.3/netdissect.h	Thu Jul  7 02:24:32 2005
--- modified/tcpdump-3.9.3/netdissect.h	Tue Sep  6 23:28:45 2005
***************
*** 298,303 ****
--- 298,304 ----
  		      const u_char *);
  
  extern void arcnet_if_print(u_char*,const struct pcap_pkthdr *,const u_char *);
+ extern void ax25_if_print(u_char*,const struct pcap_pkthdr *,const u_char *);
  extern void ether_if_print(u_char *,const struct pcap_pkthdr *,const u_char *);
  extern void token_if_print(u_char *,const struct pcap_pkthdr *,const u_char *);
  extern void fddi_if_print(u_char *,const struct pcap_pkthdr *, const u_char *);
*** original/tcpdump-3.9.3/tcpdump.c	Thu Jul  7 02:24:40 2005
--- modified/tcpdump-3.9.3/tcpdump.c	Tue Sep  6 23:19:31 2005
***************
*** 136,141 ****
--- 136,142 ----
  };
  
  static struct printer printers[] = {
+ 	{ ax25_if_print,	DLT_AX25 },
  	{ arcnet_if_print,	DLT_ARCNET },
  #ifdef DLT_ARCNET_LINUX
  	{ arcnet_linux_if_print, DLT_ARCNET_LINUX },
*** original/tcpdump-3.9.3/interface.h	Sun Jul 10 15:47:57 2005
--- modified/tcpdump-3.9.3/interface.h	Tue Sep  6 23:27:55 2005
***************
*** 195,200 ****
--- 195,201 ----
  extern u_int enc_if_print(const struct pcap_pkthdr *, const u_char *);
  extern u_int pflog_if_print(const struct pcap_pkthdr *, const u_char *);
  extern u_int arcnet_if_print(const struct pcap_pkthdr *, const u_char *);
+ extern u_int ax25_if_print(const struct pcap_pkthdr *, const u_char *);
  extern u_int arcnet_linux_if_print(const struct pcap_pkthdr *, const u_char *);
  extern void ether_print(const u_char *, u_int, u_int);
  extern u_int ether_if_print(const struct pcap_pkthdr *, const u_char *);
*** original/tcpdump-3.9.3/print-ax25.c	Sun Sep 11 00:27:13 2005
--- modified/tcpdump-3.9.3/print-ax25.c	Wed Sep 14 21:02:11 2005
***************
*** 0 ****
--- 1,340 ----
+ /*
+  * Copyright (c) 2005 Richard W. Stearn
+  *
+  * This software may be distributed either under the terms of the
+  * BSD-style licence that accompanies tcpdump or under the GNU GPL
+  * version 2.
+  *
+  */
+ 
+  /*
+  * 10/09/2005 -	Basic "get something printing version" and I know it
+  *		doesn't give the right answers.
+  * 11/09/2005 -	Correcting the deliberate errors in translation from
+  *		my existing ax.25 analyser and making the printout
+  *		more tcpdump-like.
+  * 14/09/2005 - PID list up to V2.2
+  *		S & U frame list up to V2.2
+  *		Hooked to print-atalk (not tested, no AppleTalk :-) )
+  *		decode FRMR frames
+  *
+  * To Do list:
+  *            - Hooking to print atalk arp
+  *            - Hooking to print netrom
+  *            - Hooking to print flexnet
+  *            - Hooking to print rfc1144
+  *            - Hooking to print iso8208
+  *            - implement print-axip
+  *
+  * Things we probably can not do:
+  *            - correctly decode extended (modulo 128) packets
+  */
+ 
+ #ifndef lint
+ static const char rcsid[] _U_ =
+     "@(#) $Header: /tcpdump/master/tcpdump/print-ax25.c,v ";
+ #endif
+ 
+ #ifdef HAVE_CONFIG_H
+ #include "config.h"
+ #endif
+ 
+ #include <tcpdump-stdinc.h>
+ 
+ #include <stdio.h>
+ #include <pcap.h>
+ 
+ #include "interface.h"
+ 
+ #define AX25_HDRLEN	15	/* 2 ax25 addresses & the control byte */
+ 
+ #define AX25_P_ROSE	0x01	/* ISO 8208 / CCITT X.25 PLP */
+ #define AX25_P_RFC1144C	0x06	/* Compressed TCP/IP packet. Van Jacobson RFC1144 */
+ #define AX25_P_RFC1144	0x07	/* Uncompressed TCP/IP packet. Van Jacobson RFC1144 */
+ #define AX25_P_SEGMENT	0x08	/* segmentation fragment */
+ #define AX25_P_TEXNET	0xC3	/* TEXNET datagram */
+ #define AX25_P_ATALK	0xCA	/* AppleTalk */
+ #define AX25_P_ATALKARP	0xCB	/* AppleTalk ARP */
+ #define AX25_P_IP	0xCC	/* ARPA Internet Protocol */
+ #define AX25_P_ARP	0xCD	/* ARPA Address Resolution Protocol */
+ #define AX25_P_FLEXNET 	0xCE	/* FlexNet */
+ #define AX25_P_NETROM 	0xCF	/* NET/ROM */
+ #define AX25_P_NO_L3 	0xF0	/* No layer 3 protocol */
+ #define AX25_P_L3_ESC 	0xFF	/* Escape character. Next octet contains more layer 3 protocol info */
+ 
+ char *
+ ax25_addr_string( char *b, const u_char *e )
+ {
+ int i;
+ char *s;
+ 
+ s = b;
+ for ( i = 0; i < 6; i++ )
+ 	{
+ 	*s = (char) ((e[i] >> 1) & 0x7f );
+ 	if ( *s != ' ' ) 
+ 		s++;
+ 	}
+ *s = '\0';
+ sprintf( b, "%s-%u", b, ((e[6] >> 1) & 0x0f ) );
+ return b;
+ }
+ 
+ void
+ ax25_ctrl_print( u_int control, const u_char v2cmdresp )
+ {
+ char *text_ptr;
+ 
+ switch ( control & 0x03 )
+ 	{
+ 	case 0 :
+ 	case 2 :
+ 		printf( " I, %c, pf %u, nr %u, ns %u",
+ 			v2cmdresp,
+ 			(control >> 4 ) & 0x01,
+ 			(control >> 5 ) & 0x07,
+ 			(control >> 1 ) & 0x07 );
+ 		break;
+ 	case 1 :
+ 		switch ( (control >> 2 ) & 0x03 )
+ 			{
+ 			case 0 : text_ptr = "RR"; break;
+ 			case 1 : text_ptr = "RNR"; break;
+ 			case 2 : text_ptr = "REJ"; break;
+ 			case 3 : text_ptr = "SREJ"; break;
+ 			}
+ 		printf( " %s, %c, pf %u, nr %u",
+ 			text_ptr,
+ 			v2cmdresp,
+ 			(control >> 4 ) & 0x01,
+ 			(control >> 5 ) & 0x07 );
+ 			break;
+ 	case 3 :
+ 		switch ( (((control >> 5 ) & 0x07) << 2) | ((control >> 2 ) & 0x03) )
+ 			{
+ 			case 0  :  text_ptr = "UI"; break;
+ 			case 3  :  text_ptr = "DM"; break;
+ 			case 7  :  text_ptr = "SABM"; break;
+ 			case 8  :  text_ptr = "DISC"; break;
+ 			case 12 :  text_ptr = "UA"; break;
+ 			case 15 :  text_ptr = "SABME"; break;
+ 			case 17 :  text_ptr = "FRMR"; break;
+ 			case 23 :  text_ptr = "XID"; break;
+ 			case 28 :  text_ptr = "TEST"; break;
+ 			default :  text_ptr = "????"; break;
+ 			}
+ 		printf( " %s, %c, pf %u",
+ 			text_ptr,
+ 			v2cmdresp,
+ 			(control >> 4 ) & 0x01 );
+ 		break;
+ 	}
+ }
+ 
+ void
+ ax25_frmr_print(const u_char *p, u_int length )
+ {
+ 	register u_char *ep;
+ 
+ 	ep = (u_char *)p;
+ 	ep++;
+ 	ax25_ctrl_print( *ep, '?' );
+ 	ep++;
+ 	printf( " C/R %u, nr %u, ns %u",
+ 		(*ep >> 4 ) & 0x01,
+ 		(*ep >> 5 ) & 0x07,
+ 		(*ep >> 1 ) & 0x07 );
+ 	ep++;
+ 	if ( ( *ep & 0x01 ) != 0 )
+ 		printf( " W" );
+ 	if ( ( *ep & 0x02 ) != 0 )
+ 		printf( " X" );
+ 	if ( ( *ep & 0x04 ) != 0 )
+ 		printf( " Y" );
+ 	if ( ( *ep & 0x08 ) != 0 )
+ 		printf( " Z" );
+ }
+ 
+ static inline u_char *
+ ax25_hdr_print(register const u_char *bp, u_int length)
+ {
+ 	register u_char *ep;
+ 	char v2cmdresp;
+ 	char tmp[ 20 ];
+ 	u_char dst_ssid;
+ 	u_char src_ssid;
+ 	u_char control;
+ 
+ 	ep = (u_char *)bp;
+ 
+ 	ep++; /* step over the kiss length byte */
+ 
+ 	printf( "%s", ax25_addr_string( tmp, ep + 7 ) );
+ 	src_ssid = *(ep + 13);
+ 
+ 	(void)printf(" > " );
+ 
+ 	printf( "%s", ax25_addr_string( tmp, ep ) );
+ 	dst_ssid = *(ep + 6);
+ 
+ 	ep = ep + 14;
+ 
+ 	/* print the vias */
+ 	while ( (*(ep - 1) & 0x1) == 0 )
+ 		{
+ 		printf( " V %s", ax25_addr_string( tmp, ep ) );
+ 		ep += 6;
+ 		if ( vflag )
+ 			printf( " Res %u,", ((dst_ssid >> 5) & 0x03) );
+ 		printf( " H %u,", ((dst_ssid >> 7) & 0x01) );
+ 		ep++;
+ 		}
+ 
+ 	printf( ":" );
+ 	if ( vflag )
+ 		printf( " Res %u,", ((dst_ssid >> 5) & 0x03) );
+ 	printf( " C/R %u,", ((dst_ssid >> 7) & 0x01) );
+ 
+ 	switch (((dst_ssid >> 6) & 0x02) | ((src_ssid >> 7) & 0x01))
+ 		{
+ 		case 0 : /* Pre-V2.0 */
+ 		case 3 : /* Pre-V2.0 */
+ 			v2cmdresp = '?';
+ 			break;
+ 		case 1 : /* V2.0 Command */
+ 			v2cmdresp = 'C';
+ 			break;
+ 		case 2 : /* V2.0 Response */
+ 			v2cmdresp = 'R';
+ 			break;
+ 		}
+ 
+ 	control = *ep;
+ 	ax25_ctrl_print( control, v2cmdresp );
+ 
+ 	if ( (( control & 0x03 ) == 3 ) && ((((control >> 5 ) & 0x07) << 2) | ((control >> 2 ) & 0x03)) == 17  )
+ 		ax25_frmr_print( ep, length );
+ 
+ 	(void)printf(", length %u: ", length);
+ 
+ 	return ep; /* pointer to the control byte */
+ }
+ 
+ static inline u_char *
+ ax25_hdr_skip(register const u_char *bp, u_int length)
+ {
+ 	register u_char *ep;
+ 
+ 	ep = (u_char *)bp;
+ 
+ 	ep++; /* step over the kiss length byte */
+ 
+ 	ep += 14; /* step over the src & dst addresses */
+ 
+ 	/* step over the via address fields */
+ 	while ( (*(ep - 1) & 0x1) == 0 )
+ 		ep += 7;
+ 
+ 	return ep; /* pointer to the control byte */
+ }
+ 
+ void
+ ax25_print(const u_char *p, u_int length, u_int caplen)
+ {
+ 	register u_char *bp;
+ 	register u_int hdr_len;
+ 	u_char pid;
+ 	u_char control;
+ 
+ 	if (caplen < (AX25_HDRLEN + 1) ) {
+ 		printf("[|AX.25]");
+ 		return;
+ 	}
+ 
+ 	if (eflag)
+ 		bp = ax25_hdr_print( p, length );
+ 	else
+ 		bp = ax25_hdr_skip( p, length );
+ 
+ 	control = *bp & 0xff;
+ 	bp++;
+ 
+ 	if (	(control & 0x01) == 0 ||
+ 		(( (control & 0x03) == 3 ) && (( (((control >> 5 ) & 0x07) << 2) | ((control >> 2 ) & 0x03) ) == 0 ) ) )
+ 		{
+ 		pid = *bp & 0xff;
+ 		bp++;
+ 		hdr_len = bp - p;
+ 		switch ( pid )
+ 			{
+ 			case AX25_P_ROSE	:
+ 					printf( " ROSE" );
+ 					default_print( bp, caplen - hdr_len );
+ 					break;
+ 			case AX25_P_RFC1144C	:
+ 					printf( " RFC1144 (compressed)" );
+ 					default_print( bp, caplen - hdr_len );
+ 					break;
+ 			case AX25_P_RFC1144	:
+ 					printf( " RFC1144 (uncompressed)" );
+ 					default_print( bp, caplen - hdr_len );
+ 					break;
+ 			case AX25_P_SEGMENT	:
+ 					printf( " SEGMENT" );
+ 					default_print( bp, caplen - hdr_len );
+ 					break;
+ 			case AX25_P_TEXNET	:
+ 					printf( " TEXNET" );
+ 					default_print( bp, caplen - hdr_len );
+ 					break;
+ 			case AX25_P_ATALK	:
+ 					atalk_print( bp, length - hdr_len );
+ 					break;
+ 			case AX25_P_ATALKARP	:
+ 					printf( " ATALKARP" );
+ 					default_print( bp, caplen - hdr_len );
+ 					break;
+ 			case AX25_P_IP		:
+ 					ipN_print( bp, length - hdr_len );
+ 					break;
+ 			case AX25_P_ARP		:
+ 					arp_print( gndo, bp, length - hdr_len, caplen - hdr_len );
+ 					break;
+ 			case AX25_P_FLEXNET	:
+ 					printf( " FLEXNET" );
+ 					default_print( bp, caplen - hdr_len );
+ 					break;
+ 			case AX25_P_NETROM	:
+ 					printf( " NETROM" );
+ 					default_print( bp, caplen - hdr_len );
+ 					break;
+ 			case AX25_P_NO_L3	:
+ 					printf( " TEXT" );
+ 					default_print( bp, caplen - hdr_len );
+ 					break;
+ 			case AX25_P_L3_ESC	:
+ 					printf( " L3 ESC" );
+ 					default_print( bp, caplen - hdr_len );
+ 					break;
+ 			default			:
+ 					printf( " PID = %u", pid );
+ 					if (!suppress_default_print)
+ 						default_print( bp, caplen - hdr_len );
+  					break;
+ 			}
+ 		}
+ }
+ 
+ /*
+  * This is the top level routine of the printer.  'p' points
+  * to the header of the packet, 'h->ts' is the timestamp,
+  * 'h->len' is the length of the packet off the wire, and 'h->caplen'
+  * is the number of bytes actually captured.
+  */
+ u_int
+ ax25_if_print(const struct pcap_pkthdr *h, const u_char *p)
+ {
+ 	ax25_print(p, h->len, h->caplen);
+ 
+ 	return (AX25_HDRLEN);
+ }
*** original/tcpdump-3.9.3/Makefile.in	Sun Jul 10 15:47:56 2005
--- modified/tcpdump-3.9.3/Makefile.in	Tue Sep  6 23:21:37 2005
***************
*** 68,73 ****
--- 68,74 ----
  CSRC =	addrtoname.c cpack.c gmpls.c oui.c gmt2local.c ipproto.c \
          nlpid.c l2vpn.c machdep.c parsenfsfh.c \
  	print-802_11.c print-ap1394.c print-ah.c print-arcnet.c \
+ 	print-ax25.c \
  	print-aodv.c print-arp.c print-ascii.c print-atalk.c print-atm.c \
  	print-beep.c print-bfd.c print-bgp.c print-bootp.c print-cdp.c \
  	print-chdlc.c print-cip.c print-cnfp.c print-decnet.c \
*** original/tcpdump-3.9.3/print-arp.c	Fri Apr 30 17:42:14 2004
--- modified/tcpdump-3.9.3/print-arp.c	Wed Sep 14 19:19:24 2005
***************
*** 52,57 ****
--- 52,58 ----
  struct	arp_pkthdr {
  	u_short	ar_hrd;		/* format of hardware address */
  #define ARPHRD_ETHER 	1	/* ethernet hardware format */
+ #define	ARPHRD_AX25	3	/* AX.25 Level 2.  */
  #define ARPHRD_IEEE802	6	/* token-ring hardware format */
  #define ARPHRD_ARCNET	7	/* arcnet hardware format */
  #define ARPHRD_FRELAY 	15	/* frame relay hardware format */
***************
*** 252,257 ****
--- 253,343 ----
  }
  
  void
+ ax25_arp_print(netdissect_options *ndo,
+ 	  const u_char *bp, u_int length, u_int caplen)
+ {
+ 
+ #define	ARP_AX25	204
+ 
+ 	const struct arp_pkthdr *ap;
+ 	u_short pro, hrd, op;
+ 	char tmp[ 20 ];
+ 
+ 	ap = (const struct arp_pkthdr *)bp;
+ 	ND_TCHECK(*ap);
+ 
+ 	hrd = HRD(ap);
+ 	pro = PRO(ap);
+ 	op = OP(ap);
+ 
+ 	if (!ND_TTEST2(*ar_tpa(ap), PLN(ap))) {
+ 		ND_PRINT((ndo, "truncated-arp"));
+ 		ND_DEFAULTPRINT((const u_char *)ap, length);
+ 		return;
+ 	}
+ 
+ 	if ( ( pro != ARP_AX25 )  ||
+ 	    PLN(ap) != 4 || HLN(ap) == 0  ) {
+ 		ND_PRINT((ndo, "arp-#%d for proto #%d (%d) hardware #%d (%d)",
+ 			  op, pro, PLN(ap), hrd, HLN(ap)));
+ 		return;
+ 	}
+ 	switch (op) {
+ 
+ 	case ARPOP_REQUEST:
+ 		ND_PRINT((ndo, "arp who-has %s", ipaddr_string(TPA(ap))));
+ 		if (memcmp((const char *)ezero, (const char *)THA(ap), HLN(ap)) != 0)
+ 			ND_PRINT((ndo, " (%s)",
+ 				ax25_addr_string( tmp, THA(ap) )));
+ 		ND_PRINT((ndo, " tell %s", ipaddr_string(SPA(ap))));
+ 		break;
+ 
+ 	case ARPOP_REPLY:
+ 		ND_PRINT((ndo, "arp reply %s", ipaddr_string(SPA(ap))));
+ 		ND_PRINT((ndo, " is-at %s", ax25_addr_string( tmp, SHA(ap) ) ));
+ 		break;
+ 
+ 	case ARPOP_REVREQUEST:
+ 		ND_PRINT((ndo, "rarp who-is" ));
+ 		ND_PRINT((ndo, "rarp who-is %s tell %s",
+ 				ax25_addr_string( tmp, THA(ap) ),
+ 				ax25_addr_string( tmp, SHA(ap) )));
+ 		break;
+ 
+ 	case ARPOP_REVREPLY:
+ 		ND_PRINT((ndo, "rarp reply" ));
+ 		ND_PRINT((ndo, "rarp reply %s at %s",
+ 				ax25_addr_string( tmp, THA(ap) ),
+ 				ipaddr_string(TPA(ap))));
+ 		break;
+ 
+ 	case ARPOP_INVREQUEST:
+ 		ND_PRINT((ndo, "invarp who-is" ));
+ 		ND_PRINT((ndo, "invarp who-is %s tell %s",
+ 				ax25_addr_string( tmp, THA(ap) ),
+ 				ax25_addr_string( tmp, SHA(ap) )));
+ 		break;
+ 
+ 	case ARPOP_INVREPLY:
+ 		ND_PRINT((ndo,"invarp reply" ));
+ 		ND_PRINT((ndo,"invarp reply %s at %s",
+ 				ax25_addr_string( tmp, THA(ap) ),
+ 				ipaddr_string(TPA(ap))));
+ 		break;
+ 
+ 	default:
+ 		ND_PRINT((ndo, "arp-#%d", op));
+ 		ND_DEFAULTPRINT((const u_char *)ap, caplen);
+ 		return;
+ 	}
+ 	if (hrd != ARPHRD_AX25)
+ 		ND_PRINT((ndo, " hardware #%d", hrd));
+ 	return;
+ trunc:
+ 	ND_PRINT((ndo, "[|arp]"));
+ }
+ 
+ void
  arp_print(netdissect_options *ndo,
  	  const u_char *bp, u_int length, u_int caplen)
  {
***************
*** 265,270 ****
--- 351,360 ----
  	        atmarp_print(ndo, bp, length, caplen);
  		return;
  	}
+ 	if (hrd == ARPHRD_AX25) {
+ 	        ax25_arp_print(ndo, bp, length, caplen);
+ 		return;
+ 	}
  	pro = PRO(ap);
  	op = OP(ap);
  

--------------070706090903070300020306
Content-Type: text/plain;
 name="ethereal_ax25-0.0.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ethereal_ax25-0.0.patch"

*** original/ethereal-0.10.12/capture_loop.c	2005-07-26 20:26:51.000000000 +0100
--- modified/ethereal-0.10.12/capture_loop.c	2005-10-08 16:17:55.000000000 +0100
***************
*** 92,97 ****
--- 92,98 ----
  #include <epan/dissectors/packet-ap1394.h>
  #include <epan/dissectors/packet-atalk.h>
  #include <epan/dissectors/packet-atm.h>
+ #include <epan/dissectors/packet-ax25.h>
  #include <epan/dissectors/packet-clip.h>
  #include <epan/dissectors/packet-eth.h>
  #include <epan/dissectors/packet-fddi.h>
***************
*** 1698,1703 ****
--- 1699,1707 ----
      case WTAP_ENCAP_FRELAY_WITH_PHDR:
        capture_fr(pd, 0, whdr.caplen, &ld->counts);
        break;
+     case WTAP_ENCAP_AX25:
+       capture_ax25(pd, 0, whdr.caplen, &ld->counts);
+       break;
      /* XXX - some ATM drivers on FreeBSD might prepend a 4-byte ATM
         pseudo-header to DLT_ATM_RFC1483, with LLC header following;
         we might have to implement that at some point. */
*** original/ethereal-0.10.12/epan/address.h	2005-07-26 20:26:46.000000000 +0100
--- modified/ethereal-0.10.12/epan/address.h	2005-10-06 20:19:08.000000000 +0100
***************
*** 45,51 ****
    AT_SS7PC,		/* SS7 Point Code */
    AT_STRINGZ,		/* null-terminated string */
    AT_EUI64,		/* IEEE EUI-64 */
!   AT_URI		/* URI/URL/URN */
  } address_type;
  
  typedef struct _address {
--- 45,52 ----
    AT_SS7PC,		/* SS7 Point Code */
    AT_STRINGZ,		/* null-terminated string */
    AT_EUI64,		/* IEEE EUI-64 */
!   AT_URI,		/* URI/URL/URN */
!   AT_AX25		/* AX.25 */
  } address_type;
  
  typedef struct _address {
*** original/ethereal-0.10.12/epan/column-utils.c	2005-07-26 20:26:46.000000000 +0100
--- modified/ethereal-0.10.12/epan/column-utils.c	2005-10-17 22:24:37.000000000 +0100
***************
*** 604,609 ****
--- 604,618 ----
  
    switch (addr->type) {
  
+   case AT_AX25:
+     if (is_src)
+       strcpy(pinfo->cinfo->col_expr[col], "ax25.src");
+     else
+       strcpy(pinfo->cinfo->col_expr[col], "ax25.dst");
+     strncpy(pinfo->cinfo->col_expr_val[col], ax25_to_str(addr->data), COL_MAX_LEN);
+     pinfo->cinfo->col_expr_val[col][COL_MAX_LEN - 1] = '\0';
+     break;
+ 
    case AT_ETHER:
      if (is_src)
        strcpy(pinfo->cinfo->col_expr[col], "eth.src");
*** original/ethereal-0.10.12/epan/dfilter/semcheck.c	2005-07-26 20:26:02.000000000 +0100
--- modified/ethereal-0.10.12/epan/dfilter/semcheck.c	2005-10-16 11:11:10.000000000 +0100
***************
*** 71,81 ****
  		case FT_UINT64:		/* XXX - should be able to compare with INT */
  			return a == b;
  
  		case FT_ETHER:
  		case FT_BYTES:
  		case FT_UINT_BYTES:
  		case FT_GUID:
! 			return (b == FT_ETHER || b == FT_BYTES || b == FT_UINT_BYTES || b == FT_GUID);
  
  		case FT_BOOLEAN:
  		case FT_FRAMENUM:
--- 71,82 ----
  		case FT_UINT64:		/* XXX - should be able to compare with INT */
  			return a == b;
  
+ 		case FT_AX25:
  		case FT_ETHER:
  		case FT_BYTES:
  		case FT_UINT_BYTES:
  		case FT_GUID:
! 			return (b = FT_AX25 || b == FT_ETHER || b == FT_BYTES || b == FT_UINT_BYTES || b == FT_GUID);
  
  		case FT_BOOLEAN:
  		case FT_FRAMENUM:
***************
*** 157,162 ****
--- 158,164 ----
  		case FT_IPv4:
  		case FT_IPv6:
  		case FT_IPXNET:
+ 		case FT_AX25:
  		case FT_ETHER:
  		case FT_BYTES:
  		case FT_UINT_BYTES:
***************
*** 232,237 ****
--- 234,240 ----
  is_bytes_type(enum ftenum type)
  {
  	switch(type) {
+ 		case FT_AX25:
  		case FT_ETHER:
  		case FT_BYTES:
  		case FT_UINT_BYTES:
*** original/ethereal-0.10.12/epan/dissectors/Makefile.common	2005-07-26 20:26:40.000000000 +0100
--- modified/ethereal-0.10.12/epan/dissectors/Makefile.common	2005-11-09 15:29:54.000000000 +0000
***************
*** 101,106 ****
--- 101,107 ----
  	packet-atalk.c	\
  	packet-atm.c	\
  	packet-auto_rp.c	\
+ 	packet-ax25.c	\
  	packet-ax4000.c	\
  	packet-bacapp.c	\
  	packet-bacnet.c	\
***************
*** 630,635 ****
--- 631,637 ----
  	packet-arp.h	\
  	packet-atalk.h	\
  	packet-atm.h	\
+ 	packet-ax25.h	\
  	packet-bacapp.h	\
  	packet-ber.h	\
  	packet-bgp.h	\
*** original/ethereal-0.10.12/epan/dissectors/packet-ax25.c	2005-11-07 23:58:26.000000000 +0000
--- modified/ethereal-0.10.12/epan/dissectors/packet-ax25.c	2005-11-07 00:08:49.000000000 +0000
***************
*** 0 ****
--- 1,592 ----
+ /* packet-ax25.c
+  * Routines for AX.25 dissection
+  * Copyright 2005, R.W. Stearn <richard@rns-stearn.demon.co.uk>
+  *
+  * $Id: README.developer 14679 2005-06-17 15:03:26Z gerald $
+  *
+  * Ethereal - Network traffic analyzer
+  * By Gerald Combs <gerald@ethereal.com>
+  * Copyright 1998 Gerald Combs
+  *
+  * Inspiration on how to build the dissector drawn from
+  *   packet-sdlc.c
+  *   packet-x25.c
+  *   packet-lapb.c
+  *   paket-gprs-llc.c
+  *   xdlc.c
+  * with the base file built from README.developers.
+  * 
+  * This program is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU General Public License
+  * as published by the Free Software Foundation; either version 2
+  * of the License, or (at your option) any later version.
+  * 
+  * This program is distributed in the hope that it will be useful,
+  * but WITHOUT ANY WARRANTY; without even the implied warranty of
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+  * GNU General Public License for more details.
+  * 
+  * You should have received a copy of the GNU General Public License
+  * along with this program; if not, write to the Free Software
+  * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+  */
+ 
+ #ifdef HAVE_CONFIG_H
+ # include "config.h"
+ #endif
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+ 
+ #include <glib.h>
+ 
+ #include <epan/strutil.h>
+ #include <epan/packet.h>
+ #include <epan/prefs.h>
+ #include <epan/xdlc.h>
+ #include <packet-ip.h>
+ 
+ #include "packet-ax25.h"
+ 
+ #define AX25_LEN		7  /* length of and AX.25 address */
+ #define AX25_HEADER_SIZE	16 /* length of kiss_len + src_addr + dst_addr + cntl */
+ #define AX25_MAX_DIGIS		8
+ 
+ #define AX25_P_ROSE	0x01	/* ISO 8208 / CCITT X.25 PLP */
+ #define AX25_P_RFC1144C	0x06	/* Compressed TCP/IP packet. Van Jacobson RFC1144 */
+ #define AX25_P_RFC1144	0x07	/* Uncompressed TCP/IP packet. Van Jacobson RFC1144 */
+ #define AX25_P_SEGMENT	0x08	/* segmentation fragment */
+ #define AX25_P_TEXNET	0xC3	/* TEXNET datagram */
+ #define AX25_P_ATALK	0xCA	/* AppleTalk */
+ #define AX25_P_ATALKARP	0xCB	/* AppleTalk ARP */
+ #define AX25_P_IP	0xCC	/* ARPA Internet Protocol */
+ #define AX25_P_ARP	0xCD	/* ARPA Address Resolution Protocol */
+ #define AX25_P_FLEXNET 	0xCE	/* FlexNet */
+ #define AX25_P_NETROM 	0xCF	/* NET/ROM */
+ #define AX25_P_NO_L3 	0xF0	/* No layer 3 protocol */
+ #define AX25_P_L3_ESC 	0xFF	/* Escape character. Next octet contains more layer 3 protocol info */
+ 
+ #define I_FRAME( control )  ( (control & 0x01) == 0 )
+ #define UI_FRAME( control ) (( (control & 0x03) == 3 ) && (( (((control >> 5 ) & 0x07) << 2) | ((control >> 2 ) & 0x03) ) == 0 ))
+ 
+ /* Forward declaration we need below */
+ void proto_reg_handoff_ax25(void);
+ 
+ /* Dissector handles - all the possibles are listed */
+ static dissector_handle_t rose_handle;
+ static dissector_handle_t rfc1144c_handle;
+ static dissector_handle_t rfc1144_handle;
+ static dissector_handle_t segment_handle;
+ static dissector_handle_t texnet_handle;
+ static dissector_handle_t atalk_handle;
+ static dissector_handle_t atalkarp_handle;
+ static dissector_handle_t ip_handle;
+ static dissector_handle_t arp_handle;
+ static dissector_handle_t flexnet_handle;
+ static dissector_handle_t netrom_handle;
+ static dissector_handle_t no_l3_handle;
+ static dissector_handle_t l3_esc_handle;
+ static dissector_handle_t default_handle;
+ 
+ /* Initialize the protocol and registered fields */
+ static int proto_ax25		= -1;
+ static int hf_ax25_dst		= -1;
+ static int hf_ax25_src		= -1;
+ static int hf_ax25_via[ AX25_MAX_DIGIS ]	= { -1,-1,-1,-1,-1,-1,-1,-1 };
+ static int hf_ax25_ctl		= -1;
+ 
+ static int hf_ax25_n_r		= -1;
+ static int hf_ax25_n_s		= -1;
+ 
+ static int hf_ax25_p		= -1;
+ static int hf_ax25_f		= -1;
+ 
+ static int hf_ax25_ftype_s	= -1;
+ static int hf_ax25_ftype_i	= -1;
+ static int hf_ax25_ftype_su	= -1;
+ 
+ static int hf_ax25_u_cmd	= -1;
+ static int hf_ax25_u_resp	= -1;
+ 
+ static int hf_ax25_pid		= -1;
+ 
+ static const xdlc_cf_items ax25_cf_items = {
+ 	&hf_ax25_n_r,
+ 	&hf_ax25_n_s,
+ 	&hf_ax25_p,
+ 	&hf_ax25_f,
+ 	&hf_ax25_ftype_s,
+ 	&hf_ax25_u_cmd,
+ 	&hf_ax25_u_resp,
+ 	&hf_ax25_ftype_i,
+ 	&hf_ax25_ftype_su
+ };
+ 
+ /* Global preference ("controls" display of numbers) */
+ static gboolean gPREF_HEX = FALSE;
+ 
+ /* Initialize the subtree pointers */
+ static gint ett_ax25 = -1;
+ static gint ett_ax25_ctl = -1;
+ 
+ /* Code to actually dissect the packets */
+ static void
+ dissect_ax25(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree)
+ {
+ 	proto_item *ti;
+ 	proto_tree *ax25_tree;
+ 	int offset;
+ 	int control_offset;
+ 	int hdr_len;
+ 	int via_index;
+ 	char info_buffer[ 80 ];
+ 	char v2cmdresp;
+ 	char *ax25_version;
+ 	int is_response;
+ 	char *text_ptr;
+ 	const guint8 *src_addr;
+ 	const guint8 *dst_addr;
+ 	const guint8 *via_addr;
+ 	guint8 control;
+ 	guint8 pid = AX25_P_NO_L3;
+ 	char *pid_text = NULL;
+ 	guint8 src_ssid;
+ 	guint8 dst_ssid;
+ 	void *saved_private_data;
+ 	tvbuff_t *next_tvb = NULL;
+ 
+ 
+ 	if (check_col(pinfo->cinfo, COL_PROTOCOL)) 
+ 		col_set_str(pinfo->cinfo, COL_PROTOCOL, "ax25");
+     
+ 	if (check_col(pinfo->cinfo, COL_INFO)) 
+ 		col_clear(pinfo->cinfo, COL_INFO);
+ 
+ 	/* start at 1 to step over the kiss length byte and point at dst addr */
+ 	offset = 1;
+ 
+ 	dst_addr = tvb_get_ptr( tvb,  offset, AX25_LEN );
+ 	SET_ADDRESS(&pinfo->dl_dst,	AT_AX25, AX25_LEN, dst_addr);
+ 	SET_ADDRESS(&pinfo->dst,	AT_AX25, AX25_LEN, dst_addr);
+ 	dst_ssid = *(dst_addr + 6);
+ 	offset += AX25_LEN; /* step over dst addr point at src addr */
+ 
+ 	src_addr = tvb_get_ptr( tvb,  offset, AX25_LEN );
+ 	SET_ADDRESS(&pinfo->dl_src,	AT_AX25, AX25_LEN, src_addr);
+ 	SET_ADDRESS(&pinfo->src,	AT_AX25, AX25_LEN, src_addr);
+ 	src_ssid = *(src_addr + 6);
+ 	offset += AX25_LEN; /* step over src addr point at either 1st via addr or control byte */
+ 
+ 	/* step over any vias */
+ 	while ( ( tvb_get_guint8( tvb, offset - 1 ) & 0x01 ) == 0 )
+ 		offset += AX25_LEN; /* step over a via addr */
+ 
+ 	/* decode the cmd/resp field */
+ 	v2cmdresp = '.';
+ 	switch (((dst_ssid >> 6) & 0x02) | ((src_ssid >> 7) & 0x01))
+ 		{
+ 		case 1 : /* V2.0 Response */
+ 			ax25_version = "V2.0+";
+ 			v2cmdresp = 'R';
+ 			is_response = TRUE;
+ 			break;
+ 		case 2 : /* V2.0 Command */
+ 			ax25_version = "V2.0+";
+ 			v2cmdresp = 'C';
+ 			is_response = FALSE;
+ 			break;
+ 		default :
+ 			ax25_version = "V?.?";
+ 			v2cmdresp = '?';
+ 			is_response = FALSE;
+ 			break;
+ 		}
+ 
+ 	/* decode the control field */
+ 	control_offset = offset;
+ 	control  = tvb_get_guint8( tvb, control_offset );
+ 
+ 	text_ptr = "????";
+ 	switch ( control & 0x03 )
+ 		{
+ 		case 1 :
+ 			switch ( (control >> 2 ) & 0x03 )
+ 				{
+ 				case 0 : text_ptr = "RR"; break;
+ 				case 1 : text_ptr = "RNR"; break;
+ 				case 2 : text_ptr = "REJ"; break;
+ 				case 3 : text_ptr = "SREJ"; break;
+ 				}
+ 			break;
+ 		case 3 :
+ 			switch ( (((control >> 5 ) & 0x07) << 2) | ((control >> 2 ) & 0x03) )
+ 				{
+ 				case 0  :  text_ptr = "UI"; break;
+ 				case 3  :  text_ptr = "DM"; break;
+ 				case 7  :  text_ptr = "SABM"; break;
+ 				case 8  :  text_ptr = "DISC"; break;
+ 				case 12 :  text_ptr = "UA"; break;
+ 				case 15 :  text_ptr = "SABME"; break;
+ 				case 17 :  text_ptr = "FRMR"; break;
+ 				case 23 :  text_ptr = "XID"; break;
+ 				case 28 :  text_ptr = "TEST"; break;
+ 				default :  text_ptr = "????"; break;
+ 				}
+ 			break;
+ 		default :
+ 			text_ptr = "I";
+ 			break;
+ 		}
+ 	sprintf( info_buffer, "%s", text_ptr );
+ 
+ 	/* decode the pid field (if appropriate) */
+ 	if ( I_FRAME( control ) || UI_FRAME( control ) )
+ 		{
+ 		offset += 1; /* step over control byte point at pid */
+ 		pid      = tvb_get_guint8( tvb, offset );
+ 		switch ( pid )
+ 			{
+ 			case AX25_P_ROSE	: pid_text = "Rose"			; break;
+ 			case AX25_P_RFC1144C	: pid_text = "RFC1144 (compressed)"	; break;
+ 			case AX25_P_RFC1144	: pid_text = "RFC1144 (uncompressed)"	; break;
+ 			case AX25_P_SEGMENT	: pid_text = "Segment"			; break;
+ 			case AX25_P_TEXNET	: pid_text = "Texnet"			; break;
+ 			case AX25_P_ATALK	: pid_text = "AppleTalk"		; break;
+ 			case AX25_P_ATALKARP	: pid_text = "AppleTalk ARP"		; break;
+ 			case AX25_P_IP		: pid_text = "IP"			; break;
+ 			case AX25_P_ARP		: pid_text = "ARP"			; break;
+ 			case AX25_P_FLEXNET	: pid_text = "FlexNet"			; break;
+ 			case AX25_P_NETROM	: pid_text = "NetRom"			; break;
+ 			case AX25_P_NO_L3	: pid_text = "No L3"			; break;
+ 			case AX25_P_L3_ESC	: pid_text = "L3 esc"			; break;
+ 			default			: pid_text = "Unknown"			; break;
+ 			}
+ 		sprintf( info_buffer, "%s (%s)", info_buffer, pid_text );
+ 		}
+ 
+ 	if (check_col(pinfo->cinfo, COL_INFO)) 
+ 		col_add_str( pinfo->cinfo, COL_INFO, info_buffer );
+ 
+ 	if (tree)
+ 		{
+ 
+ 		/* create display subtree for the protocol */
+ 		hdr_len = 15;
+ 		if ( I_FRAME( control ) || UI_FRAME( control ) )
+ 			hdr_len = 16;
+ 
+ 		ti = proto_tree_add_protocol_format( tree, proto_ax25, tvb, 1, hdr_len,
+ 			"AX25, Src: %s (%s), Dst: %s (%s), Ver: %s",
+ 			get_ax25_name( src_addr ),
+ 			ax25_to_str( src_addr ),
+ 			get_ax25_name( dst_addr ),
+ 			ax25_to_str( dst_addr ),
+ 			ax25_version );
+ 
+ 		ax25_tree = proto_item_add_subtree( ti, ett_ax25 );
+ 
+ 		/* start at 1 to step over the kiss length byte and point at dst addr */
+ 		offset = 1;
+ 		proto_tree_add_ax25( ax25_tree, hf_ax25_dst, tvb, offset, AX25_LEN, dst_addr );
+ 
+ 		/* step over dst addr point at src addr */
+ 		offset += AX25_LEN;
+ 		proto_tree_add_ax25( ax25_tree, hf_ax25_src, tvb, offset, AX25_LEN, src_addr );
+ 
+ 		/* step over src addr point at either 1st via addr or control byte */
+ 		offset += AX25_LEN;
+ 
+ 		/* handle the vias, if any */
+ 		via_index = 0;
+ 		while ( ( tvb_get_guint8( tvb, offset - 1 ) & 0x01 ) == 0 )
+ 			{
+ 			if ( via_index < AX25_MAX_DIGIS )
+ 				{
+ 				via_addr = tvb_get_ptr( tvb,  offset, AX25_LEN );
+ 				proto_tree_add_ax25( ax25_tree, hf_ax25_via[ via_index ], tvb, offset, AX25_LEN, via_addr );
+ 				via_index++;
+ 				}
+ 			/* step over a via addr */
+ 			offset += AX25_LEN;
+ 			}
+ 
+ 		dissect_xdlc_control(	tvb,
+ 					control_offset,
+ 					pinfo,
+ 					ax25_tree,
+ 					hf_ax25_ctl,
+ 					ett_ax25_ctl,
+ 					&ax25_cf_items,
+ 					NULL,
+ 					NULL,
+ 					NULL,
+ 					is_response,
+ 					FALSE,
+ 					FALSE );
+ 
+ 		if ( I_FRAME( control ) || UI_FRAME( control ) )
+ 			{
+ 			char s[ 80 ];
+ 
+ 			offset += 1; /* step over control byte point at pid */
+ 			s[ 0 ] = '\0';
+ 			proto_tree_add_string_format(
+ 							ax25_tree,
+ 							hf_ax25_pid,
+ 							tvb,
+ 							offset,
+ 							1,
+ 							(const char *) &s,
+ 							"Packet ID: %s (%0x)",
+ 							pid_text,
+ 							pid
+ 							);
+ 			}
+ 		}
+ 
+ 	/* Call sub-dissectors here */
+ 
+ 	if ( I_FRAME( control ) || UI_FRAME( control ) )
+ 		{
+ 		saved_private_data = pinfo->private_data;
+ 		next_tvb = tvb_new_subset(tvb, offset + 1, -1, -1);
+ 
+ 		switch ( pid )
+ 			{
+ 			case AX25_P_ROSE	: call_dissector( rose_handle    , next_tvb, pinfo, tree ); break;
+ 			case AX25_P_RFC1144C	: call_dissector( rfc1144c_handle, next_tvb, pinfo, tree ); break;
+ 			case AX25_P_RFC1144	: call_dissector( rfc1144_handle , next_tvb, pinfo, tree ); break;
+ 			case AX25_P_SEGMENT	: call_dissector( segment_handle , next_tvb, pinfo, tree ); break;
+ 			case AX25_P_TEXNET	: call_dissector( texnet_handle  , next_tvb, pinfo, tree ); break;
+ 			case AX25_P_ATALK	: call_dissector( atalk_handle   , next_tvb, pinfo, tree ); break;
+ 			case AX25_P_ATALKARP	: call_dissector( atalkarp_handle, next_tvb, pinfo, tree ); break;
+ 			case AX25_P_IP		: call_dissector( ip_handle      , next_tvb, pinfo, tree ); break;
+ 			case AX25_P_ARP		: call_dissector( arp_handle     , next_tvb, pinfo, tree ); break;
+ 			case AX25_P_FLEXNET	: call_dissector( flexnet_handle , next_tvb, pinfo, tree ); break;
+ 			case AX25_P_NETROM	: call_dissector( netrom_handle  , next_tvb, pinfo, tree ); break;
+ 			case AX25_P_NO_L3	: call_dissector( no_l3_handle   , next_tvb, pinfo, tree ); break;
+ 			case AX25_P_L3_ESC	: call_dissector( l3_esc_handle  , next_tvb, pinfo, tree ); break;
+ 			default			: call_dissector( default_handle , next_tvb, pinfo, tree ); break;
+ 			}
+ 		pinfo->private_data = saved_private_data;
+ 		}
+ }
+ 
+ void
+ proto_register_ax25(void)
+ {                 
+   module_t *ax25_module;
+ 
+ 	/* Setup list of header fields */
+ 	static hf_register_info hf[] = {
+ 		{ &hf_ax25_dst,
+ 			{ "Destination",		"ax25.dst",
+ 			FT_AX25, BASE_NONE, NULL, 0x0,          
+ 			"Destination callsign", HFILL }
+ 		},
+ 		{ &hf_ax25_src,
+ 			{ "Source",			"ax25.src",
+ 			FT_AX25, BASE_NONE, NULL, 0x0,          
+ 			"Source callsign", HFILL }
+ 		},
+ 		{ &hf_ax25_via[ 0 ],
+ 			{ "Via",			"ax25.via",
+ 			FT_AX25, BASE_NONE, NULL, 0x0,          
+ 			"Via callsign", HFILL }
+ 		},
+ 		{ &hf_ax25_ctl,
+ 			{ "Control",			"ax25.ctl",
+ 			FT_UINT8, BASE_HEX, NULL, 0x0,          
+ 			"Control field", HFILL }
+ 		},
+ 		{ &hf_ax25_n_r,
+ 			{ "n(r)",			"ax25.ctl.n_r",
+ 			FT_UINT8, BASE_DEC, NULL, XDLC_N_R_MASK,          
+ 			"", HFILL }
+ 		},
+ 		{ &hf_ax25_n_s,
+ 			{ "n(s)",			"ax25.ctl.n_s",
+ 			FT_UINT8, BASE_DEC, NULL, XDLC_N_S_MASK,          
+ 			"", HFILL }
+ 		},
+ 		{ &hf_ax25_p,
+ 			{ "Poll",			"ax25.ctl.p",
+ 			FT_BOOLEAN, 8, TFS(&flags_set_truth), XDLC_P_F,          
+ 			"", HFILL }
+ 		},
+ 		{ &hf_ax25_f,
+ 			{ "Final",			"ax25.ctl.f",
+ 			FT_BOOLEAN, 8, TFS(&flags_set_truth), XDLC_P_F,          
+ 			"", HFILL }
+ 		},
+ 		{ &hf_ax25_ftype_s,
+ 			{ "Frame type",			"ax25.ctl.ftype_s",
+ 			FT_UINT8, BASE_HEX, VALS(stype_vals), XDLC_S_FTYPE_MASK,          
+ 			"", HFILL }
+ 		},
+ 		{ &hf_ax25_ftype_i,
+ 			{ "Frame type",			"ax25.ctl.ftype_i",
+ 			FT_UINT8, BASE_HEX, VALS(ftype_vals), XDLC_I_MASK,          
+ 			"", HFILL }
+ 		},
+ 		{ &hf_ax25_ftype_su,
+ 			{ "Frame type",			"ax25.ctl.ftype_su",
+ 			FT_UINT8, BASE_HEX, VALS(ftype_vals), XDLC_S_U_MASK,          
+ 			"", HFILL }
+ 		},
+ 		{ &hf_ax25_u_cmd,
+ 			{ "Frame type",			"ax25.ctl.u_cmd",
+ 			FT_UINT8, BASE_HEX, VALS(modifier_vals_cmd), XDLC_U_MODIFIER_MASK,          
+ 			"", HFILL }
+ 		},
+ 		{ &hf_ax25_u_resp,
+ 			{ "Frame type",			"ax25.ctl.u_resp",
+ 			FT_UINT8, BASE_HEX, VALS(modifier_vals_resp), XDLC_U_MODIFIER_MASK,          
+ 			"", HFILL }
+ 		},
+ 		{ &hf_ax25_pid,
+ 			{ "Packet ID",			"ax25.pid",
+ 			FT_STRING, BASE_HEX, NULL, 0x0,          
+ 			"Packet identifier", HFILL }
+ 		},
+ 	};
+ 
+ 	/* Setup protocol subtree array */
+ 	static gint *ett[] = {
+ 		&ett_ax25,
+ 		&ett_ax25_ctl,
+ 	};
+ 
+ 	/* Register the protocol name and description */
+ 	proto_ax25 = proto_register_protocol("Amateur AX.25", "AX25", "ax25");
+ 
+ 	/* Required function calls to register the header fields and subtrees used */
+ 	proto_register_field_array(proto_ax25, hf, array_length(hf));
+ 	proto_register_subtree_array(ett, array_length(ett));
+         
+ 	/* Register preferences module */       
+         ax25_module = prefs_register_protocol(proto_ax25, proto_reg_handoff_ax25);
+      
+ 	/* Register amy preference */        
+         prefs_register_bool_preference(ax25_module, "showhex", 
+              "Display numbers in Hex",
+ 	     "Enable to display numerical values in hexadecimal.",
+ 	     &gPREF_HEX );        
+ }
+ 
+ 
+ /* If this dissector uses sub-dissector registration add a registration routine.
+    This exact format is required because a script is used to find these routines 
+    and create the code that calls these routines.
+    
+    This function is also called by preferences whenever "Apply" is pressed 
+    (see prefs_register_protocol above) so it should accommodate being called 
+    more than once.
+ */
+ void
+ proto_reg_handoff_ax25(void)
+ {
+         static gboolean inited = FALSE;
+         
+         if( !inited ) {
+ 
+ 	dissector_handle_t ax25_handle;
+ 
+ 	ax25_handle = create_dissector_handle( dissect_ax25, proto_ax25 );
+ 	dissector_add( "wtap_encap", WTAP_ENCAP_AX25, ax25_handle );
+         
+ 	/*
+ 	  I have added the "data" dissector for all the currently known PID's
+ 	  This is so at least we have an entry in the tree that allows the
+ 	  payload to be hightlighted.
+ 	  When a new dissector is available all that needs to be done is to
+ 	  replace the current dissector name "data" with the new dissector name.
+ 	*/
+ 	rose_handle     = find_dissector( "data" /* "rose"     */ );
+ 	rfc1144c_handle = find_dissector( "data" /* "rfc1144c" */ );
+ 	rfc1144_handle  = find_dissector( "data" /* "rfc1144"  */ );
+ 	segment_handle  = find_dissector( "data" /* "segment"  */ );
+ 	texnet_handle   = find_dissector( "data" /* "texnet"   */ );
+ 	atalk_handle    = find_dissector( "data" /* "atalk"    */ );
+ 	atalkarp_handle = find_dissector( "data" /* "atalkarp" */ );
+ 	ip_handle       = find_dissector( "ip" );
+ 	arp_handle      = find_dissector( "data" /* "arp"      */ );
+ 	flexnet_handle  = find_dissector( "data" /* "flexnet"  */ );
+ 	netrom_handle   = find_dissector( "data" /* "netrom"   */ );
+ 	no_l3_handle    = find_dissector( "data" /* "no_l3"    */ );
+ 	l3_esc_handle   = find_dissector( "data" /* "l3_esc"   */ );
+ 	default_handle  = find_dissector( "data" );
+ 
+         inited = TRUE;
+         }
+         
+         /* 
+           If you perform registration functions which are dependant upon
+           prefs the you should de-register everything which was associated
+           with the previous settings and re-register using the new prefs settings
+           here. In general this means you need to keep track of what value the
+           preference had at the time you registered using a local static in this
+           function. ie.
+ 
+           static int currentPort = -1;
+ 
+           if( -1 != currentPort ) {
+               dissector_delete( "tcp.port", currentPort, ax25_handle);
+           }
+ 
+           currentPort = gPortPref;
+ 
+           dissector_add("tcp.port", currentPort, ax25_handle);
+             
+         */
+ }
+ 
+ void
+ capture_ax25(const guchar *pd, int offset, int len, packet_counts *ld)
+ {
+ 	guint8 control;
+ 	guint8 pid;
+ 	int l_offset;
+ 
+ if ( ! BYTES_ARE_IN_FRAME( offset, len, AX25_HEADER_SIZE ) )
+ 	{
+ 	ld->other++;
+ 	return;
+ 	}
+ 
+ l_offset = offset;
+ l_offset += 1; /* step over kiss byte point at dst addr */
+ l_offset += AX25_LEN; /* step over dst addr point at src addr */
+ l_offset += AX25_LEN; /* step over src addr point at either 1st via addr or control byte */
+ while ( ( pd[ l_offset - 1 ] & 0x01 ) == 0 )
+ 	l_offset += AX25_LEN; /* step over a via addr */
+ 
+ control = pd[ l_offset ];
+ 
+ /* decode the pid field (if appropriate) */
+ if ( I_FRAME( control ) || UI_FRAME( control ) )
+ 	{
+ 	l_offset += 1; /* step over control byte point at pid */
+ 	pid = pd[ l_offset ];
+ 
+ 	l_offset += 1; /* step over the pid and point to the first byte of the payload */
+ 	switch ( pid & 0x0ff )
+ 		{
+ 		case AX25_P_ROSE	: break;
+ 		case AX25_P_RFC1144C	: break;
+ 		case AX25_P_RFC1144	: break;
+ 		case AX25_P_SEGMENT	: break;
+ 		case AX25_P_TEXNET	: break;
+ 		case AX25_P_ATALK	: break;
+ 		case AX25_P_ATALKARP	: break;
+ 		case AX25_P_IP		: capture_ip( pd, l_offset, len, ld ); break;
+ 		case AX25_P_ARP		: break;
+ 		case AX25_P_FLEXNET	: break;
+ 		case AX25_P_NETROM	: break;
+ 		case AX25_P_NO_L3	: break;
+ 		case AX25_P_L3_ESC	: break;
+ 		default			: break;
+ 		}
+ 	}
+ }
*** original/ethereal-0.10.12/epan/dissectors/packet-ax25.h	2005-11-07 23:58:24.000000000 +0000
--- modified/ethereal-0.10.12/epan/dissectors/packet-ax25.h	2005-10-08 16:20:29.000000000 +0100
***************
*** 0 ****
--- 1,29 ----
+ /* packet-ax25.h
+  *
+  * $Id: packet-ax25.h 13493 2005-02-24 05:42:51Z guy $
+  *
+  * Ethereal - Network traffic analyzer
+  * By Gerald Combs <gerald@ethereal.com>
+  * Copyright 1998 Gerald Combs
+  *
+  * This program is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU General Public License
+  * as published by the Free Software Foundation; either version 2
+  * of the License, or (at your option) any later version.
+  *
+  * This program is distributed in the hope that it will be useful,
+  * but WITHOUT ANY WARRANTY; without even the implied warranty of
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+  * GNU General Public License for more details.
+  *
+  * You should have received a copy of the GNU General Public License
+  * along with this program; if not, write to the Free Software
+  * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
+  */
+ 
+ #ifndef __PACKET_AX25_H__
+ #define __PACKET_AX25_H__
+ 
+ void capture_ax25(const guchar *, int, int, packet_counts *);
+ 
+ #endif
*** original/ethereal-0.10.12/epan/dissectors/register.c	2005-07-26 21:20:44.000000000 +0100
--- modified/ethereal-0.10.12/epan/dissectors/register.c	2005-11-06 23:34:58.000000000 +0000
***************
*** 60,65 ****
--- 60,66 ----
    {extern void proto_register_atm (void); proto_register_atm ();}
    {extern void proto_register_atsvc (void); proto_register_atsvc ();}
    {extern void proto_register_auto_rp (void); proto_register_auto_rp ();}
+   {extern void proto_register_ax25 (void); proto_register_ax25 ();}
    {extern void proto_register_ax4000 (void); proto_register_ax4000 ();}
    {extern void proto_register_bacapp (void); proto_register_bacapp ();}
    {extern void proto_register_bacnet (void); proto_register_bacnet ();}
***************
*** 648,653 ****
--- 649,655 ----
    {extern void proto_reg_handoff_atm (void); proto_reg_handoff_atm ();}
    {extern void proto_reg_handoff_atsvc (void); proto_reg_handoff_atsvc ();}
    {extern void proto_reg_handoff_auto_rp (void); proto_reg_handoff_auto_rp ();}
+   {extern void proto_reg_handoff_ax25 (void); proto_reg_handoff_ax25 ();}
    {extern void proto_reg_handoff_ax4000 (void); proto_reg_handoff_ax4000 ();}
    {extern void proto_reg_handoff_bacapp (void); proto_reg_handoff_bacapp ();}
    {extern void proto_reg_handoff_bacnet (void); proto_reg_handoff_bacnet ();}
*** original/ethereal-0.10.12/epan/ftypes/ftype-bytes.c	2005-07-26 20:26:02.000000000 +0100
--- modified/ethereal-0.10.12/epan/ftypes/ftype-bytes.c	2005-10-29 00:30:59.000000000 +0100
***************
*** 37,42 ****
--- 37,43 ----
  #define CMP_MATCHES NULL
  #endif
  
+ #define AX25_LEN	7
  #define ETHER_LEN	6
  #define IPv6_LEN	16
  #define GUID_LEN	16
***************
*** 109,114 ****
--- 110,122 ----
  }
  
  static void
+ ax25_fvalue_set(fvalue_t *fv, gpointer value, gboolean already_copied)
+ {
+ 	g_assert(!already_copied);
+ 	common_fvalue_set(fv, value, AX25_LEN);
+ }
+ 
+ static void
  ether_fvalue_set(fvalue_t *fv, gpointer value, gboolean already_copied)
  {
  	g_assert(!already_copied);
***************
*** 177,182 ****
--- 185,226 ----
  }
  
  static gboolean
+ ax25_from_unparsed(fvalue_t *fv, char *s, gboolean allow_partial_value, LogFunc logfunc)
+ {
+ 	gchar	*mac;
+ 
+ 	/*
+ 	 * Don't log a message if this fails; we'll try looking it
+ 	 * up as another way if it does, and if that fails,
+ 	 * we'll log a message.
+ 	 */
+ 	if (bytes_from_unparsed(fv, s, TRUE, NULL)) {
+ 		if (fv->value.bytes->len > AX25_LEN) {
+ 			logfunc("\"%s\" contains too many bytes to be a valid AX.25 address.",
+ 			    s);
+ 			return FALSE;
+ 		}
+ 		else if (fv->value.bytes->len < AX25_LEN && !allow_partial_value) {
+ 			logfunc("\"%s\" contains too few bytes to be a valid AX.25 address.",
+ 			    s);
+ 			return FALSE;
+ 		}
+ 
+ 		return TRUE;
+ 	}
+ 
+ 	mac = get_ax25_name(s);
+ 	if (!mac) {
+ 		logfunc("\"%s\" is not a valid AX.25 address.",
+ 		    s);
+ 		return FALSE;
+ 	}
+ 
+ 	ax25_fvalue_set(fv, mac, FALSE);
+ 	return TRUE;
+ }
+ 
+ static gboolean
  ether_from_unparsed(fvalue_t *fv, char *s, gboolean allow_partial_value, LogFunc logfunc)
  {
  	guint8	*mac;
***************
*** 510,515 ****
--- 554,594 ----
  		slice,
  	};
  
+ 	static ftype_t ax25_type = {
+ 		"FT_AX25",			/* name */
+ 		"AX.25 address",		/* pretty_name */
+ 		AX25_LEN,			/* wire_size */
+ 		bytes_fvalue_new,		/* new_value */
+ 		bytes_fvalue_free,		/* free_value */
+ 		ax25_from_unparsed,		/* val_from_unparsed */
+ 		NULL,				/* val_from_string */
+ 		bytes_to_repr,			/* val_to_string_repr */
+ 		bytes_repr_len,			/* len_string_repr */
+ 
+ 		ax25_fvalue_set,		/* set_value */
+ 		NULL,				/* set_value_integer */
+ 		NULL,				/* set_value_integer64 */
+ 		NULL,				/* set_value_floating */
+ 
+ 		value_get,			/* get_value */
+ 		NULL,				/* get_value_integer */
+ 		NULL,				/* get_value_integer64 */
+ 		NULL,				/* get_value_floating */
+ 
+ 		cmp_eq,
+ 		cmp_ne,
+ 		cmp_gt,
+ 		cmp_ge,
+ 		cmp_lt,
+ 		cmp_le,
+ 		cmp_bytes_bitwise_and,
+ 		cmp_contains,
+ 		CMP_MATCHES,
+ 
+ 		len,
+ 		slice,
+ 	};
+ 
  	static ftype_t ether_type = {
  		"FT_ETHER",			/* name */
  		"Ethernet or other MAC address",/* pretty_name */
***************
*** 617,622 ****
--- 696,702 ----
  
  	ftype_register(FT_BYTES, &bytes_type);
  	ftype_register(FT_UINT_BYTES, &uint_bytes_type);
+ 	ftype_register(FT_AX25, &ax25_type);
  	ftype_register(FT_ETHER, &ether_type);
  	ftype_register(FT_IPv6, &ipv6_type);
  	ftype_register(FT_GUID, &guid_type);
*** original/ethereal-0.10.12/epan/ftypes/ftypes.h	2005-07-26 20:26:02.000000000 +0100
--- modified/ethereal-0.10.12/epan/ftypes/ftypes.h	2005-10-15 16:57:45.000000000 +0100
***************
*** 61,66 ****
--- 61,67 ----
  	FT_FRAMENUM,	/* a UINT32, but if selected lets you go to frame with that numbe */
  	FT_PCRE,		/* a compiled Perl-Compatible Regular Expression object */
  	FT_GUID,		/* GUID, UUID */
+ 	FT_AX25,
  	FT_NUM_TYPES /* last item number plus one */
  };
  
*** original/ethereal-0.10.12/epan/proto.c	2005-07-26 20:26:46.000000000 +0100
--- modified/ethereal-0.10.12/epan/proto.c	2005-11-03 21:31:10.000000000 +0000
***************
*** 125,130 ****
--- 125,134 ----
  static void
  proto_tree_set_string_tvb(field_info *fi, tvbuff_t *tvb, gint start, gint length);
  static void
+ proto_tree_set_ax25(field_info *fi, const guint8* value);
+ static void
+ proto_tree_set_ax25_tvb(field_info *fi, tvbuff_t *tvb, gint start);
+ static void
  proto_tree_set_ether(field_info *fi, const guint8* value);
  static void
  proto_tree_set_ether_tvb(field_info *fi, tvbuff_t *tvb, gint start);
***************
*** 841,846 ****
--- 845,855 ----
  			proto_tree_set_ipv6_tvb(new_fi, tvb, start);
  			break;
  
+ 		case FT_AX25:
+ 			DISSECTOR_ASSERT(length == 7);
+ 			proto_tree_set_ax25_tvb(new_fi, tvb, start);
+ 			break;
+ 
  		case FT_ETHER:
  			DISSECTOR_ASSERT(length == 6);
  			proto_tree_set_ether_tvb(new_fi, tvb, start);
***************
*** 1605,1610 ****
--- 1614,1657 ----
  	proto_tree_set_string(fi, string, TRUE);
  }
  
+ 
+ /* Add a FT_AX25 to a proto_tree */
+ proto_item *
+ proto_tree_add_ax25(proto_tree *tree, int hfindex, tvbuff_t *tvb, gint start, gint length,
+ 		const guint8* value)
+ {
+ 	proto_item		*pi;
+ 	field_info		*new_fi;
+ 	header_field_info	*hfinfo;
+ 
+ 	if (!tree)
+ 		return (NULL);
+ 
+ 	TRY_TO_FAKE_THIS_ITEM(tree, hfindex);
+ 
+ 	PROTO_REGISTRAR_GET_NTH(hfindex, hfinfo);
+ 	DISSECTOR_ASSERT(hfinfo->type == FT_AX25);
+ 
+ 	pi = proto_tree_add_pi(tree, hfindex, tvb, start, &length, &new_fi);
+ 	proto_tree_set_ax25(new_fi, value);
+ 
+ 	return pi;
+ }
+ 
+ /* Set the FT_AX25 value */
+ static void
+ proto_tree_set_ax25(field_info *fi, const guint8* value)
+ {
+ 	fvalue_set(&fi->value, (gpointer) value, FALSE);
+ }
+ 
+ static void
+ proto_tree_set_ax25_tvb(field_info *fi, tvbuff_t *tvb, gint start)
+ {
+ 	proto_tree_set_ax25(fi, tvb_get_ptr(tvb, start, 7));
+ }
+ 
+ 
  /* Add a FT_ETHER to a proto_tree */
  proto_item *
  proto_tree_add_ether(proto_tree *tree, int hfindex, tvbuff_t *tvb, gint start, gint length,
***************
*** 3190,3195 ****
--- 3237,3254 ----
  				label_str[ITEM_LABEL_LENGTH - 1] = '\0';
  			break;
  
+ 		case FT_AX25:
+ 			bytes = fvalue_get(&fi->value);
+ 			ret = snprintf(label_str, ITEM_LABEL_LENGTH,
+ 				"%s: %s (%s)", hfinfo->name,
+ 				get_ax25_name( bytes ),
+ 				ax25_to_str( bytes )
+ 				);
+ 
+ 			if ((ret == -1) || (ret >= ITEM_LABEL_LENGTH))
+ 				label_str[ITEM_LABEL_LENGTH - 1] = '\0';
+ 			break;
+ 
  		case FT_ETHER:
  			bytes = fvalue_get(&fi->value);
  			ret = snprintf(label_str, ITEM_LABEL_LENGTH,
***************
*** 4314,4319 ****
--- 4373,4379 ----
  		case FT_STRING:
  		case FT_STRINGZ:
  		case FT_UINT_STRING:
+ 		case FT_AX25:
  		case FT_ETHER:
  		case FT_BYTES:
  		case FT_UINT_BYTES:
***************
*** 4493,4498 ****
--- 4553,4559 ----
  		/* These use the fvalue's "to_string_repr" method. */
  		case FT_BOOLEAN:
  		case FT_STRING:
+ 		case FT_AX25:
  		case FT_ETHER:
  		case FT_BYTES:
  		case FT_UINT_BYTES:
*** original/ethereal-0.10.12/epan/proto.h	2005-07-26 20:26:46.000000000 +0100
--- modified/ethereal-0.10.12/epan/proto.h	2005-10-15 22:22:14.000000000 +0100
***************
*** 619,624 ****
--- 619,636 ----
  proto_tree_add_ipv6_format(proto_tree *tree, int hfindex, tvbuff_t *tvb, gint start,
  	gint length, const guint8* value_ptr, const char *format, ...) GNUC_FORMAT_CHECK(printf,7,8);
  
+ /** Add a FT_AX25 to a proto_tree.
+  @param tree the tree to append this item to
+  @param hfindex field index
+  @param tvb the tv buffer of the current data
+  @param start start of data in tvb
+  @param length length of data in tvb
+  @param value data to display
+  @return the newly created item */
+ extern proto_item *
+ proto_tree_add_ax25(proto_tree *tree, int hfindex, tvbuff_t *tvb, gint start,
+ 	gint length, const guint8* value);
+ 
  /** Add a FT_ETHER to a proto_tree.
   @param tree the tree to append this item to
   @param hfindex field index
*** original/ethereal-0.10.12/epan/to_str.c	2005-07-26 20:26:46.000000000 +0100
--- modified/ethereal-0.10.12/epan/to_str.c	2005-11-03 21:31:36.000000000 +0000
***************
*** 69,75 ****
  #include <time.h>
  #include "emem.h"
  
! #define MAX_BYTESTRING_LEN	6
  
  /* Routine to convert a sequence of bytes to a hex string, one byte/two hex
   * digits at at a time, with a specified punctuation character between
--- 69,75 ----
  #include <time.h>
  #include "emem.h"
  
! #define MAX_BYTESTRING_LEN	7
  
  /* Routine to convert a sequence of bytes to a hex string, one byte/two hex
   * digits at at a time, with a specified punctuation character between
***************
*** 128,133 ****
--- 128,157 ----
  	return bytestring_to_str(ad, 6, ':');
  }
  
+ /* XXX FIXME   
+ remove this one later when every call has been converted to address_to_str() 
+ */
+ gchar *
+ ax25_to_str(const guint8 *ad)
+ {
+ 	return bytestring_to_str(ad, 7, ':');
+ }
+ 
+ /* XXX FIXME   
+ remove this one later when every call has been converted to address_to_str() 
+ */
+ gchar *
+ get_ax25_name(const guint8 *ad)
+ {
+ 	address addr;
+ 
+ 	addr.type = AT_AX25;
+ 	addr.len  = 7;
+ 	addr.data = ad;
+ 
+ 	return address_to_str( &addr );
+ }
+ 
  /* 
   This function is very fast and this function is called a lot.
   XXX update the address_to_str stuff to use this function.
***************
*** 809,814 ****
--- 833,844 ----
      memmove(buf, addr->data, addr->len);
      buf[addr->len] = '\0';
      break;
+   case AT_AX25:
+     sprintf(buf, "%c%c%c%c%c%c-%02d",
+ 	(addr->data[0] >> 1) & 0x7f, (addr->data[1] >> 1) & 0x7f, (addr->data[2] >> 1) & 0x7f,
+ 	(addr->data[3] >> 1) & 0x7f, (addr->data[4] >> 1) & 0x7f, (addr->data[5] >> 1) & 0x7f,
+ 	(addr->data[6] >> 1) & 0x0f );
+     break;
    default:
      g_assert_not_reached();
    }
*** original/ethereal-0.10.12/epan/to_str.h	2005-07-26 20:26:46.000000000 +0100
--- modified/ethereal-0.10.12/epan/to_str.h	2005-10-16 11:03:28.000000000 +0100
***************
*** 52,57 ****
--- 52,59 ----
  extern gchar*	address_to_str(const address *);
  extern void     address_to_str_buf(const address *, gchar *);
  extern gchar*	ether_to_str(const guint8 *);
+ extern gchar*	ax25_to_str(const guint8 *);
+ extern gchar*	get_ax25_name(const guint8 *);
  extern gchar*	ip_to_str(const guint8 *);
  extern void	ip_to_str_buf(const guint8 *, gchar *);
  extern gchar*	fc_to_str(const guint8 *);
*** original/ethereal-0.10.12/wiretap/libpcap.c	2005-07-26 20:26:50.000000000 +0100
--- modified/ethereal-0.10.12/wiretap/libpcap.c	2005-10-04 22:29:39.000000000 +0100
***************
*** 171,176 ****
--- 171,177 ----
  	 */
  	{ 0,		WTAP_ENCAP_NULL },	/* null encapsulation */
  	{ 1,		WTAP_ENCAP_ETHERNET },
+ 	{ 3,		WTAP_ENCAP_AX25 },
  	{ 6,		WTAP_ENCAP_TOKEN_RING },	/* IEEE 802 Networks - assume token ring */
  	{ 7,		WTAP_ENCAP_ARCNET },
  	{ 8,		WTAP_ENCAP_SLIP },
*** original/ethereal-0.10.12/wiretap/wtap.c	2005-07-26 20:26:49.000000000 +0100
--- modified/ethereal-0.10.12/wiretap/wtap.c	2005-10-05 22:49:18.000000000 +0100
***************
*** 303,308 ****
--- 303,311 ----
  	/* WTAP_ENCAP_JUNIPER_MLPPP */
  	{ "Juniper MLPPP", "juniper-mlppp" },
  
+ 	/* WTAP_ENCAP_AX25 */
+ 	{ "Amateur AX.25", "ax25" },
+ 
  };
  
  /* Name that should be somewhat descriptive. */
*** original/ethereal-0.10.12/wiretap/wtap.h	2005-07-26 20:26:50.000000000 +0100
--- modified/ethereal-0.10.12/wiretap/wtap.h	2005-10-04 22:27:45.000000000 +0100
***************
*** 171,178 ****
  #define WTAP_ENCAP_NETTL_X25			80
  #define WTAP_ENCAP_K12					81
  #define WTAP_ENCAP_JUNIPER_MLPPP                82
  /* last WTAP_ENCAP_ value + 1 */
! #define WTAP_NUM_ENCAP_TYPES			83
  
  /* File types that can be read by wiretap.
     We support writing some many of these file types, too, so we
--- 171,179 ----
  #define WTAP_ENCAP_NETTL_X25			80
  #define WTAP_ENCAP_K12					81
  #define WTAP_ENCAP_JUNIPER_MLPPP                82
+ #define WTAP_ENCAP_AX25                         83
  /* last WTAP_ENCAP_ value + 1 */
! #define WTAP_NUM_ENCAP_TYPES			84
  
  /* File types that can be read by wiretap.
     We support writing some many of these file types, too, so we

--------------070706090903070300020306--
