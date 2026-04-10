Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467983DE459
	for <linux-hams@vger.kernel.org>; Fri, 10 Apr 2026 17:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775841678; cv=none; b=j/WGC5GuLfy/plSUZei7eVnwwqJ+wdkdkRIquMmKV00RjWXw824pphZa0lh+HgQCMfehG4dznbc1U45o9o/Myl5IgnUKge57MGtUyCJQ4dQOyq/xsT3ZraJK/cxHUraV9JmbZcCySkT62nxSbok8MfAvxot68XMj8YtrBMFf8Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775841678; c=relaxed/simple;
	bh=e5lYK1lUQ/L5Rl4sT1OV4Fll/kUwcFB9V9XGt/BjVdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFlpC2AvNYocacZ4Jor4u2SXnYS96eucQ3L5iQYUE+xKmBHuleHD1M/Nt3H4PFSDZQ9y5Vv8PUMNqUig+zQ4j9x1gJ7pQHUMvDtBUgem1m6AJAe6wjsuH7Z4LiCkCrj8as7iEEEh85JxFxPNolQDlldeIlev+2trDTFVxcw+yHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ht9xxqQM; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ht9xxqQM"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so1590023f8f.0
        for <linux-hams@vger.kernel.org>; Fri, 10 Apr 2026 10:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775841674; x=1776446474; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=88cVBJSy5xjvF8idw86suZ9TuCLtWrP4zxfv/X+nnUo=;
        b=ht9xxqQMDwX2q8PTmKKT5f7zBwxlazJUr0fduHyFe7jBUcZ5pQG/sXDXHExJ/sxZdJ
         68xP33sBAyd6DFJDRRknja0X+yZmBlXPaJHuc9eBu+X5eyaESGCbmTRt2ToPC04axXlf
         vP0A9LnZZW3TzGKGjNnCreMX9QrPo5pYKArtqxYcm4l7wf3aGi9GtNzHlu25DwNQHH2i
         oPYx5X8G1KPJKyykczgIqgsQGnNUhVXmMo6MlWvtPr3U0Ltu5HgeVwIhMr1+fdYnQxBC
         2J0AFUcrfopTT3voWQkIoYwE0YJpUH+eK2lBEMFIqo7RkRZeZcsQs/pVOeAzv+aVJWpY
         wQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775841674; x=1776446474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88cVBJSy5xjvF8idw86suZ9TuCLtWrP4zxfv/X+nnUo=;
        b=ZN9OhL0/Hbmwo+HyWHxWqztF9U4+jqyLElaToyTcOT5OeKbJhmhRbsib6Oy7AWtsgG
         gPE62pdwPQJFoQ3LgnvcollU5JQcgvnXcBD45a2J6ySOjbJaj2aogV3G/lSkWp5tSEAF
         4173+wS/ETmd35uSqjyWez750Pxz4PRMVWC66gn7OBH1nvyTe28+5JkUL2OJux1iOV4O
         UcVMJdZkViQPiHqCs8Af/CxcftTb4NtD3VFHtAgr9qEpkTdBeA4pLbBhLVyrtPmogwSR
         Ac0IUQeKsrl5oQIEL2KGmexefv4Aj3ovCDtQfHPlgvB8fBFqpte/huU9RIUWcrF71jdi
         +xPw==
X-Forwarded-Encrypted: i=1; AJvYcCXZhsxEGGcEohERtRb7fWwyvGu4MXGRhHByONbmZNFjak155OyhLj5aFo4sKW/EiPZDkXaS29gfKO1n@vger.kernel.org
X-Gm-Message-State: AOJu0YzsP5SN0hEoecdsLO/L3Nn1W0Dml+++XD03MYWzLqObYFWoMBnw
	8BCc8aSt5WVEnJgMu1UaOxcS22gXIaorKCvZ7yNTGgdS/ZgvZ4vTkFOG
X-Gm-Gg: AeBDiev+iZSTNQX/WQPIuEWi4dB7R0yfw0qQA+Sn+3iXgA3l4iFOLuII67nI9qnHOup
	gwvHKa2S2V6WUbpRwaDVIUQf6I1ZcaQ/TvLrOP+j3JP4l1NshWb005mSl+mzdfcr2JvJLQA/Efa
	ufvjLTnH2rXTp6OLi88mh+E0a+7byQ3UOa4zt/gWrc/8PvHM5mUqMdInmpcX5xKaimLor4pIR+D
	zlsv80fLMirAxUQAuID1oaISvWCNp6uz3YOYno7Ps4lLCfkhgiE+AiEu/IlwKxEalS0h/tJAkJ0
	aV3Z9iRKJArwzIeCjt281yMVyi9fKuQins7M/iVODAjB1gTXzapKIwvLQXkDSiY74bG/NWg54+t
	BGwz6jQFG5g+rxRtLuqCA7ZFclCMJY0zNITnmDQgUFNqGBogt90xPh1fzgF/Yg1sBLBEUJoH+Xv
	Zp8egdvqnV2cxwicXpuks=
X-Received: by 2002:a05:6000:1ac5:b0:43c:fa96:d939 with SMTP id ffacd0b85a97d-43d6429c737mr6098789f8f.22.1775841674404;
        Fri, 10 Apr 2026 10:21:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5062fsm8350116f8f.31.2026.04.10.10.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 10:21:13 -0700 (PDT)
Date: Fri, 10 Apr 2026 20:21:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: David Ranch <linux-hams@trinnet.net>
Cc: jj <ve1jot@eastlink.ca>, Simon Horman <horms@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-hams@vger.kernel.org, Yizhe Zhuang <yizhe@darknavy.com>,
	stable <stable@kernel.org>, "Bernard, f6bvp" <f6bvp@free.fr>
Subject: Re: [PATCH net] netrom: do some basic forms of validation on
 incoming frames
Message-ID: <adkxhrzY1T5ZERiq@stanley.mountain>
References: <2026040730-untagged-groin-bbb7@gregkh>
 <20260409190328.GS469338@kernel.org>
 <20260409203235.6b9329f0@kernel.org>
 <2026041026-excuse-slashing-c4ee@gregkh>
 <20260410102827.GT469338@kernel.org>
 <18e3df62-34f9-4de0-903b-19919d7ae2ca@eastlink.ca>
 <2e0f1dca-56dc-d6e6-f4d4-1de3160e0179@trinnet.net>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e0f1dca-56dc-d6e6-f4d4-1de3160e0179@trinnet.net>

On Fri, Apr 10, 2026 at 09:38:25AM -0700, David Ranch wrote:
> 
> I agree with John VE1JOT that amateur radio protocols such as AX25, NETROM,
> and ROSE are still very active in the Linux kernel.  This discussion makes
> me wonder how the Linux kernel community judges how "active" a given feature
> / driver / etc is being used in the real world before considering
> deprecation.  If there is an official mechanism to get metrics sent from
> users back to the kernel developer community, please let us know and we'll
> try to get you some one-off or periodic metrics.
> 

We've had times where it felt like users weren't testing new kernels.

regards,
dan carpenter

