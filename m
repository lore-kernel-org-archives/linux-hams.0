Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C7D3612E9
	for <linux-hams@vger.kernel.org>; Wed, 15 Apr 2026 06:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776235037; cv=none; b=NGGOT6plGANQ9PaBvIimQ0W/wSZYFCsti7pJBKhnFHmYkjI42iyOsgpzyNwbUdhHPRr7eAjWxatJRDDvrY3zwWjo4Z7LtHsGAHNETDI4S0Pjo0m3cd83D9Ta1gLwxtsZ4xL0jcg44pTkjzKt29wpYU6GRHcqzr3xrWbVhkAzUgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776235037; c=relaxed/simple;
	bh=yJ9CzZdh0ITtrg/Qg4Whi7FTsOhB5NFwZmHZHk5gvDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UB18BbwjHz5uGqsYypynShcomo/Nt5Ypr4dtxK7P44wadWYjYcKrQ9FyIEokwtNUdMTLGNSf2zuMJAssRiCc5tAhuElqxmzXJVed7o2Mzz1yX+zZpwTsuMtEZc1kQQMgThR9IcgsFGx905tKrMS8Rf93S4bSz9Qv9s3UxYmuHuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzME5p3c; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzME5p3c"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-506a6cf8242so48843981cf.1
        for <linux-hams@vger.kernel.org>; Tue, 14 Apr 2026 23:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776235034; x=1776839834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rrC9vNrM6E6rzZeBaqxVv48Wut0j5e/JM27h9uWS1lQ=;
        b=LzME5p3cZ//ZOSu7QCVtD6m3PnoYyPtXmpsibWdgflbxsNBCfy2GRVPZNtdXHqqI09
         9wjUKpf+PObtTmjsiMfPiWuoVqIMwf/xCf3ghGfEYCmF5/4dUhH1ojyedtqPzaGptyU/
         pyA3mkEhLMSfpIBlkbt7FGp3+Kejsix0vVXOKilLFDxmvBjbY46Ujf48/4d2XkoZo6fQ
         Fr2qiob10hzpVyUmkek0gYKDiMo/tVcEsKSlNeZYB1un9G+Rjb/g8id3kFkjZWWtP2Td
         z2Q1xN9aZtsTMMWHpVDYBnZ+uYfehu5FMFAyOpfEDUgPSJxBPfQTpJbFOcq19HFTI7jK
         o8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776235034; x=1776839834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrC9vNrM6E6rzZeBaqxVv48Wut0j5e/JM27h9uWS1lQ=;
        b=ooQljqQrXPsKEHiOXmRwgZDkjQK+kJgOAzyON/8AG942gI/y98FIHgYGkKSd6/NroO
         X81mcsDWVwrvUwFKOyTP71rVBw4Jj7ibz8FDRqLNtekvhC6gHTtId7XTJLZCmDjVE/kh
         i0MDFL/j9pMhn/e41SFEhlWXQh9BYNvsVfYPh9MGm1CPJ3TiFTu3jiZ12XHRXIRsr1D5
         FMPzjb2YfWPeMhyDz/WRCoYzjfXnlVRvOBCheNXUjyzM/IssU1c4ngwF5AmivGB30EVU
         QUngwHATStT3dL63khbA6qIHm8IQVTzVKpmynXtnzXVQzjhxBmt+736tkhm9dKqiNWPs
         smrw==
X-Gm-Message-State: AOJu0YzNhUkOZx4wKOez9EAHLM+OlNZsW/fqMbwELdC0wOQ+qhOZ7KqD
	fragxmTdqUCtVkl+89EyZHRdA29d082optP81AN0+xtFeCKfXbgiuWhy
X-Gm-Gg: AeBDies+4zMwAYvTjYu5K0iLziREeQpqd5oV7aoLMJbAnwrrgjCSesRSJLCRcT64LB2
	uheGEpUNVxcntadVmd5M7cQ8KqDGCqunP23ImQkumZZn4nycXX6dEvEiRnc99zt40vLpGztN5Ay
	kIwMv4RUALUgNtNxLe/sCpcPXXgRVPmwKKjuKHvS9og54ARxctSYZ4x8R51lWt4Nx/xJjNuWKpF
	mZSSyNaqk8yfi9lp13/X6kJImZqHACUR5zbWSAiIaZvNjTML2cjAnj2sT2XQQSNwcAGOqGmoOYd
	dNy/m0yaY/nE+d683n9a9DATnYJYJZx/vswTUTNgNg3sL3pmx16NpTb8ujMjnwlhO2d2IfLG6e+
	QNWRvo2dIb/SryUf+e9wpmJ79GIMiqSgOclFNqJzM53DMyeDmsP3qhTw16YwDh14XSTLciRohxK
	PjvGUwVCbAZIN1hK2SB1mOEcsox3OPw+W8sW3O5n/6FPfGs3dc+LDz9cc9TL/RVIFQsQFDK1+pb
	yhfiy33uZ6f88/Pnbe8GAJrJo6R0Cdl+03/iDo=
X-Received: by 2002:a05:622a:134c:b0:50d:82ca:7c9c with SMTP id d75a77b69052e-50dd5adaf18mr314133561cf.14.1776235033794;
        Tue, 14 Apr 2026 23:37:13 -0700 (PDT)
Received: from TDC4045031631.e0cglfehwr0e5gttmepj3hi3hf.ux.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e1afebd48sm6222121cf.26.2026.04.14.23.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 23:37:13 -0700 (PDT)
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
	Ashutosh Desai <ashutoshdesai993@gmail.com>
Subject: [PATCH v3 net] ax25: fix OOB read after address header strip in ax25_rcv()
Date: Wed, 15 Apr 2026 06:36:54 +0000
Message-Id: <20260415063654.3831353-1-ashutoshdesai993@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A remote station can send a crafted KISS frame that is just long enough
to pass ax25_addr_parse() (minimum 14 address bytes) but carries no
control or PID bytes. After ax25_kiss_rcv() strips the KISS framing
byte and ax25_rcv() strips the address header with skb_pull(), skb->len
drops to zero. The subsequent reads of skb->data[0] (control byte) and
skb->data[1] (PID byte) are then out of bounds, which can crash the
kernel or leak heap memory to a remote attacker.

Use pskb_may_pull(skb, 2) after the skb_pull() to ensure both bytes
are in the linear area before reading them. Discard malformed frames
that carry no control/PID pair.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
---
V2 -> V3: remove incorrect Suggested-by; add symptom, Fixes, Cc stable
V1 -> V2: use pskb_may_pull(skb, 2) instead of skb->len < 2

v2: https://lore.kernel.org/netdev/20260409152400.2219716-1-ashutoshdesai993@gmail.com/
v1: https://lore.kernel.org/netdev/20260409012235.2049389-1-ashutoshdesai993@gmail.com/

 net/ax25/ax25_in.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
index d75b3e9ed93d..6a71dea876a1 100644
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

