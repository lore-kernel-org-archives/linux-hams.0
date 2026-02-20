Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B3F35957
	for <linux-hams@vger.kernel.org>; Fri, 20 Feb 2026 18:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771611839; cv=none; b=CNcxh9Cj4/D4KpA5f4sjNugDfUpU0fUgk821l/OiqAewH8ANxBA7P1vTJZXskDj6NhyvCBXM/WY43CR/9N3scXPYcSkEE38pXNG77wiDXXuqna2mh40rUfl8Erh5jfosI5M84hX0oA+GzT5/TPr1Mo1NITH3VXXIDB8bX2ze7dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771611839; c=relaxed/simple;
	bh=KoFVZUrXQFdWoNnBFDEy74wL/O85YIdUWdvx6VbTE/w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S37249wdQ6ijnN2ySOgDM9xUF/18I+I1QGWjk8KSeVQ1dGxzhzlR+ctPWgvTZZtP/Pr9/qs9T/JN4wtNzlUPCdg0PuPf/T128CmXDg+lmS893jSz2ryI13eBg5z+ILeHYxvuunjeUqZ9++QbBdGliiw6syIBCT1NUx6NAtvVhdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jV7dBTwb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jV7dBTwb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-480706554beso26909835e9.1
        for <linux-hams@vger.kernel.org>; Fri, 20 Feb 2026 10:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771611836; x=1772216636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=H/kcVI/Tb9XBIhFeAqkIfFUxMqaBQ0pLaC2viVqZjLs=;
        b=jV7dBTwbNMdxxfKFcMxp+vtKyCd78u7YQ4RTGATsIc1moX9IaHvWKh6OY1COMC2GH6
         ooVjVT05Js5OabG8df2O9F4JA+ArwgWrzsCtVmcZiu15oC3qbhVIWixqSIAUUsd70xP2
         +bOeiHxkRT/NIb2escPv9D3oUZKah7l7J3abYNuA/Yb4m6Blwi980WZl5rXF/U5wfLK8
         opxizKD4NS4vAsbsMJ22H6U55TLhuY6sxNbeyZ+k0wEDbE5OOVEY8aT0pmtRlOCpRYOw
         aMqoquOiwIAjGmWkeiMPiE8kyL7ws1d2Dztg/6JM8ip3ISSKl7G7dpLwVp9qaOEThi2E
         KhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771611836; x=1772216636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/kcVI/Tb9XBIhFeAqkIfFUxMqaBQ0pLaC2viVqZjLs=;
        b=ZNFwGNmG9bGjdRCnVRDtzsMEvDeUOSibeCCApGd/+liTKR1qjjkS48rJyfGkIZMUKa
         e2lgjD5sR8wQmtOe90Kn7yf3cmx9GQaS1pNS5uY6sAFKxlLxUzOxG6XEML+poIU7cvj0
         CHTTFlu5NZ2RkXhVvzP+duxFWTFCvPk0LAocLtA7P2zLy/GdGuYf4yNVbre5H8l/5lAB
         WOU4qIeZ/4PnJW7b/LhMI5ELVDD2CYEVNyK6ggAubaGOqUCH69cvwuuGY7wzfgr1PkCR
         mneAv8e3+gcdtHMt5Gdun4vXf8gzANe8kRmxS1u8fa/ugRH4aCfnfovmUUisgjbe9ckp
         W3Cw==
X-Gm-Message-State: AOJu0Yzb9i1wyq1BVEkiJMkGEM1F8rGy4g1su1eravvtW9IRIn8cFVkk
	fTYuXBq/tv0HSK1KGh25pg+LYQDLQ/JMvZbMCJhJuih4Dg7bOKN1dV7S
X-Gm-Gg: AZuq6aIakcBWkZNBJJ6WwDATrMDyb+w3JkYaX9qtrIkXK63JaDuS85TdoZEhv+nWDUn
	oX5T53AZwu14T4e7iT5vNZq/QacKjnazJlEGelgcm6a5T8vXuqnHAMrN+BFNNElejUE3uBArO2A
	HEJXsz/Po8b1PjaMyrAfw6Bf3teTkj14I0Jn3/19zhWw8CzdOtZyGDbQZNPnp+rMA6zIUoDGBwQ
	gQVutfLyOJeGf6a+Tq/26flwo10iR0d5C8JzltQS19b4SIRZqjw3/ze2j6V3ZmGVe1EjdotFBrO
	vrZgNVVw0dksIreTnuyQyesqTHLTtBQo2/9t+nTag071mnGIiXOcBFHgEasGUcJF7BhL30wc2K0
	2n6rQUBiqg8NazAaQWp1XpGNC5oK8R53RIR4rDMPWTuEQqwUD1SHlZLM5P+AJjiIcovloVT0noV
	GVThU9ydmHPiEn7kDkYbY0yCrvoZlbeh6MKZ0ILd2Rl3wAvtfL2fbAZaI84iwnuTXaae10RrKRI
	huEK+bxFLRj
X-Received: by 2002:a05:600c:64ce:b0:483:7432:a761 with SMTP id 5b1f17b1804b1-483a9637502mr7414695e9.24.1771611835951;
        Fri, 20 Feb 2026 10:23:55 -0800 (PST)
Received: from localhost.localdomain (lfbn-idf1-1-366-193.w86-195.abo.wanadoo.fr. [86.195.82.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3e01b0fsm28678055e9.8.2026.02.20.10.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 10:23:55 -0800 (PST)
Sender: Bernard Pidoux <bernard.f6bvp@gmail.com>
From: f6bvp <f6bvp@free.fr>
To: ve7fet@hotmail.com
Cc: linux-hams@vger.kernel.org,
	david@ranch.org,
	f6bvp <f6bvp@free.fr>
Subject: [PATCH] fix: use time_t instead of long for time variables on 32-bit ARM
Date: Fri, 20 Feb 2026 19:23:51 +0100
Message-Id: <20260220182351.18387-1-f6bvp@free.fr>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 32-bit ARM (armhf), time_t is 'long long int' (64-bit) but 'long'
is 32-bit, causing incompatible pointer type errors when passing these
variables to time(), ctime() or gmtime().

Affected files:
- ax25apps/listen/opentracdump.c: rawtime in decode_timestamp()
- ax25tools/kiss/mkiss.c: t in report()
- ax25tools/6pack/m6pack.c: t in report()

Fixes build on 32-bit ARM systems (Raspberry Pi, etc.)
---
 ax25apps/listen/opentracdump.c | 2 +-
 ax25tools/6pack/m6pack.c       | 2 +-
 ax25tools/kiss/mkiss.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/ax25apps/listen/opentracdump.c b/ax25apps/listen/opentracdump.c
index 25dbcf2..f559638 100644
--- a/ax25apps/listen/opentracdump.c
+++ b/ax25apps/listen/opentracdump.c
@@ -148,7 +148,7 @@ static int decode_position(unsigned char *element, int element_len)
 static int decode_timestamp(unsigned char *element, int element_len)
 {
 	/* 0x11 Timestamp - Unix format time (unsigned)  */
-	long rawtime = 0;
+	time_t rawtime = 0;
 
 	rawtime = get32(element);
 	lprintf(T_OPENTRAC, "Time: %s", ctime(&rawtime));
diff --git a/ax25tools/6pack/m6pack.c b/ax25tools/6pack/m6pack.c
index 2f71c9f..553c475 100644
--- a/ax25tools/6pack/m6pack.c
+++ b/ax25tools/6pack/m6pack.c
@@ -383,7 +383,7 @@ static void sigusr1_handler(int sig)
 static void report(struct iface *tty, struct iface **pty, int numptys)
 {
 	int i;
-	long t;
+	time_t t;
 
 	time(&t);
 	syslog(LOG_INFO, "version %s.", VERSION);
diff --git a/ax25tools/kiss/mkiss.c b/ax25tools/kiss/mkiss.c
index 3ad1e6e..36a366e 100644
--- a/ax25tools/kiss/mkiss.c
+++ b/ax25tools/kiss/mkiss.c
@@ -381,7 +381,7 @@ static void sigusr1_handler(int sig)
 static void report(void)
 {
 	int i;
-	long t;
+	time_t t;
 
 	time(&t);
 	syslog(LOG_INFO, "version %s.", VERSION);
-- 
2.30.2

