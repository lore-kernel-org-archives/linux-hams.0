From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v6 58/80] drivers: net: hamradio: fix document location
Date: Tue, 13 Oct 2020 13:54:13 +0200
Message-ID: <483eed6c0db2a62b89dd0e3586493c56c4fbed1b.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=sA+LLjFnYe1xhNIVyej80xZ8cWbaGG48uMqipjGVTpU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LSzM1wvJqUAXFS6m9P2E6qFFWxGvCxzBYv3AULvTyNSjajA3ScICrG51V1TLkaiKi
         CRePNr1nN7U/Ga1IgdjlxjYofBzhmPtT8pg7XIeiqpTXF1OM9UNEfyotouNS+r5EbV
         Rh7bBfxOioGCoR24o1cSUC20vntOEs+Mg6xtigEc=
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>, Joerg Reuter <jreuter@yaina.de>, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

The hamradio docs were moved to a different dir.
Update its location accordingly.

Fixes: 14474950252c ("docs: networking: move z8530 to the hw driver section")

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/net/hamradio/scc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/hamradio/scc.c b/drivers/net/hamradio/scc.c
index 1e915871baa7..36eeb80406f2 100644
--- a/drivers/net/hamradio/scc.c
+++ b/drivers/net/hamradio/scc.c
@@ -7,7 +7,7 @@
  *            ------------------
  *
  * You can find a subset of the documentation in 
- * Documentation/networking/device_drivers/wan/z8530drv.rst.
+ * Documentation/networking/device_drivers/hamradio/z8530drv.rst.
  */
 
 /*
-- 
2.26.2

