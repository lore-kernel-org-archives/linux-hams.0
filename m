Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A61C30F94D
	for <linux-hams@vger.kernel.org>; Wed, 15 Apr 2026 05:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776232695; cv=none; b=ab1C+O9sMVYLsvJq6+OZG5Pkm/Kf1aVwOVfav7d0RROzWeR7UczGoI0cxiXOynHft0w6k2wqH/KWSjilMK5d0SQPIoFEjuQFh7GVkQmyLpTKqsNYRIamaGK0kJzKg49z3BQIDCr43xe5qWSZl3wOd6lOrDiXBG7kEz8d5/C4jHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776232695; c=relaxed/simple;
	bh=YJk7HFFywOAvglX29zYP4iiLAIOHUmcE1zceWMyjEtA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rdplr/Byilb6LOr7vddAOLvuzhUx+QbpuHqOG4nz13XaZ6FEi4MA/K84ryNB0BJ5euy1yuoK7qGOiMniR0iWtUEY1d2XrqcaB4++AWxhmP3RF/AK/5r+mL2nWvP8z8LH9al0SBUnaPwuo/HyGKkr0lrQEoRlYqA437zbDtRM9o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlW0yCkL; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlW0yCkL"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79ab5fd969aso69712147b3.0
        for <linux-hams@vger.kernel.org>; Tue, 14 Apr 2026 22:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776232693; x=1776837493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J7Qu+iufcZ9jYk8S+wuxRjUaOgj3R8vJUSvzid2gdM4=;
        b=TlW0yCkLIUBrvRuZTGswlI+GJHBMFFyVA1SRcXn5BMqV9Ujb5FhwfPEBoGmxCR3hL2
         CdF3kooUryWPabs6wKdosOsBxrtCE/SHio/Ii8HtuUCZ6f2fE8c0RDM/Yo9zoNIR8nj2
         6J4YDpN9TZfWhspbIOohqeDLPw4aHcwBv3uS4WZ96GhkdsqtCTQr4OR/PXvZXPpoFkbB
         e4NgD0w08T7n76l5FEOK53jFB4lYGJp0rLQiYW+UaFk9A1q24Xc9GWDRZwIyy0fcmaIm
         XEQ0b718Xvn4SYcubqmyq4A6lk703CF/FEtdUNMmHJuIIERo3wYNFpLCyM0QV6528Gvn
         CDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776232693; x=1776837493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7Qu+iufcZ9jYk8S+wuxRjUaOgj3R8vJUSvzid2gdM4=;
        b=B0C1v4BJGVW9zk5fjunF3e7ujzRRGSoP3rEGIwp3/Le27/zjyQ6xFcjdNNZSkPRJix
         ofnYwWyFcXS2E54G/e44lwCQqGkkrAxWYvvJ6yFA88KWLeO3oZLQQ8J++Pv7T3q5d/Lu
         EmC12bPlepgL8vY2OeC6OsKYVE6rQDbY3ycqnMtcHm4xpoMSzBISbgwShQVvCaJCuU9s
         OoMZZN0Yg1V+cYNu8vVyHTWl0AiL7iU7MPs3aM96Z7a/rXE0m26iQed8iNBJ2QxX8lUI
         G3vwhUd9t/+DUf7+4kFs8+HqGqGI9qNb2vkwMvHSN9ljVvQrepsk9J32PPRXGUMHdc75
         9ZGA==
X-Gm-Message-State: AOJu0YyT0uKJGM/FmQC35Oz0oznGfOOh3cTyD9DwPUhrBE3dY2y7llgj
	EED4sbS/ZhOOJZNCjfIMKPD52I29Z869XjC59LNg4NE5ixpZuDtj4vzL
X-Gm-Gg: AeBDietBKS8f+ZlzkjaNxjNyMAGCnxCHypHM+t2GZ3Pguqwsl//r6MWaHkm8LGX1rpO
	jGwWjB764xFXK56iRgtYwepxvNZ/+ih/neynYn3x7WbTpHPWmeLFhMSzc6DSL/AJQ3NDtfrF6aO
	kFn5/9PYv+Vuo1N8sl3i68Yx14I3jPnC7xmaFlSPYJF8l/+cmU6eqKZK/o/GiEDxMYtUjnoVJsJ
	hvkOhNMw+oMjaFwkAOEGaUCJmYnoS/SbteJZjAgBzT9XbznXhX+m+8gyqrclMW520tHsr8ki5Y/
	k9wD74xeebjFcJnklr66FdpqGAPValNEn2DPffCjaqTV6i3GjCw/242Ypky9jEjX3o5We9Gjp/V
	fv8cYJIsT3sRSOJoWvcnOuUBtCVJyxJK8eJSaUiiyo2qFN7P+2ymAqibzbJFsbmIeO7Eou+tQh4
	v1y/ik7z/7WJNoyH+wcvBiUFa2j6TpVmejiZgHJgUVVxytm6Dkhagj1Sc9ANbHDnsaFZTciAW0B
	F5KILfaqp8FUYLeecOrroS/uVkT8q2dAaLIZvs=
X-Received: by 2002:a05:690c:85:b0:7a2:f14d:5a1 with SMTP id 00721157ae682-7af7252df6emr209920057b3.49.1776232693315;
        Tue, 14 Apr 2026 22:58:13 -0700 (PDT)
Received: from TDC4045031631.e0cglfehwr0e5gttmepj3hi3hf.ux.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b768d387eesm4440177b3.29.2026.04.14.22.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 22:58:12 -0700 (PDT)
From: Ashutosh Desai <ashutoshdesai993@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-hams@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashutosh Desai <ashutoshdesai993@gmail.com>
Subject: [PATCH v3 net] rose: fix OOB reads on short CLEAR REQUEST frames
Date: Wed, 15 Apr 2026 05:57:56 +0000
Message-Id: <20260415055756.3825584-1-ashutoshdesai993@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rose_process_rx_frame() calls rose_decode() which reads skb->data[2]
without any prior length check. For CLEAR REQUEST frames the state
machines then read skb->data[3] and skb->data[4] as the cause and
diagnostic bytes.

A crafted 3-byte ROSE CLEAR REQUEST frame passes the minimum length
gate in rose_route_frame() and reaches rose_process_rx_frame(), where
rose_decode() reads one byte past the header and the state machines
read two bytes past the valid buffer. A remote peer can exploit this
to leak kernel memory contents or trigger a kernel panic.

Add a pskb_may_pull(skb, 3) check before rose_decode() to cover its
skb->data[2] access, and a pskb_may_pull(skb, 5) check afterwards for
the CLEAR REQUEST path to cover the cause and diagnostic reads.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
---
V2 -> V3: drop kfree_skb() calls to fix double-free; add end-user
          visible symptom to commit log; use [net] subject prefix
V1 -> V2: switch skb->len check to pskb_may_pull; add pskb_may_pull(skb, 3)
          before rose_decode() to cover its skb->data[2] access

v2: https://lore.kernel.org/netdev/177614667427.3606651.8700070406932922261@gmail.com/
v1: https://lore.kernel.org/netdev/20260409013246.2051746-1-ashutoshdesai993@gmail.com/

 net/rose/rose_in.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/rose/rose_in.c b/net/rose/rose_in.c
index 0276b393f0e5..8e60dc562b4a 100644
--- a/net/rose/rose_in.c
+++ b/net/rose/rose_in.c
@@ -269,8 +269,14 @@ int rose_process_rx_frame(struct sock *sk, struct sk_buff *skb)
 	if (rose->state == ROSE_STATE_0)
 		return 0;
 
+	if (!pskb_may_pull(skb, 3))
+		return 0;
+
 	frametype = rose_decode(skb, &ns, &nr, &q, &d, &m);
 
+	if (frametype == ROSE_CLEAR_REQUEST && !pskb_may_pull(skb, 5))
+		return 0;
+
 	switch (rose->state) {
 	case ROSE_STATE_1:
 		queued = rose_state1_machine(sk, skb, frametype);
-- 
2.34.1

