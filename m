From: Dan Smith <dsmith@danplanet.com>
Subject: [PATCH] Make mkiss link its ptys in a predictable manner
Date: Fri, 24 Sep 2010 17:35:44 -0700
Message-ID: <4C9D43E0.2040908@danplanet.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010409070806050004000504"
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: ralf@linux-mips.org, ax25@x-berg.in-berlin.de
Cc: linux-hams@vger.kernel.org

This is a multi-part message in MIME format.
--------------010409070806050004000504
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This patch makes mkiss create symlinks for easier scripting.  If the -L
flag is specified, it uses the base device path as a template for the link:

  # mkiss -L -x 2 /dev/ttyS0
  Awaiting client connects on:
  /dev/ttyS0.0 /dev/ttyS0.1

This makes it easy to subsequently call, for example, kissattach on
/dev/ttyS0.0 to access the first TNC port without having to parse the
output of mkiss.  Without the -L flag, it behaves as it used it.  Upon
exit, the links are removed.

-- 
Dan Smith
dsmith#danplanet.com, s/#/@/
www.danplanet.com
KK7DS

--------------010409070806050004000504
Content-Type: text/x-patch;
 name="mkiss_link.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mkiss_link.patch"

Index: kiss/mkiss.c
===================================================================
RCS file: /home/ax25-cvs/ax25-tools/kiss/mkiss.c,v
retrieving revision 1.7
diff -u -r1.7 mkiss.c
--- kiss/mkiss.c	13 Apr 2010 08:36:00 -0000	1.7
+++ kiss/mkiss.c	25 Sep 2010 00:25:25 -0000
@@ -82,7 +82,7 @@
 static int invalid_ports	= 0;
 static int return_polls		= 0;
 
-static char *usage_string	= "usage: mkiss [-p interval] [-c] [-f] [-h] [-l] [-s speed] [-v] [-x <num_ptmx_devices>] ttyinterface pty ..\n";
+static char *usage_string	= "usage: mkiss [-p interval] [-c] [-f] [-h] [-l] [-s speed] [-v] [-x <num_ptmx_devices>] [-L] ttyinterface pty ..\n";
 
 static int dump_report		= FALSE;
 
@@ -112,6 +112,7 @@
 	unsigned long	txbytes;	/* TX bytes count		*/
 	char		namepts[PATH_MAX];  /* name of the unix98 pts slaves, which
 				       * the client has to use */
+	char		link[PATH_MAX];	/* The link (if any) to namepts	*/
 };
 
 static struct iface *tty	= NULL;
@@ -363,8 +364,10 @@
 	for (i = 0; i < numptys; i++) {
 		if (pty[i]->fd == -1)
 			continue;
-		if (pty[i]->namepts[0] != '\0')
+		if (pty[i]->namepts[0] != '\0') {
+			unlink(pty[i]->link);
 			continue;
+		}
 		tty_unlock(pty[i]->name);
 		close(pty[i]->fd);
 		free(pty[i]);
@@ -432,8 +435,9 @@
 	int ptmxdevices = 0;
 	char *npts;
 	int wrote_info = 0;
+	int link_pty = 0;
 
-	while ((size = getopt(argc, argv, "cfhlp:s:vx:")) != -1) {
+	while ((size = getopt(argc, argv, "cfhlp:s:vx:L")) != -1) {
 		switch (size) {
 		case 'c':
 			crcflag = G8BPQ_CRC;
@@ -462,6 +466,9 @@
 				return 1;
 			}
 			break;
+		case 'L':
+			link_pty = 1;
+			break;
 		case 'v':
 			printf("mkiss: %s\n", VERSION);
 			return 1;
@@ -585,8 +592,28 @@
 				printf("\nAwaiting client connects on:\n");
 			else
 				printf(" ");
-			printf("%s", pty[i]->namepts);
 			wrote_info = 1;
+
+			if (link_pty) {
+				int ret;
+
+				ret = snprintf(pty[i]->link, PATH_MAX,
+					       "%s.%i", tty->name, i);
+				if (ret == -1) {
+					perror("symlink");
+					return 1;
+				}
+
+				unlink(pty[i]->link);
+				ret = symlink(pty[i]->namepts, pty[i]->link);
+				if (ret) {
+					perror("symlink");
+					return 1;
+				}
+				printf("%s", pty[i]->link);
+			} else
+				printf("%s", pty[i]->namepts);
+
 		}
 	}
 
@@ -720,8 +747,10 @@
 	for (i = 0; i < numptys; i++) {
 		if (pty[i]->fd == -1)
 			continue;
-		if (pty[i]->namepts[0] != '\0')
+		if (pty[i]->namepts[0] != '\0') {
+			unlink(pty[i]->link);
 			continue;
+		}
 		tty_unlock(pty[i]->name);
 		close(pty[i]->fd);
 		free(pty[i]);

--------------010409070806050004000504--
