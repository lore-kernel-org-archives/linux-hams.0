Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30912D595D
	for <linux-hams@vger.kernel.org>; Thu,  9 Apr 2026 01:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775697759; cv=none; b=aEga1IMsGnJLvv3o2pQG0bbR8BpO32gEusVpLi14PcmgeNDFPMZI9jFOjcM7Z2jZw6O1S7pNKGhVNo0NKLP+GrmdDlAakcoVbbqunmojISyRj+iBtxf4XV48j1/Y+iS5m3B6goQrHSzAzq8uFwVWTn56losnVT5X6Cew1SqmISk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775697759; c=relaxed/simple;
	bh=erkjuSamtwykdXGKyc4eVKBd28tB47XXwgb0llv6irs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jglXaR7s9oT0Axchj0+8ZCc9gVcM822y4Oii9ZFFLaGfNdXEN6IX+liWZTeD4rHxJtzkBWEsthOkTroHcYHbYIfrkQjzQiM4TM8qIiGX+W/EwfELSAlUBM/IXHKWhLWsihaqRdTqptXdCl+V7PY35KGCSyXCSDbGn3UcZImDlio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEf/1zGH; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEf/1zGH"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8a151012558so4525326d6.3
        for <linux-hams@vger.kernel.org>; Wed, 08 Apr 2026 18:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775697757; x=1776302557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7kHgW6gODzr0y0JslZ3By3mLh3bKpybyqv0sVIih/4g=;
        b=dEf/1zGHFawTUHhITNcPHLGKqf3YRUB76RItNXMOIPJroXuU0x3z0Q2C160WKo75qe
         nReiIwoZDSERoda5PP7ZdK646z87Y6WR56vDaPcctgZPOhBFL/HqL+JQd+vMoPkDAgLW
         oLfetyLRD1okD0nWO79FifEfKQViBO85t0pqqQ3pFbi0G5qo1jIT4WC2Fkij6rZTPcfF
         /FXxTH/SZ34YQgdvnFVaS2xG0suYwtHDvUSLgKAfuVrCXZ8ZPPxwA4gNKYrDkyN5ghHG
         8H6zj9EDrBt4LxKW7xECZLk5IU4M0F3nZUbFqAifF/4Pi2waEhWQsFbG7voxhHMPW2XH
         yBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775697757; x=1776302557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kHgW6gODzr0y0JslZ3By3mLh3bKpybyqv0sVIih/4g=;
        b=UiG2/JAxrtrHDNODKfwJvkSdi863MPISIds8HX6dMF0udZhiDgVXFzvuAD9FnzuB0o
         3h3UHMmzEMMFz76CaNbyyZ+Q7vTqBrhFtjh2238ZpORVEP/jBH3tSFSKnic4XBMH9Ej0
         DwxIeV9dZW4ZPRCl6tcHwVw1NmY3PMMVwggf0SKe0XpzJp/V67Jt/OG3jUvxEiEDOvQm
         snuZO/DQzf8TGtSA2TDfCONcF/o+E99acaGjg6WVpvxNeRk28GcQXkRz/ZxtUq7hH7oV
         KXYvKyHFFiDMxl/BdKSi/+90ca1kcRM+qg3W31bKrpDNFFaDbbkIj9vYclDcWVwji1fE
         pmWA==
X-Gm-Message-State: AOJu0YwgIUR9pncPnYANAD7dtIcah8+KJHK9JR2/ao9IyiRmV99uMlzt
	55JOw6yToZ16rRUvJIxUBtzlNcAMGyXQ0jynx4ayvjL3MTTERmT2MN7Z
X-Gm-Gg: AeBDietYww6Qa4VqTYShcvz4NTEimVJhauLS28EGvzPY37nX1D7Z5oKpWu64AHeA0ZD
	dMXMdpgbZ6N/MgK7d+003sQzmmIVNy+KGFwEo2ceLVT2jgfnr5H5+K9Ls6LQervwcFiV+qg01io
	v/qyQfrBHUftmogqg3Crm1ElEk8BOFqHLp1sHn/zaeU8YDl1pRGKwI9gsXOgsAs6wIto8s2q5bk
	Z2NpvO4yXbkwL1DIsVZUzLs1tRlhzjpLHTQIvpS20r+MlhjccNWTeWraGpH7yi9PqJDiBCFes4d
	qmNw+SDwDCXAw4cUX7Bw4yV3EuENJfk3u7QXQQD9LUR/goi1t9agvltPuMiO+KgeUog1UuMG/BC
	tOksxR5MxEkRhdguqqJbK5yuguWp6MjAUrlCBqjoaU1ap+e2wMW6rmkQvmJ11d+HFEfIboWn2sg
	Ne/jbBj8GPjWHl4x4sBGxz2giW5ADTPzvXqZV7BOhehQ7iqZwTER99sVqldjBvWD3/o95NNhxm3
	tevQ56COGI48a/zfcIlIyiQAcv/izrhDlMtYvk=
X-Received: by 2002:a0c:e017:0:b0:89c:d886:c022 with SMTP id 6a1803df08f44-8ac740aba14mr28587616d6.1.1775697756769;
        Wed, 08 Apr 2026 18:22:36 -0700 (PDT)
Received: from TDC4045031631.e0cglfehwr0e5gttmepj3hi3hf.ux.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a596e03ce5sm217106476d6.35.2026.04.08.18.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:22:36 -0700 (PDT)
From: Ashutosh Desai <ashutoshdesai993@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-hams@vger.kernel.org,
	jreuter@yaina.de,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Ashutosh Desai <ashutoshdesai993@gmail.com>
Subject: [PATCH] ax25: fix OOB read after address header strip in ax25_rcv().
Date: Thu,  9 Apr 2026 01:22:35 +0000
Message-Id: <20260409012235.2049389-1-ashutoshdesai993@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ax25_rcv() calls skb_pull(skb, ax25_addr_size(&dp)) to strip the
address header, then immediately reads skb->data[0] and skb->data[1]
without verifying the buffer still contains at least 2 bytes.

A crafted 15-byte KISS frame (1 KISS byte + 14 address bytes with
EBIT set in the source address, no control/PID bytes) passes
ax25_addr_parse() which only requires len >= 14, and passes the KISS
byte check (low nibble == 0). After skb_pull(1) in ax25_kiss_rcv()
and skb_pull(14) in ax25_rcv(), skb->len is 0 and the subsequent
reads of skb->data[0] (control byte) and skb->data[1] (PID byte)
are out of bounds.

Add a check that at least 2 bytes remain after stripping the address
header, freeing the skb and returning on malformed input.

Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
---
 net/ax25/ax25_in.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
index d75b3e9ed..92baac77f 100644
--- a/net/ax25/ax25_in.c
+++ b/net/ax25/ax25_in.c
@@ -217,6 +217,11 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
 	 */
 	skb_pull(skb, ax25_addr_size(&dp));
 
+	if (skb->len < 2) {
+		kfree_skb(skb);
+		return 0;
+	}
+
 	/* For our port addresses ? */
 	if (ax25cmp(&dest, dev_addr) == 0 && dp.lastrepeat + 1 == dp.ndigi)
 		mine = 1;
-- 
2.34.1

