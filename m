From: David Howells <dhowells@redhat.com>
Subject: [PATCH 52/59] CRED: Wrap task credential accesses in the netrom
	protocol
Date: Wed, 27 Aug 2008 14:50:10 +0100
Message-ID: <20080827135010.19980.95710.stgit@warthog.procyon.org.uk>
References: <20080827134541.19980.61042.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20080827134541.19980.61042.stgit@warthog.procyon.org.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: linux-security-module@vger.kernel.org, David Howells <dhowells@redhat.com>, Serge Hallyn <serue@us.ibm.com>, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org

Wrap access to task credentials so that they can be separated more easily from
the task_struct during the introduction of COW creds.

Change most current->(|e|s|fs)[ug]id to current_(|e|s|fs)[ug]id().

Change some task->e?[ug]id to task_e?[ug]id().  In some places it makes more
sense to use RCU directly rather than a convenient wrapper; these will be
addressed by later patches.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: James Morris <jmorris@namei.org>
Acked-by: Serge Hallyn <serue@us.ibm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org
---

 net/netrom/af_netrom.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)


diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
index 532e4fa..a75e072 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -609,7 +609,7 @@ static int nr_bind(struct socket *sock, struct sockaddr *uaddr, int addr_len)
 	} else {
 		source = &addr->fsa_ax25.sax25_call;
 
-		user = ax25_findbyuid(current->euid);
+		user = ax25_findbyuid(current_euid());
 		if (user) {
 			nr->user_addr   = user->call;
 			ax25_uid_put(user);
@@ -683,7 +683,7 @@ static int nr_connect(struct socket *sock, struct sockaddr *uaddr,
 		}
 		source = (ax25_address *)dev->dev_addr;
 
-		user = ax25_findbyuid(current->euid);
+		user = ax25_findbyuid(current_euid());
 		if (user) {
 			nr->user_addr   = user->call;
 			ax25_uid_put(user);

