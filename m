Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642FC3CAE8A
	for <linux-hams@vger.kernel.org>; Wed, 15 Apr 2026 07:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239969; cv=none; b=Y2YFIsY9m1bho30LxTMCVIJnzsTax3nUR3WMriWvchFq+xe88P/NTt9DuCB6zQ6KW0UkbLiwM6WryBZIoGVvQ7WJ4fFHq92u7Xq/Pil1UVJEIUFrl0EDuBrn3EEoCgxTbDmD0N5OqZ0XHcy5zA1K+He+5+6ttBtzzXvUvouBv44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239969; c=relaxed/simple;
	bh=v4txLFrjF8x+4vhEHg9wpHXC7HaZVp8pc1Zv6dPSMoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AduhSLRH4Kqej/O9F9IuAfORlCiUHYS+0uRyqlLhysLPZFE6dwFovBYgKl1ZdsZl01Fuw+paY0nbBE2bP4fLC7b0SmdetsNiZxvZCLcGgUdg21tOCHvCNbGDIp2AUe05PbksolKqazrr2cuD/OyBToaFdo3tckEwiTj43pv++Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNAaI6x2; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNAaI6x2"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d77f6092eso2159976f8f.2
        for <linux-hams@vger.kernel.org>; Wed, 15 Apr 2026 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776239964; x=1776844764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnGUNqAPhun2LmWwo++iWXcTG1XwZ7/9oz20GAfV1pE=;
        b=iNAaI6x2O2Q2sQ6cBd+EgthxSPzePJ4VMMIbt//6SVP06nN7PFtF0nLkXyEEM4tS8M
         wwcfAP/y0OZXX5TAnrqJmKRy5wkQGI7JLSHkz/8G5+HaH8bBIRfDmzMYO7ly9TnxUULP
         UTMVQ2kjylYfcyHkGBXk9fpIZEQkZhvHNw4jh7l/4sl6+37RsYDM7YkSGm6aWfqnxy0l
         YCTge2axoOKL3yeqTfGfAGg2ZNNeE1cRZmAxMjiwyVZ232xhM1+m1VmfX/1LpEFxiube
         oP3KMWTLuia2iEPzZk5+k9Oyij35EGQuNXuoIlAtkRRyg4Sm36r7XTMgZAq16DCwFi8H
         RcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776239964; x=1776844764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fnGUNqAPhun2LmWwo++iWXcTG1XwZ7/9oz20GAfV1pE=;
        b=aUoeWejA3JzhxbciUxLphiyVSbCeJL5FNZwGmDhjxIiDwEORYdqXQpWt/AYIpZ5aII
         SX/ej1ge84aIRSs7K+idrh40pLwOT9NWp3zCgxmu6OZ07DzDrlW8xAlULNUNBdw88te0
         AePNrp/C4r39b5lQz9EdS3cOOKMhG763hETezBYj7oA4zjd/YkFJoinXkWzf6Nvx399r
         lSea19OwEI2RwfvxmRWattoGH8ZJXM8qnDF7zg+/vHAvGI3Uzili0alIHc5oNtpkUP2X
         giwGg2xNgh/GOMm2ab3BSXwxq8lqkHl/5mJSa2koDWgLHaTGOK5A9Vf+PxNDFPRI9puQ
         tXnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uyRMy/KjhrYqyum9UbmVhXWQOfkT1s8B76s2+351c3gleiSB3Owtjid/E0pA9bnfZAc5xTJt3kZj1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz91DqoV0UX4bWaNj9xk7A06HN313MAte522+Q3rm81xXCs47v0
	aSOUNjBIqrwwhezxakEzoGTZT+tkEAIuDtXAlVLlgtOaZb+TTye8JgM9
X-Gm-Gg: AeBDieuzND+yJ8wuo4XNI/mZBsqlfrGCQ9VrZUZiORoeF4wm1vS7JKjfzjbSwaJsNr+
	lb4PT6rf9wdblXPZ0L8e0BrtLzj2LMtAH2miE0MB66ItLcLp4/n7VnblomYRLBZg4INyM3NhR04
	Z9ZvrS0dNNX5Ce6obaDqihuY6pNkbpbuco/kE8DcYfopNAUAjPREVCdNizmtjigwy3KhCgu/IP6
	qCgji+3UyDIULGXKpor3yMi6FDtxGzbV1c0oZ3wysHZd2FhjFAe/dp5EnHUACbjT0kCwFUAed9T
	aJIE//2NUGRUBTWs3aSaGUlm2PCY0iIULjLlkaE+/Zofcyza+3+6vaiABdl6nC7/ZOHgoqgWfOk
	K3W6XoAx0aZOUYiCMqBvAs2TR/OwmFDj/G/PrAXLVbZXK08Xyw/LbR02SSbzExAVyYRUxTShCFq
	1W4Efdsn83C6+l4bQD/RbrspR/3fG6QWjYglWl8jU2huzBqh6rYHFilpmEPV4CuKnt
X-Received: by 2002:a05:6000:22c6:b0:43d:7e11:1b72 with SMTP id ffacd0b85a97d-43d7e111c1emr12453323f8f.9.1776239963143;
        Wed, 15 Apr 2026 00:59:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3ebaf1sm2843108f8f.33.2026.04.15.00.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 00:59:22 -0700 (PDT)
Date: Wed, 15 Apr 2026 08:59:21 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ashutosh Desai <ashutoshdesai993@gmail.com>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org, jreuter@yaina.de,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 net] ax25: fix OOB read after address header strip in
 ax25_rcv()
Message-ID: <20260415085921.757b48a0@pumpkin>
In-Reply-To: <20260415063654.3831353-1-ashutoshdesai993@gmail.com>
References: <20260415063654.3831353-1-ashutoshdesai993@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Apr 2026 06:36:54 +0000
Ashutosh Desai <ashutoshdesai993@gmail.com> wrote:

> A remote station can send a crafted KISS frame that is just long enough
> to pass ax25_addr_parse() (minimum 14 address bytes) but carries no
> control or PID bytes. After ax25_kiss_rcv() strips the KISS framing
> byte and ax25_rcv() strips the address header with skb_pull(), skb->len
> drops to zero. The subsequent reads of skb->data[0] (control byte) and
> skb->data[1] (PID byte) are then out of bounds, which can crash the
> kernel or leak heap memory to a remote attacker.
> 
> Use pskb_may_pull(skb, 2) after the skb_pull() to ensure both bytes
> are in the linear area before reading them. Discard malformed frames
> that carry no control/PID pair.

Is it just worth linearising the skb on entry to all this code?
I believe all the frames are relatively short and low frequency.
So the actual overhead is insignificant, but it makes all the sanity
checks trivial.
It is even likely (hand waving) that the extra copy for non-linear data
is faster than all the checks for non-linear data.

	David

