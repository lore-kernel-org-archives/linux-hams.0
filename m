Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB613DEFFE
	for <linux-hams@vger.kernel.org>; Thu,  9 Apr 2026 15:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748244; cv=none; b=mMC5SHuayHGPfgUcDFEKPAFYQVNcQQe00tkgvYjX01Bvtmpdn6aMOqgJq4P2LdbSIkM9YkailqsCdk05s/0N1c6oaOoOHRT+J2T9GwpTb0pxqFAL9lJH8xs6VRnIuXpvDDV2Xe/efoYC4eQHz3N6Qd0UVNZjsB7BdOtVJlJkYRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748244; c=relaxed/simple;
	bh=2neZ3Cba/z6x9Y8TtkiogWJSDFaSYQusxUMlV6UD0Hk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JEdUjlSBGsAxIl1UFtAOsopHlqnCXThQ4Ms6/MzekNdvQEJEJFlhjWF0SyvXhXRYChE4b+tz2HJy3xxQ3eoKQS4yaFvqqbqMJcfgyFPkOPWuuH9inmqiLfJc2st+0V2W2yfklgm1dE3XnVCIToV859I3ByxWDsKxmuwIjOS/2DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYYCzbVr; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYYCzbVr"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8a3342d301aso10389686d6.2
        for <linux-hams@vger.kernel.org>; Thu, 09 Apr 2026 08:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775748242; x=1776353042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoVMgFSg7TgoUkOzz8poiLNf0wihCgPQFidePPKr930=;
        b=CYYCzbVrtm1xTziVup297Rmp3zw/sHVKzTVObORC9IisocqZYjq9W+1BatWcyHW34r
         uloOZrl2Vs65A0chxFdwaJDEnjp9xrgedATnbbM6WurjOm4lrvpmF1G/Yy/ggsNUFQMo
         /SSr7FW6SqYa7dvyQTAATy9gh4+KteE3R0K1g2tE0VQV6zCXINhxggjMvblbzIdJw3uv
         B11nik8OTh4Q23ObqIzRqMlOycGp68ScytSSVFTd6nXPlpk4Kin0txywAwljwRhorYtz
         v6pLz1DissAzLzcw/+dDvnykQ7Dbkb6lTJCDpVR0s+3tngFsbAOfiUKg2MPUjsqq8MtU
         T61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748242; x=1776353042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BoVMgFSg7TgoUkOzz8poiLNf0wihCgPQFidePPKr930=;
        b=Xe3dyzODApg/y2zhqHrVIe7QlL1QUayXGT76loGiuFQvwFR12FKutb6b/9w78QQdO8
         /EestAwtgc8ISAr3ZV5X1dFa6jWioqaGKgJ9cE1T/pZxht12KW7L+KPe/Mfu5zeBkY7V
         dNQcvozjFvBiyzBun/Kgo/dZCNVY6Y/us2rsMdZ/vtslzWjMMOterruw0WTnofs/YENf
         tjm1uX9Rnnw76Xw11SoNYyH0dKwCZKc+iMKlMaD30LZx4G/+PvJ9dnUa/KCtkhPk5NcU
         vzKYJcAsKq1LkZpJAaBsUNX0nYsEMvqxQo0v6NP7gm1uuyIc2XlQ+jbguiRC+cGjt4yW
         4odg==
X-Forwarded-Encrypted: i=1; AJvYcCUtWCscCVg/KM3OVYwroJ2ADhs2LAIVrW7MvsZJMWap5+cBFGsAbKdkZy5CJUgcpMxmhvuICqaaB4gh@vger.kernel.org
X-Gm-Message-State: AOJu0YxfyeHGdjn86temxUPtXYGkGx91kv2wZbwTdyAj4hyG0C/giU02
	9NeRQ9cMCdccGznMF2jd5RUUDlT+2BOHsAGPhJ6pnPWN84l5K0wRsv/B
X-Gm-Gg: AeBDietBDdfsDe/Eo4Z6oeWqliQkZFjAgcq2rytCL/nPS+eQSDolTZI4AeFhTnjDtM9
	KL5Xanc82KVSYAcp3LZP+gYezsPuLdeuBF/HTyh4X17xJF+ITJt9+UVCfQ8SGJw4igqNL6cl8DR
	BMHt+It65ak0M+cbdKB2uWAxmgT4ilEpuyIkNefURcjx9TPgMh3+0rkgkTdhY/8z+YGI3fDant0
	JLjGTcX0SJJTPJRPTC9wMR47ea3ZUvFeEiT4Z3Ni5RK368CBglR1XJbdHEMux8fBZqsx5Qu6fVj
	1wk+MDStxtF7+T/AIqQhDMR+R/JMr8JIn7+czp9QWx2txvSHzJAi7U3zpxfOgfjipohoZegJPnF
	UW5k66z35RQqdj7v5HOAEd2zWwoepDWyN4azF1LEd8g5TzeKulxUO0elagMpTyDvGXe70sWrhtr
	jn9w3ZProUqCcuPv1DYGdI7oabvNas6qPfMc9Z1gy+hC3DfeRDVQLZHblaMPydAOUvGKfRgrvq7
	B1tl9i5AhA03lrDZj7NSh/AalLu
X-Received: by 2002:a05:6214:4c8b:b0:896:cc24:138e with SMTP id 6a1803df08f44-8ac74287bfamr58007166d6.54.1775748241840;
        Thu, 09 Apr 2026 08:24:01 -0700 (PDT)
Received: from TDC4045031631.e0cglfehwr0e5gttmepj3hi3hf.ux.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac56e3a898sm72809956d6.38.2026.04.09.08.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:24:01 -0700 (PDT)
From: Ashutosh Desai <ashutoshdesai993@gmail.com>
To: netdev@vger.kernel.org
Cc: Eric Dumazet <edumazet@google.com>,
	linux-hams@vger.kernel.org,
	jreuter@yaina.de,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Ashutosh Desai <ashutoshdesai993@gmail.com>
Subject: [PATCH v2] ax25: fix OOB read after address header strip in ax25_rcv().
Date: Thu,  9 Apr 2026 15:23:59 +0000
Message-Id: <20260409152400.2219716-1-ashutoshdesai993@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANn89iK7bzV0VpPsP5nu0mV3GCsN5MOZJgc_s8a3B2X6Ui6mxg@mail.gmail.com>
References: <CANn89iK7bzV0VpPsP5nu0mV3GCsN5MOZJgc_s8a3B2X6Ui6mxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ax25_rcv() calls skb_pull(skb, ax25_addr_size(&dp)) to strip the
address header, then reads skb->data[0] (control byte) and skb->data[1]
(PID byte) without verifying those bytes are in the linear sk_buff area.

The original fix checked skb->len < 2, but as Eric Dumazet pointed out,
skb->len counts bytes across the linear head and any non-linear
fragments. If the two bytes needed sit in a fragment, the check passes
but the direct skb->data access is still out of bounds.

Use pskb_may_pull(skb, 2) instead, which ensures both bytes are present
and pulls them into the linear area if needed before we read them.

Suggested-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
---
 net/ax25/ax25_in.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
index d75b3e9ed..6a71dea87 100644
--- a/net/ax25/ax25_in.c
+++ b/net/ax25/ax25_in.c
@@ -217,6 +217,11 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
 	 */
 	skb_pull(skb, ax25_addr_size(&dp));
 
+	if (!pskb_may_pull(skb, 2)) {
+		kfree_skb(skb);
+		return 0;
+	}
+
 	/* For our port addresses ? */
 	if (ax25cmp(&dest, dev_addr) == 0 && dp.lastrepeat + 1 == dp.ndigi)
 		mine = 1;
-- 
2.34.1

