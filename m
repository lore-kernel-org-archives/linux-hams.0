From: Felix Janda <felix.janda@posteo.de>
Subject: [PATCH] daemon.c: Include <fcntl.h> for open()
Date: Sun, 3 Jan 2016 11:25:55 +0100
Message-ID: <20160103102555.GA5031@nyan>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Fixes compilation with the musl c library

Signed-off-by: Felix Janda <felix.janda@posteo.de>
---
 daemon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/daemon.c b/daemon.c
index 01511b6..0028c0f 100644
--- a/daemon.c
+++ b/daemon.c
@@ -1,3 +1,4 @@
+#include <fcntl.h>
 #include <unistd.h>
 #include <stdio.h>
 #include <stdlib.h>
-- 
2.4.10
