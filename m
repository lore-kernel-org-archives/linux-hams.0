Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B172459EA
	for <linux-hams@vger.kernel.org>; Wed, 11 Mar 2026 08:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217502; cv=pass; b=rQyTSLe+b/uU/GreFZ3OuLsYCBMAsE9tq6A9yZxKjpq48hvMBpPdBTMhJTAMCceGqhW3q56xW1SBzyt3mykSw3sVvbhHC+bT0GofXk2Jtn06Q6YxA9lEhINLVemXcqaJE3o2Qx4YYDD+Zj8+sa+C+4Pn+0CaViKR36R0jWKSmqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217502; c=relaxed/simple;
	bh=bh6U49eCiCBbIvwEknUz7QsV9A4ESrZsJ/9XWVh19mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jNEumYcwlzL4VPBuQROmkPRQWY1dg9QrSdW5S+gyL4nb/TGeHFHAxoTsWz3gw5zsZbVL27K0ADUTVn/9JQJdDyxFP3GUSNHCAP1AZ6cz+wVUYaSZV5tt9SI1j16+n+J1m+jm2LOgJHZlVTiHp8oZ8rEOKG7XJRZJNb3u+G/9U2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pexCnYug; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pexCnYug"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50934b8ab60so7678421cf.0
        for <linux-hams@vger.kernel.org>; Wed, 11 Mar 2026 01:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773217499; cv=none;
        d=google.com; s=arc-20240605;
        b=gCIW01CoOqYwpXTnIRN9x55QIbf54emA8chk1Gr4SVkzy2rPt0qnryxsJAyL2XsXJp
         Nfl6w2Kv4IHGe9AKS5rLG8z02a+rT0ddGD7V0KxteekUudQX4ULSI73OvFIY1IDoVzQ+
         31oV40Itcaxb08xSZSFUn96fRAuDF55+vli9QgqTzpMsBjfDit2MyuymREWA+H3216z2
         9fvEodJ3Z5rdESJgxheyNp7guCQSgA1g4h+a2vjao3se2FGTL0HW4ukpJbX128lnAa0+
         kF9UAzylayiw3L86DDKKFvZmssrLmVkZp3L/N6i3JK6WAKyPPR85BoQY9BsSo/wAgFuE
         aoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bh6U49eCiCBbIvwEknUz7QsV9A4ESrZsJ/9XWVh19mc=;
        fh=nC92Zc/9DbB5kPPLB9oUKjdYSFSBGey4jxPGjbBPg+0=;
        b=OPC59116QcnomkoIEdFtd+ob8iy+p9oCw6LwzjwBU6L7sG4C1j4VFLpS+qDY6CE80E
         GNRaYHfB12A9QVEJcf5VMYOR7jcjD6O+zVnb/3PYLZsQx/7PBEJ2QP3lqrxRxfVHFTDe
         1/OgoBgeYGK2e/ZhIhRXNKdUF6A4TkX2PaWE6k5aXxzy0+XhVSsJs16XVCexIwoi/wfJ
         lW/oM+0ox0qw3ca8YgqYUlxOX++piKQ/O9ox5bTxpS94ud8FC2+z1OHeXI5zkLbN39lb
         +E+aqGcD76WwuxM6u4TzkY1ZTO3oiN2MQ979IjQCWSNZd1VlMgqxcRFJboFK3SgNKR27
         GJxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773217499; x=1773822299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bh6U49eCiCBbIvwEknUz7QsV9A4ESrZsJ/9XWVh19mc=;
        b=pexCnYugPMRnQt3MsAuJ5g+koHlN/GxcIaJ4EZs20CzSu2b5bAoN8F8/Rfd6Pd7YYc
         7NSkaaVRkIX/qvWhHQm60t7YTedMIhyeJtuUVJDiDb1MWcVLs0Gx8Z37u0gyAjloGs3j
         iAxrG7dSdWu+S1sHEu0k277zq9zDOTqD0FFMc2dipY4lGDUqV/zi2qO2h5uTVI2V1wRX
         Os0uSb+gKk2ATyWEiIYiVpoIe4luZ0qFgm/lewfgWG1MFrM6XGwwYegNEybZa0zaGNpP
         bkf3hjoxD956x6GMKks3P53X0cmSkwmivsjLJ4bxbqNcCHqE67KT9An0YHNH4Ajx70c5
         0SdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773217499; x=1773822299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bh6U49eCiCBbIvwEknUz7QsV9A4ESrZsJ/9XWVh19mc=;
        b=uFGyHhm59jpEWUuAzSGywYVHLe+bMWpm4lS6rB5cJ8Lo+rC0vkXWruNdbbT1xHTsMh
         m77aDEeCqBPQrDZOV9lfStMgOCozc5QMBqKJBMM+xxeikj6KBvTOutqgILYHNOhpG2uQ
         KQZDr78/Ecl2/3WKCuR3K1lwRWswRvflhpwbY00RA8RVgkILOnyGH93J9v87z0dhg6Kc
         QLs+pxH9HsYcEE+xJNLIFF5rQUQpfuQPpIhBoYKNz1qYz5FJtijdBnZkkjU6c89f7XDr
         HvQiG83HUNrU+0D/Lnzv1Dy8yrMFBorRJ628rDRw+lh0xjbT04yMnOX/vELGuIMAnM0H
         7TKw==
X-Forwarded-Encrypted: i=1; AJvYcCVqj52CLF23aSiD1U18/GNGuHeiXX6L1kJGAsakOkaBJkjB9m6D5QroH4nnsBQhwfeT+Xy07Maq2rKz@vger.kernel.org
X-Gm-Message-State: AOJu0YycV8imYFqTeqGToqv4ocMA1+osqO04ZzdISFlYunHsG1upNdoR
	tWZPyAwAVzzJG9vGGqGd1fbrBC1R+39SzREdE/FjdoOJAPbGwUdoFdWoxZiMmhAxLaqU1KCYIsP
	oMWsYuIbdkFNndQH4zOI197WNv46Sexn9QzFw9jJn
X-Gm-Gg: ATEYQzzIGHSBn19jldfOCKoyRtIrOgYZ/T5L84+z+cXVi/BtqqvAFNOObKCME1Y/A5u
	Hk5zQYnfgvYSvcIajJo2sNgWwhfoC05mjGkaCFxw2g1eaiXlX4Yj8ftUFnXVG+nOIm2oIuZkmQ5
	ld0V9Dm2PYkibMexZAgcEEPgLYmomEZunLKZC0DN13Krnsyzc/jB/SLKbPPm6oWUfq8rE6N5V+T
	EFsRMa3jPKSK/kg2KZMJIMfXbK4O4XVcUru3iPvPYwPzaYs9GdLckR48xzgvouVaRuRs9/GUxec
	uuwfq/o6
X-Received: by 2002:a05:622a:54:b0:509:f1e:41fb with SMTP id
 d75a77b69052e-50925fcd943mr73573621cf.6.1773217498516; Wed, 11 Mar 2026
 01:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311070611.76913-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260311070611.76913-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 11 Mar 2026 09:24:47 +0100
X-Gm-Features: AaiRm52SdgCeU51Y-1e-Sk6l4P3zSL-DgLPLdP1cnJA8BQG1vPHxIiVp-Wp5uO4
Message-ID: <CANn89i+MTAhm+T3dR9T45wOBU3xjiyKfsKXHen3bBLu2T8JD9Q@mail.gmail.com>
Subject: Re: [PATCH net v2] net/rose: fix NULL pointer dereference in
 rose_transmit_link on reconnect
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Jiayuan Chen <jiayuan.chen@shopee.com>, 
	syzbot+d00f90e0af54102fb271@syzkaller.appspotmail.com, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Kees Cook <kees@kernel.org>, 
	Takamitsu Iwai <takamitz@amazon.co.jp>, Thomas Gleixner <tglx@kernel.org>, Pwnverse <stanksal@purdue.edu>, 
	Ingo Molnar <mingo@kernel.org>, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:06=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> From: Jiayuan Chen <jiayuan.chen@shopee.com>
>
> syzkaller reported a bug [1], and the reproducer is available at [2].
>
> ROSE sockets use four sk->sk_state values: TCP_CLOSE, TCP_LISTEN,
> TCP_SYN_SENT, and TCP_ESTABLISHED. rose_connect() already rejects
> calls for TCP_ESTABLISHED (-EISCONN) and TCP_CLOSE with SS_CONNECTING
> (-ECONNREFUSED), but lacks a check for TCP_SYN_SENT.
>
> When rose_connect() is called a second time while the first connection
> attempt is still in progress (TCP_SYN_SENT), it overwrites
> rose->neighbour via rose_get_neigh(). If that returns NULL, the socket
> is left with rose->state =3D=3D ROSE_STATE_1 but rose->neighbour =3D=3D N=
ULL.
> When the socket is subsequently closed, rose_release() sees
> ROSE_STATE_1 and calls rose_write_internal() ->
> rose_transmit_link(skb, NULL), causing a NULL pointer dereference.
>
> Per connect(2), a second connect() while a connection is already in
> progress should return -EALREADY. Add this missing check for
> TCP_SYN_SENT to complete the state validation in rose_connect().
>
> [1] https://syzkaller.appspot.com/bug?extid=3Dd00f90e0af54102fb271
> [2] https://gist.github.com/mrpre/9e6779e0d13e2c66779b1653fef80516
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+d00f90e0af54102fb271@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/69694d6f.050a0220.58bed.0027.GAE@goog=
le.com/T/
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>
