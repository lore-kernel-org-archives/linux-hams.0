Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C15D3EFD3F
	for <linux-hams@vger.kernel.org>; Tue, 10 Mar 2026 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773138258; cv=pass; b=MNFglWDGBfGG96YIrUhjyPH7ALr5f9QGylhI/YRGRkPv7os19aK7QXoM0qIkHYi78SA+yVqChf4Mt2vCugALO5Coxvso2zPLJPnX8vptU78/hEDml4jB7JjlHDvLFZHyYozXmUCBrWgj9f52mNfj9GhcaYjOnZ1wyDDiWJMr0Bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773138258; c=relaxed/simple;
	bh=KED1USN9qGSdhzd02iHp3mLXob4EqfERUJ89PHWkvhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XL/9D55VYCYwuReN3qFKKvjnesnLI6+szovhNyZlBHIc7jgyENK0dr2r9iHWAL03D76yp6p/7NLOy+i8KVPn1UqXCGJ9E0hv2PiOJvO+ft07xOz1owJjkX+wLsw4/rMBoA0B/YZuybUL17XF68RHMj2YXPLSisJsIizzQHv/zk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jtQcZu/o; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jtQcZu/o"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cd80f56b27so254843185a.1
        for <linux-hams@vger.kernel.org>; Tue, 10 Mar 2026 03:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773138255; cv=none;
        d=google.com; s=arc-20240605;
        b=B8/97meneeYLne1RbwNyhXAptuG65VjEM7zM+5YT1o44Ero6vj4O27muh5FmyPgblb
         4boMumGkCrtAG1XPfrbeOHBklV9QIMK56NfeAysVtWBxYnk2TviaUaVgfNmNENocL45c
         NgE206iqYmc2dKZDFI02NTclitOnOLT9RIFYG7ZpEAlBorP/jxZLEfemVMkAOo0RhbZO
         CSCEfTvFKKX22oafPYBRamisYF2vJ8dOTWueUE9SFgu2tlIqFuarEcFs0a5dI9kRO3yc
         7OoCCjeZwxdCaM3dWOmetB91MW0Gtl/3kjYnZiUZ27KJgHDV2BwxwIoMgyERcgV3+0YM
         K2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+93VfqTtOd/2Fz2y7boXGRznfmsClCZhtRbObtkOrJ4=;
        fh=Q2jTIvarCYXfjigHb219nt8E0QtK2PqrAyhY9ITqdXc=;
        b=aPKbVXzBId5fXyxrdMD42w67JMbEsjW5Bz0wUvi3Cn5EVoFVBTQAi1ZGh1ga987Nl2
         RL4aaWYxAgTVRkZpCOZ33uqqaQDpbmoKekD1YUkxjZ41BOKMnZMxP0RelALA88eR5GWM
         /eewfo3XAuJz/s5CHlFCV/OFWYCKEpTqFxXhSVMj2OvSpEKVB22XueU6m+k30LkQD1j+
         Ev1mKZd41irLeNAhFpbNxEq78Z6KmNFXBdhdxXsrAsjrqCRKT4u86KUBgNnAViMvlmbV
         0tYkT5J9tRbOZt2sxEyLoBtKHFa7wmzqr1zFYLhEpmHo33O96N2HVmnlmZWfAe5EP4w4
         owvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773138255; x=1773743055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+93VfqTtOd/2Fz2y7boXGRznfmsClCZhtRbObtkOrJ4=;
        b=jtQcZu/okRjcJhG9vE4lAHMIlKH78v+kNCao0DyvlKPuAAPaHmHOMGRWvIWg/hQ8ue
         COJZPHS7Hz75xNrGKKVgEkR8bFe66sXbnZfFk4mlz//9iESBNEqqm6vWT0MiOssDezv+
         EUHwRJgfrpLeMt4O5H9UMZ/pyLpItnPnWa0iHGFApu6om4NXwMPUGwn+A6yHNz4ejc34
         WyRvvjP6HKtU+dhOs+q+e2j7itiUk9wp52EezYVAphfUoBF9AvPne7xbHKYOJsg++Kh1
         xS388FYMplbw/0P7gN4ptT3OUhRgtsa1DYTta02z6JZwU1Jm8Z3qdJtsu1htHOBjNv4p
         sUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773138255; x=1773743055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+93VfqTtOd/2Fz2y7boXGRznfmsClCZhtRbObtkOrJ4=;
        b=SHpbnVjQTKllPytnBM1SHgmIVHmKL+cAVPU9BOyxBMl1nc3Qtzcq3xndfiUDfPVB6X
         RRQjNhE+V+Mhdc5eqnPQ1hLaDISSdZpvk4hj7mTIoqRzGIzSL4F1Bd4mK14Dv7XvSkWR
         ufVn5sCYiTvywvnW1XwRlmiyBh9qeB4TBjZzRDdSd2q7ofDXHWXepfa9UDxqZMoJiL9H
         55++BKFwSPtbxuTJ9cQzXZso84u/m+RD3shsZjiRShAgIJ7ATDIuFNWu4iIa0RGrIwjh
         0UExERF49nUhaRtAO7XcA2uGQW0rZgeCCXp4wtfe8HNBv+DKRD/wZLVeo1wrJtBeNlid
         gpgw==
X-Forwarded-Encrypted: i=1; AJvYcCUfN4wXvsRsbyDnM/x/sOqPKOzDSRMyb2Qq2mj9ren19zizrnYZzupGcMcXWTP+DPD9tAVUutH3wTNK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ovPTPrh6izzkmkDiX+RUFV+Jh5kzqNxPniiKQo0iXc6l7zBw
	m/lidwbxHmBV0euer7VEgFOL+KdnaIgjjgwOu/LqGgHAvS3e7Zi/338pW5qaGzJPxD4KAic1rMq
	E3RC65l/iqiDXRlAHFsdckf7Nr2OvprJeei6vo3MR
X-Gm-Gg: ATEYQzzj9EUU6RIxAVtIY9pPeLt4uOwZ/OHtgsQrlbvVQotXtaXUFsLeEkespvt7hsB
	QCM4pTB6MAd84qVCrr3HDtiz9w9T0/yLuAFPooHJCKtH6EHvAdZVW/AFMut1bTQ+z438JvRWmwj
	R2f6p6tRBxNktxx9CTHlJONrSCL3VOis5A+YV6oUOYUe3jdkwa1gluUPe1KskaVt+39MCgnyyB1
	HjI/6U1j3mSB5pkMl79cVQEyHj9x75eTIOXZj+tcf4hTDAyqECEAXTkCtFws80yVp1GJ4i+nP8R
	NYVrkfc=
X-Received: by 2002:ac8:5a13:0:b0:509:3211:dc72 with SMTP id
 d75a77b69052e-5093211e380mr1902381cf.24.1773138254690; Tue, 10 Mar 2026
 03:24:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310101349.50993-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260310101349.50993-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 10 Mar 2026 11:24:03 +0100
X-Gm-Features: AaiRm50NFF9NH7MViNvliA0vkJp1G5fS36V1ilnXLWtEU9Z8qMPMOCUnHuGJmFc
Message-ID: <CANn89iL3g7+MpkDrY8-v+Zswy5Woe_VvEMqbvHYRxQGpk_OSEQ@mail.gmail.com>
Subject: Re: [PATCH net v1] net/rose: fix NULL pointer dereference in
 rose_transmit_link on reconnect
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Jiayuan Chen <jiayuan.chen@shopee.com>, 
	syzbot+d00f90e0af54102fb271@syzkaller.appspotmail.com, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Kees Cook <kees@kernel.org>, 
	Takamitsu Iwai <takamitz@amazon.co.jp>, Pwnverse <stanksal@purdue.edu>, 
	Ingo Molnar <mingo@kernel.org>, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 11:14=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.d=
ev> wrote:
>
> From: Jiayuan Chen <jiayuan.chen@shopee.com>
>
> syzkaller reported a bug [1], and the reproducer is available at [2].
>
> When rose_connect() is called a second time on an already-connecting
> socket, it overwrites rose->neighbour with the result of rose_get_neigh()
> without releasing the previous reference. If rose_get_neigh() returns
> NULL, the socket is left in an inconsistent state: rose->state remains
> ROSE_STATE_1 from the first connect while rose->neighbour is NULL.
>
> When the socket is subsequently closed, rose_release() sees ROSE_STATE_1
> and calls rose_write_internal() -> rose_transmit_link(skb, NULL), causing
> a NULL pointer dereference when accessing neigh->loopback.
>
> Fix this by:
> 1. Releasing the old neighbour reference before attempting a reconnect
> 2. Resetting rose->state to ROSE_STATE_0 before the new connect attempt,
>    so a failure leaves the socket in a clean state
> 3. Setting rose->neighbour to NULL in all error paths after
>    rose_neigh_put() to prevent use-after-free on subsequent reconnects
>
> [1] https://syzkaller.appspot.com/bug?extid=3Dd00f90e0af54102fb271
> [2] https://gist.github.com/mrpre/9e6779e0d13e2c66779b1653fef80516
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+d00f90e0af54102fb271@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/69694d6f.050a0220.58bed.0027.GAE@goog=
le.com/T/
> Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
> ---
>  net/rose/af_rose.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Normally, a connect() on a socket already connected should return an error.

disconnect is a special operation involving AF_UNSPEC

man connect
...
       Some  protocol  sockets  (e.g., TCP sockets as well as datagram
sockets in the UNIX and Internet domains) may dissolve the association
by
       connecting to an address with the sa_family member of sockaddr
set to AF_UNSPEC; thereafter, the socket can be connected to  another
ad=E2=80=90
       dress.  (AF_UNSPEC is supported since Linux 2.2.)
