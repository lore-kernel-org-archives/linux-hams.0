From: ralf@linux-mips.org
Subject: [PATCH 0/3] AX.25, NETROM and ROSE fixes and cleanups
Date: Sun, 11 Mar 2007 22:53:19 +0000
Message-ID: <20070311225319.673076841@denk.linux-mips.net>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

Patches 1/3 and 2/3 are fixes for 2.6.21 and -stable.  3/3 is a cleanup
even though it seems to partly paper over a connection establishment issue
on extremly fast networks such as loopback I'm still chasing.

  Ralf

