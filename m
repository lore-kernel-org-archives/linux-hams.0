Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EF236C9EE
	for <linux-hams@vger.kernel.org>; Sun, 26 Apr 2026 14:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777214594; cv=none; b=JYMrRAWI1mWtPU/zBdpnVfOS5UUNjr6Z705ctCjX+IgkTubG1B3EdXPik7l396f/LVDT/M0lmlBe0RCSPimpWMqIX1+WdM1rhK2wPfCYpguG6lAmL9bBaVz6BVD8ulwM1P97wJUXv8RS1822adMtB/z78U8M+ituRxMcHKB32dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777214594; c=relaxed/simple;
	bh=omBg6V4Fvn8LmVTYDPlZGWlmNNg8jjHRCnm2bN1y8CU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jf7yutNp0BENtIpgvfqUUgTWp5jUZ39q7K1vSBl/7yjphQhbt88lP7ptXpAaeGuGHo5QcyasZwud5y8+9HTiElKvkjOzu0W4Uzvn4qgBdWoNO7UmrLD+lQYEji4cRff7a+ywIErVSBx1WW1Y1/nAR+fk+hu5kdW5rIyE7CIm5Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E11hbNXz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E11hbNXz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso130227255e9.3
        for <linux-hams@vger.kernel.org>; Sun, 26 Apr 2026 07:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777214592; x=1777819392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BIOcSBCSL76yWTH37hlldgnFggOiRZJIQY7KqIeVNg=;
        b=E11hbNXzs4GGTMoQ2hl3uxU/F1i8fd/D9KFLI3VMyVNKIp9AxnoWMsItpxZ0v0CjIb
         16zpLaAmU95mNphj1ppaC9j02951OArxB+AZKyAsuH76p0SOK50XGFhzq4Xvh1rmBPat
         zsnTFiFd1VIyxAlXYY7cQ7TXO/UaGgBcLAlxGMRxnieEJyV/mfxeRKIHLNibG6tUtIbO
         yUW+JywEcZQvFgW2o9FIG8smD6Exn5Fa/mGam1QxLMXM8UJQ6ph3oFB20LCx86XBejvo
         Yunp/Yw5ICY0C6Lym+zYO1bbGBm1IecWPTbZsFe5wTiVLWg5ukjo9At/NKZiIV5fNPEe
         zSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777214592; x=1777819392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+BIOcSBCSL76yWTH37hlldgnFggOiRZJIQY7KqIeVNg=;
        b=Elz9ynHlazT/KLXRDLdY0NMKieIQ6ELQt5OKfYxrAXDcxFGldsdlnfH+fjJr2v4nWH
         cPsFQP4uRypQGeLH+O7n+h+wd2BfmoneCs9AzcqViqgaWPloFRXHfwShb2hEsx5ekRcv
         8Amu6H9sYjQKHywopPxIjllwNvhlYiBIwCyWmCGPoGKUzxPlWo0uWNzIWc5QwSwCb0Ts
         +rwCR2ZgRrb99OA3EoRePzjh501RPBB9vXi2gQAawfvQt+d+G9kXI1Lr9aKAcMaf/Nqv
         lmINlXLWR+tFYfqJp0IN4Pen81iIaJBtwxpZMNUmRfhQGT50RGaYp4qLf38YZF6cbVX6
         /TnA==
X-Gm-Message-State: AOJu0YykMw8QqTqWgvKtXYqJe858mL+J1mfMUMrtWtKupxivhPUJin9I
	LR6Tz5R45jSt0l6yugImJad5Ys6YJJIOd+rV1M+gFumWv3HgvYwy3I5b
X-Gm-Gg: AeBDieuVmoBIEoBHlE6h24YM615ilY9NrroIlUOw/W1EAoHEhgPzaYwwxboAuVsdy2Q
	oPP8D6FwGe+5yt7Xt+JhJr2JOuIaLmcOL+HbfOtrrrJN34OxmJcqKXt12h0/5pFb3b69s4S9cMM
	bbV7znMryOkj6SgJ3Ds046Ctit7ffj86goO1Nz2YbsV5qgwwpf5vZ0F0+HJwRpQ4jxC+MzEos8D
	9/zMVmbkjXCOQOTltc1L8WVzDz8dddXflGhM2QTTZSSPXl3VugEawkPLK821TqkrtSJTD6QlBmw
	HbOQXYGChyGoIko9Vsl+nAiEyGN6H3zIiDesH2z+hGZ4ZzyCDWtLFp9reo3GglC0gUy9EKx9E+6
	tzJj9EZdzgC6UJZV0sh8hbkt9mYGW4OhwMpSWm9Vw4idLFYY+VMMg4VdmRgfdhHLH+sZinnH9az
	xLQD/YmxZGB8YvfEj3GKbp3xqWV/nRGDN5Cjkzky5KjFEvpEH93TFb5/ahuTd+N6+ujQcsCM+7f
	/OBAbjNffreKqXwsZoqG7/GyA==
X-Received: by 2002:a05:600c:c09c:b0:48a:5363:8cac with SMTP id 5b1f17b1804b1-48a53638e07mr263908545e9.22.1777214591567;
        Sun, 26 Apr 2026 07:43:11 -0700 (PDT)
Received: from ubuntu-f6bvp (lfbn-idf1-1-366-193.w86-195.abo.wanadoo.fr. [86.195.82.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc18bccfsm658230335e9.8.2026.04.26.07.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 07:43:10 -0700 (PDT)
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-hams@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	Bernard Pidoux <bernard.f6bvp@gmail.com>
Subject: [PATCH net 5/5] rose: guard rose_neigh_put() against NULL in timer expiry
Date: Sun, 26 Apr 2026 16:43:05 +0200
Message-ID: <20260426144305.984349-6-bernard.f6bvp@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260426144305.984349-1-bernard.f6bvp@gmail.com>
References: <20260426144305.984349-1-bernard.f6bvp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rose_timer_expiry(), the ROSE_STATE_2 branch calls
rose_neigh_put(rose->neighbour) without first checking whether the
pointer is NULL.  After commit 5de7665e0a07 ("net: rose: fix timer
races against user threads") the timer is re-armed when the socket is
owned by a user thread; between the re-arm and the next firing, a
device-down event or concurrent teardown via rose_kill_by_device() can
set rose->neighbour to NULL, leading to a NULL-pointer dereference
inside rose_neigh_put().

Add a NULL check before the put and clear the pointer afterwards.

Fixes: 5de7665e0a07 ("net: rose: fix timer races against user threads")
Tested-by: Bernard Pidoux <bernard.f6bvp@gmail.com>
Signed-off-by: Bernard Pidoux <bernard.f6bvp@gmail.com>
---
 net/rose/rose_timer.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/rose/rose_timer.c b/net/rose/rose_timer.c
index bb60a1654d61..d997d24ab081 100644
--- a/net/rose/rose_timer.c
+++ b/net/rose/rose_timer.c
@@ -180,7 +180,10 @@ static void rose_timer_expiry(struct timer_list *t)
 		break;
 
 	case ROSE_STATE_2:	/* T3 */
-		rose_neigh_put(rose->neighbour);
+		if (rose->neighbour) {
+			rose_neigh_put(rose->neighbour);
+			rose->neighbour = NULL;
+		}
 		rose_disconnect(sk, ETIMEDOUT, -1, -1);
 		break;
 
-- 
2.51.0

