From: Jean-Christian de Rivaz <jc@eclis.ch>
Subject: [PATCH 1/1] Close the file descriptor and exit when the kernel notice hangup.
Date: Fri,  2 Oct 2015 23:40:15 +0200
Message-ID: <1443822015-18199-1-git-send-email-jc@eclis.ch>
References: <560E8B1C.9030209@eclis.ch>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <560E8B1C.9030209@eclis.ch>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Osterried <thomas@osterried.de>
Cc: =?windows-1252?Q?Ralf_B=E4chle_DL5RB?= <ralf@linux-mips.org>, linux-hams@trinnet.net, linux-hams@vger.kernel.org

Some serial device used to communicate with the TCN can be removed,
for example when a USB TCN is unplugged. If this occure, the kernel
will send a hangup event. The file descriptor is then useles and can
only be closed. The application can then try to wait on a new serial
device or simply terminate. Since kissattach was not designed to wait
on a serial device, it safer to simply exit.

The kernel mkiss.c must be patched to ad the poll method.

This problem was identified when trying to
solve a kernel crash:
http://www.spinics.net/lists/linux-hams/msg03500.html

Signed-off-by: Jean-Christian de Rivaz <jc@eclis.ch>
---
 kiss/kissattach.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kiss/kissattach.c b/kiss/kissattach.c
index e30ed05..bfcad61 100644
--- a/kiss/kissattach.c
+++ b/kiss/kissattach.c
@@ -10,6 +10,7 @@
 #include <netdb.h>
 #include <syslog.h>
 #include <errno.h>
+#include <poll.h>
 
 #include <config.h>
 
@@ -383,9 +384,9 @@ int main(int argc, char *argv[])
 	close(1);
 	close(2);
 
-	while (1)
-		sleep(10000);
+	struct pollfd fds[1] = { [0] = { .fd = fd, .events = POLLHUP } };
+	poll(fds, 1, -1);
 
-	/* NOT REACHED */
+	close(fd);
 	return 0;
 }
-- 
1.7.10.4

