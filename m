Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459109;
	b=h1lP60FHSzyAsNJkO6EAs4EBX7mYAbIlmbrGLHjlG5M6KK/p59ovt6IeHdPOZYv1yGNa
	 daozZE4tptf4HL07CqaeiPWvo9cVV50WSAzpFeOaPXJxz2ze/kVG8MuqcUElNuDmlRGyG
	 v42YQR91REqtWPuJymF93DXOeUugigLMOKTvoPrJj05BP22TSIOk9qcq0p0ySTejP+0GC
	 eEBGixx472B1wWiQeypS3hQ1RPTwGVLKSm+7VPK3fKGtJ/JmIAUW0XeDZCAi5D6FfBEv0
	 yWMIy8fCbxLXJYwwRo30G5GY4APk/gdRsFz3OxZJ+kMQNvbY2/9gVwDcG5pR5rlOGuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B6rT2mc8WeFdjm1vVBne2NA+OPpqByCAF69se4xF3d4=;
	b=fzaF5Sgr7GmsH7e3kQYcXfjymDmZQaeHYB8V8lwqt3ZhUdszdMhGZcP8peKnYm8qTF8Q
	 mxOADRZ8MH5ltDtMglY2pss5afIYAJxeZChn6SAZWn1EueFZoHRbSSmfClkdCEVcYj06I
	 JWDoGC9PGTqHuNqVcfAc9gOWoIAqSXNnEi4nDAGbUtANZF7GSasm4yRIseT1zedpFqUgH
	 HYo6tB/IuUWFxobszphYkCvdyz4HSUWe0uYUnePIdiGqhGJScxyI1L3mhXuP3omt2urmH
	 sbhiO0WkjrxpRr6PwVLIEtK5s7uNg0v2l7dUB9+6HpFLltNmwZJlj9edFCsw3ooBa5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YCoxV0Oz;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138CA606A330
	for <linux-hams@vger.kernel.org>; Mon, 23 Nov 2026 18:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 138CA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YCoxV0Oz
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a3c08d6928so5090576c88.0
        for <linux-hams@vger.kernel.org>; Mon, 23 Nov 2026 10:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795459107; x=1796063907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B6rT2mc8WeFdjm1vVBne2NA+OPpqByCAF69se4xF3d4=;
        b=YCoxV0OzkOyM2fdNuBNuyjI011Ae7t2DkkCoTkbvytolV8hQiLw+LzzO+gevKO+G5l
         /4Q2S2vsx4TifhlQB/B9D9iy01p6u9chqcGCGtqMy3/4GZ4kne38GWyO7OYnwIBo7WPF
         R64JDFXDJOUUShESgPiEncrkfPHBHPQPzHarpNKemQNRZGBp/Zd/LAIGKATbw32X0R5l
         ZsX/Ru/LzU0WueBH8WPTjE/CuiVwMlssyqxgCvQHLZUtESI3+j0N8rDf3IoKDjZvBXfJ
         t18+Af1caLBxpPU3D6ndV6P38BnMWfMpIk/FfBEkIcw3Z0Lz2p3UmBjEX8zPTl1oyVgd
         A/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459107; x=1796063907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6rT2mc8WeFdjm1vVBne2NA+OPpqByCAF69se4xF3d4=;
        b=NEnb9TRCaRwb4why/i+XBPMcpDgcfDoMPZok3NZNOHku3cFxMWegfPgsCmqFGAo5St
         vI28L9eCxN4VX87EionF6HtkQ+2t0qmgl2ZZy6BxcLqV/GkKJcpSTsER8xLjS8sNZTV7
         GQ7ZX/FVEzfuOomJb9uG5f3wnzQ00UJa3KAfkN5Rq45QtercncinK8PKHcVEHNgJeBHr
         cOVy+Z53BkUGaqCTQpQXOoNLu1nJPpvmk8IpZ7HPy1R+AYK1AaYaoPwr/G9RD/KLb6pj
         /npAJI4Iyf25G6xBgKc8SWtcNywdunwL9QZIng8W088rFjs8rveLTzOPt1a5m9sJV67G
         kUTQ==
X-Forwarded-Encrypted: i=1; AL+hErEwX3ZbIjXrxTs6mOiOF849ir2Wdww2yHINVZiQZvQlOkKrP3sEQ6Bh0KLpbpBrSxdKI6TN4sYK9o+x@vger.kernel.org
X-Gm-Message-State: APuU4Z8skwxXti2NZ34jIumSeHIJlsir6bzqeSiXJtqDVCKe8XIWc8fU
	8JFKq2qCrWWWF9KHNps3PZylLgPobbATxGKJNgZLL7KSIv/GAKorf8uL
X-Gm-Gg: AZFdTZftYPfCRm/xDq+gmMNsVSVgBJ3ZfXtIEruEDTAn2EdKluxAaGWayb59BZWw0oR
	C4otBQZjvYE0ovICjYoBGTwPBsSdOlEZNjcjVklpsSqNDvDUeQRJYTfvw9fbJ7sNC4mMkC/cAs/
	miYxHPVY8WV9AV//WX/YT/qrPKYnKuqbZ4WzfyKWBXm3RLxdP1hh7kZpznYgzAEJKW/z63zAcxz
	QIimfnWPDVenw7iCVT/c/0qyRLFapMSjqDrameGx3G5y4ejucdsaj2QbnkHatElrfEaXiQ2q8cq
	luksP9+XiILNipgsvTMDttyJj01Rbb/tdYpZC2pZq+qtKjjnebh4L0jleClAF+rjKqDMRCUTrtM
	6SftK7LkTBqW2f7QokToProcQcttXU1RtQRcMEEvKOkdO4NDFZ5KWjHJK5YGrQrSpJrHXtVGAhq
	noU3+LeSlvXOwZws0BBGugtqP/lNUYKBcwrkP87/sRZHwFwp/Ld0BKcvHJ5gWgQjodufliGUMSs
	b5kIPX9G/iidt8JMA/1lx/Y6Jdf5QGWMv6SMywQSHpeOKxsL3BCUeqZ7hzLn5kh6iA6B4reGz15
	oRmLvWDwLi1DIeM10KJvIo0f5BRP+nok/ofzdrmIqQY8d1+r1iRA9A2IRNyjItA+AmcMvOJTT6g
	djWzk20FsKd5ag7ZxOyCZuE+lww==
X-Received: by 2002:a05:701b:2604:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1b5568b9037mr12781657c88.27.1795459106853;
        Mon, 23 Nov 2026 10:38:26 -0800 (PST)
Received: from ip-192-168-31-150.ap-south-1.compute.internal ([2409:40d2:2011:872e:6565:a2df:e6e1:88c7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm28875720c88.3.2026.11.23.10.38.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 10:38:26 -0800 (PST)
From: Tanuj Sharma <ertanuj96@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: gregkh@linuxfoundation.org,
	netdev@vger.kernel.org,
	linux-hams@vger.kernel.org,
	stable@vger.kernel.org,
	ralf@linux-mips.org,
	horms@kernel.org
Subject: [PATCH] net: rose: fix OOB read in CCITT facility parsing
Date: Tue, 24 Nov 2026 00:08:18 +0530
Message-ID: <20261123183818.24508-1-ertanuj96@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:linux-hams@vger.kernel.org>
List-Help: <mailto:linux-hams+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hams+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rose_parse_ccitt(), the 0xC0 (variable-length) case validates that
len >= 2 and that the length field l is in range [10, 20], but does not
check that the remaining buffer can actually hold l + 2 bytes before
performing memcpy operations at offsets p+7 and p+12.

With a short facilities field (e.g. 2 bytes) and l=10, the memcpy calls
read up to 15 bytes past the buffer, leaking adjacent heap data into
the facilities struct. This data is then copied to the socket and can be
read by userspace via getsockname()/getpeername().

Add the same bounds check that rose_parse_national() already uses for
its own 0xC0 case: if (len < 2 + l) return -1.

This code was removed from mainline by commit dd8d4bc28ad72 but remains
in the 6.12 LTS branch and all prior LTS branches.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Tanuj Sharma <ertanuj96@gmail.com>
---
 net/rose/rose_subr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/rose/rose_subr.c b/net/rose/rose_subr.c
index XXXXXXX..XXXXXXX 100644
--- a/net/rose/rose_subr.c
+++ b/net/rose/rose_subr.c
@@ -369,6 +369,8 @@ static int rose_parse_ccitt(unsigned char *p,
 			/* Prevent overflows*/
 			if (l < 10 || l > 20)
 				return -1;
+			if (len < 2 + l)
+				return -1;

 			if (*p == FAC_CCITT_DEST_NSAP) {
 				memcpy(&facilities->source_addr, p + 7, ROSE_ADDR_LEN);
--
2.43.0
