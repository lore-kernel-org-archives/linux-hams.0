From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH 1/7] NET: ROSE: Fix race in SIOCRSSL2CALL ioctl accessing
 userspace.
Date: Wed, 20 Jul 2011 01:21:42 +0100
Message-ID: <c65a602a1358d8facb866e3e1af176e18ac2aa07.1311152437.git.ralf@linux-mips.org>
References: <cover.1311152437.git.ralf@linux-mips.org>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <cover.1311152437.git.ralf@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: Bernard F6BVP <f6bvp@free.fr>

The SIOCRSSL2CALL ioctl may abort before the complete callsign has been
copied from userspace, for example when the part of it is in a PROT_NONE
mapping.

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
To: linux-hams@vger.kernel.org
Cc: Bernard F6BVP <f6bvp@free.fr>
---
 net/rose/af_rose.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index f9ea925..710df37 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -1289,6 +1289,8 @@ static int rose_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 	void __user *argp = (void __user *)arg;
 
 	switch (cmd) {
+		ax25_address tmp_call;
+
 	case TIOCOUTQ: {
 		long amount;
 
@@ -1352,8 +1354,9 @@ static int rose_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 		if (!capable(CAP_NET_ADMIN)) return -EPERM;
 		if (ax25cmp(&rose_callsign, &null_ax25_address) != 0)
 			ax25_listen_release(&rose_callsign, NULL);
-		if (copy_from_user(&rose_callsign, argp, sizeof(ax25_address)))
+		if (copy_from_user(&tmp_call, argp, sizeof(ax25_address)))
 			return -EFAULT;
+		memcpy(&rose_callsign, &tmp_call, sizeof(ax25_address));
 		if (ax25cmp(&rose_callsign, &null_ax25_address) != 0)
 			return ax25_listen_register(&rose_callsign, NULL);
 
-- 
1.7.4.4


