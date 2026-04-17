Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCC83624A6
	for <linux-hams@vger.kernel.org>; Fri, 17 Apr 2026 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408879; cv=none; b=nEF5m0wCMAtudTrpxfaV+hJDCrweHoWhdesaIxVs8wmnoluJHBmW2LczUiluTsml+M5IY2h803Kc6Pfa4kbQ7XazJ6i6kVnCViApDlOJBRUT57Ozqj4TosZdRSDyIAkgbf4VWMBy0aY5/ItUDALp8gVuzICKFUlMWL5JlPVVekY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408879; c=relaxed/simple;
	bh=UdyI0MLqzaqJUekJ8644S6ZTpHQmBZWss+KW7Oq1u9c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fZgXAxbRl//PNzCmiRJS7EiovXqf06EJTZecM4y/Qpq6MbRYGykusSC7gxe84ThpW4Paxk8tjHiV3SS1fIwVSI979UL4qfa5utjB0Fbdr7CXJsj94JLv9ZQypeinObsrJGHCZXCmAf7a3QKwRXpdKfLp8HNf0uiBim4Vg7A8ttI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLOwRKbP; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLOwRKbP"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cfc085395fso32097785a.2
        for <linux-hams@vger.kernel.org>; Thu, 16 Apr 2026 23:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776408876; x=1777013676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l+U16PxstDR4L4OQVQNTIksMWdGsxQeNQ1RCa7J7x8Y=;
        b=HLOwRKbP7AwKrJeApv3KVfsLN6J5FEOZH9nJKLKZCuTjD8jugIK2a/Y2zHP/11kiHv
         Ile1yPrE6kMl49epVH/HnTLEx2N5x5AhD+eW7QCgQ9NjZA9j1/e+Z8mDFsukkvvMpyl7
         UEOn4cIExCzdes+iBHiBOCSwtYONLBAOvFLPBu0ioobdfeBIyAWFti+pakXy7XeILgB7
         6VjS28+Qa1VUe+igbM5ahtsnvh7nQOtyv9P8uXYIDWe++Zfe9jDrqrLF0XSaj80KS+Ns
         NPu3R/1pBKbXYLw79/cFoxoQAknGRJeSjM0bRnG5e07W+Jakwx3CYEH8PtbdKCMF6sPn
         m6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776408876; x=1777013676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+U16PxstDR4L4OQVQNTIksMWdGsxQeNQ1RCa7J7x8Y=;
        b=F8+Dqnmk+GNj1vLTzNOxYN7+hyjMPbcrJHlazLVodHC/cM97zM8tO8IVyoKTUOEIeG
         Gs8nHeqQt5XTloCALtBaY+LfmSE69/fy4E9HCK4FtmvJ87PVrwt7FliczaLO53ZCi1li
         gKIPfnGOxStCiqujHnOkWdaOzHtpE8ENecJyJUSz2nyuNAvtWvD6aZ7mCp+fDtaQwo9q
         9UefsfhDBcxNT4e3BRT7lwawrTe1wDZjO1Ko7pf/3AdQtXTP7Fj5Z8H8ooLaLyUrVfZD
         eVm1ULpj8mgAY2T+eT7V39qAwR58YzxCQIqIniY1TUNaHsoeP7a2T7Ly7v0h7+3BKOPZ
         no4w==
X-Gm-Message-State: AOJu0YymhYpAe6DrPWzMPHwenqgj8WMzKW7pN86AWFf/Z5B4RQ3VUIVR
	RZ2vVbYAqA3qOkbC37SbNWMfp+C6uAqvfG+y1VLKHS/ENpca0jHsdeos
X-Gm-Gg: AeBDievLFbLoFg2TO/DhLv4ivInx0VrKOAuSH06zzyBduhdThFQ4dq4l/VZPglvKzan
	64knDRYE2OGtIcypXjZmi0Bo9wW21IAWEz98OYmeSZDCXiRNvEI995hYDrwdKqRfqwu4WniX0H7
	hdL7F024x54qsQeM0aw5qS/Ug6PQi7xl5fITeLv9GIuhslQclhL3YkQU7OJYCrDtN/d1yP6c6nk
	ZWpluh5wxsclVBDFSOjyBekGvJFdI/gdRUhl9yliQQKLhTGAVcXpEnfRTgRl2MPCo43N+gvuTuY
	Wb2qs1HVWgkkMUSAu2FJwJUwMoTPDKZtnrdUmavBoEHVHGLTIouLOijBuM7fqA0XDlFbujD+OSy
	AmQQDpB64vbLNVSpMy2GKEr3oBPP7eR/7XHnY5LF7sO2FqopwXjlhuaucg6nxef1VceV7mLtSOL
	FPhKrAyOEekmQF380pMhVySngC9CLuxDhNqWI1Tkh0prE1UrLrS+aNnAAVFYpngm7UgYnbscZGu
	Y0JLQXhbMJcUsc2fRInE6iJ3IUCo6OaJV7HbtI=
X-Received: by 2002:a05:620a:28d1:b0:8d7:3f45:b95f with SMTP id af79cd13be357-8e78fb18dc2mr206676185a.16.1776408876364;
        Thu, 16 Apr 2026 23:54:36 -0700 (PDT)
Received: from TDC4045031631.e0cglfehwr0e5gttmepj3hi3hf.ux.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d6ba19c3sm46771285a.21.2026.04.16.23.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:54:35 -0700 (PDT)
From: Ashutosh Desai <ashutoshdesai993@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-hams@vger.kernel.org,
	jreuter@yaina.de,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	Ashutosh Desai <ashutoshdesai993@gmail.com>
Subject: [PATCH v4 net] ax25: fix OOB read after address header strip in ax25_rcv()
Date: Fri, 17 Apr 2026 06:54:07 +0000
Message-Id: <20260417065407.206499-1-ashutoshdesai993@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A crafted AX.25 frame with a valid address header but no control or PID
bytes causes skb->len to drop to zero after skb_pull() strips the
address header. The subsequent reads of skb->data[0] and skb->data[1]
are then out of bounds.

Linearize the skb at entry to ax25_rcv() so all subsequent accesses to
skb->data are safe. Then check skb->len before reading the control and
PID bytes, discarding frames that are too short.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
---
v4: linearize skb at entry to ax25_rcv(); replace pskb_may_pull() with
    skb->len check
v3: remove incorrect Suggested-by; add symptom, Fixes, Cc stable
v2: use pskb_may_pull(skb, 2) instead of skb->len < 2

Link to v3: https://lore.kernel.org/netdev/20260415063654.3831353-1-ashutoshdesai993@gmail.com/
Link to v2: https://lore.kernel.org/netdev/20260409152400.2219716-1-ashutoshdesai993@gmail.com/
Link to v1: https://lore.kernel.org/netdev/20260409012235.2049389-1-ashutoshdesai993@gmail.com/

 net/ax25/ax25_in.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
index d75b3e9ed93d..d14ccebf9cdd 100644
--- a/net/ax25/ax25_in.c
+++ b/net/ax25/ax25_in.c
@@ -190,6 +190,9 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
 	ax25_cb *ax25;
 	ax25_dev *ax25_dev;
 
+	if (skb_linearize(skb))
+		goto free;
+
 	/*
 	 *	Process the AX.25/LAPB frame.
 	 */
@@ -217,6 +220,9 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
 	 */
 	skb_pull(skb, ax25_addr_size(&dp));
 
+	if (skb->len < 2)
+		goto free;
+
 	/* For our port addresses ? */
 	if (ax25cmp(&dest, dev_addr) == 0 && dp.lastrepeat + 1 == dp.ndigi)
 		mine = 1;
-- 
2.34.1

