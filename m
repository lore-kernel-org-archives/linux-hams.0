From: me@vk4msl.yi.org
Subject: [PATCH 1/2] kissattach: Add support for pty symlinking
Date: Sun, 28 Jun 2015 13:04:41 +1000
Message-ID: <1435460682-27595-2-git-send-email-me@vk4msl.yi.org>
References: <1435460682-27595-1-git-send-email-me@vk4msl.yi.org>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1435460682-27595-1-git-send-email-me@vk4msl.yi.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org, Stuart Longland <stuartl@longlandclan.yi.org>

From: Stuart Longland <stuartl@longlandclan.yi.org>

This patch adds abilities for symlinking of dynamically allocated slave
PTY interfaces to kissattach.  This enables other services to make use
of these PTYs without manually editing their configuration files to
point to the dynamically allocated PTY.

In addition, the patch includes the ability to change the ownership and
permissions on the allocated PTY, allowing an unpriviged process to make
use of it.
---
 kiss/kissattach.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 103 insertions(+), 7 deletions(-)

diff --git a/kiss/kissattach.c b/kiss/kissattach.c
index e30ed05..a872d0a 100644
--- a/kiss/kissattach.c
+++ b/kiss/kissattach.c
@@ -18,6 +18,9 @@
 #include <sys/socket.h>
 #include <sys/ioctl.h>
 
+#include <pwd.h>
+#include <grp.h>
+
 #include <net/if.h>
 #include <netax25/ax25.h>
 #include <netrose/rose.h>
@@ -32,6 +35,8 @@
 #define N_6PACK 7	/* This is valid for all architectures in 2.2.x */
 #endif
 
+#define PTMX_TTY	"/dev/ptmx"
+
 static char *callsign;
 static int  speed;
 static int  mtu;
@@ -42,6 +47,7 @@ static char *portname;
 static char *inetaddr;
 static int allow_broadcast;
 static int i_am_unix98_pty_master;		/* unix98 ptmx support */
+static int symlink_pty = 0;
 
 static char *kiss_basename(char *s)
 {
@@ -58,6 +64,8 @@ static void terminate(int sig)
 
 	if (!i_am_unix98_pty_master)
 		tty_unlock(kttyname);
+	else if (symlink_pty)
+		unlink(kttyname);
 
 	exit(0);
 }
@@ -214,7 +222,8 @@ static int startiface(char *dev, struct hostent *hp)
 
 static void usage(void)
 {
-	fprintf(stderr, "usage: %s [-b] [-l] [-m mtu] [-v] tty port [inetaddr]\n", progname);
+	fprintf(stderr, "usage: %s [-b] [-l] [-m mtu] [-v] [-o user:group] [-p mode] tty port [inetaddr]\n",
+			progname);
 }
 
 int main(int argc, char *argv[])
@@ -227,12 +236,18 @@ int main(int argc, char *argv[])
 				* the client has to use */
 	struct hostent *hp = NULL;
 
+	/* Name of the user and group who will "own" the pty */
+	char* pty_owner_user = NULL;
+	char* pty_owner_group = NULL;
+	/* Mode for pty: if 0; use defaults */
+	mode_t pty_mode = 0;
+
 	progname = kiss_basename(argv[0]);
 
 	if (!strcmp(progname, "spattach"))
 		disc = N_6PACK;
 
-	while ((fd = getopt(argc, argv, "b6i:lm:v")) != -1) {
+	while ((fd = getopt(argc, argv, "b6i:lm:o:p:v")) != -1) {
 		switch (fd) {
 		case '6':
 			disc = N_6PACK;
@@ -250,9 +265,24 @@ int main(int argc, char *argv[])
 		case 'm':
 			if ((mtu = atoi(optarg)) <= 0) {
 				fprintf(stderr, "%s: invalid mtu size - %s\n", progname, optarg);
-				return 1;
+		case 'o':
+			/* Change the owner of the pty */
+			{
+				char* colon = index(optarg,':');
+				if (colon) {
+					pty_owner_user = optarg;
+					pty_owner_group = colon + 1;
+					*colon = 0;
+				} else {
+					fprintf(stderr, "%s: Must specify user:group\n", progname);
+					return 1;
+				}
 			}
 			break;
+		case 'p':
+			/* Change the permissions (mode) of the pty */
+			pty_mode = (mode_t)strtoul(optarg, NULL, 8);
+			break;
 		case 'v':
 			printf("%s: %s\n", progname, VERSION);
 			return 0;
@@ -278,8 +308,17 @@ int main(int argc, char *argv[])
 	if (argc-1 >= optind && !inetaddr)
 		inetaddr = argv[optind];
 
-	if (!strcmp("/dev/ptmx", kttyname))
+	if (!strcmp(PTMX_TTY, kttyname)) {
+		i_am_unix98_pty_master = 1;
+	} else if (strstr(kttyname, "pty:") == kttyname) {
+		/*
+		 * If the path starts with pty:, then create a
+		 * new pty (Unix98 style) and make a symlink to it
+		 */
 		i_am_unix98_pty_master = 1;
+		kttyname = index(kttyname, ':') + 1;
+		symlink_pty = 1;
+	}
 
 	if (!i_am_unix98_pty_master) {
 		if (tty_is_locked(kttyname)) {
@@ -296,7 +335,7 @@ int main(int argc, char *argv[])
 		return 1;
 	}
 
-	if ((fd = open(kttyname, O_RDONLY | O_NONBLOCK)) == -1) {
+	if ((fd = open((symlink_pty ? PTMX_TTY : kttyname), O_RDONLY | O_NONBLOCK)) == -1) {
 		if (errno == ENOENT) {
 			fprintf(stderr, "%s: Cannot find serial device %s, no such file or directory.\n", progname, kttyname);
 		} else {
@@ -353,12 +392,69 @@ int main(int argc, char *argv[])
 
 	printf("AX.25 port %s bound to device %s\n", portname, dev);
 	if (i_am_unix98_pty_master) {
-		/* Users await the slave pty to be referenced in the 3d line */
-		printf("Awaiting client connects on\n%s\n", namepts);
+		/* Are we being asked to chown? */
+		if (pty_owner_user) {
+			/* Look up the user */
+			struct passwd user;
+			struct passwd* user_ptr = NULL;
+			struct group grp;
+			struct group* grp_ptr = NULL;
+			char buffer[512];
+			int err = getpwnam_r(pty_owner_user, &user,
+				buffer, sizeof(buffer)-1, &user_ptr);
+			if (err) {
+				fprintf(stderr,
+					"Failed to look up user: %s (%d)\n",
+					strerror(err), err);
+				return 1;
+			}
+
+			err = getgrnam_r(pty_owner_group, &grp,
+				buffer, sizeof(buffer)-1, &grp_ptr);
+			if (err) {
+				fprintf(stderr,
+					"Failed to look up group: %s (%d)\n",
+					strerror(err), err);
+				return 1;
+			}
+
+			if (user_ptr && grp_ptr &&
+					chown(namepts, user_ptr->pw_uid,
+						grp_ptr->gr_gid)) {
+				fprintf(stderr,
+					"Failed to change ownership: %s (%d)\n",
+					strerror(errno), errno);
+				return 1;
+			}
+		}
+
+		/* Are we being asked to chmod? */
+		if (pty_mode) {
+			if (chmod(namepts, pty_mode)) {
+				fprintf(stderr,
+					"Failed to change mode: %s (%d)\n",
+					strerror(errno), errno);
+			}
+		}
+
+		if (symlink_pty) {
+			/* Create the symlink */
+			if (symlink(namepts, kttyname)) {
+				fprintf(stderr,
+					"Failed to symlink PTY %s to %s: %s (%d)\n",
+					kttyname, namepts, strerror(errno), errno);
+				return 1;
+			}
+		} else {
+			/* Users await the slave pty to be referenced in the 3d line */
+			printf("Awaiting client connects on\n%s\n", namepts);
+		}
 	}
 	if (logging) {
 		openlog(progname, LOG_PID, LOG_DAEMON);
 		syslog(LOG_INFO, "AX.25 port %s bound to device %s%s%s\n", portname, dev, (i_am_unix98_pty_master ? " with slave pty " : ""), (i_am_unix98_pty_master ? namepts : ""));
+		if (symlink_pty)
+			syslog(LOG_INFO, "Slave pty %s is symlinked to %s.", namepts, kttyname);
 
 	}
 
-- 
2.3.6

