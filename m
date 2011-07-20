From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH 6/7] NET: ROSE: Move return statements hidden behind an if to
 their own line
Date: Wed, 20 Jul 2011 09:11:14 +0100
Message-ID: <c974f48d4d85d3dffee48187968a199c70e39a29.1311152437.git.ralf@linux-mips.org>
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

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
To: linux-hams@vger.kernel.org
Cc: Bernard F6BVP <f6bvp@free.fr>
---
 net/rose/af_rose.c   |    7 +++++--
 net/rose/rose_subr.c |    3 ++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index 47f1824..2e058bb 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -609,7 +609,8 @@ static int rose_release(struct socket *sock)
 	struct sock *sk = sock->sk;
 	struct rose_sock *rose;
 
-	if (sk == NULL) return 0;
+	if (sk == NULL)
+		return 0;
 
 	sock_hold(sk);
 	sock_orphan(sk);
@@ -1353,7 +1354,9 @@ static int rose_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 	}
 
 	case SIOCRSSL2CALL:
-		if (!capable(CAP_NET_ADMIN)) return -EPERM;
+		if (!capable(CAP_NET_ADMIN))
+			return -EPERM;
+
 		if (ax25cmp(&rose_callsign, &null_ax25_address) != 0)
 			ax25_listen_release(&rose_callsign, NULL);
 		if (copy_from_user(&tmp_call, argp, sizeof(ax25_address)))
diff --git a/net/rose/rose_subr.c b/net/rose/rose_subr.c
index f6c71ca..53fb653 100644
--- a/net/rose/rose_subr.c
+++ b/net/rose/rose_subr.c
@@ -89,7 +89,8 @@ int rose_validate_nr(struct sock *sk, unsigned short nr)
 	unsigned short vc = rose->va;
 
 	while (vc != rose->vs) {
-		if (nr == vc) return 1;
+		if (nr == vc)
+			return 1;
 		vc = (vc + 1) % ROSE_MODULUS;
 	}
 
-- 
1.7.4.4


