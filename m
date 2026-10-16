Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07FB5AEC5A
	for <linux-hams@vger.kernel.org>; Fri, 16 Oct 2026 18:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792174483; cv=pass; b=jVRTwujpzI81wxpYu/SEODDAb4zI/JlX1AFHhyJo8ceGCGAy9fKup7KVmhtisKfLwHZhSeKgSrTzCmSsQvZc4Ao+e7NxgEhvFtS88zW4OTKeTVuX9NV1Lo49ptbMsB3uaIe5avVmlbS6GjYoYz5m/b9rHREWCGhrjB8LtxNn7Hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792174483; c=relaxed/simple;
	bh=tWzCRQDUO8xebvJNG7V+Ac6nQ7ojXfH4RjQ+JXubXOk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=VenmKCqdN99rQEMjvyfn2+rc8n8arR39pqqqGgJMvheXtmf9Pqg0r9Edi8S4fK6xvwFWkC/+Cq7YsaB3a1pww1eb7JPDEAYoRfV6ka3AHvRU36uSvMW9Iwc/SP/TiNGYLqfduunRXAESI8kJehYcBAi0spDeKj4UaqI+FZqjc+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVBR8LVT; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVBR8LVT"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8ac8a2ac52bso3500197b3.0
        for <linux-hams@vger.kernel.org>; Fri, 16 Oct 2026 11:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792174482; cv=none;
        d=google.com; s=arc-20260327;
        b=aTHsMpuJkrJfLMGJa7ryIhC4dkWRzxIFslhKCmigXQ9KGya+n0/nb5ITn6uPfXwvau
         hYQZ5VDL+EZfFOUY8LGVDwKq6ahFRSkmv/l8sajPih4ih63EsZwuMNgPOEyQqSbvUyKw
         AgRUqIiAIIhwRlZXpVwsG3yWxqKEMkJ7QuvE37oXnq8EX3VYdnwXGemPe82Vghdi53eK
         K5MCbUU6gSR9gRErcKLofO1pfr7JL0TMC/rHeERhN6DZk1AP6mSeaaposlO/i89Bn9ep
         ZANc86I+c+HiG9A1kbZppdC2Oy+yep9xeLUR2rerZ0jUyh0fb6ULuHKL2V2Vub3XVU57
         eYZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=tWzCRQDUO8xebvJNG7V+Ac6nQ7ojXfH4RjQ+JXubXOk=;
        fh=yvyQ0fNR7evt9jL2wClrmYYCzRjxmggS8kmKCqDY7Yw=;
        b=J19CdCb2Ep/58fh9FeUvN+2qNfLOxeTwAz0yw15wji+xG4Q4tjThk0Nnu1mxhde8Bw
         TWKlldWeS9AX+XuDlWY2eXs5o2qxvvMYy7Of22sBSKNyg0o9/1dyJUYPyq9437lh9b6H
         q5ZGkPBuQB9lSKSThoUJtxyvbNIDEMLBo18kw2dfQZtO08RvdGvj5d0NCK3g0clroH9s
         mYOVGf8kvC5TjCCCH5EC4reSLzfoy79+Jvgt3dyR22cE6gZSd22Q+KQYmGOQQpB5zZDW
         BVgnbki3lkpWH5M4RTaUxhkoLSqlsIPahMLZD5upoMeCi+pkV/eQL08TrqtOQs7/+yeO
         94TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792174482; x=1792779282; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tWzCRQDUO8xebvJNG7V+Ac6nQ7ojXfH4RjQ+JXubXOk=;
        b=kVBR8LVT8E1DpYngkjuC0lv+lerQF35eTmAP9zXjjakf86bANqQBdTbw+wNkd+Kv9P
         sMBBS9i+5pNnRiIqZQfuBayCjq6hhhnnxldMKO9NLmlwD8bZg19Vx16rJSVK2+uj5j8O
         NnRZV3T3WKPBXmYKhrOYKXn20FYIdPXwxTdXpys76mQiRoiEYiEr5gBN29gtYu7O9wDd
         EcML6g+HLG8wUeMYAKsUciI8R/jbtbXg+QMoMxUl00Y5Nl1GMXqav+5VKKwEhnzptDJw
         HLiqznV8bFcRyDZ++ANTwNk5G8ZkG4kFCRrnfFeypRrdC3lp2nQEnRasPaQFwRoH8emp
         ep3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792174482; x=1792779282;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWzCRQDUO8xebvJNG7V+Ac6nQ7ojXfH4RjQ+JXubXOk=;
        b=1XqxXSXkkWUFvCBvX302TtvysYbIttv8henPnThc5EL7QXJNYzv+oDlzLSUmxMhxSI
         8FaU7opiWd6VC5eEirg/oG5OkxfsXNU1yhZK9crJXGm2cHS5Lkk18w+BM7fRXCkbV3xv
         aAf6uuVnZ3/mCBMGJy5mDCESywXpqlqbms5IZLBWlWnfyI+bGilzx/aQgq0wi5YEgC2m
         cPTpIPPwlyEV0V4Mxda8VL3OZn82HwFbNztZl0sUlsBlFDSpweN01C8fFv77yBoczINQ
         UdGwzgCFWVEpHSCSohMn70+Uhl2g2oP7FFoeyNNgoxoDXT6Y6bRYkSQZO72DcIX23cIN
         zn5A==
X-Gm-Message-State: AFq9FYLzLHVB5YgqdDoc3XCMAt1OZ7OLpJr0z8faIqtOlyAlYewM1R+E
	HEdVDkZYWIU3DojijJ/e/Fgen+oE7vE9TO/v2AzAJ/W29yBq3SI04AQrxKVHPDzSc9tt2+6Q0/v
	YeY2Nu8wdNlJmaNUL8E/6yoofJaLNPUPr1oOD
X-Gm-Gg: AYBFou094VlGlgPZRpgmDSyC8lIH/qnj6CRdZwB41G1A7wICjIX0QbcnheyB4KGQND/
	ECztW+VS4eJZKPXrH0eFH/QNj6FmUQPpOCSkENXRaxPP1DvqEDyaNaT2x3K4cMwddDri7a/Tk7J
	kseRKuviBy9qQtJxN5SXzJtAXGklzXPHYt7fzrCB1jdNmsqkkQv9dS7JQAVoQPddpCz8+lxEiwW
	spiBpJHtrWr8MGaBObkqH4Q7iBwPwpKsrmj6FrCZw9Uz9JWnruthbmcayVr+UtIXHaUsGqmVz7D
	J/nn6A08mw3UWHXzh4pRZGGRScmQimjyb1QVNkGJPnIYvzB9GkXStkQ=
X-Received: by 2002:a05:690c:6c04:b0:80e:dc2:873b with SMTP id
 00721157ae682-8b0f2133876mr2687157b3.16.1792174481513; Fri, 16 Oct 2026
 11:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Fri, 16 Oct 2026 20:14:28 +0200
X-Gm-Features: AclHuK8JOz3D5YYgMpAVU_k1YzLXNn2Rxjb25bA_DNCzvnnoUtM5J2RCmgd51ng
Message-ID: <CAFAa3YA74pKPk7G1qyJfC58yUkbxD5Ythn1KJshhpB6ru+j2Sw@mail.gmail.com>
Subject: mod-orphan: a README for the out-of-tree AX.25, NET/ROM and ROSE modules
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

The linux-netdev/mod-orphan repository on GitHub, where the AX.25,
NET/ROM and ROSE modules live since they were removed from the kernel
tree, now has a README. It is shown on the front page of the
repository.

It explains:

- what the repository holds (amateur radio, plus the ATM, ISDN and
AppleTalk modules that were removed at the same time) and why;

- how to build and install the modules, also on the 6.12.y, 6.18.y
and 7.0 kernels that still have AX.25 in-tree, where the modules
built from mod-orphan replace the in-tree ones;

- a short presentation of AX.25 for readers who are new to it: packet
radio on VHF, UHF, HF and through satellites, APRS and BBS
forwarding, its early link with the Internet (IP over AX.25 since
KA9Q NOS, AMPRNet, the amateur radio "net 44" address block, and
AX.25 over UDP/IP with ax25ipd), and the NET/ROM and ROSE networks
built on top of it;

- where the fixes come from: failures seen on real packet radio links
and syzbot reports, days of testing on a live network of eight
Linux nodes before a fix is proposed, review as pull requests, and
then backports by the stable maintainers to 6.12.y and 6.18.y;

- how to contribute.

To see which stable and long-term releases already contain each
merged fix, and when they reach the Raspberry Pi kernels, there is
an automatically updated page on my web site: kernels-lts.html on
f6bvp dot org (French version: noyaux-lts.html).

Corrections and additions are welcome, either here or as a pull
request.

73 de Bernard, F6BVP
