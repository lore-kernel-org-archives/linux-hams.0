Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939F63FFD
	for <linux-hams@vger.kernel.org>; Wed, 15 Apr 2026 06:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776233014; cv=none; b=eQDNPdrtggWdIJuOwgV/BTnCY8kmLwPyRo0P1+B0Jy6qFF+kz0cnAgm9krBwrtiUcb/GClbTCPdtTolVnBKzH0/u6doIkrfaY1YBDSkzRFStfD9WpjeiSL5OIKEVhsCT2X7sA7U3U9Gbd4iYEpX8SF3k2UYReWufqSRtanfne7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776233014; c=relaxed/simple;
	bh=cyjgq35kTUANpRors0UJ2MyAA8YEkpvyucVoJcuXyxI=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=NTiN662oVyg1ZJ7pc5cnEA2vNdU3tachng3S9NKPsl21kh+a7WrJ+s53vIZj6wJZ7k5sOaz+kL+Z35hBTsIi1rrQQNICijLvzLdb8/dG2TA1mEW4smpdj/Cr5cWKkTckM6Joj6RFF00zMq9i7dxAkQTK28q9R2Brvv4IAgih9KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHhAr1Ss; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHhAr1Ss"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8d424af6282so697659385a.0
        for <linux-hams@vger.kernel.org>; Tue, 14 Apr 2026 23:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776233013; x=1776837813; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cyjgq35kTUANpRors0UJ2MyAA8YEkpvyucVoJcuXyxI=;
        b=FHhAr1Ss3JNstmp2wN9mOKvNClfd7PuRcHwfOZSAib2HiXP+sgDVaVa2nhNOhWFBH/
         qkDvNUZG/1Jbnxh2ODSxK8QLTvJVvnEKBevSovP/S6ElQt8drkJEuxeLqfLVFSKLm5+r
         uVEdySUvCyNJf4Ashtc9Pg/vVXPiIlqRILIxAesgIdiEUxsTETHmKaiRBC2oWMe7Ktr1
         KL08VIEBiTQ9bs7q2yCuzwZpOXt4cf30eDWnN3y0Oy9v/iirCiQhGqcRWr2+7zaHRGfp
         j2iKxEoWp3Q1zPfoGOG+N/dSAavinIdSPlnDnwdszSq3KWQvVKMifd9tkd77HkMPCwVC
         7SHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776233013; x=1776837813;
        h=references:in-reply-to:subject:cc:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyjgq35kTUANpRors0UJ2MyAA8YEkpvyucVoJcuXyxI=;
        b=jty+mXoZCa0ec85KGgQTgcD1Z2osaHn4YsxSKHKV8rC2xTep7f+T8eGsJl25iRZqCT
         Tp/hQ8KwtoZEtcfYunp57Yzz1K7mspkVuR+4Hk35m1jpDRSlKGmBpgPcLgL7zUK+p3sM
         C/dfG3SM9CcUcNCX/lwYWQT3BX2vZsAymSenRLe3ohjEuw6JeY3ifD3Vu8J6lMVCiE3C
         WRZ7XrypgoUKjuo4Xqse5yIbFG2FfO1aCQk1Ifv8QoCmzr3E5f67H4zGFJilydIqJXS9
         sdTzfBByVjY2bOr1W8ANXDfOkuR8VyzgaH2nqcYND5ecUTBGoUzQpBKHkSgkCHPflAUQ
         L7Ww==
X-Forwarded-Encrypted: i=1; AFNElJ9ZTfJUc2oGa7yA1mtMYQYRC/YboVY3CH8qHg2kfRQWJ1a3xZ4Cv75B8yuqqNBCTd8gQZ+4bWxFKtcK@vger.kernel.org
X-Gm-Message-State: AOJu0YyMTmq7L/oTknQHsxTMzK4/vax9YVErP9wK3h5DZ3f7ndonc/EQ
	iYYlEupGbzbQt3YrwBl9JjmSESowrMFGvXXb4fcO5JVAjY7vqHP/Pr23
X-Gm-Gg: AeBDievzuz4isD/V+8HXYnP14HL0QD2t0ZQEez2vAahGETZ6gbAKC2ePN3HgFuzM6nX
	mGuxOrq57zGZhzMLW1X3L3xExcCP/YPwm1+cM4iYWxvxjI49/ANwkb5hR7j7Xl2GdYAGG43wvSi
	RZofxTCFrM5xV4qb9EXnj+S9KFx5yqOH1XbD/eaweWKrc21F8pYHhlSAn3pi9C1qHYF4Z3/04Yh
	eL8UZSLbTFOy5LvAdYJT+ZqVW1NZzYiJWLgdPIRI24O+YpuRVMXb/dC4tXrDeKOMwKJijZyEkj6
	GzYl3Qng9mUHJ2i1MWX2qeQpDDWyIAxp92UhZJafwR3r8n53DshspwzRIEhDAXhiEA8YrOFn0/T
	Ur6OFjPA1eXaD9frfIoJiDvIpR2ukRf/+q6a2xV96hZprX3e9FPaqziXtvZuuz0rn2KjWfeqlm2
	8zDwkLnrQ4WqkD89ORZdPPt1FEKWBoHelBywwZlwDmGBLK9lBWjnKF5uo6I9XAXpiCa3anDgwbZ
	c8J3Lu6aQ==
X-Received: by 2002:a05:620a:2585:b0:8dd:7919:153d with SMTP id af79cd13be357-8ddcd1195c1mr2907886285a.7.1776233012579;
        Tue, 14 Apr 2026 23:03:32 -0700 (PDT)
Received: from tdc4045031631.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e4f2345c3bsm53523685a.24.2026.04.14.23.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 23:03:32 -0700 (PDT)
Message-ID: <69df2a34.050a0220.2d53f.b61c@mx.google.com>
Date: Tue, 14 Apr 2026 23:03:32 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============7568368645748790231=="
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ashutosh Desai <ashutoshdesai993@gmail.com>
To: edumazet@google.com
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rose: fix OOB reads on short CLEAR REQUEST frames
In-Reply-To: <CANn89iLXG5ZMNeHkcLW+Ug9PxNnw_EKtpGVkPw1qeXEjJNtA0g@mail.gmail.com>
References: <CANn89iLXG5ZMNeHkcLW+Ug9PxNnw_EKtpGVkPw1qeXEjJNtA0g@mail.gmail.com>

--===============7568368645748790231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hi Eric,

On Mon, Apr 13, 2026 at 11:11 PM Eric Dumazet wrote:
> rose_process_rx_frame() callers already call kfree_skb(skb) if
> rose_process_rx_frame() returns a 0. Your patch would add double-frees.
>
> Your patch is white-space mangled.

Thanks for the review. Sent v3 with all issues addressed.

Best regards,
Ashutosh
--===============7568368645748790231==--
