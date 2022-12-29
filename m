From: Nate Bargmann <n0nb@n0nb.us>
Subject: [PATCH] ttyutils.c: Correct suspected typo in speed_struct
Date: Thu, 29 Dec 2022 12:14:20 -0600
Message-ID: <20221229181420.998996-1-n0nb@n0nb.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=n0nb.us;
        s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=4X94lelONQ5G3ZpLBIKDVbfc6ej/uijug8GrWP9aylI=; b=Sovwmk9NbPnGlzjSamkCpJ/mu4
        KNHZX2CkbiHfyQCt6nT+EpAnPLS5yh8fDFl+k6tlFXzz+OICxfC3+VH1OGfepVkXg7LuthDzuXQKh
        vA/z9NFxl64X2omOjLuQ82kOyFKxIMnbaGhDWTXhVkziq/bUvsDEMa1dX/5rWv+d4C5k=;
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Osterried <thomas@osterried.de>
Cc: linux-hams@vger.kernel.org, Nate Bargmann <n0nb@n0nb.us>

Looking over recent commits I noticed what looks to be a typo where
user_speed did not match termios_speed for the B3500000 declaration.

Signed-off-by: Nate Bargmann <n0nb@n0nb.us>
---
 ttyutils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ttyutils.c b/ttyutils.c
index 6ffd2fb..6bd6b56 100644
--- a/ttyutils.c
+++ b/ttyutils.c
@@ -61,7 +61,7 @@ static struct speed_struct {
 	{3000000,	B3000000},
 #endif
 #ifdef  B3500000
-	{1000000,	B3500000},
+	{3500000,	B3500000},
 #endif
 #ifdef  B4000000
 	{4000000,	B4000000},
-- 
2.34.1

