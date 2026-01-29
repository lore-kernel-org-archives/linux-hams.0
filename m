Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com [209.85.221.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5585EAE7
	for <linux-hams@vger.kernel.org>; Thu, 29 Jan 2026 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680212; cv=none; b=Y52nClq+llLpbxW1W22KVW/qT8ddBkoHKm3s3W4GaNXVWZ2sVC8v9iki9It1fXqHTRqPHERnvK7F4W7nT7M7ON0geSN1MqrlapKik1X0BNuNMRL+MignT5X6nf2tHGwI9b1KVeCovEHV9cdM4tW0WV4XJ+PnDnJ9Eg05xpTOiNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680212; c=relaxed/simple;
	bh=MI+D2Ic6bz3jYMbMxWU4odca96W1KdTlxUzB6WUQDjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ElR/d10A50stahUhEFg9g3TWKyc9lwaDV/EJdyC/dCXqA4DDIc4xHjZNyGs4dQzLfODFmMGpQtapf2UNNd0hkZbAN4yGSEfEICmmHnA+4lEJuSFDUCAjm83JlLm6YqyUuQ+boOYIZt74CCA8qs0chJ2s9c30d9LU9hZ/+viNzb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lw25WmUU; arc=none smtp.client-ip=209.85.221.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lw25WmUU"
Received: by mail-vk1-f193.google.com with SMTP id 71dfb90a1353d-5663724e4daso569353e0c.3
        for <linux-hams@vger.kernel.org>; Thu, 29 Jan 2026 01:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769680210; x=1770285010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEB8Yp/SddLVwrY1R6Js1dQZWhnZcm4xY82a3ZUzWc4=;
        b=Lw25WmUUCnduiL/CYC4xB9Dipy1/5HVO5uzz6EZZRZfIb/8Vn5rx67f+XL2W1xItjA
         nmYhNrz9ObPaAux6FTwIa/8m3TivmE8+RFc6xfkMHNVBTEoH6Lux7+/mCi7Ke6QEXPUq
         fGfoYTVl7L+NOxiOsidZYfwkFvgt/MqYX4e5TTv0jFmzyRS6llznE0f5gIHmI0R7ylU9
         oHThTDvEMxYg3WeVkXt2sESvnkXd6zQ7ora0cDfXd/oulrwJfXADMQpm0w1deHMtWaxA
         mA5MC3eT9buo2MYWJP/arIFvyYTU599TshX/PbibUBVdBoofJrYk2aOkomXOtMQGLCun
         iwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769680210; x=1770285010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEB8Yp/SddLVwrY1R6Js1dQZWhnZcm4xY82a3ZUzWc4=;
        b=V3TKUES/7W3fB/deJMw43lsMQPwnN/tX3bdAuv4iPvp0MDCNdec/clYJQ1FyG6j62X
         dz0OyhE5Hhfd3VAtA6Le1BTRE4ep1WTRyuC7AumsjjKIv2C5PtWQdrvJ1jvpsb8GSTB1
         AxU9OWA8GezRiy+fpZTTMhXZaYYxYsifA/SfF1RhrpTjM+CHEqiYjeu2iWHI4J2QbeJ8
         ZAcwksoeOl528ZFDbP6xaXgtuIqObEERcoskCnT11cU0wKbmUcUtIvNkbY+jYgA8k+qy
         mwizNRtp858q0LK57ak+3b6bRf8QAH2sBls27sa58At9i3G8FzZdTIaC5estiqQguDx5
         jHdg==
X-Forwarded-Encrypted: i=1; AJvYcCXhCtM2w/AnDDR+cGkGnWlgYpnHq1BXIj2nz7ZJq7r20Ixx2zTsInuA8s2+xzLO3BAWiTmnMS8IxRDX@vger.kernel.org
X-Gm-Message-State: AOJu0YyGfgWlOPD8bfhOV44uzxBuWLJIXz1XazIfj/UIsXR50Cv2B/Pg
	vkCqZlXpyW5YRXqZ8soS5tQ6TK1X6/btJvmnPbr5aQsgpM4iEic369X5E6HwkCi/
X-Gm-Gg: AZuq6aI58oVvPQPBxuFELOO8m4FPu39RFbSgkVG4BJ7R9J1DHs6XibjgfZdoP3k//0K
	NUDiuR5pFJ/a8SIuWFtDZFQcmXAVPZG9Lj2wntys/ORfADtS0Cm1i7WvTiKWeRejYE5R58Ymu6n
	A+B4eUYIfLVklSdTkp+R6P8MZFgQplETR8RlvV5GpIVE8fn+DdJWJOfWcojsFvpwLFhGg4R7fs7
	FrGw4yvPbcbhN6W1zeKyHd+f9ugVqPWjyX/eR6BIOxHXoSnD9KaOAK4nBZZptf7EP3BmglSnqNo
	5PpcACipL4f0U0cEBdFSWpe7rT+P/HY3KI7g6/VU9z9icPbrFP03dL1QvrcM1VjGG27Vj/+IFrr
	oVbGeimtlrzibR1QtNKaj/fVwwdCArR0xMA3kqoVqcwU+VECZzfgV/mq16pEYPn0+ozFiraLzmF
	5jNpQqkHT7b6TVHOPxCRzg27NqEY/6a03e2p7a2QR/r2oditbaFeh+ym8TVjlXIfUjBPhYch/V4
	lVMteI9RxWW75wOveLnpyTEkuyTVQjsxzbPYI4+GOSYffECm9+JXHEDhF5HZ478vL/D6ZTMuBjg
	YBug
X-Received: by 2002:a05:6830:828d:b0:7ab:e111:1a57 with SMTP id 46e09a7af769-7d18512db09mr5036559a34.31.1769674175726;
        Thu, 29 Jan 2026 00:09:35 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c831394sm3317768a34.31.2026.01.29.00.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:09:35 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-x25@vger.kernel.org,
	linux-hams@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Joerg Reuter <jreuter@yaina.de>
Subject: [PATCH] net: ax25: remove plumbing for never-implemented DAMA Master support
Date: Thu, 29 Jan 2026 00:09:04 -0800
Message-ID: <20260129080908.44710-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AX25_DAMA_MASTER option has been unimplemented and marked broken
ever since it was introduced in 2007 in commit 954b2e7f4c37 ("[NET]
AX.25 Kconfig and docs updates and fixes"). At this point, it is very
unlikely it will be implemented. Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 include/net/ax25.h  |  8 ++------
 net/ax25/Kconfig    | 14 --------------
 net/ax25/ax25_dev.c |  2 --
 3 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/include/net/ax25.h b/include/net/ax25.h
index a7bba42dde15..ad3d7626130e 100644
--- a/include/net/ax25.h
+++ b/include/net/ax25.h
@@ -116,10 +116,6 @@ enum {
 	AX25_PROTO_STD_DUPLEX,
 #ifdef CONFIG_AX25_DAMA_SLAVE
 	AX25_PROTO_DAMA_SLAVE,
-#ifdef CONFIG_AX25_DAMA_MASTER
-	AX25_PROTO_DAMA_MASTER,
-#define AX25_PROTO_MAX AX25_PROTO_DAMA_MASTER
-#endif
 #endif
 	__AX25_PROTO_MAX,
 	AX25_PROTO_MAX = __AX25_PROTO_MAX -1
@@ -138,7 +134,7 @@ enum {
 	AX25_VALUES_IDLE,	/* Connected mode idle timer */
 	AX25_VALUES_N2,		/* Default N2 value */
 	AX25_VALUES_PACLEN,	/* AX.25 MTU */
-	AX25_VALUES_PROTOCOL,	/* Std AX.25, DAMA Slave, DAMA Master */
+	AX25_VALUES_PROTOCOL,	/* Std AX.25, DAMA Slave */
 #ifdef CONFIG_AX25_DAMA_SLAVE
 	AX25_VALUES_DS_TIMEOUT,	/* DAMA Slave timeout */
 #endif
@@ -226,7 +222,7 @@ typedef struct ax25_dev {
 	struct net_device	*forward;
 	struct ctl_table_header *sysheader;
 	int			values[AX25_MAX_VALUES];
-#if defined(CONFIG_AX25_DAMA_SLAVE) || defined(CONFIG_AX25_DAMA_MASTER)
+#ifdef CONFIG_AX25_DAMA_SLAVE
 	ax25_dama_info		dama;
 #endif
 	refcount_t		refcount;
diff --git a/net/ax25/Kconfig b/net/ax25/Kconfig
index e23a3dc14b93..310169ce1488 100644
--- a/net/ax25/Kconfig
+++ b/net/ax25/Kconfig
@@ -63,20 +63,6 @@ config AX25_DAMA_SLAVE
 	  be enabled at runtime.  For more about DAMA see
 	  <https://linux-ax25.in-berlin.de>.  If unsure, say Y.
 
-# placeholder until implemented
-config AX25_DAMA_MASTER
-	bool 'AX.25 DAMA Master support'
-	depends on AX25_DAMA_SLAVE && BROKEN
-	help
-	  DAMA is a mechanism to prevent collisions when doing AX.25
-	  networking. A DAMA server (called "master") accepts incoming traffic
-	  from clients (called "slaves") and redistributes it to other slaves.
-	  If you say Y here, your Linux box will act as a DAMA master; this is
-	  transparent in that you don't have to do any special DAMA
-	  configuration. Linux cannot yet act as a DAMA server.  This option
-	  only compiles DAMA slave support into the kernel.  It still needs to
-	  be explicitly enabled, so if unsure, say Y.
-
 config NETROM
 	tristate "Amateur Radio NET/ROM protocol"
 	depends on AX25
diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index 3733c0254a50..c504ed9c3a88 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -82,9 +82,7 @@ void ax25_dev_device_up(struct net_device *dev)
 
 #ifdef CONFIG_AX25_DAMA_SLAVE
 	ax25_dev->values[AX25_VALUES_DS_TIMEOUT]= AX25_DEF_DS_TIMEOUT;
-#endif
 
-#if defined(CONFIG_AX25_DAMA_SLAVE) || defined(CONFIG_AX25_DAMA_MASTER)
 	ax25_ds_setup_timer(ax25_dev);
 #endif
 
-- 
2.43.0

