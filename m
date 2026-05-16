Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDEB13B58C
	for <linux-hams@vger.kernel.org>; Sat, 16 May 2026 10:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778928537; cv=pass; b=HSVDhrUqz5U43qYmRr4HYoTFmOGSF1vVyPh9RQLkB0oQADWU6PENaaT9XhoT63FsKJtIiTIWqohQYUH5TKJPmkTJLl526EVcVjZVfHmRiVPMaJpGXFNayOPBsc2yLLSav5DfqFlk3KqzNQC862MGWLAsfiZ+Pys/yo5LUu0Ce6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778928537; c=relaxed/simple;
	bh=n/AVyKlJGTsYHXsiXwBdHgBJFjZOldWnzK92bPN/bbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSncXXCfZWjDO+OXoZBfdFiX/CHEC9z2llNOfjQ2n1d3Dt/DTntDmstZ4R8wq6Vde+kmnc/nwY6V6kULzsjnHoXjhBGVD3iAGtRT9D0MLJRMDrg/gGQ9MWrki6muY0iVlCX+RVyKjk/rzLNWXp/PRd7QaX/GRURq4lxmrjKFBTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pNYtLhh5; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pNYtLhh5"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7bdec52f48dso2338287b3.0
        for <linux-hams@vger.kernel.org>; Sat, 16 May 2026 03:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778928535; cv=none;
        d=google.com; s=arc-20240605;
        b=S3B9QtPlxT0KSuuyYQ0E897+Uezq8pkhGHOUrukX7B3iPdaDMODfhc3nWSaf3wHdY1
         uz7BaeOlmYKhNC+5so73M6+q8m0/wUiyZlZ//bQ3qxmv6j3zwTm9gg3A88xCxGMPwWYr
         eT+AONmohGTlPwbBUi8pGModVWk4ERCQLrHU9Mz7ltL+kPOKDnMXUZuNpTJAl85OqHLK
         PO+QoMnKiIAnwhTXcsfqVyPaEAg5dRb7VdzRzGxkEDYFqLWYGpoU3Ex7n8G5Juw2FSGz
         9j4gh1K8ISFjJZ3Gp+j8VlJQTRrTRVIoO2DT+67TwGKX1gZGv/vjGKvpvf8/5SoyMKRc
         r6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n/AVyKlJGTsYHXsiXwBdHgBJFjZOldWnzK92bPN/bbw=;
        fh=idY9Tf1m3HNNsYSoow2fNkXzIWWm25vPW1njdUDmC2k=;
        b=dxw781hxvFrinWJXsyD0EZgbX9wfFxScy5t0X4T+B7Vt8giQX0MBA9eAWaFpuFEF6G
         ne8QmXNlB7gjLgkmWPW1nXIYyS+RPnjis1cjKh0AbUipfzkrvnHgn0Z/xPfwn8+eJMX4
         +5SnjAEnJiiLJZozcN39ddhaq96C+wNd7NiEDhZ/55HhbBQHguCuoYDIJVvRZUU6ZB6W
         tAXaew28OOJHznXefrEjguKOrAYdbo8yvj2MpQwQ7Vtvi06swrnP7FEXewePNT6Zk0Nl
         UlWUM7Jr1FgYzmZLz4VclWsYS1EV+XF2mgOOTItxKxHDaHvoc6FblY+f955f5dLZ5ztd
         Nmgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778928535; x=1779533335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/AVyKlJGTsYHXsiXwBdHgBJFjZOldWnzK92bPN/bbw=;
        b=pNYtLhh5Z7Szpf+lmmbK5DyYZo09+EFqC9DuBQrPsp4WWjDm4UOApB/IjtyGCU2Jgg
         s879xPqgRqLMyrnJMxYTEl6FsidKqoJEIcn4lxrtvZFLlqhdtUP53YBaWKFTtHVIY7Kv
         CJWXP+/ph1nPWfZUjE9gRgq7L51vDPXnceo1FYZnQeDo+GeZovYXLPuB1WUT7dxBtojP
         7MhF+wm24KlkZAMocLkOwMwU6DejpPquPiDBkrYZQLdL0iwZSU3L/SRVf4g2260FYSyO
         r4xv9CE4FAzsN2GlsXS88f9+bXBKJAwmNKIx+/GoN1WAB6tQGOuejZoObLYWzuAkPq7M
         13WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778928535; x=1779533335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n/AVyKlJGTsYHXsiXwBdHgBJFjZOldWnzK92bPN/bbw=;
        b=nsMTRAmnO1++VDdvWNuJK8Ez75rRsOs2aU+Y0O/JTxmbQTuYOy4TYdCB9eXN97HAfT
         v6IK4FVMn8yNZJsOMKo+axDMMLoNTS6J4xWhC54vwMW3HL3BR3Rp8h/E2L5Ye2Tv0KNl
         0unLDTgeRU82W7UVtUP9ZGySY1RxodRTpUhrX19ncksnOX/zdowtbIV8RpP5fsKw7U60
         ylS+GXL1Y/FQv9/d206BpmPeGW30iPG0+q99JapX0lniqiHPja5AnKyBtOAfUwKSjhnC
         VOVIj9zgOCpeCwx0Zzztsabb2I0vASp6wJ+yx85KM6xYrAnU/CdAwte33zWmdvNfRukz
         Sh6g==
X-Forwarded-Encrypted: i=1; AFNElJ9N03uLdj5O1DzlY6DpRinc9/VuEdJzy8zxIuCc2pGWOcl5n++O2lVwT3tvmHuDlR/mdNZ5SIYWt02l@vger.kernel.org
X-Gm-Message-State: AOJu0YwWhhn7h5IBSlDB65wZAP9vLWa3xVXNSUY0srrocznkRjPf1REZ
	sXf8iTkLaeE51upDsBysoElegsCpnBPMenCqTEvkzwrLAqZci9feD0TA2zt43SSUR7Zy8JA7ghZ
	CBgIdng1Rv9iJfS3QCduvjjQlH5jXGXr7EeZy
X-Gm-Gg: Acq92OGr3CzkZ7HKoJHS3wi62ijAJF04tma/eDBStOfDFRvrMwpUj0zkUob9dl13Rfl
	hA7BYreamHb26xLCtanBJl+3RuKbus7B3ifojIX+9GiQ6w+Bgx537AcJXtfj/j8By05cpKLn4DA
	9g8PcGAlh5k94xNHmJwZAB5K/lvQh7ME3D4F3NnEzDjTXrFSMLyQno/sfaBu9dYiHXBIM+i2/T3
	So1aIouv/s6q+r2UNSU1zFMDuXq5/Y4pR95ia5PKiNMGvNIXE6l1w0Igj5pG1xvCCpS+lbGu0mo
	Y4LtItk=
X-Received: by 2002:a05:690c:c36b:b0:7ba:ded4:df69 with SMTP id
 00721157ae682-7c9463a27d4mr60332307b3.1.1778928534930; Sat, 16 May 2026
 03:48:54 -0700 (PDT)
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
Date: Sat, 16 May 2026 12:48:43 +0200
X-Gm-Features: AVHnY4IZ0c2IDo5kgo9E787Nd7IrItMcCAVJ5vxd7c8NHwfo2rpdQii2G5jAbXo
Message-ID: <CAFAa3YDf4Zq9bH44FMS43E=FnMrvXF1ry9pdTQqT4ZvrqhzZBw@mail.gmail.com>
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
To: kuba@kernel.org
Cc: toke@toke.dk, stable@vger.kernel.org, davem@davemloft.net, 
	netdev@vger.kernel.org, pabeni@redhat.com, gregkh@linuxfoundation.org, 
	linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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


Le sam. 16 mai 2026 =C3=A0 03:14, Jakub Kicinski <kuba@kernel.org> a =C3=A9=
crit :
>
> On Fri, 15 May 2026 16:52:43 +0200 Bernard Pidoux wrote:
> > I am happy to submit these two fixes as patches to mod-orphan if that
> > is the right approach. Please let me know.
>
> It's a GitHub repo so PR is probably appropriate there.
