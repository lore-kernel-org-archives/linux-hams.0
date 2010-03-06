From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: [PATCH] ax25ipd
Date: Sat, 06 Mar 2010 19:13:24 +0100
Message-ID: <4B929B44.8090003@upmc.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000703090703090503010800"
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Cathryn Mataga <cathryn@junglevision.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

This is a multi-part message in MIME format.
--------------000703090703090503010800
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Cathryn,
 
Thanks for your excellent work on ax25ipd.

I have been using ax25-apps.0.0.8-rc2 with your ax25ipd  patch for a 
couple of months.
I did not notice any issue, although I use devfs legacy pseudo tty and 
not Unix98 devices.
However I know there are an increasing number of AX25 ROSE FPAC nodes 
using  Unix98
/dev/ptmx /dev/pts devices.

I noticed that your patch included a few minor errors that I corrected.
Also you added -pthread into ax25ipd Makefile while this file does
not exist when unpacking ax25-tools-0.0.8-rc2.
Thus I moved  this argument into apps configure file.

I included also a reference  to Steve Fraser vk5asf work, adding
provision for dynamic dns hosts in June 2005, and changed sub
version number to 1.0.6

Patched ax25-apps package may be found here:
http://f6bvp.free.fr/logiciels/ax25/From%20other%20sources/ax25-apps-0.0.8-rc2.ax25ipd.dyndns.tar.bz2


Bernard Pidoux





--------------000703090703090503010800
Content-Type: text/plain;
 name="ax25-apps-0.0.8-rc2.ax25ipd.dyndns.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ax25-apps-0.0.8-rc2.ax25ipd.dyndns.patch"

diff -ruN ax25-apps-0.0.8-rc2/ax25ipd/ax25ipd.h ax25-apps-0.0.8-rc2.ax25ipd.dyndns/ax25ipd/ax25ipd.h
--- ax25-apps-0.0.8-rc2/ax25ipd/ax25ipd.h	2009-06-14 10:11:48.000000000 +0200
+++ ax25-apps-0.0.8-rc2.ax25ipd.dyndns/ax25ipd/ax25ipd.h	2010-03-06 13:58:23.000000000 +0100
@@ -25,6 +25,18 @@
  * Terry Dawson, VK2KTJ, September 2001.
  */
 
+/*
+  Version 1.0.5
+  added provision for dynamic dns hosts
+  Steve Fraser vk5asf, June 2005
+*/
+
+/*
+  Version 1.0.6
+
+
+*/
+
 /* Define the current version number
  *
  * The first digit represents the major release (0 is a prototype release)
@@ -37,7 +49,7 @@
  *
  */
 
-#define VERS2 "Version 1.0.2"
+#define VERS2 "Version 1.0.6"
 
 #define IPPROTO_AX25 93
 #define DEFAULT_UDP_PORT 10093
@@ -118,6 +130,11 @@
 
 #define	AXRT_BCAST	1
 #define	AXRT_DEFAULT	2
+#define	AXRT_PERMANENT	4
+#define	AXRT_LEARN	8	
+
+
+#define IPSTORAGESIZE 6 /* Bytes needed for call_to_ip */
 
 /* start external prototypes */
 /* end external prototypes */
@@ -133,12 +150,16 @@
 
 /* routing.c */
 void route_init(void);
-void route_add(unsigned char *, unsigned char *, int, unsigned int);
+void route_add(char *, unsigned char *, unsigned char *, int, unsigned int);
+int route_ipmatch(struct sockaddr_in *, unsigned char *);
+unsigned char *retrieveip(unsigned char *, unsigned char *);
+void route_process(struct sockaddr_in *, unsigned char *);
 void bcast_add(unsigned char *);
-unsigned char *call_to_ip(unsigned char *);
+unsigned char *call_to_ip(unsigned char *, unsigned char *);
 int is_call_bcast(unsigned char *);
 void send_broadcast(unsigned char *, int);
 void dump_routes(void);
+void update_dns(unsigned);
 
 /* config.c */
 void config_init(void);
@@ -151,11 +172,13 @@
 /* process.c */
 void process_init(void);
 void from_kiss(unsigned char *, int);
-void from_ip(unsigned char *, int);
+void from_ip(unsigned char *, int, struct sockaddr_in *);
 /* void do_broadcast(void);  where did this go ?? xxx */
 void do_beacon(void);
 int addrmatch(unsigned char *, unsigned char *);
+int addrcompare(unsigned char *, unsigned char *);
 unsigned char *next_addr(unsigned char *);
+unsigned char *from_addr(unsigned char *);
 void add_crc(unsigned char *, int);
 void dump_ax25frame(char *, unsigned char *, int);
 
diff -ruN ax25-apps-0.0.8-rc2/ax25ipd/config.c ax25-apps-0.0.8-rc2.ax25ipd.dyndns/ax25ipd/config.c
--- ax25-apps-0.0.8-rc2/ax25ipd/config.c	2009-06-14 10:07:11.000000000 +0200
+++ ax25-apps-0.0.8-rc2.ax25ipd.dyndns/ax25ipd/config.c	2010-03-06 11:24:05.000000000 +0100
@@ -292,6 +292,8 @@
 		return 0;
 
 	} else if (strcmp(p, "route") == 0) {
+		char *thost;
+	
 		uport = 0;
 		flags = 0;
 
@@ -305,15 +307,26 @@
 		q = strtok(NULL, " \t\n\r");
 		if (q == NULL)
 			return -1;
-		he = gethostbyname(q);
-		if (he != NULL) {
-			memcpy(tip, he->h_addr_list[0], 4);
-		} else {	/* maybe user specified a numeric addr? */
-			j = inet_addr(q);
-			if (j == -1)
-				return -5;	/* if -1, bad deal! */
+		thost = strdup(q);
+		j = inet_addr(q);
+		if (j != -1){ /* maybe user specified a numeric addr? */
+			flags |= AXRT_PERMANENT; /* Prevent useless dns check on dotted ip */
 			memcpy(tip, (char *) &j, 4);
+			if (!j){/* IP of 0.0.0.0. Learn from incoming packets */
+				flags |= AXRT_LEARN;
+			}
+		}
+		else {
+			he = gethostbyname(q); 
+			if (he != NULL) {
+				memcpy(tip, he->h_addr_list[0], 4);
+			} else {	
+				j = inet_addr("0.0.0.0");/* try to rescue this idea of checking later.*/
+				memcpy(tip,  (char *) &j, 4);
+				fprintf(stderr,"ax25ipd: %s host IP address unknown - will probe it again later\n",thost);
+			}
 		}
+	
 
 		while ((q = strtok(NULL, " \t\n\r")) != NULL) {
 			if (strcmp(q, "udp") == 0) {
@@ -334,9 +347,19 @@
 				if (strchr(q, 'd')) {
 					flags |= AXRT_DEFAULT;
 				}
+
+				/* Test for "permanent" flag */
+				if (strchr(q, 'p')) {
+					flags |= AXRT_PERMANENT;
+				}
+				/* Test for "learn" flag */
+				if (strchr(q, 'l')) {
+					flags |= AXRT_LEARN;
+				}
 			}
 		}
-		route_add(tip, tcall, uport, flags);
+		route_add(thost, tip, tcall, uport, flags);
+		free(thost);
 		return 0;
 
 	} else if (strcmp(p, "broadcast") == 0) {
diff -ruN ax25-apps-0.0.8-rc2/ax25ipd/HISTORY.ax25ipd ax25-apps-0.0.8-rc2.ax25ipd.dyndns/ax25ipd/HISTORY.ax25ipd
--- ax25-apps-0.0.8-rc2/ax25ipd/HISTORY.ax25ipd	2005-10-30 11:31:40.000000000 +0100
+++ ax25-apps-0.0.8-rc2.ax25ipd.dyndns/ax25ipd/HISTORY.ax25ipd	2010-03-06 14:08:24.000000000 +0100
@@ -53,4 +53,54 @@
  *		ax25 goes directly to the bpqether interface in the kernel via
  *		ethertap/tuntap interfaces, which is a much better way than
  *              traditional kissattach to a ttyp/ptyp pair.
- */
+ *
+        1.0.5
+ *
+ *              added provision for dynamic dns hosts
+ *              Steve Fraser vk5asf, June 2005
+ *
+ *
+        1.0.6
+
+List:       linux-hams
+Subject:    [PATCH] ax25ipd
+From:       Cathryn Mataga <cathryn () junglevision ! com>
+Date:       2009-12-15 23:14:01
+
+I've been sitting on this code for about a week, and it's
+been running fine here.  I've made a few small changes, mostly
+to the comments.
+
+1. This patch adds the ability to route packets over axip
+links that are not from the gateway callsign.
+
+2.  Integrates the Dynamic DNS patch and uses mutex and
+a thread as suggested.
+
+3.   If DNS fails during startup for a route, the IP of a route is set
+to 0. Then later, after about an hour or so, DNS for the
+route is checked again.
+
+4.  ax25ipd.conf has two new flags for routes.  l and p.
+
+route KE6I-1 0.0.0.0 l
+
+The route to KE6I-1 will be updated based on the IP
+addresses of incoming packets.
+
+route KE6I-2 ke6i.ampr.org p
+
+the 'p' flag forces the code to not recheck DNS later for
+this route.   If DNS fails at startup, however, DNS will
+be checked until it succeeds, and then DNS will not be checked
+again.
+
+
+ax25ipd should route as before, except in the case when packets
+not from the callsign of the route but from the same IP
+would have gone to the default route, they now will go to the
+ip from which they originate. (Ugh, that's an awkward sentence.)
+
+Anyway, let me know what you think, good or bad.
+
+*/
diff -ruN ax25-apps-0.0.8-rc2/ax25ipd/io.c ax25-apps-0.0.8-rc2.ax25ipd.dyndns/ax25ipd/io.c
--- ax25-apps-0.0.8-rc2/ax25ipd/io.c	2009-06-14 17:42:11.000000000 +0200
+++ ax25-apps-0.0.8-rc2.ax25ipd.dyndns/ax25ipd/io.c	2010-03-06 11:24:54.000000000 +0100
@@ -378,10 +378,11 @@
 		if (nb == 0) {
 			fflush(stdout);
 			fflush(stderr);
+			update_dns(60*60); // Once/hour
 			/* just so we go back to the top of the loop! */
 			continue;
 		}
-
+		update_dns(60*60); // once/hour
 		if (FD_ISSET(ttyfd, &readfds)) {
 			do {
 				n = read(ttyfd, buf, MAX_FRAME);
@@ -418,7 +419,7 @@
 				LOGL4("udpdata from=%s port=%d l=%d\n", (char *) inet_ntoa(from.  sin_addr), ntohs(from.  sin_port), n);
 				stats.udp_in++;
 				if (n > 0)
-					from_ip(buf, n);
+					from_ip(buf, n, &from);
 			}
 		}
 		/* if udp_mode */
@@ -434,7 +435,7 @@
 				LOGL4("ipdata from=%s l=%d, hl=%d\n", (char *) inet_ntoa(from.  sin_addr), n, hdr_len);
 				stats.ip_in++;
 				if (n > hdr_len)
-					from_ip(buf + hdr_len, n - hdr_len);
+					from_ip(buf + hdr_len, n - hdr_len, &from);
 			}
 #ifdef USE_ICMP
 			if (FD_ISSET(icmpsock, &readfds)) {
@@ -461,6 +462,9 @@
 
 	if (l <= 0)
 		return;
+	if (* (unsigned *) targetip == 0){ /* If the ip is set to 0 don't send anything. I'm not sure what sending to 0 does, but I don't like the idea. */
+		return; 
+	}
 	memcpy((char *) &to.sin_addr,
 	       targetip, 4);
 	memcpy((char *) &to.sin_port,
diff -ruN ax25-apps-0.0.8-rc2/ax25ipd/process.c ax25-apps-0.0.8-rc2.ax25ipd.dyndns/ax25ipd/process.c
--- ax25-apps-0.0.8-rc2/ax25ipd/process.c	2009-06-14 10:07:11.000000000 +0200
+++ ax25-apps-0.0.8-rc2.ax25ipd.dyndns/ax25ipd/process.c	2010-03-06 11:24:58.000000000 +0100
@@ -68,6 +68,7 @@
 void from_kiss(unsigned char *buf, int l)
 {
 	unsigned char *a, *ipaddr;
+        unsigned char ipstorage[IPSTORAGESIZE];// Provide storage for the IP.  To keep all the locking stuff centralized. 
 
 	if (l < 15) {
 		LOGL2("from_kiss: dumped - length wrong!\n");
@@ -105,7 +106,7 @@
 	}			/* end of tnc mode */
 
 	/* Lookup the IP address for this route */
-	ipaddr = call_to_ip(a);
+	ipaddr = call_to_ip(a, ipstorage);
 
 	if (ipaddr == NULL) {
 		if (is_call_bcast(a)) {
@@ -146,10 +147,11 @@
  * We simply send the packet to the KISS send routine.
  */
 
-void from_ip(unsigned char *buf, int l)
+void from_ip(unsigned char *buf, int l, struct sockaddr_in *ip_addr)
 {
 	int port = 0;
 	unsigned char *a;
+	unsigned char *f;
 
 	if (!ok_crc(buf, l)) {
 		stats.ip_failed_crc++;
@@ -194,6 +196,10 @@
 		}
 #endif
 	}			/* end of tnc mode */
+
+	f = from_addr(buf);
+	route_process(ip_addr, f);
+
 	if (!ttyfd_bpq)
 		send_kiss(port, buf, l);
 	else {
@@ -277,6 +283,31 @@
 }
 
 /*
+ * return 0 if the addresses supplied match
+ * return a positive or negative value otherwise 
+ */
+int addrcompare(unsigned char *a, unsigned char *b)
+{
+	signed char diff;
+
+	if ((diff = (signed char )((*a++ - *b++) & 0xfe)))
+		return diff;	/* "K" */
+	if ((diff = (signed char )((*a++ - *b++) & 0xfe)))
+		return diff;	/* "A" */
+	if ((diff = (signed char )((*a++ - *b++) & 0xfe)))
+		return diff;	/* "9" */
+	if ((diff = (signed char )((*a++ - *b++) & 0xfe)))
+		return diff;	/* "W" */
+	if ((diff = (signed char )((*a++ - *b++) & 0xfe)))
+		return diff;	/* "S" */
+	if ((diff = (signed char )((*a++ - *b++) & 0xfe)))
+		return diff;	/* "B" */
+	if ((diff = (signed char )((*a++ - *b++) & 0xfe)))
+		return diff;	/* ssid */
+	return 0;
+}
+
+/*
  * return pointer to the next station to get this packet
  */
 unsigned char *next_addr(unsigned char *f)
@@ -301,6 +332,32 @@
 }
 
 /*
+ * return pointer to the last station this packet came from 
+ */
+unsigned char *from_addr(unsigned char *f)
+{
+	unsigned char *a;
+
+	a = f + 7;
+/* If no digis, return the source address */
+	if (NO_DIGIS(f))
+		return a;
+
+/* check each digi field. Go to last that has seen it */
+	do
+		a += 7;
+	while (NOT_LAST(a) && REPEATED(a));
+
+/* in DIGI mode: we have set REPEATED already, so the one before is it */	
+	if (digi || !REPEATED(a))
+		a -= 7;
+
+/* in TNC mode: always the last is it */
+	return a;
+}
+
+
+/*
  * tack on the CRC for the frame.  Note we assume the buffer is long
  * enough to have the two bytes tacked on.
  */
diff -ruN ax25-apps-0.0.8-rc2/ax25ipd/routing.c ax25-apps-0.0.8-rc2.ax25ipd.dyndns/ax25ipd/routing.c
--- ax25-apps-0.0.8-rc2/ax25ipd/routing.c	2009-06-14 10:07:11.000000000 +0200
+++ ax25-apps-0.0.8-rc2.ax25ipd.dyndns/ax25ipd/routing.c	2010-03-06 17:13:34.000000000 +0100
@@ -12,6 +12,8 @@
 #include <netinet/in.h>
 #include <memory.h>
 #include <syslog.h>
+#include <string.h>
+#include <pthread.h>
 
 /* The routing table structure is not visible outside this module. */
 
@@ -23,6 +25,7 @@
 	unsigned char pad1;
 	unsigned char pad2;
 	unsigned int flags;	/* route flags */
+	char *hostnm; /* host name */
 	struct route_table_entry *next;
 };
 
@@ -38,16 +41,31 @@
 
 struct bcast_table_entry *bcast_tbl;
 
+struct callsign_lookup_entry {
+	unsigned char callsign[7];
+	struct route_table_entry *route;
+	struct callsign_lookup_entry *prev, *next;
+};
+
+struct callsign_lookup_entry *callsign_lookup;
+
+time_t last_dns_time;
+volatile int threadrunning;
+pthread_mutex_t dnsmutex = PTHREAD_MUTEX_INITIALIZER;
+
 /* Initialize the routing module */
 void route_init(void)
 {
 	route_tbl = NULL;
 	default_route = NULL;
 	bcast_tbl = NULL;
+	callsign_lookup = NULL;
+	last_dns_time = time(NULL);
+	threadrunning = 0;
 }
 
 /* Add a new route entry */
-void route_add(unsigned char *ip, unsigned char *call, int udpport,
+void route_add(char *host, unsigned char *ip, unsigned char *call, int udpport,
 	unsigned int flags)
 {
 	struct route_table_entry *rl, *rn;
@@ -75,6 +93,7 @@
 		rn->callsign[i] = call[i] & 0xfe;
 	rn->callsign[6] = (call[6] & 0x1e) | 0x60;
 	rn->padcall = 0;
+	rn->hostnm = strdup(host);
 	memcpy(rn->ip_addr, ip, 4);
 	rn->udp_port = htons(udpport);
 	rn->pad1 = 0;
@@ -100,6 +119,130 @@
 	return;
 }
 
+/* For route rn, a different IP is being used.  Trigger a DNS check. 
+ * as long as DNS hasn't been checked within 5 minutes (300 seconds)
+ * */
+void route_updatedyndns(struct sockaddr_in *ip_addr, struct route_table_entry *rn)
+{
+	if (rn->flags & AXRT_LEARN){
+		pthread_mutex_lock(&dnsmutex);
+		* (unsigned *) rn->ip_addr = (unsigned) ip_addr->sin_addr.s_addr;
+		pthread_mutex_unlock(&dnsmutex);
+	}
+	if (!(rn->flags & AXRT_PERMANENT)){
+		LOGL4("received changed ip: %s", call_to_a(rn->callsign));
+		update_dns(300);
+	}
+}
+
+/* Save the calls in a binary tree.  This code links new callsigns 
+ * back to an existing route.  No new routes are created. */
+void route_updatereturnpath(unsigned char *mycall, struct route_table_entry *rn)
+{
+	struct callsign_lookup_entry **clookupp = &callsign_lookup;
+	struct callsign_lookup_entry *clookup = callsign_lookup;
+	for (;;){
+		int chk;
+		if (!clookup){
+			clookup = *clookupp = calloc(sizeof(struct callsign_lookup_entry), 1);
+			memcpy(clookup->callsign, mycall, 7);
+			LOGL4("added return route: %s %s %s %d\n",
+	      			call_to_a(mycall),
+				(char *) inet_ntoa(*(struct in_addr *) rn->ip_addr),
+	      			rn->udp_port ? "udp" : "ip", ntohs(rn->udp_port));
+
+			clookup->route = rn;
+			return;
+		}
+		chk = addrcompare(mycall, clookup->callsign);
+		if (chk > 0){
+			clookupp = &clookup->next;
+			clookup = *clookupp;
+		}
+		else if (chk < 0){
+			clookupp = &clookup->prev;
+			clookup = *clookupp;
+			}
+		else{
+			
+			if (clookup->route != rn){
+				clookup->route = rn;
+			}
+			return;
+		}	
+	}
+
+
+}
+
+
+/* Compare ip_addr to the format used by route_table_entry */
+int route_ipmatch(struct sockaddr_in *ip_addr, unsigned char *routeip)
+{
+	unsigned char ipstorage[IPSTORAGESIZE];
+	return (unsigned) ip_addr->sin_addr.s_addr == * (unsigned *) retrieveip(routeip, ipstorage);
+}
+
+
+/* Process calls and ip addresses for routing.  The idea behind
+ * this code that for the routes listed in the ax25ipd.conf file,
+ * only DNS or the given IP's should be used.  But for calls
+ * that are not referenced in ax25ipd.conf that arrive using
+ * a known gateway IP, the code links them back to that gateway.
+ *
+ * No new routes are created.  If a callsign comes in from an  
+ * unknown gateway, it will not create an entry.
+ *
+ * if the Callsign for a known route is received, and it does
+ * not match the current ip for that route, the update_dns code
+ * is triggered, which should fix the IP based on DNS.  
+ *
+ * */
+void route_process(struct sockaddr_in *ip_addr, unsigned char *call)
+{
+	struct route_table_entry *rp;
+	unsigned char mycall[7];
+	int i;
+	int isroute;
+
+	if (call == NULL)
+		return;
+
+	for (i = 0; i < 6; i++)
+		mycall[i] = call[i] & 0xfe;
+
+	mycall[6] = (call[6] & 0x1e) | 0x60;
+
+	rp = route_tbl;
+	isroute = 0;
+	while (rp) {
+		if (addrmatch(mycall, rp->callsign)) {
+			if (!route_ipmatch(ip_addr, rp->ip_addr)) {
+				route_updatedyndns(ip_addr, rp);
+				}
+			isroute = 1;
+		}
+		rp = rp->next;
+	}				
+
+	// Don't use any of the ip lookup code for the routes.
+	// Also, do not set return paths for broadcast callsigns. 
+	// Not sure if this ever happens.  But it's no good if it does.
+	if (!isroute && !is_call_bcast(call)){
+		rp = route_tbl;
+		while (rp) {
+			// Only do this once. 
+			if (route_ipmatch(ip_addr, rp->ip_addr)) {
+				route_updatereturnpath(mycall, rp);
+				break;
+			}
+			rp = rp->next;
+		}
+	}
+
+}
+
+
 /* Add a new broadcast address entry */
 void bcast_add(unsigned char *call)
 {
@@ -136,17 +279,35 @@
 }
 
 /*
+ * It's possible that the thread will update the IP in mid
+ * memcpy of an ip address, so I changed all the references to
+ * route_table_entry->ip_addr to use this routine
+ 
+ * Note that the printfs don't check this
+ */
+
+unsigned char *retrieveip(unsigned char *ip, unsigned char *ipstorage)
+{
+	if (!ipstorage)return ip;
+	pthread_mutex_lock(&dnsmutex);
+	memcpy((void *) ipstorage, (void *) ip, IPSTORAGESIZE);
+	pthread_mutex_unlock(&dnsmutex);
+	return ipstorage;
+}
+
+/*
  * Return an IP address and port number given a callsign.
  * We return a pointer to the address; the port number can be found
  * immediately following the IP address. (UGLY coding; to be fixed later!)
  */
-
-unsigned char *call_to_ip(unsigned char *call)
+ 
+unsigned char *call_to_ip(unsigned char *call, unsigned char *ipstorage)
 {
 	struct route_table_entry *rp;
 	unsigned char mycall[7];
 	int i;
-
+	struct callsign_lookup_entry *clookup;
+	
 	if (call == NULL)
 		return NULL;
 
@@ -163,11 +324,35 @@
 			LOGL4("found ip addr %s\n",
 			      (char *) inet_ntoa(*(struct in_addr *)
 						 rp->ip_addr));
-			return rp->ip_addr;
+			return retrieveip(rp->ip_addr, ipstorage);
 		}
 		rp = rp->next;
 	}
 
+	/* Check for callsigns that have been heard on known routes */
+	clookup = callsign_lookup;
+	for (;;){
+		int chk;
+		if (!clookup){
+			break;
+		}
+		chk = addrcompare(mycall, clookup->callsign);
+		if (chk > 0){
+			clookup = clookup->next;
+		}
+		else if (chk < 0){
+			clookup = clookup->prev;
+		}
+		else{
+			LOGL4("found cached ip addr %s\n",
+			      (char *) inet_ntoa(*(struct in_addr *)
+						 clookup->route->ip_addr));
+	
+			return retrieveip(clookup->route->ip_addr, ipstorage);
+		}	
+	}
+
+
 	/*
 	 * No match found in the routing table, use the default route if
 	 * we have one defined.
@@ -176,7 +361,7 @@
 		LOGL4("failed, using default ip addr %s\n",
 		      (char *) inet_ntoa(*(struct in_addr *)
 					 default_route->ip_addr));
-		return default_route->ip_addr;
+		return retrieveip(default_route->ip_addr, ipstorage);
 	}
 
 	LOGL4("failed.\n");
@@ -223,7 +408,9 @@
 	rp = route_tbl;
 	while (rp) {
 		if (rp->flags & AXRT_BCAST) {
-			send_ip(buf, l, rp->ip_addr);
+			unsigned char ipstorage[IPSTORAGESIZE];
+
+			send_ip(buf, l, retrieveip(rp->ip_addr, ipstorage));
 		}
 		rp = rp->next;
 	}
@@ -242,7 +429,7 @@
 
 	rp = route_tbl;
 	while (rp) {
-		LOGL1("  %s\t%s\t%s\t%d\t%d\n",
+		LOGL1("  %s %s %s %d %d\n",
 		      call_to_a(rp->callsign),
 		      (char *) inet_ntoa(*(struct in_addr *) rp->ip_addr),
 		      rp->udp_port ? "udp" : "ip",
@@ -251,3 +438,60 @@
 	}
 	fflush(stdout);
 }
+
+/* Update the IPs of DNS entries for all routes */
+void *update_dnsthread(void *arg)
+{
+	struct hostent *he;
+	struct route_table_entry *rp;
+
+	rp = route_tbl;
+	while (rp) {
+		// If IP is 0,  DNS lookup failed at startup.
+		// So check DNS even though it's permanent.
+		// I think checking the lock on this ip_addr reference
+		// isn't needed since the main code doesn't change
+		// ip_addr after startup, and worst case is that it
+		// does one extra dns check
+		if ((rp->hostnm[0])  && 
+			  (!(rp->flags & AXRT_PERMANENT) || ( * (unsigned *) rp->ip_addr == 0) )){
+			LOGL4("Checking DNS for %s\n", rp->hostnm);
+			he = gethostbyname(rp->hostnm);
+			if (he != NULL) {
+				pthread_mutex_lock(&dnsmutex);
+				* (unsigned *) rp->ip_addr = * (unsigned *) he->h_addr_list[0];  
+				pthread_mutex_unlock(&dnsmutex);
+				LOGL4("DNS returned IP=%s\n", (char *) inet_ntoa(*(struct in_addr *) rp->ip_addr)); 
+			}
+		}
+		rp = rp->next;
+	}
+	threadrunning = 0;
+	pthread_exit(0);
+	return 0;
+}
+
+/* check DNS for route IPs.  Packets from system whose ip 
+ * has changed  trigger a DNS lookup. The 
+ * the timer is needed when both systems are on dynamic
+ * IPs and they both reset at about the same time.  Also
+ * when the IP changes immediately, but DNS lags.  
+ */
+void update_dns(unsigned wait)
+{
+	pthread_t dnspthread;
+	int rc;
+
+	if (threadrunning)return;// Don't start a thread when one is going already.
+	if (wait && (time(NULL) < last_dns_time + wait))return;
+	threadrunning = 1;
+	LOGL4("Starting DNS thread\n");
+	last_dns_time = time(NULL);
+	rc = pthread_create(&dnspthread, NULL, update_dnsthread,  (void *) 0);
+	if (rc){
+		LOGL1("    Thread err%d\n", rc); // Should we exit here?
+		threadrunning = 0;
+	}	
+		
+}
+
diff -ruN ax25-apps-0.0.8-rc2/ax25ipd/run.bat ax25-apps-0.0.8-rc2.ax25ipd.dyndns/ax25ipd/run.bat
--- ax25-apps-0.0.8-rc2/ax25ipd/run.bat	1970-01-01 01:00:00.000000000 +0100
+++ ax25-apps-0.0.8-rc2.ax25ipd.dyndns/ax25ipd/run.bat	2010-03-06 11:24:58.000000000 +0100
@@ -0,0 +1,2 @@
+killall ax25ipd
+./ax25ipd -c /etc/ax25/ax25ipd.conf

--------------000703090703090503010800--
