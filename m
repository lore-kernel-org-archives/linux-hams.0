Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49442370D41
	for <linux-hams@vger.kernel.org>; Thu,  9 Apr 2026 07:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775718525; cv=pass; b=GeWMUc8tzHAqDTHyw6Zo3cm+OWM9i8HwN+LwXh1oMhbRMiMSrkJgi9WsGWSfM4Kws3mtr1edZIblB272lTk3okaqAE9AwfhC74jmI8SYPMFBFi/Zh41/PtUnZYxTrlme/SHsHyh3uU1YlJkg8qf8JiFSASZ+UDgHPiYPtKm725U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775718525; c=relaxed/simple;
	bh=PRFayrKxPdZ1mTEyp14s0b1w0yWwkt+Ou1Wuz12o2xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bs1lQrsuDiW5tQys04XXrDdGXGjfzpA4bisTSGcTpmqGKzUOOG5MrtNwMLFFsNDviREl1PLxKXAOZLuSiSSeAUF0rdXJAdnKNZD6vnBPvcpgxleWcNdlfuGE6FPmqaE1y0bOIQGegzpKJga4d2grDqQTO90SQwMC1sCR4uMBfCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SkXwV87S; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SkXwV87S"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8a016799d2cso8025136d6.1
        for <linux-hams@vger.kernel.org>; Thu, 09 Apr 2026 00:08:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775718522; cv=none;
        d=google.com; s=arc-20240605;
        b=T4VYcFs7Pxi0akF7KuuuuY1zR0zet+7ZqDw80ExS3ahHElxi+sixxUIJlY/bODVrlY
         3DNDtX8J7fGUV8M95TMfN4zFVOXk4iAgIIYZPtOEmRvjT3a2j/oSD75VJlTeaz6E6AY5
         NV8i+s7BH3Y/QsF5IHDPxb73rxa8tkBkuy70EBvFwJjjlYmL7Hgd8L4RBXtJcOeu6d8v
         IaKrYhmybsosHMbo7LY1swScL4rLAuS3LIhQKJWnsPo23zWOwTPTxMTJ6EEArE7hkbEZ
         fZp64wLw+qn8BWvq4w+KTV2tmAHGzlrqtDezh5FD9dRp/PT1mbo1c/lkY24AG/jGpuX0
         qmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G11Ctve6TNDq0sGTdIs3vggtNtTBmZS/FVmEfytylFI=;
        fh=vWJiA0bHqT/YakO/vxu3t4SI/KQheo3s97V0ZmSfNCc=;
        b=lp4TXUP3Ff0I+JlSmksZ0qvtIXHb67GyomeM1anVu9b+jhwOe0EUKwea/UNAHePcoB
         HaZW/M67XDCKxAoZFA5nzZEBf/C8uD6n1g14jGJ07v0Lm6AlaJ2tmkSMMe5OJ3pC3cMb
         HvIqYHm4KzVyFssYXZ5tlWaqnBoOLjzz7LQG2X6MoLo/1TE52025XhjEOT5d4XKHL5kf
         IT9wWY0kCYeEUTz5oGOYT31toRKjL9idYydlNYjwqUG6Wlsf3Z5gaXoHDryujTPq6B8T
         N0msgaAHYjEjxUaos+Etk4IsqIGOUfa/wu1euUg3oGFn+ULug14JQZaAOCSCmY7OBx2s
         JWpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775718522; x=1776323322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G11Ctve6TNDq0sGTdIs3vggtNtTBmZS/FVmEfytylFI=;
        b=SkXwV87SzkRVc316HffeN6yld2hUkvgQIU1HS0s7U/PKLvBX3doCUIVCiE7avZATQP
         rsBu8tsD72kB8jSXWGIBVVCTmoecZ/V+0/+ZBqw1Yo/B+ilFML8pqUuKR5sflqy/qtj5
         dtYqNjDGQd9MD5suBpCgmtsirK/8wFWvIFoxW5jW/r19ZhL42rzBjKTnmjwEGI9of1wl
         pVQStgEyYX2ZmDmyj4A0uA+XwRD9ziBDfdODSPbqyDqjeKS5HWEuzc6irrJXfnM504e6
         5vhnRgKkQoYmNp/Cy2bJpDCZPKt4z0v8BGsxTq72ot5jVcR6ZASaKp760XXsMQ6Pf0i/
         +BrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718522; x=1776323322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G11Ctve6TNDq0sGTdIs3vggtNtTBmZS/FVmEfytylFI=;
        b=fg1+49vvVKxFUFxctqB92bvTG1Lk9ySEXz1epMHD2TpHfBDSbYCcsFUefO9BNyncRg
         23w+Q7HbcOeJeha7s++FzhvKzDjCtMyEY5zCk6BVu7SRLiqEL/wYtMbtNgeHoR/Fi3+z
         cj6VS8axB4TGEp4tMoJ/2Ai+kYMmuKGUUv2cL2eA0sY2gM9NsPDiJUDJoC/YU9nqJa3O
         QFsXVqIjQcvivTYonNq/s7wJEVnDFNYdOKIxtrHeuDmtkBHze3xOiROYtN0svHNaS5Qs
         jHPgic1DB12F3dDJ3x1mBdUnSg7Ioz2o/mPHlW/zGoItNI8oznfj15eT3AxgWV5GnZ0e
         YTvg==
X-Forwarded-Encrypted: i=1; AJvYcCX9OA9Ebz4CC2w9mLVcbqWloz42b/p06khhnaAgTVw5GoqWrIA86YnWjWO1YV8BW1wzbNNDx28oL2fm@vger.kernel.org
X-Gm-Message-State: AOJu0YzkUJERDf4JCbmnfp0DxDUemHvmBDJbJD6rMqFOgtepXFXP9q/a
	/PmBFKmg0tXesTNe/1UhkE8e3kLbq6M4/uo+lczyhfmUvAS4FyUR25HGoyVxRmjzui0YBfdbLzJ
	rkwKiCkBEgJ504SMlHi4QA8M7cIGQffpUrKEz+b/SMdAA6Nd/daKKpzmc
X-Gm-Gg: AeBDiesRid5ePcjTKfaM0PihEYn8KpuL8a3XDkb8rxGDrMWwHuPjlS3iYRhVEMiQ/I1
	PDlrvSoCjDLRUxVEUY7PL2Zk+yq68sW1TKWw+mVtXLrSLbAegvga4AqS/J3Ahse1BUScpwxH8S+
	A1MVLHWxm5CN4LtfchMpJZvJt/8n0uiwzM8KSzJbmSPrdh0sB1DuvAVEzqX+1/V43IlQG61Qi5p
	g68LXHHyNG2qLQ7I6vgMhZIVEBSTg1DMqkFK9wnUT255TQ1mFtPHSUX7aEelvXbI2O9tagfcOVe
	4F8Jdxk=
X-Received: by 2002:a05:6214:4985:b0:8a7:1745:c50a with SMTP id
 6a1803df08f44-8a71745c752mr399083816d6.41.1775718521778; Thu, 09 Apr 2026
 00:08:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409012235.2049389-1-ashutoshdesai993@gmail.com>
In-Reply-To: <20260409012235.2049389-1-ashutoshdesai993@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 9 Apr 2026 00:08:29 -0700
X-Gm-Features: AQROBzCFLDmd8uWNsPBZtfGSuu8peKqgi5AWIUFx7ssHDeVE3xo0QX7B-xKT5B0
Message-ID: <CANn89iK7bzV0VpPsP5nu0mV3GCsN5MOZJgc_s8a3B2X6Ui6mxg@mail.gmail.com>
Subject: Re: [PATCH] ax25: fix OOB read after address header strip in ax25_rcv().
To: Ashutosh Desai <ashutoshdesai993@gmail.com>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org, jreuter@yaina.de, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 6:22=E2=80=AFPM Ashutosh Desai
<ashutoshdesai993@gmail.com> wrote:
>
> ax25_rcv() calls skb_pull(skb, ax25_addr_size(&dp)) to strip the
> address header, then immediately reads skb->data[0] and skb->data[1]
> without verifying the buffer still contains at least 2 bytes.
>
> A crafted 15-byte KISS frame (1 KISS byte + 14 address bytes with
> EBIT set in the source address, no control/PID bytes) passes
> ax25_addr_parse() which only requires len >=3D 14, and passes the KISS
> byte check (low nibble =3D=3D 0). After skb_pull(1) in ax25_kiss_rcv()
> and skb_pull(14) in ax25_rcv(), skb->len is 0 and the subsequent
> reads of skb->data[0] (control byte) and skb->data[1] (PID byte)
> are out of bounds.
>
> Add a check that at least 2 bytes remain after stripping the address
> header, freeing the skb and returning on malformed input.
>
> Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
> ---
>  net/ax25/ax25_in.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
> index d75b3e9ed..92baac77f 100644
> --- a/net/ax25/ax25_in.c
> +++ b/net/ax25/ax25_in.c
> @@ -217,6 +217,11 @@ static int ax25_rcv(struct sk_buff *skb, struct net_=
device *dev,
>          */
>         skb_pull(skb, ax25_addr_size(&dp));
>
> +       if (skb->len < 2) {
> +               kfree_skb(skb);
> +               return 0;
> +       }
> +

Are you aware of pskb_may_pull() ?

Testing skb->len is not enough.

I suspect all net/ax25 is expecting linear skbs and never considered fragme=
nts.
