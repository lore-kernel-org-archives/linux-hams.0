From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 5/5] MIPS: SGI-IP27: fix spelling in Copyright
Date: Mon, 22 Feb 2021 17:19:05 +0100
Message-ID: <20210222161905.1153-6-lukas.bulwahn@gmail.com>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com>
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XZM02Qjnqqn9qJFAUKB25dGoRRDf53l7ATxy6Z9Woso=;
        b=R8k9FZItQ1mBUVjy9LxAWXhyIoj0naDvVWAktpGylajzQv9gy5KIPbWu+PplCLcgrN
         ZQw3bUelRCr2klfem4rjdCYyDRbl0p41Awk0gh4By7Ca3zRN0HiuSeFS4xArDiZ8u7+p
         SRNf997VXgkFFoTeowUY7P9jcoNS+rHickSaY/uB/J98qbZONi3MdrxxRFQTEdJSNRVj
         +EHTrCKksElXfIiDodnnsKyme+S+BPA1vJ3DOuu+4w9+qt/vaUHMq9OqeOlcE+TUHmBc
         v0wcuMrw2YxXHxN7GgF7SpSCLrGUpuJnDEDeq0J7MEMRQ7o0BZ7gg8OFTU/WbG2cVAAs
         gt4Q==
In-Reply-To: <20210222161905.1153-1-lukas.bulwahn@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Cc: "Maciej W . Rozycki" <macro@orcam.me.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

This is a Copyright line, and just a typo slipped through.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/mips/sgi-ip27/ip27-timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
index 79c434fece52..444b5e0e935f 100644
--- a/arch/mips/sgi-ip27/ip27-timer.c
+++ b/arch/mips/sgi-ip27/ip27-timer.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copytight (C) 1999, 2000, 05, 06 Ralf Baechle (ralf@linux-mips.org)
- * Copytight (C) 1999, 2000 Silicon Graphics, Inc.
+ * Copyright (C) 1999, 2000, 05, 06 Ralf Baechle (ralf@linux-mips.org)
+ * Copyright (C) 1999, 2000 Silicon Graphics, Inc.
  */
 #include <linux/bcd.h>
 #include <linux/clockchips.h>
-- 
2.17.1

