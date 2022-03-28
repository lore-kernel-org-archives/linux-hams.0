From: Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH net 0/2] Fix UAF bugs caused by ax25_release()
Date: Mon, 28 Mar 2022 21:00:13 +0800
Message-ID: <cover.1648472006.git.duoming@zju.edu.cn>
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org, jreuter@yaina.de, dan.carpenter@oracle.com, Duoming Zhou <duoming@zju.edu.cn>

The first patch fixes UAF bugs in ax25_send_control, and
the second patch fixes UAF bugs in ax25 timers.

Duoming Zhou (2):
  ax25: fix UAF bug in ax25_send_control()
  ax25: Fix UAF bugs in ax25 timers

 net/ax25/af_ax25.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
2.17.1

