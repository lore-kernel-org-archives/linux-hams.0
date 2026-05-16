Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA3F3D47C4
	for <linux-hams@vger.kernel.org>; Sat, 16 May 2026 11:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778931245; cv=none; b=S1qad9TjP8g5UYpQ/J+rKNTQ3DKiOPlhBxQ2xv/Cxq1W3Q4sr10JiazjAfhUmyoc520xa1IUn46apwbmUJgqbAWAJsN57mU1925szprqXElAMziVSl3Ny0vn4Fn5J/A072ojjzOiFWbkwt864o5enKJGvIO8vWMMwHS/d+YjtTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778931245; c=relaxed/simple;
	bh=kS9Q1v0jE50HuL+kLJLERVYaxzIqhv2g23wbEVDAAK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nmrKxxAawBRVMuISRlMcQaKRBNFNQpfVgo0rJQYBi74a4azjoK8jUsoLPOSc7fHA6u102968/DaD69LMOslgFlB+dPhqdEZWtBI9ExZG5KFYraRYhU/6RkFCkaLa8sxFixsZAHDz2DGQ8npVu44HwCK2813yM8CWIosi+4YqCkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BX0ylpmC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BX0ylpmC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b0046078so5617325e9.1
        for <linux-hams@vger.kernel.org>; Sat, 16 May 2026 04:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778931242; x=1779536042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wXRm8wHLMvu7h8cKS/PMy3rIET0MllJuf9jGLxBvpQs=;
        b=BX0ylpmCyBrPOKvAE7i+QMm+Opwg8fyoDDQ27gqJTSpOL1QAyRqFdnevY2CWhRwiJL
         RdQTw09kFSD41jbtBDbGRjA0lsVrkjKSe+yXkbYfEyWV4rc4E7ryeEXeP8iliccxMRBZ
         kMuUhui0lVxR6NYzRiaZoFE2ZCrZcc9cIZyPFvyP0A9s/iHLsK/WS3gqsK63i5UoPewa
         P4Ytg89XML1rQZ6Q8XnsdlOpJTwcrb3nwYz8/XlgTwCHbhCUZnm3TIQSeO54IpuTWpId
         tqTYKjxs3jBXvHJXmUDJCz4GcZ/fUdfUyarmHv64M+DQPmejP5Pzn3YY55qZejDwnlor
         +dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778931242; x=1779536042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXRm8wHLMvu7h8cKS/PMy3rIET0MllJuf9jGLxBvpQs=;
        b=Gkw6aVXq/ABcJ7FLh9lv4klvH9wL1U4Sje3OAiUrY8LjnMnpCjRsoNxISrVDUXDd5S
         5vzCHxsj3AKl8CwlFDT32u12pyP6HvNYw01Q8QgwY61rJWX/zcbtKF+jQ48O5qCZ2Ozt
         XwCuOCOSdjHdhlqpbyRvyWynDzCgH0WZujQzPr1A6eLCmbuBUJunRspyKB3s2aol3hlO
         3KYzIdszmb21y1bfsdqGOJio5wWrIZQKVXSPunO+hq89toK3K2vm7hI0zdOEoqQDcZTu
         M4db6CBf43/7RkLcEKbhlZWUq4Smd4OwMZxUkROP9bBg9aJwcdm7z1petGOqFDjTN19O
         /xTA==
X-Forwarded-Encrypted: i=1; AFNElJ9fgQ62q6dfI7sgZbvuE4bFSbES641hy5+0+UKXKd+P8GDO38ml/AQ5pGKzdrfBBonZjRjEYGjtHPR0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8GTGEy3CvC8VEn7oK986uz9TWuSISPwywmCZ6bkuzn43xO7Fs
	oVA9UZrsg5vF6e3OY92KYmoQHQWa+ztgGhEFgvfCDXtIxClcrssA+czO
X-Gm-Gg: Acq92OGYJTeV8iHfTO03asBLz6fH1UNE0COtqw4R65REolsYUOdGjwpxG8hYRoBHv9e
	GEkqpBmm+ZogvCiRjynUb5QfRbc/wXJSFKbxUfSCWRpIrEuvkU9j97Jd6cPM44X1CXwOQVyuVkb
	1vDAXDLu+O3wCaazxToKPV534OaimKkapegicPdsz5qY7wfEXGhZtms4M/K7FHYIyZocHs0YOu7
	btucoZIuCsSlM5ESDqfDsoNq0ZVC2kn5eY9GXSrKywFzYrwYX9hY5F0ivuofUve5Bj2WTpclYdz
	RcKDd0Tjjvr8NuWPYUPV8ir0SkvXrIoummswTuIOsVhV23651KE3IQqDWWaXo3P4aEEc++lZq2P
	l2wYo93okRmcDgLVpP7REUgDi7b0iJpmCDzpecc6q7ur1eeJnxgF/CuhND3kfsT7Q8qTba0kMQk
	wsH5Vl1cnzGp89rnBRx7aRTWpGLAd6kGy1hC+xBRSRjVIjfr3XyXKj6Pdd/8GklheEEaNbW6aMV
	V0+
X-Received: by 2002:a05:6000:2dc2:b0:43d:1c4a:37c with SMTP id ffacd0b85a97d-45e5c5b39admr10857244f8f.4.1778931241865;
        Sat, 16 May 2026 04:34:01 -0700 (PDT)
Received: from ubuntu-f6bvp (lfbn-idf1-1-304-238.w86-195.abo.wanadoo.fr. [86.195.26.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768acesm22686198f8f.7.2026.05.16.04.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:34:01 -0700 (PDT)
From: Bernard Pidoux F6BVP <bernard.f6bvp@gmail.com>
To: kuba@kernel.org
Cc: toke@toke.dk,
	stable@vger.kernel.org,
	davem@davemloft.net,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	gregkh@linuxfoundation.org,
	linux-hams@vger.kernel.org
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio (hamradio) subsystem
Date: Sat, 16 May 2026 13:33:55 +0200
Message-ID: <20260516113355.24110-1-bernard.f6bvp@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 16 May 2026 Jakub Kicinski wrote:
> It's a GitHub repo so PR is probably appropriate there.

Done. I have submitted the five rose fixes as a pull request to the
mod-orphan repository:

  https://github.com/linux-netdev/mod-orphan/pull/1

The PR contains six commits:

  1. rose: build with hamradio_compat.h on pre-7.0 kernels
     (compat shim for struct sockaddr_unsized, required by af_rose.c)
  2. rose: fix dev_put() leak in rose_loopback_timer()
  3. rose: hold loopback neighbour reference across timer callback
  4. rose: fix race between loopback timer and module removal
  5. rose: clear neighbour pointer after rose_neigh_put() in state machines
  6. rose: guard rose_neigh_put() against NULL in timer expiry

All five fixes have been built and tested successfully against kernel
6.17.0-23-generic (pre-7.0): insmod, functional operation, and rmmod
all completed cleanly with no crash or leak detected.

73 de Bernard Pidoux F6BVP
