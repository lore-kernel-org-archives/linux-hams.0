Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1B633F581
	for <linux-hams@vger.kernel.org>; Thu,  9 Apr 2026 07:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775718803; cv=pass; b=iO/mW8pW1pzG5FFD+UK83biO8xGf5F5EhKGEqu/9d5Z60QanFb+XM3dqbLAPm/Jh4y9XF70BfeOWlitpS5G2RfWDD+tuivGmjYr+Zw/j9krK4+MdmzZqllfFFcpxlYroWvVHmiqUZBmM+oAg1xAT6DSZQM1a2jLt4H2UpqiZ/Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775718803; c=relaxed/simple;
	bh=9DFaHZMYaCMqRR6Rx4RrfAGPj2L+2hco6S/i/9VyJtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RuIyZXJzjhaeoczbrIbo4O2jw92zKoi5O/mx5xipqooxLWtb4Mu797ZduVnErkJWWObgxKNI4zKfM4OAmmxu8vlnJgEli5MARn1y9U7kIcHf/orRMDxLvt1yxTi0E6g6pmmG/9he8sE8xBPzsPAdYST+kMkjtXFpzEskxXBJiNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SoTC1w4P; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SoTC1w4P"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50b69bf5638so6487841cf.1
        for <linux-hams@vger.kernel.org>; Thu, 09 Apr 2026 00:13:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775718802; cv=none;
        d=google.com; s=arc-20240605;
        b=j4aCqCVFJO8CgJxbVsKxbEoMdVy5x0VOP/BNRMJRGcY0IQMqwoNb31VDaVwJl6g5+m
         3X3q7s3NAXKgfhUP/VzxDwfSFBPtlywK18qFfIOXF0T51Z4AJ1Rr1hhCfyNw1pl4hHyF
         /NRI3kAi42evZezA/Op8VkUdhoaQ3xZtqD/qUKHWzCpovgU/5m+eRTnM+ch14As9oU/U
         X4imFF5/n50O2MjYwaVBW7wpEIq6ED1u34uSCcHpovcbfeX3LgGZYmWX1M0KTLkZgI4D
         TojQCdu3JaaZpG2n8deZmaV4co/DUU4M5tNyBJRYwykj6FI2dt8YNK8OykQD+2WvZVbc
         Htvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N4t9qEuOwjjeNBEsJhxscNy9pF7gCA9F8HMy/E0F534=;
        fh=AI0nCMiEtJbK+4o1RsPcXJuMy+UoujK4qGzFIRODNLU=;
        b=jknfdCwo4mIyygDrMjZu042AsaDYTUfj9J+hcZxwJKqdySmg+21Aum8Rngju8wD+um
         PUgon8rKbr4rgYJl3RxrZLTa2kluZMqR2BNKIpL81S4aXZ4sADCk9dWXZaTiAIz1+e71
         NWBhom3bITMG8Sw4iustXE4ISpMFrp48vxismuJWI60+csMrs7MvF+GaawLYjlfqLVPb
         nDxMaqpE1/Qhu/4gAtf9gc2vW8xiiYITS/0nWdELE+YurHIufRZ1IXR7HXbHYGk58y5U
         HyJTgGmxx5kWw10B4MLdZazLhot4ED5SmpM18qwo7qoRZCxaGwPrCPqKLFxvJxgNtWer
         BV0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775718801; x=1776323601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4t9qEuOwjjeNBEsJhxscNy9pF7gCA9F8HMy/E0F534=;
        b=SoTC1w4P4q/Z4E8T3s6sbx5wp8/sLsFladCaCgiSEmtmtS3d66ZdD9FwRIU5p3MGMl
         RuS08dfJkOBzx2F3w/BWvy4gqsk9iTS0qhS0GNCqCvruykyD9sQqY/LbJUG0ke9BCt/p
         leRIeTqIda4TdGvjMv/jr4szSLT9san/iPyVv15/kUojPl345dcRnB9wmqlo4+NgZRbK
         wHO63UISkyz+/ei83PrY7Ja3qh1q+ZhU/C4Zr7P7A5heJKk8VMNAeL9F7SVU886FRVV5
         XJeDCT7mBPp5JfGj4ejsCVzPkzUazTHJy1qX/Bbau+yDskjrTChvSYi5V9m2zLdS/EUK
         K3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718802; x=1776323602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N4t9qEuOwjjeNBEsJhxscNy9pF7gCA9F8HMy/E0F534=;
        b=BMKuARd0OwbYswGjQl+ynpVPa2YmbKXtE0yPiqKJdklpa2nM20Y+UFgVDd/szK5QKQ
         hf8mQZzlfkcmCl+Ik1v87jYGfPctM5hxw/C9+tLoiE5hbKz4QFTbkJRR1xbPNjbpurVV
         KOhv5UrU5cIGbOTwXuLFGS59nJDf4bI7Kz1V3hx1WlcXLC5Y9MAwYbv60EMurfoDVkaH
         nCBD/yKvlu4Nnt+0Z17DVrmHPOF9ma8HrM6+YGSyTkreQ1j/uBo8e4DdG9iK7xwEMhiI
         noDekPm18Q9KQ56qd/aXCmWQ54jPhM1JYBrkuk8XWz9ouvCD0iWsX9KlERwlbFBGKLHA
         xcZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf88WKSjPGCQ0wB+8lWyYf/rUcGNeI2xrv5D6+wnrx9mYXjHwsHKN4s2deNJjToY/jet1h46/Um6wc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg4/x45k5VcXHjpnxqTLXxdyV97OJNBjMHmuWWdtOdcHyS+4HF
	rgNP09adoSbXC0x1bwxrp5K8eGb/nCWlPiGyDepSlMQeorfsxXtiyXvp2KUuutpZTGSeHwzl6Rr
	I9nFf0MZHrg3ie45fWXgVaBnut1rJG97WO64Vwr8R
X-Gm-Gg: AeBDieuC1yPh6IVS8S5D3gUj6uf7gdYvc0HT08quTPHjI3+kviQsg4wDNOs1pNZRCsv
	yXRrVtWA7kds2SzjTzScEYQ4F+VaYDeqpFS9Ri+plwj9MEoW2g/hRP4e4iH+7qMPNRCeIcPOG3i
	uP+Zm3uaFzPHzUwPs7HQ6+bUQosJr/Ze9KFkdFoj5YxNS1iLe9zI6JKiYHSVdRvNf608D6GIsU6
	uL0/VFtOBE/flJGYEtACsbfGGLicKvmLKy6lCUf3jaxIpjIqQprx8NLnLhbqvoA/VuAhAQl39I9
	IfLxJ+0=
X-Received: by 2002:a05:622a:1646:b0:50b:3a6d:db64 with SMTP id
 d75a77b69052e-50dc22a8b4dmr34916481cf.48.1775718801154; Thu, 09 Apr 2026
 00:13:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409013246.2051746-1-ashutoshdesai993@gmail.com>
In-Reply-To: <20260409013246.2051746-1-ashutoshdesai993@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 9 Apr 2026 00:13:08 -0700
X-Gm-Features: AQROBzBgm54MYQPAvx4xSHJ4oCxEzanS_DwtWNC9T2qlEb7Lk6iw4a95H8iRfTE
Message-ID: <CANn89iJTzuhz4izn2rQvAXcm4QR64wwk=3D_Gieuq5Fr83o42Q@mail.gmail.com>
Subject: Re: [PATCH] rose: fix OOB read on short CLEAR REQUEST frames.
To: Ashutosh Desai <ashutoshdesai993@gmail.com>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 6:32=E2=80=AFPM Ashutosh Desai
<ashutoshdesai993@gmail.com> wrote:
>
> rose_process_rx_frame() dispatches to state machines after calling
> rose_decode(), but does not verify the frame is long enough before
> doing so. All five state machine handlers read skb->data[3] and
> skb->data[4] (cause and diagnostic bytes) when handling a
> ROSE_CLEAR_REQUEST frame, yet the only upstream length check is
> ROSE_MIN_LEN (3 bytes) in rose_route_frame().
>
> A crafted 3-byte ROSE CLEAR REQUEST frame (bytes: GFI/LCI-high,
> LCI-low, 0x13) passes the minimum length gate and reaches the state
> machines, where skb->data[3] and skb->data[4] are read one and two
> bytes past the valid buffer respectively.
>
> Add a check in rose_process_rx_frame() that drops any CLEAR REQUEST
> frame shorter than 5 bytes (3-byte header + cause + diagnostic),
> covering all five state machines with a single guard.
>
> Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
> ---
>  net/rose/rose_in.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/net/rose/rose_in.c b/net/rose/rose_in.c
> index 0276b393f..1ac9a6aee 100644
> --- a/net/rose/rose_in.c
> +++ b/net/rose/rose_in.c
> @@ -271,6 +271,11 @@ int rose_process_rx_frame(struct sock *sk, struct sk=
_buff *skb)
>
>         frametype =3D rose_decode(skb, &ns, &nr, &q, &d, &m);
>
> +       if (frametype =3D=3D ROSE_CLEAR_REQUEST && skb->len < 5) {
> +               kfree_skb(skb);
> +               return 0;
> +       }
> +

Same answer: Testing skb->len alone is not enough.

skbs can have fragments, pskb_may_pull() or skb_linearize() would be needed=
.
