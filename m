From: Guido Trentalancia <iz6rdb@trentalancia.net>
Subject: [PATCH] ax25-tools: mheard
Date: Sun, 17 Jul 2016 16:53:13 +0200
Message-ID: <1468767193.20047.2.camel@trentalancia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

The following patch prevents fatal segmentation faults errors
on strcpy() in the mheard tool when the result of ctime() is
zero and it also avoids printing inconsistent log entries.

Signed-off-by: Guido Trentalancia <iz6rdb@trentalancia.net>
---
 ax25/mheard.c |   39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

--- ax25-tools-0.0.10-rc2-orig/ax25/mheard.c	2016-07-17 16:15:14.810986323 +0200
+++ ax25-tools-0.0.10-rc2/ax25/mheard.c	2016-07-17 16:14:15.332363054 +0200
@@ -57,27 +57,39 @@ static void PrintHeader(int data)
 
 static void PrintPortEntry(struct PortRecord *pr, int data)
 {
-	char lh[30], fh[30], *call, *s;
+	char lh[30], fh[30], *call, *s, *ctime_out;
 	char buffer[80];
-	int i;
+	int i, pkt_count;
 
 	switch (data) {
 		case 0:
-			strcpy(lh, ctime(&pr->entry.last_heard));
+			ctime_out = ctime(&pr->entry.last_heard);
+			if (!ctime_out)
+				break;
+			strcpy(lh, ctime_out);
 			lh[19] = 0;
 			call =  ax25_ntoa(&pr->entry.from_call);
+			if (!call)
+				break;
 			if ((s = strstr(call, "-0")) != NULL)
 				*s = '\0';
+			pkt_count = pr->entry.count;
+			if (!pkt_count)
+				break;
 			printf("%-10s %-5s %5d   %s\n",
-				call, pr->entry.portname, pr->entry.count, lh);
+				call, pr->entry.portname, pkt_count, lh);
 			break;
 		case 1:
 			buffer[0] = '\0';
 			call = ax25_ntoa(&pr->entry.from_call);
+			if (!call)
+				break;
 			if ((s = strstr(call, "-0")) != NULL)
 				*s = '\0';
 			strcat(buffer, call);
 			call = ax25_ntoa(&pr->entry.to_call);
+			if (!call)
+				break;
 			if ((s = strstr(call, "-0")) != NULL)
 				*s = '\0';
 			strcat(buffer, ">");
@@ -95,11 +107,19 @@ static void PrintPortEntry(struct PortRe
 				buffer, pr->entry.portname);
 			break;
 		case 2:
-			strcpy(lh, ctime(&pr->entry.last_heard));
+			ctime_out = ctime(&pr->entry.last_heard);
+			if (!ctime_out)
+				break;
+			strcpy(lh, ctime_out);
 			lh[19] = 0;
-			strcpy(fh, ctime(&pr->entry.first_heard));
+			ctime_out = ctime(&pr->entry.first_heard);
+			if (!ctime_out)
+				break;
+			strcpy(fh, ctime_out);
 			fh[19] = 0;
 			call = ax25_ntoa(&pr->entry.from_call);
+			if (!call)
+				break;
 			if ((s = strstr(call, "-0")) != NULL)
 				*s = '\0';
 			printf("%-10s %-5s %5d %5d %5d  %s  %s\n",
@@ -107,10 +127,15 @@ static void PrintPortEntry(struct PortRe
 			break;
 		case 3:
 			call = ax25_ntoa(&pr->entry.from_call);
+			if (!call)
+				break;
 			if ((s = strstr(call, "-0")) != NULL)
 				*s = '\0';
+			pkt_count = pr->entry.count;
+			if (!pkt_count)
+				break;
 			printf("%-10s %-5s %5d %5s ",
-				call, pr->entry.portname, pr->entry.count, types[pr->entry.type]);
+				call, pr->entry.portname, pkt_count, types[pr->entry.type]);
 			if (pr->entry.mode & MHEARD_MODE_ARP)
 				printf(" ARP");
 			if (pr->entry.mode & MHEARD_MODE_FLEXNET)
