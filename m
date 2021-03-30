From: Wang Qing <wangqing@vivo.com>
Subject: [PATCH 6/6] net/decnet: Delete obsolete TODO file
Date: Tue, 30 Mar 2021 15:02:49 +0800
Message-ID: <1617087773-7183-7-git-send-email-wangqing@vivo.com>
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Adaptec OEM Raid Solutions <aacraid@microsemi.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Wang Qing <wangqing@vivo.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net
Cc: gregkh@linuxfoundation.org

The TODO file here has not been updated from 2005, and the function 
development described in the file have been implemented or abandoned.

Its existence will mislead developers seeking to view outdated information.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 net/decnet/TODO | 40 ----------------------------------------
 1 file changed, 40 deletions(-)
 delete mode 100644 net/decnet/TODO

diff --git a/net/decnet/TODO b/net/decnet/TODO
deleted file mode 100644
index 358e9eb..0000000
--- a/net/decnet/TODO
+++ /dev/null
@@ -1,40 +0,0 @@
-Steve's quick list of things that need finishing off:
-[they are in no particular order and range from the trivial to the long winded]
-
- o Proper timeouts on each neighbour (in routing mode) rather than
-   just the 60 second On-Ethernet cache value.
-
- o Support for X.25 linklayer
-
- o Support for DDCMP link layer
-
- o The DDCMP device itself
-
- o PPP support (rfc1762)
-
- o Lots of testing with real applications
-
- o Verify errors etc. against POSIX 1003.1g (draft)
-
- o Using send/recvmsg() to get at connect/disconnect data (POSIX 1003.1g)
-   [maybe this should be done at socket level... the control data in the
-    send/recvmsg() calls should simply be a vector of set/getsockopt()
-    calls]
-
- o check MSG_CTRUNC is set where it should be.
-
- o Find all the commonality between DECnet and IPv4 routing code and extract
-   it into a small library of routines. [probably a project for 2.7.xx]
-
- o Add perfect socket hashing - an idea suggested by Paul Koning. Currently
-   we have a half-way house scheme which seems to work reasonably well, but
-   the full scheme is still worth implementing, its not not top of my list
-   right now.
-
- o Add session control message flow control
-
- o Add NSP message flow control
-
- o DECnet sendpages() function
-
- o AIO for DECnet
-- 
2.7.4

