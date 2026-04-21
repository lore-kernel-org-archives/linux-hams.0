Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D590042A96
	for <linux-hams@vger.kernel.org>; Tue, 21 Apr 2026 02:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776738437; cv=none; b=tfObY1LtzoDh+E1kc3p3y6UJhaIleckhKg8ujoR43Qt3ne3wOEgKFNBc+EUoLnGktovCrfhuvpPe3fV4lYssCd/5zKDtlYtd5EGDSZn5wQ7pfBRpgspSjrNZ1I0ZYStJC1/NQzrzxyudlbq2e9N19TRPYB+WCgyw/sxs4wAc0ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776738437; c=relaxed/simple;
	bh=GzVHWf0l5vucDJpwZdVDM4/favjvJ44bEkb5ldw1OrM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pQfE+b6SrRTPsy1J1NEvalE9/95HyhIinskzw52j/mmM1fMjHSDFbQ23uTgzZ77CvhZMRaqUDKD1C0aR6gv5uK9tJOuHTIbhyx0Xzu//rDTZ9CSdPE5RttkrxSyUzCZB2ypXbhHMFeY4Po4XK1s+nfTb14WGrqhAH3lMKavUgvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rTEjoy0L; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTEjoy0L"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50d6b9bca48so50659191cf.2
        for <linux-hams@vger.kernel.org>; Mon, 20 Apr 2026 19:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776738435; x=1777343235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzVHWf0l5vucDJpwZdVDM4/favjvJ44bEkb5ldw1OrM=;
        b=rTEjoy0L1ZjCEGTGFfFF2UXyxyf1QYYe6bpjp6iguWuXw0XBvc8wBFoO+Dwllvj7mY
         3GhLZPrP2uVMd+vwK6i3S1q1fLMiuWuHfoIEqwtJlbbMHdOleGwQrECBvZt/lw4z/Hr5
         x9M3Roa2Wxc3uXUJVEIrGgMU5ZnJITSwpF0C4aEenj1qRWb93V3a1cUhCVcyYy7s20F4
         NbT4j98hWrapEhYogcGz4pIp9JLk7AnzbBKJqIL4GSlv9xbYCQKVbSaSp/15tPcvY5SH
         iGuuaiVNeKt/tw3BCgz5/xp53b078YCOejiU/H0ewhgQYk4Vfd69fcmIFSENsbKNuXc5
         Bxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776738435; x=1777343235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GzVHWf0l5vucDJpwZdVDM4/favjvJ44bEkb5ldw1OrM=;
        b=sTCf6rp+rW+ZqTU8MN7ILUI8IlZRuerLFFXr0csoeBN6BcNmNPOtKv+5kRU0dH44uI
         osK/9YdJfOgEnUdjkAnlM4ZrJmkLi+2NcTYwQ9I9n4jEEZcBkbOifH8WjGTW2r9XJ/kE
         JxVm3XoR2OkcL8iZNNB9Mjs6bR2j3FbjghspILOd5Wn+DxWqQIXmqgAv06nHjAHdBHpY
         +kul51/dAae6/wmlrnHq8sbQg2Ul2e21gUnlWH1mrtwU1o98QQOaQLC9tmF/w2tBYJ+m
         cw7+bIVJ18NiAD8ZJcqXwgitW3IWfpBWwGCaPyYaFajR9BnNu6WMiGNaG8mFJ0ZGE1m2
         I5Kw==
X-Forwarded-Encrypted: i=1; AFNElJ9iqZlYYzFUWv1jmzny5xHc805zJIYGmO9LgGGN+Fg9YBikUaJdUtzneyYsYO/X7jOkYUslmKvP61X0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0lDVv8+XAG5lP03LdtbGN4ZaUGsA+OTL0rsrPGuMxQsxwCTQf
	HqMDpFHE+sJlHpvHHQ4J2+K2MnkfqMuLTmXsLrrHujO1sMHoUBWBdiBK
X-Gm-Gg: AeBDietiB7g0vKM9OdtdEx8ObI1+CPG5DW+uXR/TCIiODqiNLpu6l5nWjK5w/AL9WDd
	q+cJ4GEhGV1u66r8kjf3D7jIdjsDVXo2ahr37iBPz5Z3Z3/5VUuyc9WrEJFSDk2yoxDj061KuDn
	h9RHymGhlNF8mr1MOXtZrvT2eUJa3f5cNGzK5rly8QE9qgQe5EqK9Ln2DGlfistMFIt70h03kel
	47Axuf2pdazntsD/H4HarIexkKwfewfBkSCOiT6pqkpth5GFxKoTbWd2g+kfSLq23dbdiRnMORc
	j/zkMeFE6gNe5CS2rRjGpODV+j0cgApa9cmCckZtm3A5AkPvRy0rx0nuqaPks7wFDTjZLGCjI4D
	Shs9wo5iPb1Gq25L6XZCN4ujPKqSsy8TFV4vd7tvC9TmPPDfciE0dSfUtmia+Zg/TnzuVttip1s
	1wQ58Lt93y8MGMkvgAe0tQFffbsbtyqLaVwKpAH4Rziw+3xlOOUI/cq17+RTpk4VvBnAfzJQQRL
	8iu+8zq5XmBXrFM5PmikL/Lz5rZZ2BZGu86lV4=
X-Received: by 2002:ac8:5890:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-50e36b44bf4mr247259321cf.18.1776738434842;
        Mon, 20 Apr 2026 19:27:14 -0700 (PDT)
Received: from TDC4045031631.e0cglfehwr0e5gttmepj3hi3hf.ux.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e39495192sm99144271cf.27.2026.04.20.19.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 19:27:14 -0700 (PDT)
From: Ashutosh Desai <ashutoshdesai993@gmail.com>
To: andrew@lunn.ch
Cc: netdev@vger.kernel.org,
	linux-hams@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Ashutosh Desai <ashutoshdesai993@gmail.com>
Subject: Re: [PATCH] net: rose: use pskb_may_pull() in CLEAR_REQUEST length check
Date: Tue, 21 Apr 2026 02:27:12 +0000
Message-Id: <20260421022712.690822-1-ashutoshdesai993@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <48f45bdb-6edf-4676-a96e-4530634cd7c0@lunn.ch>
References: <20260420015723.462479-1-ashutoshdesai993@gmail.com> <48f45bdb-6edf-4676-a96e-4530634cd7c0@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Apr 20, 2026 at 15:04:30 +0200, Andrew Lunn wrote:
> Did you review all the other comparisons on skb->len in rose?
> Do these need the same fix? Are there other places non linear buffers
> should be considered?

Reviewed all rose files. Thanks for pointing those out - yes, the two
spots in rose_route.c and rose_loopback.c have the same issue and need
the same fix.

While reviewing I also noticed rose_link.c: rose_link_rx_restart()
accesses skb->data[3] in the ROSE_RESTART_REQUEST case and
skb->data[3]/skb->data+4 in the ROSE_DIAGNOSTIC case, with only a
ROSE_MIN_LEN (3 bytes) guard upstream in the caller. Same linearity
concern.

Is it recommended to send a v2 covering all three files?
