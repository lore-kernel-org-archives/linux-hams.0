Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9E938C2A3
	for <linux-hams@vger.kernel.org>; Thu, 16 Apr 2026 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331302; cv=none; b=pbVLdh91uVOTv2/u721BequAsGth46ojFPg7YgcgoGj+3N5LDMb8l8nUZkikbZn4WRQxKREscavyI1CnlfHJyy+IVxeOSYsNjtutiX2vHk34nLwLbTlx9zPdLXSEBtdtof13zIq9Eyx850pvWYVJYiEaF3U079g1LD1IkAmEuz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331302; c=relaxed/simple;
	bh=e57nDf5tJn8pmI6DL/EqYWuRO62Bk6bXtzpM6Y09P7o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bzI0yCZg7p0Rz8sU3s/1VbBX+ufFbi2iohQJOWuB+oFweVLDO4/PCSxF5liuHUqwll2ZfC6bD/mVJ0wsqFjxhg1adyvtM1mAYoToYBPHSOe3Z1EyOUYbsvN4mI6bUQpTBYyiw9X4byYEO3OlGSeXDtEcoetfBuZhQgRwdjgwjxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRRXTGCY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRRXTGCY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488971db0fdso77412685e9.0
        for <linux-hams@vger.kernel.org>; Thu, 16 Apr 2026 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776331299; x=1776936099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJ4uoEfFYWjSIYr4YjUAeTcpQFLjt1x9S0J2zuFA2jc=;
        b=nRRXTGCYpfFZ+ZvzXtRXgsrWHh3rj9RLqWr2VHxfRBp3i4MpsB9gW+YgY+i19AivpO
         jyW3N97NdNyl5HMED7SrNf4taVqZCiqO9Msm9RQx/GgATGKZXlLEyUwigDul0Ulpq5Tv
         BDK6qdMYE80iImRH+BP4mSlDiI2fQ8N6vuMa2OY3VDb1T5fojSNEPuSiUxEyKiiFkCZj
         3bJAzAW+XXhC8cnwFQet78pse9KGlbAGlsxj76wqkSVAF1/wuW6fQezr5mp0W/sYTpzs
         zMHpoMkvtYUjWaCr7DZxocROnPKBJGjcRIgeGEjwLQilvoF/xiKGGpFibZuvf/754Eeo
         w07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331299; x=1776936099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lJ4uoEfFYWjSIYr4YjUAeTcpQFLjt1x9S0J2zuFA2jc=;
        b=jyYrT5A8IW3xoZhNAdpU2XI2+IKRqXdhOh0t7ydrhAiXVBiNQZnH/X0EoQvJ2YtRCA
         Y1AmiSsPi/GO8c2UTJm9pbVhXqlEskQkc0qMsbuUcQovi3JxDA1PlGgq5bXCQxbf+FMS
         yZr/pYtO1IUarGymRC4zzYw+mVo9uCHLShZZQdQUDu3gYVW1FLNdytOQOX89FfVegQnp
         huZQJC0ymBvzGmgYo5GJ3WYgoR4+AiCbndfH0YyFQO/2e/5qbgTcrAGbUC2KvyRef2lP
         +uwGkjGiguNK87OcLM/KYptKy6Lro/LsP18axhX7I0/Vu6kjYVa8c0dxmtM69O7zitlD
         RRsg==
X-Forwarded-Encrypted: i=1; AFNElJ+KtoBSLXBTLY4JbKHIjkQqV5uodAl0nhJaI40CjTYt/4WlYAna6sQv3SrWpTdbY0X+OmV4vYa6E7Ws@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh7oGZ2HIS2vV31u4v25AzKsIjOpIO0L7yqufBG+JCUj+/yPLL
	mbj4gdnL5eHIhBnIe7r3NKp3rnXJV6gOjrRJYOxb39wx8aX5wvExCAO7
X-Gm-Gg: AeBDiev1dv7Qh/NvZ5moU2z16rvLQjq+teLHeqYlybhb513XChJEUS/Y1zMgdT3/sdV
	Z7YX4BcL5DXGVIHHXrfv+HexUCP67gBC3ANdozVan7S2KxCCHcQG6G7edkXANBY2fTpXaP8KF/X
	21KCnz6aT7Ehjk1sLJoZqfAd1Y9MzXChDDNhR02k+8/o8BF+5ZuoZsac38YbS7JwsuT92KDb8nr
	hyuMZc2FsxLZmeyC07MUdTRgnfq34ZXNxDekqEr39q9oYIymke9Y8o8jEheAZhY+pNqdFr3bHH0
	x5ULDvu/bBD8mekuqJzlsRHSdVmEXgAtwNEnwU7aPIDCQE34hQ+XK8kMfqtFIGsvDEMMiHmvebb
	pROxuulSmK0ZNUzBglZmpxT2HUveCJQVgGiVvAlZ5et1Mq5TRWIfmf7UsaesUfWPjYiblBZfktv
	Hf6vIrQkZ+BMm4F3peJoKK4tCID+vdk2Uy5cVD/SZy+FfGPjnz7FEb+N5RcrQdf2UN
X-Received: by 2002:a05:600c:8b6d:b0:485:9a50:3384 with SMTP id 5b1f17b1804b1-488d688209dmr322411545e9.25.1776331299391;
        Thu, 16 Apr 2026 02:21:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead33d65asm12155424f8f.4.2026.04.16.02.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:21:39 -0700 (PDT)
Date: Thu, 16 Apr 2026 10:21:37 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ashutosh Desai <ashutoshdesai993@gmail.com>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org, jreuter@yaina.de,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 net] ax25: fix OOB read after address header strip in
 ax25_rcv()
Message-ID: <20260416102137.4e7264c4@pumpkin>
In-Reply-To: <69e07601.c80a0220.2f9024.1e0b@mx.google.com>
References: <20260415063654.3831353-1-ashutoshdesai993@gmail.com>
	<20260415085921.757b48a0@pumpkin>
	<69e07601.c80a0220.2f9024.1e0b@mx.google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Apr 2026 22:39:13 -0700 (PDT)
Ashutosh Desai <ashutoshdesai993@gmail.com> wrote:

> On Wed, 15 Apr 2026 08:59:21 +0100, David Laight wrote:
> > Is it just worth linearising the skb on entry to all this code?  
> 
> Thanks for the feedback, David.
> 
> skb_linearize() on entry is a nice idea for simplifying sanity checks
> overall, but it wouldn't fix this particular bug on its own - the issue
> is skb->len dropping to zero after skb_pull(), not non-linear data. We'd
> still need a length check regardless. pskb_may_pull(skb, 2) handles both
> in one call.

The skb->len >= 2 check will be a lot cheaper/smaller.

> That said, linearizing on entry to ax25_rcv() as a cleanup to simplify
> future checks sounds worthwhile - happy to send that as a separate
> net-next patch.

I think you proposed just checking skb->len in an earlier version
and it was pointed out that the skb may not be linear.
So perhaps linearize as part of this fix and leave the simplifcation
of any other checks to later.

	David
