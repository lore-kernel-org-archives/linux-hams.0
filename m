Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCD42E764D
	for <linux-hams@vger.kernel.org>; Thu,  9 Apr 2026 01:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775698372; cv=none; b=o9sGNtTwmA2Ky0CZhiANXVjgpkb37miCotjMWDp2iwcQW+Yzcj96TCfboO5j0WcrpB1F0Z29A7B/26S2W90MldiLoD267nYMRuNL9Q+1nINxlU0HuCuHe6YZdrVPXzwGSUGeSI9TKAuSxPG8p9BgihmVmrSeC13Vfer91lt0smI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775698372; c=relaxed/simple;
	bh=ceurvPD39uZmHE7ZYdMljcXED72ZrKuWYWfD67F9jN8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UA9q/c2ycBQVS3JtweptkT6+hJVCkQrVmyJiChZhDBosOmOaii1gNNfM7EwkUkOpBpn6locvGMLGX+X2lukIIwptdzbixIt4ZkoY8O+6zbFBsmcQ+bCOUrgYq3NJ8JTk2LdATCzRufNxwkX3gNc0Z5gin+TUbpBMSGEFXKqgx+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlhMBosz; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlhMBosz"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8a08fa355a1so6036636d6.0
        for <linux-hams@vger.kernel.org>; Wed, 08 Apr 2026 18:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775698369; x=1776303169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YmlLOlUfJ6gKKRXnCcVenCQOaaM3E2xjVjNERB+O5uE=;
        b=YlhMBoszOyfNkLK8a0iUlX5ugTskv5BeK0APHX7+6hrgTU5NiKNJde1AJIFDzQ3dyd
         w3nT83Igq5FfX8RQAF4yljdCwjEJYhY0NqZuMvsShpJVSTQzJvjAf6HGjDHWB5MJWAk2
         jhXBzCPlJtmyv5cWr6igQTamlasatTKFntB0gHVhb3K2uPCW9/a5LAfPR3M6+E30zTGW
         h/+Vun2E45OZ6+2R5ngZOa/kVZtrVloO5gObKoqUmi7/JBx1/fLvmsjqPcqo5Q14pAou
         wc51sbLX/Rqa7eoCrSqUaDf76HtHy3Exg7IFfykhuer1gzAuHyrra5PIxP9eYzXlu60+
         t60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775698369; x=1776303169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmlLOlUfJ6gKKRXnCcVenCQOaaM3E2xjVjNERB+O5uE=;
        b=rVsRsWyo2/ubQ4XE5cnQYdVIR/xHiebci6guXZ8AFsNIQk3C1/ovGF72HajdDBjW7w
         2PrrLbKKKtTFtLeXTSE6IBz9UXM1REQAYcaA0UJ4RZPvtHyuKlbZyBLnFNbpnGpU2TXK
         N1m4B/cOAWUXR4NUBu1EU9ZxdiLWjQEaQO4c73MQQKVr4nxSa+c4WWjLsQrPm4uQEprq
         RfnQob3yIEgXbuoDMub250+TsTML/dcMVH1/N+fxwdarCVGhhtwsPI/OVRSPYxaCnSOz
         YC9ROFhDdjaYo0wgar2vM8fM03eN9zjpQyjQ/kVGLyUo5/msveAjffa9BC9rkgfmZVx/
         1wmQ==
X-Gm-Message-State: AOJu0Yx8J6WRVrn05o4J9LW+au9E9aIVCk/8o7Kw93FOGVkFOxsuF9ql
	yS+S1rMh30ZEEVMasjmg2RoJ12sVJ/aJgyDGscCU5jnOoyrOwpvKUpMz
X-Gm-Gg: AeBDietNlF36N0GSHyl618yMKMFbYKCESIzo5G4jpLjOF/YYoC12jXEXCg51SmsnF7R
	Mwk9oQKEIO3kuSorqVu4xhsYlpkOGsFxKvGdQf/zyt43E4IiUowdiIo/UaFAR0uSaOnj8D0H1PW
	rhVaOpCDW52c+2yc5biIVoC1iaPT3JVRXUh/pe8Rehta9a3v8piePWDpwqi6rbXravAwDTvorYa
	oY0bJ4cMIUzREft+o0cutPAE+JDTHdeL4CIN6ZrGvOg/vZxRXen7Or7zOmHqkLvcNw58emocxhF
	hU82OJF3DsAc1LlDG84LTo5ZeKPMCo5H08zBC2onZveWAm/7FUQnAG3iLEYoDTOVaE2Ablcj3p/
	1rdnlcP/VD9ANbG7njMX5jom9mzLYQM6gSn22etv7XvFJoXkRvuoAvEQeDjKmmY7xyPIX1hK5T0
	vCYh+g+ZMGTqWxmhN252fySIXG16XtLIj2sLBMAM7oQHJdYeU6piR/AQudQkyVvBe7EomR8xuBG
	ZpODvczj9i5wK7mJyqisYFrC4mr7JOI61YyzRQ=
X-Received: by 2002:ad4:5c4c:0:b0:8a5:104b:e37b with SMTP id 6a1803df08f44-8ac7441cc2dmr30872916d6.42.1775698368709;
        Wed, 08 Apr 2026 18:32:48 -0700 (PDT)
Received: from TDC4045031631.e0cglfehwr0e5gttmepj3hi3hf.ux.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593cec807sm186681866d6.19.2026.04.08.18.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:32:48 -0700 (PDT)
From: Ashutosh Desai <ashutoshdesai993@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-hams@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Ashutosh Desai <ashutoshdesai993@gmail.com>
Subject: [PATCH] rose: fix OOB read on short CLEAR REQUEST frames.
Date: Thu,  9 Apr 2026 01:32:46 +0000
Message-Id: <20260409013246.2051746-1-ashutoshdesai993@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rose_process_rx_frame() dispatches to state machines after calling
rose_decode(), but does not verify the frame is long enough before
doing so. All five state machine handlers read skb->data[3] and
skb->data[4] (cause and diagnostic bytes) when handling a
ROSE_CLEAR_REQUEST frame, yet the only upstream length check is
ROSE_MIN_LEN (3 bytes) in rose_route_frame().

A crafted 3-byte ROSE CLEAR REQUEST frame (bytes: GFI/LCI-high,
LCI-low, 0x13) passes the minimum length gate and reaches the state
machines, where skb->data[3] and skb->data[4] are read one and two
bytes past the valid buffer respectively.

Add a check in rose_process_rx_frame() that drops any CLEAR REQUEST
frame shorter than 5 bytes (3-byte header + cause + diagnostic),
covering all five state machines with a single guard.

Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
---
 net/rose/rose_in.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/rose/rose_in.c b/net/rose/rose_in.c
index 0276b393f..1ac9a6aee 100644
--- a/net/rose/rose_in.c
+++ b/net/rose/rose_in.c
@@ -271,6 +271,11 @@ int rose_process_rx_frame(struct sock *sk, struct sk_buff *skb)
 
 	frametype = rose_decode(skb, &ns, &nr, &q, &d, &m);
 
+	if (frametype == ROSE_CLEAR_REQUEST && skb->len < 5) {
+		kfree_skb(skb);
+		return 0;
+	}
+
 	switch (rose->state) {
 	case ROSE_STATE_1:
 		queued = rose_state1_machine(sk, skb, frametype);
-- 
2.34.1

