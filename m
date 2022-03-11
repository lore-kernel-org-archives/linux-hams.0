From: Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH net 0/2] Fix refcount leak and NPD bugs in ax25
Date: Fri, 11 Mar 2022 15:03:05 +0800
Message-ID: <cover.1646981034.git.duoming@zju.edu.cn>
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, jreuter@yaina.de, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org, thomas@osterried.de, Duoming Zhou <duoming@zju.edu.cn>

The first patch fixes refcount leak in ax25 that could cause 
ax25-ex-connected-session-now-listening-state-bug.

The second patch fixes NPD bugs in ax25 timers.

Duoming Zhou (2):
  ax25: Fix refcount leaks caused by ax25_cb_del()
  ax25: Fix NULL pointer dereferences in ax25 timers

 include/net/ax25.h    |  5 +++++
 net/ax25/af_ax25.c    | 13 ++++++++++---
 net/ax25/ax25_dev.c   |  1 +
 net/ax25/ax25_timer.c | 10 +++++-----
 4 files changed, 21 insertions(+), 8 deletions(-)

-- 
2.17.1

