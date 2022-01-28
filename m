From: Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH 0/2] ax25: fix NPD and UAF bugs when detaching ax25 device
Date: Fri, 28 Jan 2022 12:47:14 +0800
Message-ID: <cover.1643343397.git.duoming@zju.edu.cn>
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>

There are NPD and UAF bugs when detaching ax25 device, we
use lock and refcount to mitigate these bugs.

Duoming Zhou (2):
  ax25: improve the incomplete fix to avoid UAF and NPD bugs
  ax25: add refcount in ax25_dev to avoid UAF bugs

 include/net/ax25.h    | 10 ++++++++++
 net/ax25/af_ax25.c    | 11 ++++++++---
 net/ax25/ax25_dev.c   | 12 ++++++++++--
 net/ax25/ax25_route.c |  3 +++
 4 files changed, 31 insertions(+), 5 deletions(-)

-- 
2.17.1

