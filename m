Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DB4336EE1
	for <linux-hams@vger.kernel.org>; Tue, 21 Apr 2026 05:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776750562; cv=none; b=nXMXVfNBkP/0iTouI7AQ5C+tlewlznfsbNCgyVXIfsIKVgzUBAb8QBgrWS6NA3M+G38WMoBSn15w9KMD0EBI8NMTlE9aZFdM2Y0/1/S6GZJ6l311olibU7noYZm6HHMT0Atl77l4wrJJyKOzA9Xo9W3FXvTn+tPsQVcw6EqG/yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776750562; c=relaxed/simple;
	bh=Ub2/CujAcX3WFWcxCD/i+N7vpumJ3LeFtAn0W3AHdL4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X702khOpIWeBmntDm8vRqnnESNJhTPjCU05N9RtI6JN4InMARsX21bv2eCCdlcKBBRdvS0W5c7OsgzM07qnaY0U/cU+3bSNIjLGDzfuaO48L7W4jgqPQ/JvmiqR0ds7t+XC6dkHVfClGrdYyEgBxIH5uOQmIFMyOzdU9DIGvZ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlNeSH8+; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlNeSH8+"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cb3bae8d3eso333604985a.1
        for <linux-hams@vger.kernel.org>; Mon, 20 Apr 2026 22:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776750560; x=1777355360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cwVOqviN0nRLq3+r1rz1vZYdV1pHIllY/x32ovYOlAo=;
        b=NlNeSH8+6HVZ2mvFduxG05QSjMQ4JS3vRfPoOLIqWcTzh0bCHxC9cRjz+1lbTcUfbf
         P8WoNOj+gcB1wLZkgom91xSWVrkuJVVfUKy97Wapaer/xcjeJxCtyAChBaOfVrHjDyxX
         LAPIL54e6oB9zCs22cB3t27uBVa6eeU32CxrwZCDKS9UXFFZ0cJU2SoEexpBndIWSj42
         nJZXTHD1RydUlUzsjsbcCN7MexwXeJ/zncrDZjmuO7r7ROw+1qRkl//+FOeFVUX2Tndc
         g0UXEmS7eL5m4Zy0nbtnYpIIrlKkReWOeQBrA3lmM6FN0SYnWjCPqQJDcs6kIyW2/n7K
         2Q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776750560; x=1777355360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwVOqviN0nRLq3+r1rz1vZYdV1pHIllY/x32ovYOlAo=;
        b=WiGpvbrm/nX6z8JXSGs1MLrQd1m5ZevH+NhM2sftnWZATW/l4IizISor8g4XZdZVtj
         3RqRA/vXSyKEVWnux5WmLcqNMQG1l1rACJtwB+3zuSQcUz9T9iyTMll/CwVTgwUfkwSj
         CW5kjw2IINJ5VmS5kgWUxRmjOLgTVmeG3zNaS5qpe5Cp03PQK3Bn0Hg9o83aOOrN2zvF
         88bg0WA7ni+IhxPSCg+O8t7rn4h3GfysHuZLUHBGDIJS866btJ2OOWRElnS7otot/mzP
         3mDshCRU1dF7l3/52nBuQ3b/2D4sgYIWiEeZXwZF9O9Xsu5PM1CpcQfqes2KfSe8l9BP
         qFsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Eabdh5V+N97AUYOexb27xPQDboY7pfg5xNnzQrHphafgxbYENs4bUj+O9h174XVMSziS1/ljvSeq4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz7ZzPdC3+gnS567GooW+UfE72zgGD5mGbC7xGKR9rctOvG0um
	FtU0hIdqaXnekoNpXNGxX0H40bQtAu3+g6k/5nv74Tmdui88nuU+XWTn
X-Gm-Gg: AeBDieu4ycseKP1oJo+DWyy7quyEYWJ28ohllY/gZuoYlIHrA9dTH/a1DfzVWruRKM3
	gefgap/kdXKOcQJ9995FnZKWy6VVkCyP5u6C0Xsx+Yt66o4t7dGNuZeCjqU1qouXrPhyy3QLoJf
	vUZ6rSi4++bwGSUcFfP78aXtsQqZv4WtLc+D5SWRtQUrcesIlGHJ+OGLN8t9PnUjVsOI+AdmByF
	6IURhDncdyebM6DpTFRJOUg2TIzcMmg5XLounKRkzaapX2SnMhVZM/2xqIvDUWKE6RgbS2ap2Ca
	ewtnQ7ExATyeYNZQHxwfKEjyK3uKk2yM0U0jJPeXaESqSnEVklGZksQekvZQci4zz8PBHp5h+l+
	NBd/7bfSUYDn6hOCOleWMb8CsukzVweL79HS/LawDsN4H1R9Qv5Okfbq/iTw6cC8Ii5lI+/RXBR
	mmoUGRtRmIneuvkw6lOJDKrMFnfOB+0SWOOd5vAeUHgNVwUnaNxeU2U5gj8E3W/tBsWG/7SMoAC
	BQLyv/ydArJxUJs9nzw1UY3N8qefsRm4ZGD8gQ=
X-Received: by 2002:a05:620a:31a9:b0:8cf:e0fe:f227 with SMTP id af79cd13be357-8e79030cca6mr2392122885a.26.1776750560194;
        Mon, 20 Apr 2026 22:49:20 -0700 (PDT)
Received: from TDC4045031631.e0cglfehwr0e5gttmepj3hi3hf.ux.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d9abce59sm1151715585a.46.2026.04.20.22.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 22:49:19 -0700 (PDT)
From: Ashutosh Desai <ashutoshdesai993@gmail.com>
To: netdev@vger.kernel.org,
	linux-hams@vger.kernel.org
Cc: jreuter@yaina.de,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ashutosh Desai <ashutoshdesai993@gmail.com>
Subject: [PATCH v5 net] ax25: fix OOB read after address header strip in ax25_rcv()
Date: Tue, 21 Apr 2026 05:48:58 +0000
Message-Id: <20260421054858.732939-1-ashutoshdesai993@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A crafted AX.25 frame with a valid address header but no control byte
causes skb->len to reach zero after skb_pull() strips the header.
The subsequent reads of skb->data[0] (control) and skb->data[1] (PID)
are then out of bounds.

Linearize the skb after confirming the device is an AX.25 interface.
Guard with skb->len < 1 after the pull - one byte suffices for LAPB
control frames which have no PID byte. Add a separate skb->len < 2
check inside the UI branch before accessing the PID byte.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
---
v5:
- Move skb_linearize() to after ax25_dev_ax25dev() check; avoids
  unnecessary allocation for frames on non-AX.25 interfaces
- Lower general guard from skb->len < 2 to skb->len < 1; the stricter
  limit incorrectly dropped valid 1-byte LAPB control frames (SABM,
  DISC, UA, DM, RR) which carry no PID byte
- Add explicit skb->len < 2 check inside UI branch before the PID
  byte (skb->data[1]) access
v4:
- Linearize skb at entry to ax25_rcv(); replace pskb_may_pull() with
  skb->len < 2 check (per David Laight review)
v3:
- Remove incorrect Suggested-by; add Fixes:, Cc: stable@
v2:
- Replace skb->len check with pskb_may_pull(skb, 2)

Link to v4: https://lore.kernel.org/netdev/20260417065407.206499-1-ashutoshdesai993@gmail.com/
Link to v3: https://lore.kernel.org/netdev/20260415063654.3831353-1-ashutoshdesai993@gmail.com/
Link to v2: https://lore.kernel.org/netdev/20260409152400.2219716-1-ashutoshdesai993@gmail.com/
Link to v1: https://lore.kernel.org/netdev/20260409012235.2049389-1-ashutoshdesai993@gmail.com/

 net/ax25/ax25_in.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
index d75b3e9ed93d..c81d6830af48 100644
--- a/net/ax25/ax25_in.c
+++ b/net/ax25/ax25_in.c
@@ -199,6 +199,9 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
 	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
 		goto free;
 
+	if (skb_linearize(skb))
+		goto free;
+
 	/*
 	 *	Parse the address header.
 	 */
@@ -217,6 +220,9 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
 	 */
 	skb_pull(skb, ax25_addr_size(&dp));
 
+	if (skb->len < 1)
+		goto free;
+
 	/* For our port addresses ? */
 	if (ax25cmp(&dest, dev_addr) == 0 && dp.lastrepeat + 1 == dp.ndigi)
 		mine = 1;
@@ -227,6 +233,9 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
 
 	/* UI frame - bypass LAPB processing */
 	if ((*skb->data & ~0x10) == AX25_UI && dp.lastrepeat + 1 == dp.ndigi) {
+		if (skb->len < 2)
+			goto free;
+
 		skb_set_transport_header(skb, 2); /* skip control and pid */
 
 		ax25_send_to_raw(&dest, skb, skb->data[1]);
-- 
2.34.1

