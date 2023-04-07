From: Peter Lafreniere <peter@n8pjl.ca>
Subject: [PATCH net-next] ax25: exit linked-list searches earlier
Date: Fri,  7 Apr 2023 10:20:42 -0400
Message-ID: <20230407142042.11901-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-2023;
 d=n8pjl.ca;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=OwRei2BNhmX8BvkJp0ZRG4WxXMLSD0qgfQ+sHxu4kJY=;
 b=femRHw778OSDlNxmFnGld1JbuhztYY0Zas5/EW5a+oMMRbO+NljHtKhUm4RgJeRFUsWYLq+2qWbK
   sDD4ZEDoZwzfDCHwJAOVRKg1FUa4ui+keHPGFQikex48T6R1yBgv1b9ptn7xZCPgdr4AeJ8gvzZv
   Y7HNQqyHDLfsqeICqOUBAEiZGgMkPSuWzfh4tKdzgFfMRUHMvm07obyNuQ+Z3G4+9TfocdJyPC4u
   MxUyF2IUg9ry761GQAoyCKaM6PjBmlePJQiOa0VHlRlta377agnIc2nfeXH+1LLww5jGmd2sMgNL
   J7dxmQ8dzqhwK4VOkRQBjsxf1qqbyh1/dUJEGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-yyz-20200204;
 d=yyz1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=OwRei2BNhmX8BvkJp0ZRG4WxXMLSD0qgfQ+sHxu4kJY=;
 b=pb38zMMdLPNdfGip2jYCBjov8UtYlXZQ4QSuC0u5xU2Fw455RqrwNn0ZxGh0cvXWdoQ0J1cpd+cH
   0GP4/LWNpMGfxVXI3fEMtKjJ4IZ8PfHu4cG6T5uM3+6Efcp2WnhQmmI5ak70gUoFpAgDFHDKfpIJ
   8XW9x97fkNtEEkJOKXGfwJfCzgicGIIW4dpYAt85O+gpmPspBfMzuSiElUVI37nPQ2de5O810rpK
   BZoYBuyx+yZJcoJKQ1/V9dF07IWvEMRJkTsegskImfRCShpStYIZwMD842iRkWFVAPnxCstXP6r8
   cvCPQVPTc1un5RSM+EEp+tK3JHqQj+AfAm+oAw==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: Peter Lafreniere <peter@n8pjl.ca>, netdev@vger.kernel.org

There's no need to loop until the end of the list if we have a result.

Device callsigns are unique, so there can only be one dev returned from
ax25_addr_ax25dev(). If not, there would be inconsistencies based on
order of insertion, and refcount leaks.

Same reasoning for ax25_get_route() as above.

Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
 net/ax25/ax25_dev.c   | 4 +++-
 net/ax25/ax25_route.c | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index c5462486dbca..8186faea6b0d 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -34,11 +34,13 @@ ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
 	ax25_dev *ax25_dev, *res = NULL;
 
 	spin_lock_bh(&ax25_dev_lock);
-	for (ax25_dev = ax25_dev_list; ax25_dev != NULL; ax25_dev = ax25_dev->next)
+	for (ax25_dev = ax25_dev_list; ax25_dev != NULL; ax25_dev = ax25_dev->next) {
 		if (ax25cmp(addr, (const ax25_address *)ax25_dev->dev->dev_addr) == 0) {
 			res = ax25_dev;
 			ax25_dev_hold(ax25_dev);
+			break;
 		}
+	}
 	spin_unlock_bh(&ax25_dev_lock);
 
 	return res;
diff --git a/net/ax25/ax25_route.c b/net/ax25/ax25_route.c
index b7c4d656a94b..ed2cab200589 100644
--- a/net/ax25/ax25_route.c
+++ b/net/ax25/ax25_route.c
@@ -364,6 +364,9 @@ ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev)
 			if (ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0 && ax25_rt->dev == dev)
 				ax25_def_rt = ax25_rt;
 		}
+
+		if (ax25_spe_rt != NULL)
+			break;
 	}
 
 	ax25_rt = ax25_def_rt;
-- 
2.40.0

