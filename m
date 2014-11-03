From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] hamradio: 6pack: remove unnecessary check
Date: Mon,  3 Nov 2014 17:42:29 +0530
Message-ID: <1415016749-6825-1-git-send-email-sudipm.mukherjee@gmail.com>
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=83ySBwFr4xgWeGiv0THO3icSxvpSTuCrj7rgNg4ipJs=;
        b=BX/7XZdrBv6PdwCwuA36obR7zLXOUaLOW2++X6GyhRz2NyVbZPE4rwA+OzNLmdXGcU
         Knbe2IVG6y8Bkx07iRvbHZYwzdp5scymNmROA5HGW75fs4iOLL6JHW31Wx4sptvB0NzX
         Vu86KtCgcs5id70JExtC3s3O8+lF/1/mWk7iWjFm3O0/sy1642ghqvlmStgMBewvISE4
         FQrYum7cZgwyCJFpu1HqduP4m8SgrNm7Oc0tcyU89e+18HPQ6FnepzfPE0SnpP9QVWOc
         HtYXgQQoKO5lUCgriZzmeQVlDQDnG30pvf2yXFRlgltaNyWvGU/cYr8H2ZXUt4GWR17L
         0otg==
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Koensgen <ajk@comnets.uni-bremen.de>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

this is check for dev is unnecessary, as we are already checking dev
after allocating it via alloc_netdev, and jumping to label: out
if it is NULL.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---
 drivers/net/hamradio/6pack.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index c3c4051..daca0de 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -675,8 +675,7 @@ out_free:
 	kfree(xbuff);
 	kfree(rbuff);
 
-	if (dev)
-		free_netdev(dev);
+	free_netdev(dev);
 
 out:
 	return err;
-- 
1.8.1.2

