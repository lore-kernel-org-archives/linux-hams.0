From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: AX.25 in tcpdump.
Date: Sat, 24 Sep 2005 23:56:00 +0100
Message-ID: <4335D980.503@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090201090707090103020103"
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams <linux-hams@vger.kernel.org>

This is a multi-part message in MIME format.
--------------090201090707090103020103
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

For the foolhardy, desperate or those who just like to live dangerously.

To play with this you will need to be comfortable with using tar, patch
& make at the very least.

Attached is a patch that adds AX.25 recognition to libpcap and (limited)
printing of AX.25 to tcpdump.

It will decode IP and ARP payloads, all others are treated as having no
L3 protocol and printed in hex and ascii.

The patch is against:
	libpcap-0.9.3
	tcpdump-3.9.3

This is an alpha release.

My testing is limited to vanilla AX.25 over non-radio mkiss serial link
carrying IP.

To build a test version of tcpdump:
	1.  Download libpcap & tcpdump sources
	2.  create a directory to work in (I use /usr/src/modified)
	3.  cd into that directory
	4.  unpack the sources into this directory
	5.  save the patch into this directory
	6.  apply the patch by running:
		patch -p1 < libpcap_tcpdump_ax25-0.0.patch
	7.  cd into libpcap-0.9.3
	8.  run ./configure
	9.  run make
	10. cd into tcpdump-3.9.3
	11. run ./configure
	12. run make
	13. run ./tcpdump -eni <ax.25 interface name>

and (hopefully) watch the cryptic text flow up the screen.

Currently there is no way to filter on AX.25 addresses. That I will
endevour to add as one of the next features.

This is the first step to getting AX.25 analysis into Ethereal, for
which we need AX.25 recognition in libpcap. If I ask for the updates
to libpcap I need to offer at least basic AX.25 protocol printing in
tcpdump (libpcap is maintained by the tcpdump workers).

What I am looking for from this release is testing against all the
various AX.25 network interfaces and checking that the decode is
correct. Remember that tcpdump, in general, does not do protocol
analysis, only printing of the protocol headers.

The format of the decode is not finalised, suggestions welcomed.
The format needs to be concise but informative to someone conversant
with the protocol.

As I am exceedingly lazy, has anybody got a softcopy of the NET/ROM
protocol spec so I can code netrom_print? or is even fool enough to
volunteer to code netrom_print?

Oh, and before anyone mentions it, yes I am aware of a patch from
Thomas Sailer with an ax25_print for tcpdump 3.4, unfortunately this
does not appear to have made it into mainstream tcpdump. I only
became aware of it from tcpdump worker Guy Harris after I had done
the bulk of the ax25_print coding for this patch.

-- 
Regards
	Richard

--------------090201090707090103020103
Content-Type: text/plain;
 name="libpcap_tcpdump_ax25-0.0.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libpcap_tcpdump_ax25-0.0.patch"

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
  

--------------090201090707090103020103--
