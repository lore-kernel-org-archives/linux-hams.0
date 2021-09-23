From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 18/19] net: 6pack: Fix tx timeout and slot time
Date: Wed, 22 Sep 2021 23:38:52 -0400
Message-ID: <20210923033853.1421193-18-sashal@kernel.org>
References: <20210923033853.1421193-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632368367;
        bh=v+I8QNo3TKWMn6cbjdZKqsdAo0EcMoZ7bol0AcjFG0I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R8U2ZwY+TN18Kqb9A09OOOcR/bmuiXCvWAk+J1rHH/AEBjcsRZ4RXtEL8jBSblaRQ
         r9rmwe1Zxk6u3CG8Zv4KFG4E5+bC4R9hs6yDiLQTH/PhpSJwscnlj2H7eM8eD0XUuB
         7XeRSQWFQS4G4oK00cTHNadlX0nvOFNjxR3eRxBUH/DG9Y/vpduBQKWPRsm6nuPBD4
         eimRI+W/6N01UY+izBLXBK6eZl8MCeofyoVPVpEHq5Pf4TKJr7B9ipYzGHj63FaB30
         muAtX0pd5P279Nt1Rgu8vst5oLgxgBbZRoKxAZzr8OioICeICSWjZXBR/KMr9vl2vy
         tmYJYsXiDgSNQ==
In-Reply-To: <20210923033853.1421193-1-sashal@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Linus Torvalds <torvalds@linux-foundation.org>, Sasha Levin <sashal@kernel.org>, ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org

From: Guenter Roeck <linux@roeck-us.net>

[ Upstream commit 3c0d2a46c0141913dc6fd126c57d0615677d946e ]

tx timeout and slot time are currently specified in units of HZ.  On
Alpha, HZ is defined as 1024.  When building alpha:allmodconfig, this
results in the following error message.

  drivers/net/hamradio/6pack.c: In function 'sixpack_open':
  drivers/net/hamradio/6pack.c:71:41: error:
  	unsigned conversion from 'int' to 'unsigned char'
  	changes value from '256' to '0'

In the 6PACK protocol, tx timeout is specified in units of 10 ms and
transmitted over the wire:

    https://www.linux-ax25.org/wiki/6PACK

Defining a value dependent on HZ doesn't really make sense, and
presumably comes from the (very historical) situation where HZ was
originally 100.

Note that the SIXP_SLOTTIME use explicitly is about 10ms granularity:

        mod_timer(&sp->tx_t, jiffies + ((when + 1) * HZ) / 100);

and the SIXP_TXDELAY walue is sent as a byte over the wire.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/hamradio/6pack.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index da13683d52d1..bd0beb16d68a 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -68,9 +68,9 @@
 #define SIXP_DAMA_OFF		0
 
 /* default level 2 parameters */
-#define SIXP_TXDELAY			(HZ/4)	/* in 1 s */
+#define SIXP_TXDELAY			25	/* 250 ms */
 #define SIXP_PERSIST			50	/* in 256ths */
-#define SIXP_SLOTTIME			(HZ/10)	/* in 1 s */
+#define SIXP_SLOTTIME			10	/* 100 ms */
 #define SIXP_INIT_RESYNC_TIMEOUT	(3*HZ/2) /* in 1 s */
 #define SIXP_RESYNC_TIMEOUT		5*HZ	/* in 1 s */
 
-- 
2.30.2

