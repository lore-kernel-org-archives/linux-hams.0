From: me@vk4msl.yi.org
Subject: [PATCH 2/2] kissnetd: Add support for symlinking PTYs
Date: Sun, 28 Jun 2015 13:04:42 +1000
Message-ID: <1435460682-27595-3-git-send-email-me@vk4msl.yi.org>
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
 kiss/kissnetd.c | 177 +++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 169 insertions(+), 8 deletions(-)

diff --git a/kiss/kissnetd.c b/kiss/kissnetd.c
index 8c8fce9..db3bb27 100644
--- a/kiss/kissnetd.c
+++ b/kiss/kissnetd.c
@@ -14,6 +14,7 @@
 #include <stdlib.h>
 #include <sys/time.h>
 #include <sys/types.h>
+#include <sys/stat.h>
 #include <string.h>
 #include <unistd.h>
 #include <assert.h>
@@ -23,11 +24,17 @@
 #include <syslog.h>
 #include <time.h>
 #include <limits.h>
+#include <signal.h>
+
+#include <pwd.h>
+#include <grp.h>
 
 static char *Version = "1.5";
 static int VerboseMode;
 static int MaxFrameSize = 512;
 
+#define PTMX_TTY	"/dev/ptmx"
+
 #define REOPEN_TIMEOUT	30	/* try tio reopen every 10 s */
 
 struct PortDescriptor {
@@ -39,15 +46,29 @@ struct PortDescriptor {
 	char		namepts[PATH_MAX];	/* name of the unix98 pts slaves, which
 						 * the client has to use */
 	int		is_active;
+	int		is_unix98;
+	int		is_symlinked;
+
+	int		do_chown;
+	uid_t		pty_uid;
+	gid_t		pty_gid;
+
+	mode_t		pty_mode;
 };
 
 static struct PortDescriptor *PortList[FD_SETSIZE];
 
 static int NbPort;
 
+static int SetPtyOwner = 0;
+static uid_t PtyOwnerUid = 0;
+static gid_t PtyOwnerGid = 0;
+
+static mode_t PtyMode = 0;
+
 static void Usage(void)
 {
-	fprintf(stderr, "\nUsage : kissnetd [-v] [-f size] [-p num | /dev/pty?? [/dev/pty??]* ]\n");
+	fprintf(stderr, "\nUsage : kissnetd [-v] [-f size] [-p num | /dev/pty?? [/dev/pty??]* | [owner=USER:GROUP] [mode=MODE] pty:/dev/symlink1 [pty:/dev/symlink2]* ]\n");
 	fprintf(stderr, " -v       : Verbose mode, trace on stdout\n");
 	fprintf(stderr, " -f size  : Set max frame size to size bytes (default 512)\n");
 	fprintf(stderr, " -p num   : Number of /dev/ptmx-master-devices has to open\n");
@@ -90,13 +111,24 @@ static void NewPort(char *Name)
 		exit(1);
 	}
 
-	strncpy(MyPort->Name, Name, PATH_MAX-1);
+	MyPort->is_symlinked = (strstr(Name, "pty:") == Name);
+	MyPort->is_unix98 = MyPort->is_symlinked
+				|| (!strcmp(PTMX_TTY, Name));
+
+	strncpy(MyPort->Name, (MyPort->is_symlinked
+				? index(Name, ':') + 1
+				: Name), PATH_MAX-1);
+
 	MyPort->Name[PATH_MAX-1] = '\0';
 	MyPort->Fd = -1;
 	MyPort->FrameBuffer[0] = 0xC0;
 	MyPort->BufferIndex = 1;
 	MyPort->namepts [0] = '\0';
 	MyPort->is_active = 0;
+	MyPort->do_chown = SetPtyOwner;
+	MyPort->pty_uid = PtyOwnerUid;
+	MyPort->pty_gid = PtyOwnerGid;
+	MyPort->pty_mode= PtyMode;
 	PortList[NbPort++] = MyPort;
 }
 
@@ -112,7 +144,10 @@ static void ReopenPort(int PortNumber)
 	if (PortList[PortNumber]->namepts[0] == '\0') {
 
 		syslog(LOG_WARNING, "kissnetd : Opening port %s\n", PortList[PortNumber]->Name);
-		PortList[PortNumber]->Fd = open(PortList[PortNumber]->Name, O_RDWR | O_NONBLOCK);
+		PortList[PortNumber]->Fd = open(
+				(PortList[PortNumber]->is_symlinked
+				 ? PTMX_TTY
+				 : PortList[PortNumber]->Name), O_RDWR | O_NONBLOCK);
 		if (PortList[PortNumber]->Fd < 0) {
 			syslog(LOG_WARNING, "kissnetd : Error opening port %s : %s\n",
 				PortList[PortNumber]->Name, strerror(errno));
@@ -123,7 +158,7 @@ static void ReopenPort(int PortNumber)
 			return;
 		}
 		PortList[PortNumber]->is_active = 1;
-		if (!strcmp(PortList[PortNumber]->Name, "/dev/ptmx")) {
+		if (PortList[PortNumber]->is_unix98) {
 			char *npts;
 			/* get name of pts-device */
 			if ((npts = ptsname(PortList[PortNumber]->Fd)) == NULL) {
@@ -140,7 +175,35 @@ static void ReopenPort(int PortNumber)
 				syslog(LOG_WARNING, "kissnetd : Cannot unlock pts-device %s\n", PortList[PortNumber]->namepts);
 				exit(1);
 			}
-			syslog(LOG_WARNING, "kissnetd : Using /dev/ptmx with slave pty %s\n", PortList[PortNumber]->namepts);
+
+			if (PortList[PortNumber]->do_chown) {
+				if (chown(PortList[PortNumber]->namepts,
+						PortList[PortNumber]->pty_uid,
+						PortList[PortNumber]->pty_gid)) {
+					syslog(LOG_CRIT, "Cannot chown %s\n",
+							PortList[PortNumber]->namepts);
+					exit(1);
+				}
+			}
+			if (PortList[PortNumber]->pty_mode) {
+				if (chmod(PortList[PortNumber]->namepts,
+						PortList[PortNumber]->pty_mode)) {
+					syslog(LOG_CRIT, "Cannot chmod %s\n",
+							PortList[PortNumber]->namepts);
+					exit(1);
+				}
+			}
+
+			if (PortList[PortNumber]->is_symlinked) {
+				/* Create symbolic link */
+				if (symlink(PortList[PortNumber]->namepts, PortList[PortNumber]->Name)) {
+					syslog(LOG_CRIT, "Cannot symlink %s to %s\n", PortList[PortNumber]->namepts,
+							PortList[PortNumber]->Name);
+					exit(1);
+				}
+			} else {
+				syslog(LOG_WARNING, "kissnetd : Using /dev/ptmx with slave pty %s\n", PortList[PortNumber]->namepts);
+			}
 		}
 	} else {
 		if (PortList[PortNumber]->Fd == -1) {
@@ -324,6 +387,63 @@ static void ProcessPortList(void)
 	}
 }
 
+/*
+ * Parse the owner string; given as a user:group pair.  Result is stored
+ * in PtyOwnerUid and PtyOwnerGid; and overrides previously set defaults.
+ */
+static int ParseOwner(char* owner)
+{
+	char* colon;
+	char* pty_owner_group;
+
+	if (!strcmp(owner, "default")) {
+		SetPtyOwner = 0;
+		return 0;
+	}
+
+	colon = index(owner, ':');
+	if (!colon) {
+		fprintf(stderr, "Owner must be given in the form user:group\n");
+		return 1;
+	}
+	*colon = 0;
+	pty_owner_group = colon + 1;
+
+	if (owner) {
+		/* Look up the user */
+		struct passwd user;
+		struct passwd* user_ptr = NULL;
+		struct group grp;
+		struct group* grp_ptr = NULL;
+		char buffer[512];
+		int err = getpwnam_r(owner, &user,
+				buffer, sizeof(buffer)-1, &user_ptr);
+		if (err) {
+			fprintf(stderr,
+				"Failed to look up user: %s (%d)\n",
+				strerror(err), err);
+			return 1;
+		}
+
+		err = getgrnam_r(pty_owner_group, &grp,
+				buffer, sizeof(buffer)-1, &grp_ptr);
+		if (err) {
+			fprintf(stderr,
+				"Failed to look up group: %s (%d)\n",
+				strerror(err), err);
+			return 1;
+		}
+
+		if (user_ptr && grp_ptr) {
+			PtyOwnerUid = user_ptr->pw_uid;
+			PtyOwnerGid = grp_ptr->gr_gid;
+			SetPtyOwner = 1;
+			return 0;
+		}
+	}
+	return 1;
+}
+
 static void ProcessArgv(int argc, char *argv[])
 {
 	int opt;
@@ -345,7 +465,16 @@ static void ProcessArgv(int argc, char *argv[])
 				exit(1);
 			}
 			for (i=0; i < ptmxdevices; i++)
-				NewPort("/dev/ptmx");
+				NewPort(PTMX_TTY);
+			break;
+		case 'o':
+			/* Change the owner of the ptys */
+			if (ParseOwner(optarg))
+				exit(1);
+			break;
+		case 'm':
+			/* Change the mode of the pty */
+			PtyMode = (mode_t)strtoul(optarg, NULL, 8);
 			break;
 		default:
 			fprintf(stderr, "Invalid option %s\n", argv[optind]);
@@ -354,8 +483,18 @@ static void ProcessArgv(int argc, char *argv[])
 		}
 	}
 
-	while (optind < argc)
-		NewPort(argv[optind++]);
+	while (optind < argc) {
+		char* arg = argv[optind++];
+		if (strstr(arg, "owner=") == arg) {
+			if (ParseOwner(index(arg,'=')+1))
+				exit(1);
+		} else if (strstr(arg, "mode=") == arg) {
+			PtyMode = (mode_t)strtoul(index(arg,'=')+1,
+				NULL, 8);
+		} else {
+			NewPort(arg);
+		}
+	}
 
 	if (NbPort < 2) {
 		fprintf(stderr, "This multiplexer needs at least two pty's\n");
@@ -363,6 +502,23 @@ static void ProcessArgv(int argc, char *argv[])
 	}
 }
 
+void cleanup(void)
+{
+	/* Clean up symbolic links */
+	int i;
+	for (i=0; i<NbPort; i++) {
+		if (PortList[i]->is_symlinked) {
+			if (unlink(PortList[i]->Name))
+				syslog(LOG_WARNING, "Failed to unlink %s",
+					PortList[i]->Name);
+		}
+	}
+}
+void cleanup_sig(int signal)
+{
+	cleanup();
+	exit(0);
+}
 
 int main(int argc, char *argv[])
 {
@@ -374,6 +530,11 @@ int main(int argc, char *argv[])
 		Banner(1);
 	}
 
+	atexit(cleanup);
+	signal(SIGTERM, cleanup_sig);
+	signal(SIGINT, cleanup_sig);
+	signal(SIGQUIT, cleanup_sig);
+
 	ProcessArgv(argc, argv);
 	while (1) ProcessPortList();
 	return 0;
-- 
2.3.6

