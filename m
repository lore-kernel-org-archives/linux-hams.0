From: Peter Lafreniere <peter@n8pjl.ca>
Subject: [PATCH v2 net-next] ax25: exit linked-list searches earlier
Date: Fri, 14 Apr 2023 10:33:57 -0400
Message-ID: <20230414143357.5523-1-peter@n8pjl.ca>
References: <20230407142042.11901-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-2023;
 d=n8pjl.ca;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=eLMR8c+rUCn0e6s6vuSNWWr8ZkEgeN7CWTblMl8MyOA=;
 b=ooBfR03zCOKGJLuZfxkgeiYpv7RAvUijX1giAlvMOhR5ZM0Ra3zHS89fuXEe5cAinmFjYkSpuZuT
   56hNvk3hfIdcs3g6RjXh3Ch2DITpMdHyYB2CmlST3YsHCevV3GuF1A6HM3bUWxHKwJxN44KUKWti
   M7rkMh6927p5vD2E1wQXQZXpVLBP2tyxyYaUTBpOZtPELZSQTkFXEdkEZbHSquXNPAT7eOgzJsCi
   DOzelwm9fx2eK+svGMjuMtplffNd7aBDZtWXKSGwigYjR9x6Yxy99bnQYrE7S+cs0LlgwT8GBSx9
   BsPo8ODKXZ4zGSAwefmDwYDvFBTD+xnU0r7vNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-yyz-20200204;
 d=yyz1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=eLMR8c+rUCn0e6s6vuSNWWr8ZkEgeN7CWTblMl8MyOA=;
 b=BQLlT4fzvOBPeO0VpWXBl3FRX2kwoc9f2WwIK7ypY9NPgjP5SLNeIrWIzLe8fZ0EnZMUp5xva48l
   AjpcaoYJRMP36qaz4S6V0jPXVypKXJ69MXFbI6vVr+Ac19wHww+hOEEIjkf+jzXRy0jTzmGfbVt2
   t07xYxIcOpzYVqmGOmg+WIyJWnd7+LJZejYaYonVQNE7ZCOVfaSWFnsqyGHe/nNRKFGK+r+lksNJ
   jx85XqfLsm5FSIF3L9ln1p5mjloeWpY2t16adTrTd05/fkBKYzToRO8tiFjpmwmsfq7Wy7s1xzNk
   j5ZahltfB956FRjrJExnAPi7ltEqxIGs++Q/zw==
In-reply-to: <20230407142042.11901-1-peter@n8pjl.ca>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: Peter Lafreniere <peter@n8pjl.ca>, netdev@vger.kernel.org, error27@gmail.com

There's no need to loop until the end of the list if we have a result.

Device callsigns are unique, so there can only be one dev returned from
ax25_addr_ax25dev(). If not, there would be inconsistencies based on
order of insertion, and refcount leaks.

We follow the same reasoning in ax25_get_route(), and additionally
reorder conditions to skip calling ax25cmp() whenever possible. 

Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
v1 -> v2
 - Make ax25_get_route() return directly
 - Reorder calls to ax25cmp() in ax25_get_route()
 - Skip searching for default route once found in ax25_get_route()

 net/ax25/ax25_dev.c   |  4 +++-
 net/ax25/ax25_route.c | 25 +++++++++++++------------
 2 files changed, 16 insertions(+), 13 deletions(-)

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
index b7c4d656a94b..ebef46c38e80 100644
--- a/net/ax25/ax25_route.c
+++ b/net/ax25/ax25_route.c
@@ -344,7 +344,6 @@ const struct seq_operations ax25_rt_seqops = {
  */
 ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev)
 {
-	ax25_route *ax25_spe_rt = NULL;
 	ax25_route *ax25_def_rt = NULL;
 	ax25_route *ax25_rt;
 
@@ -354,23 +353,25 @@ ax25_route *ax25_get_route(ax25_address *addr, struct net_device *dev)
 	 */
 	for (ax25_rt = ax25_route_list; ax25_rt != NULL; ax25_rt = ax25_rt->next) {
 		if (dev == NULL) {
-			if (ax25cmp(&ax25_rt->callsign, addr) == 0 && ax25_rt->dev != NULL)
-				ax25_spe_rt = ax25_rt;
-			if (ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0 && ax25_rt->dev != NULL)
+			if (ax25_rt->dev != NULL && ax25cmp(&ax25_rt->callsign, addr) == 0)
+				return ax25_rt;
+
+			if (ax25_def_rt != NULL &&
+			    ax25_rt->dev != NULL &&
+			    ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0)
 				ax25_def_rt = ax25_rt;
 		} else {
-			if (ax25cmp(&ax25_rt->callsign, addr) == 0 && ax25_rt->dev == dev)
-				ax25_spe_rt = ax25_rt;
-			if (ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0 && ax25_rt->dev == dev)
+			if (ax25_rt->dev == dev && ax25cmp(&ax25_rt->callsign, addr) == 0)
+				return ax25_rt;
+
+			if (ax25_def_rt != NULL &&
+			    ax25_rt->dev == dev &&
+			    ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0)
 				ax25_def_rt = ax25_rt;
 		}
 	}
 
-	ax25_rt = ax25_def_rt;
-	if (ax25_spe_rt != NULL)
-		ax25_rt = ax25_spe_rt;
-
-	return ax25_rt;
+	return ax25_def_rt;
 }
 
 /*
-- 
2.40.0

