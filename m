From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] net: 6pack: Fix tx timeout and slot time
Date: Wed,  8 Sep 2021 20:57:43 -0700
Message-ID: <20210909035743.1247042-1-linux@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6nfIMaaVLj1YzU7mkiPI+ONBiuveYWVyPFsoIJsROgY=;
        b=btMnqgkad9oUWL8mWAP6fG+U3m+iZ/3foSLMTZfyTk3Lxf2embDq4Ngbcs+9GH0ug5
         ckt+fhaat3Eky7CIB2UW+LxLzXN0lV+YOY60ZtKPLu121XgUM2Gjc8OjCprtcnMNaHPf
         Pf7G39qXQlIpL/1VVlPHROupfdlrSG0XVmskKdcmmrHKjBmDKwRvgLnQGPTD1kaG/rg0
         dnD0KNMldZWbnq5QM2xo7KycXDsZ38DfiiTY0izkrGMzDVc0QgCqasqsuCuuVkApy7LY
         ugm8dcynjpnc16BlUdDJ6wtb9n4HymTgl2u98X6qE0kc5kvAJIi9Gopuj3npHmucBpdf
         1KWg==
Sender: Guenter Roeck <groeck7@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Koensgen <ajk@comnets.uni-bremen.de>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

tx timeout and slot time are currently specified in units of HZ.
On Alpha, HZ is defined as 1024. When building alpha:allmodconfig,
this results in the following error message.

drivers/net/hamradio/6pack.c: In function 'sixpack_open':
drivers/net/hamradio/6pack.c:71:41: error:
	unsigned conversion from 'int' to 'unsigned char'
	changes value from '256' to '0'

In the 6PACK protocol, tx timeout is specified in units of 10 ms
and transmitted over the wire. Defining a value dependent on HZ
doesn't really make sense. Assume that the intent was to set tx
timeout and slot time based on a HZ value of 100 and use constants
instead of values depending on HZ for SIXP_TXDELAY and SIXP_SLOTTIME.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
No idea if this is correct or even makes sense. Compile tested only.

 drivers/net/hamradio/6pack.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 8fe8887d506a..6192244b304a 100644
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
2.33.0

