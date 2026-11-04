Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793810742;
	b=hz3KK3UmClE5H2w7pIkV9j56PNEuK+soLRGTtt76cEZ5LvYMpqIXMue3qYDHir5jBYOZ
	 ScmvQ9mQ24msFSHVtv3bAe1KLflY2ByqSbAjw3XO1e6h3j253J/l/Khgex/fV3+XAeVKL
	 At89jHtHoY9wH/HLULRi9YXaTGFXRuUFdHBQczH0B002oJShilNZyJLiVLKGlkBloonCi
	 df6K71v4qTrZ1qXmRGSR9ahNOIV3fqpKklcZDFRBPj30s927WGx/8P7pLsPCt98lw+VHa
	 sqZBzivSSD2X2SG29fLuYvnv+msyxpDhMmSmzLw67hCXYuId5La2irD3eyTtJf6AI2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=ZU+xd8GcU1n6HuImLB6wtpGMhsUt00uRIJIYrLFK6cA=;
	b=x3J7uANLEWbCiSYnEPnKFd7yQ2jFYvLqaiS35EtMC9WTQbbQmK9VV+XO+96kRJQd7Lkm
	 kUwFT8J6ZYK3kOkq6tTBpESlKAHwpcLJH2TopeBZeBanMcpTikQCooj+VXvfovd9ns61a
	 dfkSuS7wlSOgWVAsUORcI39IbfMkQBYIEkNkuPl6boeD97W2ANeoTzdb9Sbwz7/jCbZgV
	 L+hOwo9QKT4Hs5czZsOapwik0dNmO3kRZGvI1wWS3r+BrVlaVEJVyUOr1FMU39DlRvEgG
	 3S2dkpC5h2Dx6fB+9Yv3VM067xzuQLSSEh3XIWuv1neRzocUj9ye8aRZHJAce4NT6Bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+45eIMD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64695606D80E
	for <linux-hams@vger.kernel.org>; Wed,  4 Nov 2026 16:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64695606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+45eIMD
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8aea7b7ca0cso9880507b3.2
        for <linux-hams@vger.kernel.org>; Wed, 04 Nov 2026 08:45:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793810741; cv=none;
        d=google.com; s=arc-20260327;
        b=gfE7n19h1oWi5jAf23IyaApr84FOfIh+l/05e8EppBFtgMGgVnLNhwitdwgxEyuvw7
         Fxyyqex7JB2ZZYOIgV70aDuz1//7Tun5UXTcuiSqcyJa69SmoRw1LDlN1FBZHBG/0l0j
         KcC0o7xn8/UOVQrMEIC7ghKrMb4nO+1NAKyob1vTLqOxUcZcBsEDoWG8mMe6Z8cSPQOX
         CNXa2NjAT8xtwx/BpBBIq6XXSBSAAtnzJlo7EnqKYWv6UKuZ95I0T1r+NK5PiCP4ZAy7
         gyWbuTCIZeXh6uH/9Bq61AEmOMfa8RDwVP6nAgn/zbWzmPjP9N8jIDrnjWL6Ee21Vf0V
         fnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZU+xd8GcU1n6HuImLB6wtpGMhsUt00uRIJIYrLFK6cA=;
        fh=yvyQ0fNR7evt9jL2wClrmYYCzRjxmggS8kmKCqDY7Yw=;
        b=WMYZLE5eaC1HI5iJvPiIWzdupo0a0zpUoosHCyxaQiH9THM5++5bNOASfevAWBFFg1
         1kAQlk+Mm8oLfSLvOHrMUtynHSr58FjQ8h0qhB2YQgSQLTc1tluc2QGwCO9qC3vC4Ksj
         9ojvfJfb/GjNKIC+95aZ5HzvLePaSG/kp/w6NnptMiWnruQ3jTsvW48RtIIX6MHq4KIV
         kHasd4mwlLUHH3eELF/ZF+DmEOJ2SDI9YxvseGocRc8D2ps7f3Gv5SPwX+0Kuzlug8YS
         8Fm7CK6is3OH1jwo0LtD0QljbcReZw0LT5P9QxGu2sfytN61irIFbkfLEDvbqDKA7lQG
         LETw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810741; x=1794415541; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZU+xd8GcU1n6HuImLB6wtpGMhsUt00uRIJIYrLFK6cA=;
        b=b+45eIMDW7nGUd4+vSvkVvGe0gc/PBBbJL6AdqqY+iSchdkVtsLkYGic2JiHoVVxzZ
         xAutQJ81nSbIh3oCHc5K/qmET41MAXGNhC7hxrYO0g/rrimzos4OPqZMwYCLM8aCdYmI
         wx0iNZKvAVRaU/Hh+cNXDv3vXD4W8+0lf/kG8o2SxvAwNcfZIoZFEbjTipLwO+kL8NuA
         O8sywH0aez8sAqQKnJB7oMppGL8N9T3Apbv+bAfB33LuiKnFJidoZONG4oK2/gMVZFeD
         ZgGpzk71i+9cvppscFC1cG6wO10KZelC6f3nxi3rp9MgLlZK+6SZgfjgD9CqTx7/UyMS
         oP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810741; x=1794415541;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZU+xd8GcU1n6HuImLB6wtpGMhsUt00uRIJIYrLFK6cA=;
        b=H6bHSt6zjB5p1nuRBRWe27oMpIMoeo6yr9DU3RlRVsxDTgtXovDK+ZJvwxDAmLf3Bf
         bFWsdc9f+l77px3iTcOAYCUIY/Irsq83D9B95Q7GvFBCipRpK24+AiiMiwb7r86Tyb1a
         /v2AUi+oVfgvWWhE0WjHLq6DtrpCsAaD2GQNF6s+eHtXIDfXVfPKY6ngwS3RwHIQ81ao
         +GPuRz/4u/deKuSmTVN/5dCca3PHUizt4q+fJJoHlGYF81Hq2y2SEDSKC+WnJkepwY8K
         eUDzkThQNFuuWPf3IbvoEloxLtvWo4+j9Ko5zdWPJaM975QHmKuI/zI+2e6g8O3tqQrz
         EcfA==
X-Gm-Message-State: APuU4Z8znESDShNMTg09YrNAq4DDoQMjelPVMwBucBYVRN3HgHu+P8hE
	jQtKuTPGFwFGtnHsixXNS8W+EeQveWJ1XhPGx4m8HTsrOGp5rtmjanME8sV2qKXBlj4Grfm010g
	aWX6ibWEpqlpr4T/x1/6qYb5yAPg1H3JMuw==
X-Gm-Gg: AYBFou2GxOOTmwJG9lWdGGymWtUNMcbHEJV5I5/GgsYAdEWQmmzQXPGZHr7Bi4NBPGQ
	Styv7KJBBBZSdASMjhvlvaFgaR+Ds4ESPEW6CTZ5mWazVRm8wGQHpGaYEjvoyHHKonT3Z9rOaw0
	RECfb56MtRE98mGPWSSIWfS6LhdgQ2e0U/E+QbZo/DucA0/XKGItmGB/Jyqn0Yjx+rDjaO68x4Y
	VuuziI5QONVlsbqlZTH5l+oXDoeaUhUt6efoj0YMPUZ1sENHGfhVyyMdbZ2vcTo1IbIY4x9PTnV
	YxzIUZG61j0XloG3Pt2zVLq2PTsk0PTf3rNa8/DgFpgEhATgy09b0hQ0G2IaUWhJ1X4vfCYXfwM
	ZfhHfM8rKvS/qOUyEQ0TI49hnlLp9r/zqhvROjOR7ekPNGQdsQXXQTu411A==
X-Received: by 2002:a05:690e:4594:10b0:679:b810:6e03 with SMTP id
 956f58d0204a3-67ba4eeb82amr6485344d50.27.1793810740939; Wed, 04 Nov 2026
 08:45:40 -0800 (PST)
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:linux-hams@vger.kernel.org>
List-Help: <mailto:linux-hams+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hams+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Wed, 4 Nov 2026 17:45:29 +0100
X-Gm-Features: AclHuK_HcQ9FjvKfMBYMOeID8HvKdZAmrFDuvI3JL6cOAzUqY9ANWiibhTtdWKc
Message-ID: <CAFAa3YAmOhtL0B+aEAtkTCn+Br5hKXpkah42VTcPFxjhFB3jhA@mail.gmail.com>
Subject: [ANNOUNCE] LinFBB 7.0.15
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

LinFBB 7.0.15 is available.
It fixes held messages losing their first word on 64-bit systems.

The bug:
A message held for the sysop (H status, reject.sys "H" or "L" rules)
is stored in a .hld file that starts with a 256-byte header.
On 64-bit systems the header written there (bullist record and home
BBS) is 263 bytes, so it overwrote the first 7 bytes of the text.
Once the message was released, its text started with 7 NULs instead
of its first word ("Hello a", "Bonjour"), in the BBS and in the
copies forwarded to the other BBSs.
32-bit systems (235-byte header) were not affected.

The fix:
The header now takes the size it needs, never less than 256 bytes,
for writing and reading .hld files.
32-bit systems keep the same file layout.
On 64-bit systems, .hld files already waiting are read at the right
place and get no NULs.

Tests:
Built on a Raspberry Pi armv7l (Debian 13) and on aarch64, with no
error and no warning.
On F6BVP-1 (aarch64), a bulletin held for the sysop and then released
keeps its first word and contains no NUL.

The configuration files do not change.
Upgrading means replacing xfbbd.

Download: Files section of the linfbb project on SourceForge,
fbb-7.0.15.tar.gz or fbb-7.0.15.tar.bz2.
SVN: tag 7.0.15 (r268), the fix itself is r266.

SHA-256:
80cc5664759a42bd8a167a768cb6a42c63d4af061ae3847edc28f04cf25b18f1
fbb-7.0.15.tar.gz
f953b2abb1f823e6a4bcf61b1d96263d77eb120a837cc993eb5096839b380f7a
fbb-7.0.15.tar.bz2

73,
Bernard F6BVP
