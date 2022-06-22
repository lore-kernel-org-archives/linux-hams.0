From: Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH net v2 0/2] Fix UAF and null-ptr-deref bugs in rose protocol
Date: Wed, 22 Jun 2022 12:57:46 +0800
Message-ID: <cover.1655871645.git.duoming@zju.edu.cn>
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>

The first patch fixes the UAF bug of sock caused by
timer. The second patch fixes the null-ptr-deref bug
caused by rose_kill_by_neigh().

Duoming Zhou (2):
  net: rose: fix UAF bugs caused by timer handler
  net: rose: fix null-ptr-deref caused by rose_kill_by_neigh

 net/rose/af_rose.c    |  6 ++++++
 net/rose/rose_route.c |  2 ++
 net/rose/rose_timer.c | 22 +++++++++++++---------
 3 files changed, 21 insertions(+), 9 deletions(-)

-- 
2.17.1

