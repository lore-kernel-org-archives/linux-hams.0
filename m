From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: [PATCH] FBB & linux 2.6
Date: Fri, 13 Feb 2004 20:28:07 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040213202807.F220@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AWniW0JNca5xppdA"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org
Cc: jpr@f6fbb.org, xfbb@f6fbb.org


--AWniW0JNca5xppdA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

This is a patch to let xfbb run on 2.6 kernels.
The problem is that xfbb checks the memory status and asumes /proc/meminfo
to have the same layout as older kernels.
The new code should be a bit more flexible in parsing this file.

Jeroen

--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="fbb703.linux2.6.diff"

--- fbbsrc.703c/src/console.c	2000-09-14 22:16:38.000000000 +0200
+++ fbbsrc.703c.rxq/src/console.c	2004-02-13 19:49:34.000000000 +0100
@@ -893,7 +893,7 @@
 
 #define MEMINFO_FILE "/proc/meminfo"
 
-static char buf[300];
+static char buf[1000];
 
 #define MAX_ROW 3				/* these are a little liberal for flexibility */
 #define MAX_COL 7
@@ -929,6 +929,29 @@
 	for (i = 0; i < MAX_ROW; i++)	/* zero unassigned fields */
 		for (j = 0; j < MAX_COL; j++)
 			row[i][j] = 0;
+	if (!strncmp("MemTotal:", p, 8)) {
+		printf("Asuming 2.6 Kernel\n");
+		while (*p && !isdigit(*p)) p++;
+		l = sscanf(p, "%u%n", &row[meminfo_main][meminfo_total], &k);
+		p += k;
+		while (*p && !strncmp("MemFree:", p, 8)) p++;
+		while (*p && !isdigit(*p)) p++;
+		l = sscanf(p, "%u%n", &row[meminfo_main][meminfo_free], &k);
+		p += k;
+		while (*p && !strncmp("Buffers:", p, 8)) p++;
+		while (*p && !isdigit(*p)) p++;
+		l = sscanf(p, "%u%n", &row[meminfo_main][meminfo_buffers], &k);
+		p += k;
+		while (*p && !strncmp("Cached:", p, 7)) p++;
+		while (*p && !isdigit(*p)) p++;
+		l = sscanf(p, "%u%n", &row[meminfo_main][meminfo_cached], &k);
+		p += k;
+		while (*p && !strncmp("SwapFree:", p, 9)) p++;
+		while (*p && !isdigit(*p)) p++;
+		l = sscanf(p, "%u%n", &row[meminfo_swap][meminfo_free], &k);
+		p += k;
+		return row;
+	}
 	for (i = 0; i < MAX_ROW && *p; i++)
 	{							/* loop over rows */
 		while (*p && !isdigit (*p))

--AWniW0JNca5xppdA--

