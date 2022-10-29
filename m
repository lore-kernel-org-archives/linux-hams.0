From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 2/2] MAINTAINERS: drop Liam Mark and Laura Abbott
Date: Sat, 29 Oct 2022 20:17:34 +0700
Message-ID: <20221029131734.616829-3-bagasdotme@gmail.com>
References: <20221029131734.616829-1-bagasdotme@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wa2vaDs0sctiUqzfxVGectMJZGVrT1qw4Z5WdhU1TTI=;
        b=dmhCUyhr1AXbtT9VNPWTRZLWpYj4iVvRw8BldQdFZ0lDzRh5RPCL8KBkdkSIMHKR5o
         jBFV5wABHqgAkb7BoxFaj6SoBubbncTcPrjnI+LCnYpWEvm+XAJZUv9vbAooq73AWVzj
         bDmNK4TDjvla3CU0CqWjVm8OsvbAhNw5Xv9yJv5h5p3QgP9WAqxrn4LUXqRDltCuVsFu
         eZugXntF+UU1SJwV58rr9MbNwNKkk1pO2U6DHO4Gs1rdQv2zOuleUY6O8en6wG4Z5r0z
         TOZ23IwqtKe8tNSvPFGSkQ78gLS9AsUHVwFTlHu+E7Nymi8yhalt5/v9tdxzgLspyCLL
         M+oQ==
In-Reply-To: <20221029131734.616829-1-bagasdotme@gmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277; i=bagasdotme@gmail.com; h=from:subject; bh=3YA4rB9qga7V3JgGk+EtiHhHSnGeaiPpwThJXG+h3vU=; b=owGbwMvMwCH2bWenZ2ig32LG02pJDMmx6u8kdpda/WjyszjOZibtFPCGR7w+eHvmX8sr614ruOif FMnoKGVhEONgkBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwERETzD8M31wTsfH4c2tq4ybT8r92P Zi8tUlJteiur+J9m6XTLaOD2Vk+Pw95cs1V7vAIPO7AQw3HtTuLlWyCbPfvkPc/+WngkeXuAE=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, linux-media@vger.kernel.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Laura Abbott <laura@labbott.name>

Emails sent to their respective addresses listed bounces (550 error).
Their last post on LKML was two years ago ([1] and [2]). Remove them.

Link: https://lore.kernel.org/lkml/alpine.DEB.2.10.2002201508320.1846@lmark-linux.qualcomm.com/ ([1])
Link: https://lore.kernel.org/lkml/b85fa669-d3aa-f6c9-9631-988ae47e392c@redhat.com/ ([2])
Cc: Laura Abbott <laura@labbott.name>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Actually Laura's last post was a year ago from her personal address,
 where she announced 2021 LF TAB results [3], so Cc that address.

 [3]: https://lore.kernel.org/lkml/6e307861-3149-a984-cc79-088559caeab2@labbott.name/
 
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 63a84d3218a7b4..564c3c66077e0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6221,8 +6221,6 @@ F:	tools/testing/selftests/dma/
 DMA-BUF HEAPS FRAMEWORK
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 R:	Benjamin Gaignard <benjamin.gaignard@collabora.com>
-R:	Liam Mark <lmark@codeaurora.org>
-R:	Laura Abbott <labbott@redhat.com>
 R:	Brian Starkey <Brian.Starkey@arm.com>
 R:	John Stultz <jstultz@google.com>
 L:	linux-media@vger.kernel.org
-- 
An old man doll... just what I always wanted! - Clara

