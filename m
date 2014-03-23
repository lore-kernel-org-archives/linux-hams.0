From: Stuart Longland <me@vk4msl.yi.org>
Subject: [PATCH] ax25ipd: Add support for multicast AX/UDPv4
Date: Sun, 23 Mar 2014 17:40:58 +1000
Message-ID: <1395560458-9576-2-git-send-email-me@vk4msl.yi.org>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
 <1395560458-9576-1-git-send-email-me@vk4msl.yi.org>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1395560458-9576-1-git-send-email-me@vk4msl.yi.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org, Stuart Longland <me@vk4msl.yi.org>

This allows the use of multicast IP addresses for exchanging UDPv4
traffic, such as on a local area network whose addresses are dynamically
assigned.

In /etc/ax25/ax25ipd.conf:
    socket udp
    mcttl your-ttl
    # e.g. 3
    route 0 your.multicast.ip.addr bd
    # e.g. I'm using 224.0.1.1

Then start ax25ipd as normal.
---
 ax25ipd/ax25ipd.h |  6 ++++++
 ax25ipd/config.c  | 18 ++++++++++++++++++
 ax25ipd/io.c      |  3 ++-
 ax25ipd/routing.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/ax25ipd/ax25ipd.h b/ax25ipd/ax25ipd.h
index b088247..6356cc8 100644
--- a/ax25ipd/ax25ipd.h
+++ b/ax25ipd/ax25ipd.h
@@ -72,8 +72,13 @@
 #include	<sys/types.h>
 #include	<netax25/daemon.h>
 
+#define IPV4_MULTICAST_ADDR	(0xe0000000ul)
+#define IPV4_MULTICAST_MASK	(0xf0000000ul)
+
 int udp_mode;                   /* true if we need a UDP socket */
 int ip_mode;                    /* true if we need the raw IP socket */
+int mc_ttl;                     /* multicast time-to-live */
+struct in_addr my_addr;         /* the IP address to bind to (default INADDR_ANY) */
 unsigned short my_udp;          /* the UDP port to use (network byte order) */
 char ttydevice[PATH_MAX];       /* the tty device for serial comms */
 int ttyspeed;                   /* The baud rate on the tty device */
@@ -141,6 +146,7 @@ unsigned char *call_to_ip(unsigned char *);
 int is_call_bcast(unsigned char *);
 void send_broadcast(unsigned char *, int);
 void dump_routes(void);
+void join_multicast(int);
 
 /* config.c */
 void config_init(void);
diff --git a/ax25ipd/config.c b/ax25ipd/config.c
index 8d9405b..bc47416 100644
--- a/ax25ipd/config.c
+++ b/ax25ipd/config.c
@@ -47,6 +47,7 @@ void config_init(void)
 	udp_mode = 0;
 	ip_mode = 0;
 	dual_port = 0;
+	my_addr.s_addr = INADDR_ANY;
 
 	stats.kiss_in = 0;
 	stats.kiss_toobig = 0;
@@ -254,6 +255,23 @@ int parse_line(char *buf)
 			return -9;
 		return 0;
 
+	} else if (strcmp(p, "bindip") == 0) {
+		q = strtok(NULL, " \t\n\r");
+		if (q != NULL) {
+			if (inet_aton(q, &my_addr) < 0)
+				return -10;
+		}
+		return 0;
+
+	} else if (strcmp(p, "mcttl") == 0) {
+		q = strtok(NULL, " \t\n\r");
+		if (q != NULL) {
+			mc_ttl = atoi(q);
+			if ((mc_ttl <= 0) || (mc_ttl >= 256))
+				return -11;
+		}
+		return 0;
+
 	} else if (strcmp(p, "beacon") == 0) {
 		q = strtok(NULL, " \t\n\r");
 		if (q == NULL)
diff --git a/ax25ipd/io.c b/ax25ipd/io.c
index f0b3993..4ac1cdb 100644
--- a/ax25ipd/io.c
+++ b/ax25ipd/io.c
@@ -184,12 +184,13 @@ void io_open(void)
  * Ok, the udp socket is open.  Now express our interest in receiving
  * data destined for a particular socket.
  */
-		udpbind.sin_addr.s_addr = INADDR_ANY;
+		memcpy(&udpbind.sin_addr, &my_addr, sizeof(udpbind.sin_addr));
 		udpbind.sin_port = my_udp;
 		if (bind(udpsock, (struct sockaddr *) &udpbind, sizeof udpbind) < 0) {
 			perror("binding udp socket");
 			exit(1);
 		}
+		join_multicast(udpsock);
 	}
 
 	if (!strcmp("/dev/ptmx", ttydevice))
diff --git a/ax25ipd/routing.c b/ax25ipd/routing.c
index 4c3faed..9a4c4f1 100644
--- a/ax25ipd/routing.c
+++ b/ax25ipd/routing.c
@@ -26,6 +26,7 @@ struct route_table_entry {
 	unsigned char pad1;
 	unsigned char pad2;
 	unsigned int flags;	/* route flags */
+	unsigned int multicast;	/* Is this a multicast address? */
 	struct route_table_entry *next;
 };
 
@@ -252,3 +253,49 @@ void dump_routes(void)
 	}
 	fflush(stdout);
 }
+
+/* Look for routes to multicast groups and join them */
+void join_multicast(int udpsock)
+{
+	struct route_table_entry *rp;
+	int num_groups = 0;
+
+	rp = route_tbl;
+	while (rp) {
+		if (rp->udp_port &&
+				((htonl(rp->ip_addr_in.s_addr)
+				  & IPV4_MULTICAST_MASK)
+				 == IPV4_MULTICAST_ADDR)) {
+			struct ip_mreqn group;
+			group.imr_ifindex = 0;
+			memcpy(&group.imr_multiaddr, &rp->ip_addr_in,
+					sizeof(group.imr_multiaddr));
+			memcpy(&group.imr_address, &my_addr,
+					sizeof(group.imr_address));
+			if (setsockopt(udpsock, IPPROTO_IP, IP_ADD_MEMBERSHIP,
+						(char*)&group, sizeof(group)) < 0) {
+				perror("adding multicast group");
+				close(udpsock);
+				exit(1);
+			}
+			num_groups++;
+		}
+		rp = rp->next;
+	}
+	if (num_groups) {
+		u_char arg = 0;
+		if (setsockopt(udpsock, IPPROTO_IP,
+					IP_MULTICAST_LOOP, &arg, sizeof(arg)) < 0) {
+			perror("disabling loopback");
+			close(udpsock);
+			exit(1);
+		}
+		arg = mc_ttl;
+		if (setsockopt(udpsock, IPPROTO_IP,
+					IP_MULTICAST_TTL, &arg, sizeof(arg)) < 0) {
+			perror("setting TTL");
+			close(udpsock);
+			exit(1);
+		}
+	}
+}
-- 
1.8.3.2

