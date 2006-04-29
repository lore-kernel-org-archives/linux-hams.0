From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [AX25, ROSE] Remove useless SET_MODULE_OWNER calls.
Date: Sat, 29 Apr 2006 15:29:43 +0100
Message-ID: <20060429142943.GA4402@linux-mips.org>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-hams@vger.kernel.org

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

--

 net/netrom/nr_dev.c |    1 -
 net/rose/rose_dev.c |    1 -
 2 files changed, 2 deletions(-)

Index: linux-net.git/net/netrom/nr_dev.c
===================================================================
--- linux-net.git.orig/net/netrom/nr_dev.c	2006-04-29 01:43:47.000000000 +0100
+++ linux-net.git/net/netrom/nr_dev.c	2006-04-29 11:38:00.000000000 +0100
@@ -185,7 +185,6 @@ static struct net_device_stats *nr_get_s
 
 void nr_setup(struct net_device *dev)
 {
-	SET_MODULE_OWNER(dev);
 	dev->mtu		= NR_MAX_PACKET_SIZE;
 	dev->hard_start_xmit	= nr_xmit;
 	dev->open		= nr_open;
Index: linux-net.git/net/rose/rose_dev.c
===================================================================
--- linux-net.git.orig/net/rose/rose_dev.c	2006-04-29 01:43:47.000000000 +0100
+++ linux-net.git/net/rose/rose_dev.c	2006-04-29 11:38:00.000000000 +0100
@@ -135,7 +135,6 @@ static struct net_device_stats *rose_get
 
 void rose_setup(struct net_device *dev)
 {
-	SET_MODULE_OWNER(dev);
 	dev->mtu		= ROSE_MAX_PACKET_SIZE - 2;
 	dev->hard_start_xmit	= rose_xmit;
 	dev->open		= rose_open;
