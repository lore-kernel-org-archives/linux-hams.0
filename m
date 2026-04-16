Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A243783D8
	for <linux-hams@vger.kernel.org>; Thu, 16 Apr 2026 05:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776317956; cv=none; b=tapB1dCOn+EqzlpLyGIXp6BvKmMCENN4oIx1/EqWjvmk9r1pBWTGPtc1+9yVfl7mIZJQMTb1hbL/53qduTcy0dZoZIZwhYDCcakAayDMqHxHoyxHxq2OWD2hYrNAnBs4Sy2WrJleopqPYsrHU+KLuOmbsvckFk2mITw3KlgvVFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776317956; c=relaxed/simple;
	bh=N0T590H9heaCHgH2KW+HuYix7auOVSrFYd7ngm6UIiY=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=RJj9HEFnR0LHZYTOZNJ/rbpaNkEII+STRro8yKdndYiJEoq55D7wIp11fDTNccZlbYuobQ+MQ9eygPLI45G7h0c3JKGm1NwmG2ud/syUk6sXy4/MB8cLnebUgL2IEVwGrZsOvsdLF9xPZZhLpIWoc1oNK3ceiCvBxVnbAGRJ5KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyAxBYNG; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyAxBYNG"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50b69bf5638so82009841cf.1
        for <linux-hams@vger.kernel.org>; Wed, 15 Apr 2026 22:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776317955; x=1776922755; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0T590H9heaCHgH2KW+HuYix7auOVSrFYd7ngm6UIiY=;
        b=gyAxBYNGO0944S9MKltImXjBJfUVrj2z22Kf4X/6PQ8oRHX98V+ApLFx7XHh7HrUaN
         lRooy+ms32oAXcHmeDQuZGdHdaQkyLiSGiR5L5hAjAMXcvTmTAZbCuuZjKkej0z477id
         1Zwb4gNFbX144sCb1LlNdpJHMQ9Y2kNsKQ/TOfaDRZEojYqBI6Jsj762nfPelHKWA/EF
         hxBVECjqr3whsNf969/qvCXdGng0azx64lcs0RuOAxXGBLcPSozryAq6JuU6NoLfZaPN
         qmpQWEZNh45nKABKnF2QdP9g4duwk6J0K0+YDLnf2FWqI6FiivS6lC71pse9QL3+Pi+E
         fDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776317955; x=1776922755;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0T590H9heaCHgH2KW+HuYix7auOVSrFYd7ngm6UIiY=;
        b=odqILK5daJ8Kq982gLIlD4UcQmzYPWr7cp4EGS5xvq0W1XGarHu2XizUr35/tZzguv
         u4IGg91q96F8vBMj9ZfPFbwBLCLRKavJawvC5OmlTP3BBG5Viz0o5f1kGdcbqAoFCvVG
         rz/b5TYyu5DfKSvkvJyqvbIvqcDf1FYWv03CeIJIuu5pMFPT4i9RRlbWgVvgvqHz2jv8
         ylDJPbt21aMdgCmB2rOfff6J9mknlAFeI2AVGba1d34aorlDTwspTJh4Sv3wREYa7TG+
         u1EkybDv6t3BuKaGoCACi2jEYkwHgDXjjHz0SQss5hZr+51s0KhxCX0dh2sCt15wMWcy
         O0uQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mvCocONA2WoojzbL4inEZu1YAo64TSDwsPmvw7JtoYVEKfrVLQ2y/f1PL2yg3MGjy13F80T5JAEQy@vger.kernel.org
X-Gm-Message-State: AOJu0YypqdbgTPza5ezRHao1Y1QZux24xwkAM6WIAiLsU050LwWzZceo
	5a/C4G5ZlwsfK3nyVh0nLHjrq0LBrCplS33NoC5ik5o6Id7kocsTQ6vJ
X-Gm-Gg: AeBDietA46x5iWNWXiaVcEktmeHZ7l2Cf/YI4c/aj8AcH/yJ+yzSVAfTxmUv7hDruAe
	oM2VI2LrstDjW9TFmNxcylumy6p7/wWaqVa4zWu7h2rOQAzHXGcSoAsVJFx4RRccbKie+iHkYiV
	fIGpdU1wqlnyoGhMYzm+Aex36VOSOMcp1kU2HvlO3tC+1u72DrRptEh3AnkbACtpadGweakkAmQ
	DJ1PTHs7Jf4nzDmUnmJdH7AuNnE2wKyWM9UM8d4Yyv3AeT2y8vTThF4r6WSY5UxCusJOBw6Rtyf
	ipJIv3KY8jxN8/vQSaSENy+MrvtDNyUH83+xgScsxCG+RSwNLVU+kiEza02VNNcbyi2haH89XYh
	g8VFE6haqc/Zp13YiPvgkkhRkT3jpjjdvgpzIi1LKAyTg4YCBQRXqBaTqssBTQhHUIo7XSjwIg/
	LgSKE5IYCly7Kmc53bwJu1+cTHc605zAHrgoKCioMfO+JcMpRn+rk1qM/7FsxgWcLdza4W+WSsy
	gm6Nq0kFg==
X-Received: by 2002:a05:622a:1493:b0:509:68c:634d with SMTP id d75a77b69052e-50dd5b95a14mr387417291cf.10.1776317954583;
        Wed, 15 Apr 2026 22:39:14 -0700 (PDT)
Received: from tdc4045031631.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e1afc597fsm30185571cf.24.2026.04.15.22.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:39:13 -0700 (PDT)
Message-ID: <69e07601.c80a0220.2f9024.1e0b@mx.google.com>
Date: Wed, 15 Apr 2026 22:39:13 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Ashutosh Desai <ashutoshdesai993@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org, jreuter@yaina.de, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 net] ax25: fix OOB read after address header strip in ax25_rcv()
In-Reply-To: <20260415085921.757b48a0@pumpkin>
References: <20260415063654.3831353-1-ashutoshdesai993@gmail.com> <20260415085921.757b48a0@pumpkin>

On Wed, 15 Apr 2026 08:59:21 +0100, David Laight wrote:
> Is it just worth linearising the skb on entry to all this code?

Thanks for the feedback, David.

skb_linearize() on entry is a nice idea for simplifying sanity checks
overall, but it wouldn't fix this particular bug on its own - the issue
is skb->len dropping to zero after skb_pull(), not non-linear data. We'd
still need a length check regardless. pskb_may_pull(skb, 2) handles both
in one call.

That said, linearizing on entry to ax25_rcv() as a cleanup to simplify
future checks sounds worthwhile - happy to send that as a separate
net-next patch.
