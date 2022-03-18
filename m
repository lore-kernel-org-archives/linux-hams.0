From: Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH V5 0/2] Fix refcount leak and NPD bugs in ax25
Date: Fri, 18 Mar 2022 08:54:03 +0800
Message-ID: <cover.1647563511.git.duoming@zju.edu.cn>
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org, jreuter@yaina.de, eric.dumazet@gmail.com, dan.carpenter@oracle.com, Duoming Zhou <duoming@zju.edu.cn>

The first patch fixes refcount leak in ax25 that could cause 
ax25-ex-connected-session-now-listening-state-bug.

The second patch fixes NPD bugs in ax25 timers.

Duoming Zhou (2):
  ax25: Fix refcount leaks caused by ax25_cb_del()
  ax25: Fix NULL pointer dereferences in ax25 timers

 net/ax25/af_ax25.c   | 18 +++++++++++++-----
 net/ax25/ax25_subr.c | 20 ++++++++++++++------
 2 files changed, 27 insertions(+), 11 deletions(-)

-- 
2.17.1

