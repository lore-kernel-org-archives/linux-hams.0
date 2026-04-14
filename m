Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BB72F90C5
	for <linux-hams@vger.kernel.org>; Tue, 14 Apr 2026 06:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776147104; cv=pass; b=kW8yFhGBYqNFBenGRlg4ajXUJHAW2yeRTBDoAMDU1+nVoQ4p88OgGyQ+7lTwuwgf/zjDrzqGnUOgIiRiHdTRrw2kQaGrDNODnmZmLoD4uwMFEZyja8iHsLc33SznrvzdsZb9zNOMPsRrEcOE+pXNfmAAyXyamt9+9loRUA2srzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776147104; c=relaxed/simple;
	bh=zlED/jrEEWRWLJ0Yf78FvE6LghQYdstVM2QEXnaqevk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mOFmoI6wqqB6LLr9uBlxF/DJJe1whliBtLEhPblLJvtIZ92UeInwjVrPva2zrpUj9Tg0iOmjJyyCr9nkmTmM3MdnSiuDPgpUr9Cz4Wc2Vp3LE3U28KvvfK0XPkMUpx7/AfSugc4Rmpf0jb3VEK9Vas8hq0d9vFgRsCmEd2c7xIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F9ymhVHe; arc=pass smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F9ymhVHe"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8d76492e51bso497782485a.0
        for <linux-hams@vger.kernel.org>; Mon, 13 Apr 2026 23:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776147100; cv=none;
        d=google.com; s=arc-20240605;
        b=dGO4Z9u5fn+nyCIdGHz0kHlJT0Ez3xCW9dHNcs8UWyxuajbVjLgPzpPX/ilOjgHbQG
         Tx6QHSE8aO9k3ct2+F/b7Ou2FiAsoxZjFRsLEpfK7HUlol1jai5Wb/Zd5JeIb4qsmP3v
         9Lypdm/nh1sRgt1zM89hFQQ4IFdw19K7lLX9tyBzr11Q2QRNZyZTOaqe33sBGHsmkVOF
         s/6NFX1Ktp853DUXhUM/2rbOwoVr8/jX5jRhNgfsEOnW6v4h+vgpNX4lObJadCpz9JoC
         euNxn6QUdYoj6dJ9tSZ5dttx9frtJC1vv4Y2BTU1INjfR6hI71xHg+qo+MNiYHofE9u+
         zMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OAF0Vl7njHyXK7EYn4RJLUuBj27JTwxYrzgtP7tc5r0=;
        fh=bjouBKk8UGkcfxx/8kLuO1u1Lzjf53NwRGFNI/SL+3Q=;
        b=jIzLva5CYa5wMcVocXapLI5fFikwyn4XLMQpMIOsBYdaDhoxPkVKVi0JmzVPjjgv+4
         Bk9WB/kGfjKN78d+7/NRx2qnFxKrdck/Ccx6MZ3GSrh8yD81bbB5WQYhYlhkV6glylvk
         ay0cCt2zpmz40bR6L7JyYocDqHRXQtA+EfI91RwtR9frU2fSreFf3mUFAxgxlph/T/a8
         zl81pzx0bOkq2lfPMaHkAtCKbaLCMHSlpeCSHSIpfSXVG6XmY7/DTp9GKhwtbFKNDr6Q
         pzwSCqJ/0RfhV7gwLPI86MekEaypmOm4M/mxEEJHj7ZO/M9wgDkeGTTW5NabXls+rLTE
         AwGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776147100; x=1776751900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAF0Vl7njHyXK7EYn4RJLUuBj27JTwxYrzgtP7tc5r0=;
        b=F9ymhVHecZjpAjNFwjuwn2HO+cqwe1ARVzE5KmP2DjqQOtiYBfi/xIRnkk35Jr/CET
         4E7VT8PZrsr2gNdSlQf3K4n1bFPGlWq03JS0x60YHCs9RcnfElEok9JbYNYOIHmAjJ1K
         cjkrlEKvyvJq/jAcxWEV08frh0MgKh9o4pew3Hu/WKVPQfmTKyAoIsUx/hX8qb1O08Qf
         yH/rjlVQSaFNEs6rYspxrHz/J9wmisSu2L79tvAoSG9QyNN/xPWG+jmmJmS8X5uenOa6
         Tg/nnUvXUyEVTSKHppGcZb7RHFj10Tircg2tYXSb6FHa/Z3lIJcgtM1ujdhe1ns9QCBH
         PsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776147100; x=1776751900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OAF0Vl7njHyXK7EYn4RJLUuBj27JTwxYrzgtP7tc5r0=;
        b=aCis9/wyL9jpWzc2RWAW0yrCLMD93lIGHk8aJ7JB2KhvjVlxqYfXXOTlKtp9oi81N0
         rmQXSfesjz1JFWS3CZrwZ5UXgX93nrI9inezsvJTCOBqPRb+C62O4sWYQ8czpJIpmh3f
         xnaEWM28amDTHksIK11BLSbgXPRVOaY0+NSahGibnP7Cdm1xToGjN9G0lJkv4Mlo/Fyj
         5A+jHhhbMuDUAs3viviAjNqkOeZPBCYizzxQk+Lpx9BHcypuSNdXd4dnWyUWBPA3ZnHP
         taFxHFKXWVx6OUxfMDVYyO0yZwqJ8fp0+WZJTIgRaAmNCfc/7lHGR6RhKtGH50g1UjQZ
         SCJw==
X-Forwarded-Encrypted: i=1; AFNElJ9De8pKKdFcB2IPxIoe5xkGO9nPBbLJGHwZrKOt3BsWQyKRgCZjWnngMudSpFKA7/k69it2iNstXuh5@vger.kernel.org
X-Gm-Message-State: AOJu0YzgBDUKBMobglJisn6woz+hdU1nTSfOvAIR1m9/dF1XYm8M0CSs
	/Euuv8MgznirLWSKXwZoHyRZmSfiVGax0ZNUjvRxLHiXH7DWbkd2W+SxnNCeumpswSmQiqbCmy2
	O5sz9HEleyngTI7c7/z1BnDqpsI8iysXdQymeDcks
X-Gm-Gg: AeBDiet5p7ZGuHKOWRi3XateqQ3LhFFDtnJUeBfa/Dfx0hpp/mIQZ8FOZ4hT2YNW42b
	sNpCPyxYb6zSrRgLtFnLxWlM93F5P2tWtVvUXPJkCc5/ssbZ2xjVY8o2FPHq6SProqNnLrPkmPz
	3oCt9kkSvkvW3ZDyC50ktUuZxvvaHXb1dqODu7hWnVL1ZqrjxdW/ABqbVC8iXYUopzlGsq4PNor
	QOk7XSfFVKHmKQPmIL9wnnZcQnm8+Ekp6DtVo/Q+VLm4X7aee0MkS3OvqZVdKVhxfzDjOO4CqO2
	EUgaSB9iqZW75rIESJN8MpaEOOpxjvboLC3WOdfusr+qr2/tghnuRAK8F3AJZVkT5U0r/FX8fR9
	w2nh+hU8=
X-Received: by 2002:a05:622a:90d:b0:50d:b030:fc6a with SMTP id
 d75a77b69052e-50dd5bbe532mr244310831cf.49.1776147100067; Mon, 13 Apr 2026
 23:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <177614667427.3606651.8700070406932922261@gmail.com>
In-Reply-To: <177614667427.3606651.8700070406932922261@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 13 Apr 2026 23:11:28 -0700
X-Gm-Features: AQROBzAo4pWAgj6mqIT7boi1_hwaMvrf2yxvVlFSjJeeXAUS1D9VQOZ7QAM6Iog
Message-ID: <CANn89iLXG5ZMNeHkcLW+Ug9PxNnw_EKtpGVkPw1qeXEjJNtA0g@mail.gmail.com>
Subject: Re: [PATCH v2] rose: fix OOB reads on short CLEAR REQUEST frames
To: Ashutosh Desai <ashutoshdesai993@gmail.com>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 11:04=E2=80=AFPM Ashutosh Desai
<ashutoshdesai993@gmail.com> wrote:
>
> rose_process_rx_frame() calls rose_decode() which reads skb->data[2]
> without any prior length check. For CLEAR REQUEST frames the state
> machines then read skb->data[3] and skb->data[4] as the cause and
> diagnostic bytes.
>
> A crafted 3-byte ROSE CLEAR REQUEST frame passes the minimum length
> gate in rose_route_frame() and reaches rose_process_rx_frame(), where
> rose_decode() reads one byte past the header and the state machines
> read two bytes past the valid buffer.
>
> Add a pskb_may_pull(skb, 3) check before rose_decode() to cover its
> skb->data[2] access, and a pskb_may_pull(skb, 5) check afterwards for
> the CLEAR REQUEST path to cover the cause and diagnostic reads.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
> ---
> V1 -> V2: switch skb->len check to pskb_may_pull; also add
>           pskb_may_pull(skb, 3) before rose_decode() to cover its
>           skb->data[2] access
>
> v1: https://lore.kernel.org/netdev/20260409013246.2051746-1-ashutoshdesai=
993@gmail.com/
>
>  net/rose/rose_in.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/net/rose/rose_in.c b/net/rose/rose_in.c
> index 0276b393f0e5..b9f01a11e2df 100644
> --- a/net/rose/rose_in.c
> +++ b/net/rose/rose_in.c
> @@ -269,8 +269,18 @@ int rose_process_rx_frame(struct sock *sk, struct sk=
_buff *skb)
>  if (rose->state =3D=3D ROSE_STATE_0)
>   0;
>
> +if (!pskb_may_pull(skb, 3)) {
> +kfree_skb(skb);
> +return 0;
> +}
> +
>  frametype =3D rose_decode(skb, &ns, &nr, &q, &d, &m);
>
> +if (frametype =3D=3D ROSE_CLEAR_REQUEST && !pskb_may_pull(skb, 5)) {
> +kfree_skb(skb);
> +return 0;
> +}
> +
>  switch (rose->state) {
>  case ROSE_STATE_1:
>  ueued =3D rose_state1_machine(sk, skb, frametype);
> --
> 2.34.1

rose_process_rx_frame() callers already call kfree_skb(skb) if
rose_process_rx_frame()
returns a 0.
Your patch would add double-frees.


Your patch is white-space mangled.

Please take a look at Documentation/process/maintainer-netdev.rst

Preparing changes
-----------------

Attention to detail is important.  Re-read your own work as if you were the
reviewer.  You can start with using ``checkpatch.pl``, perhaps even with
the ``--strict`` flag.  But do not be mindlessly robotic in doing so.
If your change is a bug fix, make sure your commit log indicates the
end-user visible symptom, the underlying reason as to why it happens,
and then if necessary, explain why the fix proposed is the best way to
get things done.  Don't mangle whitespace, and as is common, don't
mis-indent function arguments that span multiple lines.  If it is your
first patch, mail it to yourself so you can test apply it to an
unpatched tree to confirm infrastructure didn't mangle it.

Finally, go back and read
:ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
to be sure you are not repeating some common mistake documented there.

Also:

Indicating target tree
~~~~~~~~~~~~~~~~~~~~~~

To help maintainers and CI bots you should explicitly mark which tree
your patch is targeting. Assuming that you use git, use the prefix
flag::

  git format-patch --subject-prefix=3D'PATCH net-next' start..finish

Use ``net`` instead of ``net-next`` (always lower case) in the above for
bug-fix ``net`` content.

Please

pw-bot: cr
