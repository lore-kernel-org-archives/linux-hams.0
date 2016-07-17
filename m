From: Guido Trentalancia <iz6rdb@trentalancia.net>
Subject: [PATCH v2] ax25-tools: mheard
Date: Sun, 17 Jul 2016 22:14:40 +0200
Message-ID: <1468786480.20047.4.camel@trentalancia.net>
References: <1468767193.20047.2.camel@trentalancia.net>
	 <20160717182948.GK24846@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20160717182948.GK24846@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Osterried <thomas@osterried.de>
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org

The following patch prevents fatal segmentation faults errors
on strcpy() in the mheard tool when the result of ctime() is
zero and it also avoids printing inconsistent log entries.

This second version includes revisions from Thomas Osterried
and it is correctly based on code from the current git tree.

Signed-off-by: Guido Trentalancia <iz6rdb@trentalancia.net>
---
 ax25/mheard.c |   62 ++++++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 43 insertions(+), 19 deletions(-)

--- ax25-tools-git-17072016-2126/ax25/mheard.c	2016-07-17 21:25:22.547557162 +0200
+++ ax25-tools-git-17072016-2126-fix-mheard/ax25/mheard.c	2016-07-17 22:05:19.925283229 +0200
@@ -60,19 +60,25 @@ static void PrintHeader(int data)
 
 static void PrintPortEntry(struct PortRecord *pr, int data)
 {
-	char lh[30], fh[30], *call, *s;
+	char lh[33], fh[33], *call, *s, *ctime_out;
 	char buffer[80];
-	int i;
+	int i, pkt_count;
 
 	switch (data) {
 	case 0:
-		strcpy(lh, ctime(&pr->entry.last_heard));
-		lh[19] = 0;
+		ctime_out = ctime(&pr->entry.last_heard);
+		if (!ctime_out)
+			break;
+		strcpy(lh, ctime_out);
+		lh[32] = 0;
 		call =  ax25_ntoa(&pr->entry.from_call);
 		if ((s = strstr(call, "-0")) != NULL)
 			*s = '\0';
-		printf("%-9s  %-5s  %5d   %s\n",
-			call, pr->entry.portname, pr->entry.count, lh);
+		pkt_count = pr->entry.count;
+		if (!pkt_count)
+			break;
+		printf("%-9s  %-5s  %5u   %s\n",
+			call, pr->entry.portname, pkt_count, lh);
 		break;
 	case 1:
 		buffer[0] = '\0';
@@ -98,22 +104,31 @@ static void PrintPortEntry(struct PortRe
 			buffer, pr->entry.portname);
 		break;
 	case 2:
-		strcpy(lh, ctime(&pr->entry.last_heard));
-		lh[19] = 0;
-		strcpy(fh, ctime(&pr->entry.first_heard));
-		fh[19] = 0;
+		ctime_out = ctime(&pr->entry.last_heard);
+		if (!ctime_out)
+			break;
+		strcpy(lh, ctime_out);
+		lh[32] = 0;
+		ctime_out = ctime(&pr->entry.first_heard);
+		if (!ctime_out)
+			break;
+		strcpy(fh, ctime_out);
+		fh[32] = 0;
 		call = ax25_ntoa(&pr->entry.from_call);
 		if ((s = strstr(call, "-0")) != NULL)
 			*s = '\0';
-		printf("%-9s  %-5s  %5d %5d %5d  %s  %s\n",
+		printf("%-9s  %-5s  %5u %5u %5u  %s  %s\n",
 			call, pr->entry.portname, pr->entry.iframes, pr->entry.sframes, pr->entry.uframes, fh, lh);
 		break;
 	case 3:
 		call = ax25_ntoa(&pr->entry.from_call);
 		if ((s = strstr(call, "-0")) != NULL)
 			*s = '\0';
-		printf("%-9s  %-5s  %5d %5s ",
-			call, pr->entry.portname, pr->entry.count, types[pr->entry.type]);
+		pkt_count = pr->entry.count;
+		if (!pkt_count)
+			break;	
+		printf("%-9s  %-5s  %5u %5s ",
+			call, pr->entry.portname, pkt_count, types[pr->entry.type]);
 		if (pr->entry.mode & MHEARD_MODE_ARP)
 			printf(" ARP");
 		if (pr->entry.mode & MHEARD_MODE_FLEXNET)
@@ -141,16 +156,25 @@ static void PrintPortEntry(struct PortRe
 		printf("\n");
 		break;
 	case 4:
-		strcpy(lh, ctime(&pr->entry.last_heard));
-		lh[19] = 0;
-		strcpy(fh, ctime(&pr->entry.first_heard));
-		fh[19] = 0;
+		ctime_out = ctime(&pr->entry.last_heard);
+		if (!ctime_out)
+			break;
+		strcpy(lh, ctime_out);
+		lh[32] = 0;
+		ctime_out = ctime(&pr->entry.first_heard);
+		if (!ctime_out)
+			break;
+		strcpy(fh, ctime_out);
+		fh[32] = 0;
 		call = ax25_ntoa(&pr->entry.from_call);
 		if ((s = strstr(call, "-0")) != NULL)
 			*s = '\0';
-		printf("%-9s  %-5s  %5d %5d %5d  %s  %s",
+		pkt_count = pr->entry.count;
+		if (!pkt_count)
+			break;
+		printf("%-9s  %-5s  %5u %5u %5u  %s  %s",
 			call, pr->entry.portname, pr->entry.iframes, pr->entry.sframes, pr->entry.uframes, fh, lh);
-		printf("%5d    %5s ", pr->entry.count, types[pr->entry.type]);
+		printf("%5d    %5s ", pkt_count, types[pr->entry.type]);
 		if (pr->entry.mode & MHEARD_MODE_ARP)
 			printf(" ARP      ");
 		if (pr->entry.mode & MHEARD_MODE_FLEXNET)
