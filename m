From: Bernard f6bvp <f6bvp@free.fr>
Subject: Re: [PATCH] net: rose: fix unregistered netdevice: waiting for rose0
 to become free
Date: Fri, 22 Jul 2022 18:41:28 +0200
Message-ID: <9c033c36-c291-1927-079b-b4aee5f7ac08@free.fr>
References: <20220715154314.510ca2fb@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
        s=smtp-20201208; t=1658508098;
        bh=rlcF3KgIs0FMFe9DKk3wBQxyYNlE9M2DFSh/Q2odekM=;
        h=Date:To:Cc:References:Subject:From:In-Reply-To:From;
        b=ahw2VbGbUP6QfXSmCLtzpCFUpFes8gs8rTT//nHE/flfU+k1ldDPxjM58lvu63KDq
         +erobcPtQctDBFvw9/Ao6V8WmQax6xi36BXfQ2NQOsuw3glZIkJnJPadpV1r8Ku04p
         asSWQI5ATDnAkkhaCCo3cNvUEHcw5rDYNnjDHizh2gjRLJLy/QDop5lOyGkZlXToup
         RrRsne8WIdxmcJQFgS0ABz0VLFTQ+wjJrnNAZuICDBdRcUtj1UtfwQo09fHNuMn96h
         FdxsgJgOtwQi9bsdKK1xKDdRAsnf/qWjmJjCxKeQdGGCiRpbKChP4Lp3M0KR7mxaH0
         IaoHdQ4uH15vw==
Content-Language: en-US
In-Reply-To: <20220715154314.510ca2fb@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: kuba@kernel.org
Cc: davem@davemloft.net, duoming@zju.edu.cn, edumazet@google.com, f6bvp@free.fr, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org

Here is the context.

This patch adds dev_put(dev) in order to allow removal of rose module
after use of AX25 and ROSE via rose0 device.

Otherwise when trying to remove rose module via rmmod rose an infinite
loop message was displayed on all consoles with xx being a random number.

unregistered_netdevice: waiting for rose0 to become free. Usage count = xx

unregistered_netdevice: waiting for rose0 to become free. Usage count = xx

...

With the patch it is ok to rmmod rose.

This bug appeared with kernel 4.10 and has been only partially repaired 
by adding two dev_put(dev).

Signed-off-by: Bernard Pidoux <f6bvp@free.fr>

---
  net/rose/af_rose.c | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index bf2d986a6bc3..4163171ce3a6 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -711,6 +711,8 @@ static int rose_bind(struct socket *sock, struct 
sockaddr *uaddr, int addr_len)
      rose_insert_socket(sk);

      sock_reset_flag(sk, SOCK_ZAPPED);
+
+    dev_put(dev);

      return 0;
  }
-- 
2.34.1

[master da21d19e920d] [PATCH] net: rose: fix unregistered netdevice: 
waiting for rose0 to become free
  Date: Mon Jul 18 16:23:54 2022 +0200
  1 file changed, 2 insertions(+)


