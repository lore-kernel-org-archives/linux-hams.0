Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CA2376BF4
	for <linux-hams@vger.kernel.org>; Mon, 20 Apr 2026 01:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776650271; cv=none; b=qsC49fsg6MT+fY/MIzMEinTcppoMuG6XHScpY+aIVUqz+vQ4AR7eRfEeDBT4bohlxiwFsuGNUxyz/K0FGLZcSZw6mOrz8aE9OFRcSPahBjFPHzfJdYSOlJlmSMYY4rBtFRF16IAC++u5pPng0e+sRjDtGpILCnaoB6HysXBiw8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776650271; c=relaxed/simple;
	bh=nDOO/QVVxqLEgHoPDQz6EwQRY3Od75nFCAbkfCou6bY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y91Wav6f9LgvBgGSR5swkSWoNWuolbaG3QZgKEOeo5ua1Y702iiVspDOcEAIv+4uE6zMnqIRUyC1tycJUKifqDzZ5ZFlJMbzUJqwa+48FB/gBGbjgZAi8WC83PlwO0ENLjfCo+Ehtsi+I/evHeoYcVfR2ELdZG0IUph4D8gFyBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltfWM9Nx; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltfWM9Nx"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8a032383008so27203876d6.1
        for <linux-hams@vger.kernel.org>; Sun, 19 Apr 2026 18:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776650268; x=1777255068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tGxkhVLfHZjK8520beBJO1JbPMJ7IBle55iVGcEnGWs=;
        b=ltfWM9NxzQI6xg8W+qC8xfe2z+j0zYF2phPpwxjcKPYO4hYX3Ji01bNVpHe+Y6aheO
         avnOD+UbwJFJZ5BQzYyMTroAHn1slKiz/Ds1dmJDW9xxiOU37Clk71JUo7vm301pqYH9
         qEKJcpZrWsNjmtXIm3tNcUm4MYSYcdQQ905qz/VPvtlnwKXNAjt+Us5nUoh96M3meUg7
         6dUE0xsaayUzuwG1zF0hxM9E4OP4n2fIU8mmUASjvbPxKEjTUilLRFPlTdDmxUqCFFlI
         Bbx40GtAtMN6ynFjB4afDaP5awRY+CLyv9QVJkJOwBZzFBjP7TNGIRgS6E2uo4sshJ1B
         Y6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776650268; x=1777255068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGxkhVLfHZjK8520beBJO1JbPMJ7IBle55iVGcEnGWs=;
        b=ftiM+nVR3kypeZVcPLZ4izf1xgjIpBwm40YRORxsNg6TYo09QI16eSVpNmvftu6smS
         TtnkmDpBhWtKB6ZwWTzyVieVdTIwBGSmYyFJfCSf2hGIf5DAhnMvc/v5kiCzNffqWvGJ
         EQ5SBDmBSqztFfMIjQvMWi90o2X52YDupAJKoIeRtjqda9STPKV783l5xYpKD84al7tj
         j3986cggxfUk2ZzkpyujruuGqlGZg0c9Ac56N5hfbBhqfEf7s8sFEDn+NUTCTZBPLNWW
         vV+bJKwvO3Lyn1tXT+psw/9CTCS0j4yHNN9SvfFdV82GrOjR7yuZ66L+2ozXqXa6Qn29
         bHhA==
X-Gm-Message-State: AOJu0YweZyHxvs9cqu27V5fnZHQ5yC9AL0DTI/oEkVIy9rQlc5Zay4TE
	aVTWeqQNY+cBQ2rJIGGXH9Zi+qp4YPGD2tuk5qsD08hmel9bl9+PjTSOI552S49mMFXEfA==
X-Gm-Gg: AeBDietZHPRQowkvpYQKrsLSTERKV/bdZGx+TGrv7nV76gBVis9mGfWzqs+ijS/1RmD
	aKt51Kr1YLTJUG5HLj35CkDNqrUBuFbaJimzA+YPqexXyJUPuXjcF2AoWOLs6yyT6ZhbctjpWj5
	/7Lv4h7MqrPnhKSYLyEdHXxqR45e1UgvNuZh1Ad6Ij47+Vvy8Apz3qJHyJPMQ4hhYnhoEnAdhHZ
	takYf7Ax2CTUrWNIlKPqNSN46CbpweMK7uFql9EZ+G1wPpa/S9BRYrJVQg06mcHxJx9dRyd3og1
	O+IR0FTAO9umwv21ihwbIPz3kcx5hEwPUREXSF5l4yWegLCZMObmLOsO0SyS/A4VzDKDyoh8uEH
	sloY8RZT/9+7KBlGb66HJcIAsf7OfCj6OFct2v/dzuWPBFuKCIeVFYtYu+HbHwO4IMnZbheX+ro
	+t4I0CWrOuM4x8/PoymLmwGWgbLWZ1bDDKbYS2w4+iptx/BDHyNL7H9f4hzazFvAK+H1yo17AuW
	ueIP9FHEJJSLXEBs+L7DnoKsYm9/f+5Ik4yv6A=
X-Received: by 2002:ad4:5ecb:0:b0:8ae:64c0:c922 with SMTP id 6a1803df08f44-8b02817684fmr194814596d6.46.1776650268394;
        Sun, 19 Apr 2026 18:57:48 -0700 (PDT)
Received: from TDC4045031631.e0cglfehwr0e5gttmepj3hi3hf.ux.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae79733sm65963546d6.33.2026.04.19.18.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 18:57:48 -0700 (PDT)
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
Subject: [PATCH] net: rose: use pskb_may_pull() in CLEAR_REQUEST length check
Date: Mon, 20 Apr 2026 01:57:23 +0000
Message-Id: <20260420015723.462479-1-ashutoshdesai993@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2835750dd647 ("net: rose: reject truncated CLEAR_REQUEST frames
in state machines") guards against short CLEAR_REQUEST frames using a
plain skb->len comparison. Use pskb_may_pull() instead, which both
enforces the length requirement and ensures the bytes are in the linear
part of the skb, making the subsequent accesses to skb->data[3] and
skb->data[4] safe for non-linear buffers.

Suggested-by: Simon Horman <horms@kernel.org>
Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
---
 net/rose/rose_in.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rose/rose_in.c b/net/rose/rose_in.c
index ca4f217ef3d3..48183363d3f9 100644
--- a/net/rose/rose_in.c
+++ b/net/rose/rose_in.c
@@ -274,7 +274,7 @@ int rose_process_rx_frame(struct sock *sk, struct sk_buff *skb)
 	 * ROSE_CLEAR_REQUEST carries cause and diagnostic in bytes 3..4.
 	 * Reject a malformed frame that is too short to contain them.
 	 */
-	if (frametype == ROSE_CLEAR_REQUEST && skb->len < 5)
+	if (frametype == ROSE_CLEAR_REQUEST && !pskb_may_pull(skb, 5))
 		return 0;
 
 	switch (rose->state) {
-- 
2.34.1

