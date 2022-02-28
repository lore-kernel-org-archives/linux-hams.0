From: John Paul Morrison <jmorrison@bogomips.com>
Subject: [PATCH] libax25 hamradio: higher baud rate support
Date: Mon, 28 Feb 2022 10:46:38 -0800
Message-ID: <CAO-kYtEhzohMYgk=K_jt0hQ+bdrmReUVBkAzMYTKJeAK9vcenQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bogomips.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=QEvhm6SqwOZbJ1C68hIJNq3B6gugT4X8lGqjwEO/UC8=;
        b=VtgRwj+XSbnnRPf6lygQwCYiY8kQ/JWCvYJX9N5KJwnthXdruiUYN41SSWpMYmkXxk
         vAa4bijLgWj4ZsGCEXE4u6HCA8wYodWDL8KBtgRGQxMB3PVEKUy7650YRGUAIDkdt8BZ
         sZRVYcRnZf6AoNWKzT3folpntI0UhNhDMl3k4=
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

The kissattach program rejects valid baud rates in /etc/ax25/axports
so I updated libax25

I tested on x86_64 and armv7l (Raspberry Pi)  up to 1.5 Mbps

VE7JPM


Signed-off-by: John Paul Morrison <jmorrison@bogomips.com>
---

diff --git a/ttyutils.c b/ttyutils.c
index a374103..981d630 100644
--- a/ttyutils.c
+++ b/ttyutils.c
@@ -32,6 +32,36 @@ static struct speed_struct {
 #endif
 #ifdef  B460800
  {460800, B460800},
+#endif
+#ifdef  B500000
+ {500000, B500000},
+#endif
+#ifdef  B921600
+ {921600, B921600},
+#endif
+#ifdef  B1000000
+ {1000000, B1000000},
+#endif
+#ifdef  B1152000
+ {1152000, B1152000},
+#endif
+#ifdef  B1500000
+ {1500000, B1500000},
+#endif
+#ifdef  B2000000
+ {2000000, B2000000},
+#endif
+#ifdef  B2500000
+ {2500000, B2500000},
+#endif
+#ifdef  B3000000
+ {3000000, B3000000},
+#endif
+#ifdef  B3500000
+ {1000000, B3500000},
+#endif
+#ifdef  B4000000
+ {4000000, B4000000},
 #endif
  {-1, B0}
 };
