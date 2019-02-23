From: Jules Irenge <jbi.octave@gmail.com>
Subject: [PATCH] net: ax25: Add SPDX License to fix missing License warning
Date: Sat, 23 Feb 2019 11:11:00 +0000
Message-ID: <20190223111100.13983-1-jbi.octave@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6dtKJgSm47uLAMGcWp0iCU0yCDNLGMuI36OMyEl1aiU=;
        b=bzOGJp96A+AHxUcbO7dpZkYYcoaOcfD/NqEgiZRxBEgc861jMQ/CCavyiTToYfWlX1
         d7AaRROr5/Ptn8S+qecpbEwGSsIS1t6EdndlvsEFJhi5c4hIeUpsoIB/VfrKK58Um7Mq
         tHqqr5+5Z+FUam8bcbxkB4TvRiZl6R66n0WRrD1r9wl4TQlFTT2+5vmNCz2w5UBZ9Tof
         B0dmXeLUIkymkfatVIZlmDoE+QesutwmpOS2MGBzhBuD/sNZLYEGSiez9lnAoMmK3oj1
         GlC/EnBLhr+zoNtcZ7suMDZfjt1TF5bVthXsK4H+6bB7qWIXuRKSDH6NK50PRM9VPZwn
         KSMg==
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jreuter@yaina.de
Cc: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, ralf@linux-mips.org, netdev@vger.kernel.org, outreachy-kernel@googlegroups.com, gregkh@linuxfoundation.org, jbi.octave@gmail.com

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 net/ax25/af_ax25.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 5d01edf8d819..5048790a75f6 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
-- 
2.20.1

