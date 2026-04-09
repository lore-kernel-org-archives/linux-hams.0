Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E303DE432
	for <linux-hams@vger.kernel.org>; Thu,  9 Apr 2026 15:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775747950; cv=none; b=jQhLp6AizWeCI4MtGM7248iPQh1w7GXjAHGu2qd8wcHD0bclG6PHs/FTsJUNXTtfV1CnEhMluv9qI2nrApC31jg6whX9474KDrmjyc+7nk+HA5f09xvHOBEdYVHY1WPD7e9G1gJdP4LGbkRlxlWVlyTfhhnRrAWE84MQepac6zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775747950; c=relaxed/simple;
	bh=T/erxDjW9UFZzf7bm2hBpPwN8nVpBgLLyvaiBrM62xU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XAQqafCbOwNxEnI3G/UN86wcxOAnI1cmJWu+/NAxj2hHK0h+HjE4OMu6axmrEhYjIe5ueOKgZUgBR8wQM5c2zRccukO1+YGlIyCFM2aX40aTrX7mlcXXwNFfOg0ExHxIrcbypj2msqHdsvbXJMk5GBhT44/DSGU8eHxwjltm9N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnooKcP8; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnooKcP8"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-605def5b807so324784137.3
        for <linux-hams@vger.kernel.org>; Thu, 09 Apr 2026 08:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775747948; x=1776352748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ht4C6Q0Frr+SWXmDtcQM792Kd3ZqmaPaKjBBDdw6zT0=;
        b=HnooKcP8Jh6f/JkmAkEhuzSmgCeHeKCjUNtCrPAQ7SbYaFC2OgU1Q6Il4hfjnN4ME4
         ht/s4Rw0+2W5Fuf2uKd3O2bF0tl3XDLv0KWvUQLcgKm9++9NxHmgYVMIQtq7C+oP+86J
         oi4e9BYwiErJki7TE/fouAjZLDo70MTCgtuL9jWCWEmoWBcHX79B5IKAZD45+x/y96yX
         ka7gaD9pyaUbxver4bl8TT5QgWzZNnE5YUXW2fK4RD19Nc9Ezt2SzfSE/oUDzvfGJwZn
         xbY5KgX5vhYRPKc9hudluIW/Pvp5s0LogO6fQjmXRJtmYd7yVEMoXPqtMAXBIbRx6vxs
         DDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747948; x=1776352748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ht4C6Q0Frr+SWXmDtcQM792Kd3ZqmaPaKjBBDdw6zT0=;
        b=OA6jAWDla5tBS3A7HTE7Qqn/JnghITKgp10ErkgbIjiEyQJURpXCgfDKCHnU2wzUJd
         cPAgNF3DiKCus0racfk2YXVq0tAaFmTUcWIg7cVNfLbZTugXL+6nhazWYKXUb0RWqTI+
         8YhCQgZI1KZfAUxsLRJVE2TcPHfW3vc60UkPSOS+Z0Uijvu8AMmyBE4Nk1iZNmf55iQb
         n17eTLKQ9L3dsbpeaiNUm/qv+pohM3uLQiIP8PcvW5jidbGQHnYCwgSFgP8beg+5tdDF
         vNL6Anbti2BNoHBsooOYCG2+2eTstRPWbT093YHi20FgrMccDK6Zc/ILid2bbjy6+CL8
         Ju7A==
X-Forwarded-Encrypted: i=1; AJvYcCWCUq1QpUAD8M15hMsnjJZ3NFEUSIYP0lDp2nMlB5ygDpbvNe7bJ/bTF74wxwRT1xQf+nk9DhrgqlAr@vger.kernel.org
X-Gm-Message-State: AOJu0YzVolRFWZKkyQ2EQdKliGV8JaBEH6SFbdwyMamJrgrVW74tqcOg
	VhXnTYkfwCyO35BNdHcRRw6GuonUwCq9Dh24jQ1/umFdzpAOtwz7/Kv9
X-Gm-Gg: AeBDietG3Flo8XGYyEskQjkw41c3SibksjcQT4YsiV8A0urNGs3UPaW0F30ZPioCsE+
	6UBxze3JYN3Oi7BUM/3S6W9fVT5Hwoc8SWq6q9QYbOQdqV6i82mKAsQyroAMMOUfTjHgXktx5Ze
	y8+vvGa0TPLE/v8cfbC2wAdQMhFu6rNs4AC1FV2CQvS+eIVw5Kzn0eeyvNu5JQXc5lzENjT8r6l
	EGSgksgAp+UHKViTAZq1LXJcyPEGISpgNxwvI1M+0L4HbinSAM/Ir37HdSRyIkka+aoccFztwkv
	6YxAG3jSJJY4ITS/WRvczkxED9wgU9UR9ZZa2vQa6i/cQPrJGdIcQfo06pH18AIU5JSVatnlffy
	sUgm9RbQjC6MaRqXZvA+/SKgTAqeG+y2P4dbvvwZrRklTQt33psydBL2s62xwAFiCJrS5xC6UMv
	2a3upyqb4jhH/qtUrY9gyNNj+4JgwoyERMZpiaR00EWKlP7fPpPf1IhocfNnqYKyMkQ6KcbcuFF
	LpdvwGLEa3Z6bXBw6SAAcYzc6DyA2BJ4O9mzds=
X-Received: by 2002:a67:e113:0:b0:5f5:4d9b:bd67 with SMTP id ada2fe7eead31-605a4e20b60mr8913640137.6.1775747948440;
        Thu, 09 Apr 2026 08:19:08 -0700 (PDT)
Received: from TDC4045031631.e0cglfehwr0e5gttmepj3hi3hf.ux.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5969156d3sm202318526d6.31.2026.04.09.08.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:19:08 -0700 (PDT)
From: Ashutosh Desai <ashutoshdesai993@gmail.com>
To: netdev@vger.kernel.org
Cc: Eric Dumazet <edumazet@google.com>,
	linux-hams@vger.kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Ashutosh Desai <ashutoshdesai993@gmail.com>
Subject: [PATCH v2] rose: fix OOB reads on short CLEAR REQUEST frames.
Date: Thu,  9 Apr 2026 15:19:06 +0000
Message-Id: <20260409151906.2218957-1-ashutoshdesai993@gmail.com>
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

rose_process_rx_frame() passes skb directly to rose_decode(), which
reads skb->data[2] without any prior length check. For CLEAR REQUEST
frames the state machines then read skb->data[3] and skb->data[4] as
the cause and diagnostic bytes.

The original fix checked skb->len after the rose_decode() call, which
was wrong for two reasons: rose_decode() already accessed skb->data[2]
before the check ran, and skb->len counts bytes across non-linear
fragments while skb->data only covers the linear head - so even a
passing len check doesn't guarantee the bytes are safe to read directly.

Eric Dumazet pointed out that pskb_may_pull() is the right approach
here. Add a pskb_may_pull(skb, 3) check before rose_decode() to cover
its frame[2] access, and a pskb_may_pull(skb, 5) check afterwards for
the CLEAR REQUEST path to cover the cause and diagnostic reads.

Suggested-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
---
 net/rose/rose_in.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/net/rose/rose_in.c b/net/rose/rose_in.c
index 0276b393f..b9f01a11e 100644
--- a/net/rose/rose_in.c
+++ b/net/rose/rose_in.c
@@ -269,8 +269,18 @@ int rose_process_rx_frame(struct sock *sk, struct sk_buff *skb)
 	if (rose->state == ROSE_STATE_0)
 		return 0;
 
+	if (!pskb_may_pull(skb, 3)) {
+		kfree_skb(skb);
+		return 0;
+	}
+
 	frametype = rose_decode(skb, &ns, &nr, &q, &d, &m);
 
+	if (frametype == ROSE_CLEAR_REQUEST && !pskb_may_pull(skb, 5)) {
+		kfree_skb(skb);
+		return 0;
+	}
+
 	switch (rose->state) {
 	case ROSE_STATE_1:
 		queued = rose_state1_machine(sk, skb, frametype);
-- 
2.34.1

