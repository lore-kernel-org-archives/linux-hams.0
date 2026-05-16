Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E2A23183C
	for <linux-hams@vger.kernel.org>; Sat, 16 May 2026 10:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778928940; cv=pass; b=VyZ6X9+uYPOEcFLHyLt4HQ9d3G09WLiTVmLkTvhMgRFd5weDKmzXCkuOX9T9SngwcwD3sq65r0d4ltqZ1fiSxrqTdvxgvri1x0SvA8zO8woiUTv56MDdRQR6umOsSd89PfFMQEAUnbLIkNMlLbFVvpaErxxkZVMahYoJSAjDfvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778928940; c=relaxed/simple;
	bh=UJm0Vha4QgPi+LutZgf6PJHq7Sc8qU5QzD/hNhrZv3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JwVIpOiaiNRa/2M+pN2VT+8Xw7EBjFNOpm1iAwPZR6UYHsjQmDtzDbf5nwrNVyJQ4X2kLzmyvxsnGMPLxHN+QQotfYhYtO5oFtUzmn+hZBQJmVUTmSegvHTMpPCO4XzoOPw68tMe6ZqHZFJzScTltIjQcMSdrHHq6+P6EH4HRF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsZq6v7d; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsZq6v7d"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7c58e6eb3edso2340457b3.2
        for <linux-hams@vger.kernel.org>; Sat, 16 May 2026 03:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778928938; cv=none;
        d=google.com; s=arc-20240605;
        b=NtfM/byfGAqY3YPbYwcZ6kybmhFKVESDu4t6uIl5+nxC+eYhn3+Jc9Tk2WqhZ2ilSX
         aeDLFy4WNYgvjpUpnldz1M8llXNeXEN6DutRJNhJcKbZgPdPTPqbkd/vopTFFUBEoDla
         2uyMwYujf58zGL42o5+pm+enPdwCuHp84kEOqTVRrq9+wXlFogOBrMm1yZNczEVGHrUk
         S8NYqBI5vEWkf9FRR35TrBpnfPk3+H4EBUxX8ctvGqhSV8ncnLnxFcaF7k3CUkx8t3Vd
         m3z+uh3wHOXzx0qE59Uy/dp9fod50shahTaLdGUvE3RWxqC35Z2zJY+z/oQL3v/fVgOS
         40Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UJm0Vha4QgPi+LutZgf6PJHq7Sc8qU5QzD/hNhrZv3Y=;
        fh=TMg8UGov4ng62JUTbfrSE8oWRYbKRqJ6m5I8tGpAss0=;
        b=Xx4M2upQefWrxqCBt2mNFwdbs5mzeh8kWmto9NqCUMdfUN8cb19cmrqQPow4UUhPtl
         Ls2CIXqahPWGaehBppjdwNLmOlpXl3DIG/CdVVdsedm6b+ZObfG4RzRXBs8yVuFWKUuh
         WVKqMOKid5DG4BjS8WzskFNGI2opYxNtzhrwWwQodHjpOgPZ+JzJUe+AxoFTLj5+yDAq
         eoEtAXVK8mOc3FLT3msmUT33Td7wLKeqygzTsfL85AcaxMH8znBVl3iH9dz4NOmc7Mqt
         VV66lm9OtcdKoqAl+iBfGP0R2iDx9T+m+yM4glQ3RuYvRcgo3v/KjJCtaxcd0xYsX6+2
         tAnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778928938; x=1779533738; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UJm0Vha4QgPi+LutZgf6PJHq7Sc8qU5QzD/hNhrZv3Y=;
        b=GsZq6v7dZDcbSi8fd9eExCz0xZgbsKrPjDRcniLyr2qYMIeOc/shZVvAEaTFUeU9bG
         6dElielVZdZcfxecQYfz1D8rqKLXz2jLZB26AYnzRBY2TgrIjqDaAC8Y8I41Ggb3CQtq
         c9GWpK/8R/ywGIJ+QyLh/ttGTtOVLQA6fBghH/lXJzSrJP/rNDwyoDnULRuswKer3EOU
         rSXUHhEFMPeSdic6k0ivYqclBmNruqWfQU31rfq0QmZ6CcGCWSx1fNC4HBUmJtZfkvM2
         xrG1ihBNZot52uy8gaTwCLV6cHPPk92oBuW370lnEY9OVtHc4DpMNBIfvnhUfBCekTXR
         P4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778928938; x=1779533738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJm0Vha4QgPi+LutZgf6PJHq7Sc8qU5QzD/hNhrZv3Y=;
        b=Xq5ryDKKdZnyYSiWlpSRKLDkTFBJwGtW750ouUfjz3O4k1WcwweRNIbTmgGQjzREPz
         4F9r8mLXOYJEAMgv8qJe/0QlUHp3QZiIrcnfp4b2tA8bfGzUtes6ZvISbRFifz7dr5Xx
         zCScOaABWMB3EeQEyemA4w1sw/8kMebOQJ5ZVOthZHkSIW4AzijlTWBr/NDK3n4CaaT6
         nuWZWdoZVILOS+/ZJDO7hliH8CIVieOa/iePd9P10S49eVGNMit4JUdORbR/BLiZCmol
         EWRkvhUdSjEEIVfdebhvjFBKiozk397N/ZuHgGQa0UX9LiDHbbKt65EKmtv4k1Zfrxlv
         gnSw==
X-Forwarded-Encrypted: i=1; AFNElJ8wT5mgpaVodu+yw6EiRYPT9G3fEmyu+3/KS6oWRfEbePyvZbeKsiykTfHpJ8MgjTBAEXhSLC3wBLqF@vger.kernel.org
X-Gm-Message-State: AOJu0YyXgeiQYrPX6a+7m2NOK41RZw6p0wpAQENv7d6dN/ZJSkacPnZ4
	leBquPwpGu94a44gmjgWkv49Ey1AnfymIXaQvz6+B78LXwHpooPA8UcHYzVKZWbcYEMdCB81eOz
	WmGrk6P/lTkxQ15zC+gvaUfSQSONAZe7O2v2h
X-Gm-Gg: Acq92OFw3RqI00PDkWeiVZOtS7QCjM+TBwmQZPxrUzMnu6N9eBzq6PboLzmfa9ML5NC
	YqyyFEVJsvX3sM3QSsNFB8AsKNM+xyPQpwja8gP6S5Bm8spbMZrodTPTIkqOgy7K98swWtTvH3g
	Pbrv09onwSBMxMe7+sk4v7BGhChI88R3E+qbuDcGtmpVNqRCWqOj57V6KXcT5f52TD3zLTQkb4Q
	NuWXprW8r146TnrwuH80SrNi8vvin2ypBtfT0CXoymmlU3XQz/mVz/rxjubFCvZE7P0mjbMsRmj
	5EhEqbg=
X-Received: by 2002:a05:690c:22c1:b0:7bd:95d1:ed51 with SMTP id
 00721157ae682-7c95b829b37mr88157687b3.28.1778928938365; Sat, 16 May 2026
 03:55:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87se8mytvv.fsf@toke.dk> <20260512144512.9960-1-bernard.f6bvp@gmail.com>
 <20260512163648.7367a640@kernel.org> <CAFAa3YDcBsCnEJ1t+a3iHhzxW65HX+QNkZWPKHvDYp_V+UwZYQ@mail.gmail.com>
 <20260515181411.28af7ffc@kernel.org>
In-Reply-To: <20260515181411.28af7ffc@kernel.org>
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Sat, 16 May 2026 12:55:27 +0200
X-Gm-Features: AVHnY4LM44c5zj8zy_QkFpcfHYCBiRpHUh4S3nKYrYR_oB3folOtDOnJ-b_4rwg
Message-ID: <CAFAa3YCx0schCKn8k-nPfQPSaQ_5PKYFzt-5j-ZyEZbKr2DyuA@mail.gmail.com>
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
To: kuba@kernel.org
Cc: toke@toke.dk, stable@vger.kernel.org, davem@davemloft.net, 
	netdev@vger.kernel.org, pabeni@redhat.com, gregkh@linuxfoundation.org, 
	linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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

On Sat, May 16, 2026 03:14 AM, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Fri, 15 May 2026 16:52:43 +0200 Bernard Pidoux wrote:
> > I am happy to submit these two fixes as patches to mod-orphan if that
> > is the right approach. Please let me know.
>
> It's a GitHub repo so PR is probably appropriate there.
