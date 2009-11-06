From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: Re: [PATCH] ax25ipd : added provision for dynamic dns hosts
Date: Fri, 06 Nov 2009 23:43:44 +0100
Message-ID: <4AF4A6A0.9090707@upmc.fr>
References: <C5A3335A.25066%teners@bh90210.net> <4AE1AA6C.9040500@upmc.fr> <20091102172232.GA31187@x-berg.in-berlin.de> <4AF03451.9030505@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040008030209070203080804"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4AF03451.9030505@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: linux-hams@vger.kernel.org, Ralf Baechle DL5RB <ralf@linux-mips.org>, ax25@x-berg.in-berlin.de

This is a multi-part message in MIME format.
--------------040008030209070203080804
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I resend the complete ax25ipd patch, taking into account Thomas remarks
about fixed array values.
However sizeof() was not appropriate and I put strnlen() instead. 

73 de Bernard, f6bvp



Pidoux wrote :
> Hi Thomas,
> 
> You are absolutely right.
> There was a part of the code missing in io.c patch.
> I have just sent a patch including the call to update_dns().
> 
> I agree with you about the use of sizeof() instead of a fixed value.
> 
> I removed exit() when the progam detects an UDP failure for it aborts
> unecessarily ax25ipd daemon.
> 
> UDP socket could not be set when remote station is not on line at the time
> ax25ipd tries to resolve a dynamic IP address.
> This is usually corrected by a later call to update_dns().
> 
> 73 de Bernard, f6bvp
> 
> 
> 
> Thomas Osterried wrote :
>> Hello Bernard,
>>
>> On 2009-10-23 15:06:52 +0200, Bernard Pidoux <bernard.pidoux@upmc.fr>
>> wrote in <4AE1AA6C.9040500@upmc.fr>:
...
>>
>> You're right. I admit I was not very happy about the code. I remember I
>> tried to minimize unnecessary DNS requests, but I did not like my 
>> solution
>> neither.
>>


 

--------------040008030209070203080804
Content-Type: text/plain;
 name="ax25ipd-0.0.8-rc2.new.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ax25ipd-0.0.8-rc2.new.patch"

diff -ruN ax25-apps-0.0.8-rc2/ax25ipd/ax25ipd.h ax25-apps-0.0.8-rc2-new/ax25ipd/ax25ipd.h
--- ax25-apps-0.0.8-rc2/ax25ipd/ax25ipd.h	2009-06-14 10:11:48.000000000 +0200
+++ ax25-apps-0.0.8-rc2-new/ax25ipd/ax25ipd.h	2009-11-03 15:31:33.178816102 +0100
@@ -25,6 +25,10 @@
  * Terry Dawson, VK2KTJ, September 2001.
  */
 
+/*
+* added provision for dynamic dns hosts
+  Steve Fraser vk5asf, June 2005
+*/
 /* Define the current version number
  *
  * The first digit represents the major release (0 is a prototype release)
@@ -133,12 +137,13 @@
 
 /* routing.c */
 void route_init(void);
-void route_add(unsigned char *, unsigned char *, int, unsigned int);
+void route_add(unsigned char *, unsigned char *, unsigned char *, int, unsigned int);
 void bcast_add(unsigned char *);
 unsigned char *call_to_ip(unsigned char *);
 int is_call_bcast(unsigned char *);
 void send_broadcast(unsigned char *, int);
 void dump_routes(void);
+void update_dns(void);
 
 /* config.c */
 void config_init(void);
diff -ruN ax25-apps-0.0.8-rc2/ax25ipd/config.c ax25-apps-0.0.8-rc2-new/ax25ipd/config.c
--- ax25-apps-0.0.8-rc2/ax25ipd/config.c	2009-06-14 10:07:11.000000000 +0200
+++ ax25-apps-0.0.8-rc2-new/ax25ipd/config.c	2009-11-06 23:28:00.062795762 +0100
@@ -154,7 +154,7 @@
 int parse_line(char *buf)
 {
 	char *p, *q;
-	unsigned char tcall[7], tip[4];
+	unsigned char tcall[7], tip[4], thost [256];
 	struct hostent *he;
 	int i, j, uport;
 	unsigned int flags;
@@ -212,8 +212,7 @@
 		q = strtok(NULL, " \t\n\r");
 		if (q == NULL)
 			return -1;
-		strncpy(ttydevice, q, sizeof(ttydevice)-1);
-		ttydevice[sizeof(ttydevice)-1] = 0;
+		strcpy(ttydevice, q);
 		return 0;
 
 	} else if (strcmp(p, "mode") == 0) {
@@ -280,8 +279,7 @@
 		if (strlen(q) > sizeof(bc_text))
 			return -7;
 		q[strlen(q) - 1] = '\0';
-		strncpy(bc_text, q, sizeof(bc_text)-1);
-		bc_text[sizeof(bc_text)-1] = 0;
+		strcpy(bc_text, q);
 		return 0;
 
 	} else if (strcmp(p, "loglevel") == 0) {
@@ -305,14 +303,20 @@
 		q = strtok(NULL, " \t\n\r");
 		if (q == NULL)
 			return -1;
-		he = gethostbyname(q);
-		if (he != NULL) {
+
+		j = inet_addr(q);
+                if (j != -1) {
+                   memcpy(tip, (char *) &j, 4);
+                   thost[0]=0;
+                } else {
+                   he = gethostbyname(q);
+		   if (he != NULL){
 			memcpy(tip, he->h_addr_list[0], 4);
-		} else {	/* maybe user specified a numeric addr? */
-			j = inet_addr(q);
-			if (j == -1)
-				return -5;	/* if -1, bad deal! */
-			memcpy(tip, (char *) &j, 4);
+                        strncpy(thost, q, strlen(q));
+                        thost[strlen(q)] = 0;
+		   } else {
+			fprintf(stderr,"ax25ipd: %s host IP address unknown - will probe it again later\n",q);
+		   }
 		}
 
 		while ((q = strtok(NULL, " \t\n\r")) != NULL) {
@@ -336,7 +340,7 @@
 				}
 			}
 		}
-		route_add(tip, tcall, uport, flags);
+		route_add(thost,tip, tcall, uport, flags);
 		return 0;
 
 	} else if (strcmp(p, "broadcast") == 0) {
diff -ruN ax25-apps-0.0.8-rc2/ax25ipd/io.c ax25-apps-0.0.8-rc2-new/ax25ipd/io.c
--- ax25-apps-0.0.8-rc2/ax25ipd/io.c	2009-06-14 17:42:11.000000000 +0200
+++ ax25-apps-0.0.8-rc2-new/ax25ipd/io.c	2009-11-03 15:31:33.178816102 +0100
@@ -15,7 +15,6 @@
 
 #include <sys/types.h>
 #include <sys/time.h>
-#include <time.h>
 #include <sys/socket.h>
 #include <netinet/in.h>
 #include <netinet/in_systm.h>
@@ -67,8 +66,7 @@
 struct sockaddr_in from;
 socklen_t fromlen;
 
-time_t last_bc_time;
-
+time_t last_bc_time, last_dns_time;
 int ttyfd_bpq = 0;
 
 /*
@@ -134,6 +132,8 @@
 
 	bzero((char *) &udpbind, sizeof(struct sockaddr));
 	udpbind.sin_family = AF_INET;
+
+        last_dns_time = time(NULL);
 }
 
 /*
@@ -378,9 +378,19 @@
 		if (nb == 0) {
 			fflush(stdout);
 			fflush(stderr);
+/*                      do we need to check hostname->ip mappings? */
+                        if (time(NULL) > last_dns_time + 300) {
+                           update_dns();
+                           last_dns_time = time(NULL); 
+                        }
 			/* just so we go back to the top of the loop! */
 			continue;
 		}
+/*              just in case we've been too busy......... */
+                if (time(NULL) > last_dns_time + 900) {
+                   update_dns();
+                   last_dns_time = time(NULL); 
+                }
 
 		if (FD_ISSET(ttyfd, &readfds)) {
 			do {
@@ -599,8 +609,9 @@
 			perror("reading from raw ip socket");
 			exit(2);
 		} else if (mode == UDP_MODE) {
-			perror("reading from udp socket");
+/*			perror("reading from udp socket");
 			exit(2);
+*/
 		} else if (mode == TTY_MODE) {
 			perror("reading from tty device");
 			exit(2);
@@ -645,8 +656,9 @@
 				usleep(100000);	/* sleep a bit */
 				return 1;	/* and retry */
 			}
-			perror("writing to udp socket");
+/*			perror("writing to udp socket");
 			exit(2);
+*/
 		} else if (mode == TTY_MODE) {
 			if (errno == EWOULDBLOCK) {
 				LOGL4("write to tty would block, sleeping and retrying!\n");
diff -ruN ax25-apps-0.0.8-rc2/ax25ipd/routing.c ax25-apps-0.0.8-rc2-new/ax25ipd/routing.c
--- ax25-apps-0.0.8-rc2/ax25ipd/routing.c	2009-06-14 10:07:11.000000000 +0200
+++ ax25-apps-0.0.8-rc2-new/ax25ipd/routing.c	2009-11-06 23:28:53.082799117 +0100
@@ -10,8 +10,11 @@
 #include "ax25ipd.h"
 #include <sys/types.h>
 #include <netinet/in.h>
+#include <sys/socket.h>
+#include <netdb.h> 
 #include <memory.h>
 #include <syslog.h>
+#include <string.h>
 
 /* The routing table structure is not visible outside this module. */
 
@@ -23,6 +26,7 @@
 	unsigned char pad1;
 	unsigned char pad2;
 	unsigned int flags;	/* route flags */
+	unsigned char hostnm[256]; /* host name or null */
 	struct route_table_entry *next;
 };
 
@@ -47,7 +51,7 @@
 }
 
 /* Add a new route entry */
-void route_add(unsigned char *ip, unsigned char *call, int udpport,
+void route_add(unsigned char *host, unsigned char *ip, unsigned char *call, int udpport, 
 	unsigned int flags)
 {
 	struct route_table_entry *rl, *rn;
@@ -75,6 +79,7 @@
 		rn->callsign[i] = call[i] & 0xfe;
 	rn->callsign[6] = (call[6] & 0x1e) | 0x60;
 	rn->padcall = 0;
+	strncpy(rn->hostnm, host, strlen(host));
 	memcpy(rn->ip_addr, ip, 4);
 	rn->udp_port = htons(udpport);
 	rn->pad1 = 0;
@@ -242,12 +247,30 @@
 
 	rp = route_tbl;
 	while (rp) {
-		LOGL1("  %s\t%s\t%s\t%d\t%d\n",
+		LOGL1("  %s %s %s %d %d %s\n",
 		      call_to_a(rp->callsign),
 		      (char *) inet_ntoa(*(struct in_addr *) rp->ip_addr),
 		      rp->udp_port ? "udp" : "ip",
-		      ntohs(rp->udp_port), rp->flags);
+		      ntohs(rp->udp_port), rp->flags,
+                      rp->hostnm);
 		rp = rp->next;
 	}
 	fflush(stdout);
 }
+/*update DNS entries of routes */
+void update_dns(void)
+{
+        struct hostent *he;
+	struct route_table_entry *rp;
+
+	rp = route_tbl;
+	while (rp) {
+           if (strlen(rp->hostnm) > 0) {
+              he = gethostbyname(rp->hostnm);
+                if (he != NULL) {
+                        memcpy(rp->ip_addr, he->h_addr_list[0], 4);
+                }
+           }
+	rp = rp->next;
+	}
+}

--------------040008030209070203080804--
