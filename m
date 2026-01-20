Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2AE331A41
	for <linux-hams@vger.kernel.org>; Tue, 20 Jan 2026 16:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924821; cv=none; b=VtI3Xxjfda6terHAfP22KNvP4qrjuqW2CtR1Brf06fa4AJZfifl87nFFK6BlP6WoWPa6tBNdYKEDcPWBhJWga3OMJ5LDj41HwcqPdvuHK5N7jEyAglVGrIhhs7VlXV2N5wsz+xl2oGWDm18PhnKAcglw6LW37nzPKIPyOu2/vIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924821; c=relaxed/simple;
	bh=IB+sIXEjGEhU9cqcsuNosGFcQqX5n9sKNDGU5mhonx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiimXBxRQXSADq6YERZ/K2ZrDU5hbKh/uw8PfQ39q2Uv9JtCfjJEc70gtlIb3Vb2sEO6OxrIssjthVWN5S5oYuclCTmr0huDSzieiEGw7OyevmQ70B5EjRM7AUYJRxpqm1fIhGwQyOA0rZHNRxghC0ENYSWuS9hy1BM/P3KEgrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyO+c4Py; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyO+c4Py"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-81f39438187so2994922b3a.2
        for <linux-hams@vger.kernel.org>; Tue, 20 Jan 2026 08:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768924819; x=1769529619; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ayo5jQZPeaTZqwD9/xDSR/da6D6Deuo6ebApFmbkVFM=;
        b=UyO+c4PyElHC5I/PVdjmqMq9rLYRC8UrYJTG7X1iLbsB4yd5gpsffjH8WOWQZxXMJE
         SiJbFD51O9/8aKIHBVdSLvAfoRHQgwUaFxkKiH5WzkozI9/mzKUnMbsTv2BQ0dxBOakZ
         ypCgTOuFx5MrWATlxgRO+NMiYvtMIL4QtBQb0MXTkqM51M6UfcdNhrJMPvJu1jR0NyIU
         z5IF0GrHtOeWegVH9Ab7nHyseYI8RZxwb79zrJG6zvCTyFBe470UW+/gaHmY0wc0MTJ/
         o7OxLqx5MTO21lngRhMjbdSPJjUpCsbxMKqz+oj2hy0CaETmEdjLv/orvmbH7DGUKgia
         6jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768924819; x=1769529619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayo5jQZPeaTZqwD9/xDSR/da6D6Deuo6ebApFmbkVFM=;
        b=PZaWbWWeQ+qPkeKQDy6PjCuAGjcFcgFHP32UUtUIqUxEFZbI7bKmezoVXgbh3odW/O
         fOE/wjYjwVI5T7+Kw6wr/OCl90/rb8j4YOGEVmgB5itL2nra9HM3Mm57qP1r7yvWJ/o+
         ZyVlOa8+2wyajL+wOQKNkyPiEUFY2F7dLyZCd3goAp/AusELu+VQFqNzXNJDgOhSneIT
         1oZBWiBjD6no6iV41MuAc8BP6Vuf3iDFdD7ans3jZLUHzfPaFAsspl3ZgK7hrevV9QyX
         8LnZW5Wqj97j9mv95d3NNZluEwwVt5Yy1kPm5GR5MhrPqXokIf9+tx4S9fNJsIYDQC4W
         WAbw==
X-Forwarded-Encrypted: i=1; AJvYcCVXyU/EMbq3o/Kwa+qJX+QpvAHnZxOwsKHZRJHoo6R4Pyw3f0SloskjyQw8jbv9MMYBXqoX5WW5xcGL@vger.kernel.org
X-Gm-Message-State: AOJu0YzNhA+nEze21ZBS4i/6LP66vHgZDCatu0NvjFW15mIxaf03gogC
	uSaq17vefuCWLL/iiTRxT+t6dEFxLdZb91PLCw857IE8iAHeGzA4g/fO
X-Gm-Gg: AY/fxX7aUysUzmqL+h5OnjbTdDK2gdmy3EVzKO+hmKW4vLlFwigeyCGuEnJIhrbI4EK
	vW6SekyVqFs0MHmYWhj+3OFZghNv1pRvoK4Blx/Hvvkm/p8zUKTvZTxCTDWoLzYELTI717P5+ve
	nRqQgLduo2DTx7OB/I9XOlC829YLiao3uu0/MvfpJttvoQDYLp+chtFDdrOFcLdM3FNAK6+SNaS
	intXvMFz+Nlwr/xOVRFX7x5InV8//KGujxh7Huq8FwQSeaSIGlYlYQGBFx1z1/fomRfMY4H3jeT
	cNb4cqJv2SxvKZtUDLYcQTER3rNbIub6SG64q3KfpQHy145MgHcZF038hCsmS/sf/sDCcFJHzxz
	+vqgeqUT/r7mfuuEpzGrtKxZ371Fmw8TVa5q5P5ha3aW/N7UjEheG78m2Rg9g0llNO3O5bWsWZD
	oSffzR+/hzHoc=
X-Received: by 2002:a05:6a21:103:b0:35e:e604:f78b with SMTP id adf61e73a8af0-38dfe590340mr15226404637.3.1768924818506;
        Tue, 20 Jan 2026 08:00:18 -0800 (PST)
Received: from inspiron ([111.125.231.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf32d68asm12193550a12.18.2026.01.20.08.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 08:00:18 -0800 (PST)
Date: Tue, 20 Jan 2026 21:30:08 +0530
From: Prithvi <activprithvi@gmail.com>
To: dranch@trinnet.net, f6bvp@free.fr
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org,
	kuba@kernel.org, linux-hams@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com,
	syzbot+3f2d46b6e62b8dd546d3@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: Testing for netrom: fix memory leak in nr_add_node
Message-ID: <20260120160008.2kylsycgrpzcwvak@inspiron>
References: <20260117142632.180941-1-activprithvi@gmail.com>
 <f108f1f4-cdd3-4b14-ad24-d1ef328ca316@free.fr>
 <46f8fefa-f549-0b8b-d37e-0d608c5ee5f6@trinnet.net>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46f8fefa-f549-0b8b-d37e-0d608c5ee5f6@trinnet.net>

On Mon, Jan 19, 2026 at 07:37:07PM -0800, David Ranch wrote:
> 
> Thanks for catching that Bernard and I sure wish kernel committers would
> test their code before committing it! Does the kernel show any sort of
> diagnostic information before it resets?  An oops on the serial console,
> etc?
> 
> --David
> KI6ZHD
> 
> 
> On 01/19/2026 01:06 PM, F6BVP wrote:
> > 
> > Proposed patch is lethal to netrom module and kernel causing a reboot
> > after a few minutes running ROSE / FPAC node f6bvp.
> > 
> > Bernard, f6bvp
> > 
> 

Hello Bernard and David,

Thank you very much for your feedback. I sincerely apologize for the
instability caused due to this patch. I take this instability very 
seriously.

Unfortunately I am on a low-end backup system right now which does not have 
resources to build or boot custom kernels effectively, locally. That's why, 
it has been difficult for me to test the patch locally due to which I have 
been relying on syzbot for testing. I am grateful for your feedback by 
testing that patch on your setup.

I will work on investigating further why the kernel isn't stable with this
patch and try to create a better fix for this bug. 

Thanks a lot Bernard for testing this patch. In case you get any crash 
dump or similar information, it would be very helpful to understand the issue 
and fix it. 

Thank you very much and best regards,
Prithvi

