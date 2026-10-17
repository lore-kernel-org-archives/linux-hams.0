Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142DE3BAD9B
	for <linux-hams@vger.kernel.org>; Sat, 17 Oct 2026 18:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260773; cv=pass; b=tuESmSCAVxeabHnfu4j3YSgEgYc+n493dJCwy3FBJw0eSMMB6MGGr5jBwvkwwXmsQSPp2hJ4QPIYxtYNvDGcqL+gAichE/z7JIXQUP6PZdiyNBVbekTEGkwxk0f26dBza9LfTY/21tErw2R5EVAi5AvzMcdo99xoCYoRtOuM8EU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260773; c=relaxed/simple;
	bh=EAjs0OmtszIQl7CAKawyEIZQDr4QrubtblmVqS40wHs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=X6WvdV9Rrp7mYsN3jxjQT9bDhU2UOW2nrcHeQfl4b7MfwIZE7fOHhIohlVanAr+zVxARCGVSefq3FoYoHt7YUHijvKMbLIF9IO/u6B3VKI8oy/iRr6E05UOEngl/fd/L6n+2bizkLNSGQBtCIpKPIEe5PIyUoRrWvREY1pILM/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GY7pr+/J; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GY7pr+/J"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67999045530so979527d50.1
        for <linux-hams@vger.kernel.org>; Sat, 17 Oct 2026 11:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792260771; cv=none;
        d=google.com; s=arc-20260327;
        b=H+YPnj4bSxWpI0fgMCeq6qPshIcXUMA4ph5dvZat0m24qC1rjW8AFyJeTQmS9zkEDA
         2PfakoOEe9Na1KJPK95sdfURYKhv+PvUPfo6prg0Aj/iVDvdspVwxMYREPMuHu6g1J8U
         9pr6UnHojhObzhTMSMJC5qNaW7sJgiahIUMT1ffpo+3eu50EFAzG/ZAOWlEDXVmXe/jA
         7F4ezxwufHWV19zzG7QZAxEF+G35AJTmepE72clJtG5cBpPkwMbly/2c50s7ICYIgL/L
         1VJESmVGxX79SPUoroK6rIJFGk29dEX6G3rtyAd/U/n2Qx61rxPLilLzhVJKK8xhwxEx
         cgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=EAjs0OmtszIQl7CAKawyEIZQDr4QrubtblmVqS40wHs=;
        fh=yvyQ0fNR7evt9jL2wClrmYYCzRjxmggS8kmKCqDY7Yw=;
        b=EMvfhJbbxbi25ZY0OpuoSWzTTxIohLPb43yonoYdJZDbG8sWyiD5kcrXIT9gV2XQrv
         LSNVYnu/hYMtp0GVC/gSaUAiLYus96dmvtvLrfGd/+HdaQG+picuDSADzNnPAg2MCtCJ
         Q6WiCF2wTmnuySD7mWbNPk1p9YXQEpPWNmBJfFH5PsSspk5B6MUvdkHi0yBKlRtQtejd
         m/0F3Cn0AyksKWRSEFtwXtxnjm35OgXZyIVMfE0M7KRiuszKbatYQquLL40uJHJbSf8m
         9OhtVYoMaOxz5MhuiB4eaw+7djh6PX07CTjCPnd6CzFt0QhK1Z5kUXgITjVrtJVAhKqP
         hiwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792260771; x=1792865571; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EAjs0OmtszIQl7CAKawyEIZQDr4QrubtblmVqS40wHs=;
        b=GY7pr+/JGxUE1y9wVpqnJxtql8FDkXozC84XIKzVj+/rWqMMrJCEXuTx7Qj2g47Bqa
         GJVz4m4MnK28OFQ0ZXrOY7nvcIgYTIOVsjScyjUncP3XjnV62DkDZrwxK9V5LcUGM3mK
         cnn3ghkU6LMKjgWFvtLO3lnd1azYOcoVsgGBcm8blPpBSe6tTOQLnzZuLh/chFmCuD1a
         ix6NzjItB3pTTz5yyYR8bMG9M58X+JWwsZ3rFShaiZLcecOWRMwsUHoFAmDlBxetQxYk
         VchNgVlTyljxJ7u07Fql7Tg/WUqLBkDe3li9IgN6TJUqnsDYXHM3K7D1iojbCLI5WitI
         VxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260771; x=1792865571;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAjs0OmtszIQl7CAKawyEIZQDr4QrubtblmVqS40wHs=;
        b=wARmzvgK59VP2c/F39AvejumdzwSeruuOVV3/RiS1OhnuZK63bFWIe3T3snNOtyc6q
         mAgTV0k2gtpOUKOV2vy9Mxc3lRQGS/l9oInO/Pc2EzIPLYC4vb56kvN+MiWuIwBf5dxE
         csMwF/HUdOYS+d6mhaN+y5bRfDVvhJDbxc+5xOj3Tnoqy6vUmqSp+NNopjPJnbNTTVG+
         aZ7mltGfyc3NiYBQ7e5nfus0IDFUL0b6g0ODZNXIUSYD8gt+TO4XkP7b/al8rufEDfLw
         S4t7h79GNM9y0hVSaT8tZBUr6zWn6RSTbSXXacvoqg4ymisncfBwb3cTSAMGjtzvs3U/
         vExw==
X-Gm-Message-State: AFq9FYIXNbRe9mILv+OWKTuujiQnrsp390iXUaE0NrQlVF9FoW3UiYFq
	KOJ9AAXdBjgBS1mgLrJco7NHL7JwCJS8O1gOeaUpRzh7a+FpBKGlkmZegmlWFMpUhqFg8Ocbs+P
	J6Rk0TLKXxlPV0sNFy4Gq4bE9REPV32sWlLwG
X-Gm-Gg: AYBFou3SoJD5YuOKl1TQJTuekezAph5ChyQQkJi8xSpp9xshDdj0NN2BJl8I3LVfCV6
	9U0TgxtLhqek45PMN03YJevq5llUAEfBP55aUDOaXC010MHV7APIBXHpnVK/agzwxkkBU5Oj97m
	VNLjoEFDrjG0OB+E4PkRt6i07YiMNA25sqCx0TwcBkbytofP2ehTdNUSgeDbqpJYUvDBpq1kOeD
	i6eyZeTuCvVJfsBgOwJ4JCl+TGniiNpequuueHytmiNJF65r7N5A+KoAmUB+XBcnIBw0oOyKbnI
	M28MCy2zyydvRL77qJsEG7itPWBE4pdolvTYURQJBy5YI17zht43YH4=
X-Received: by 2002:a05:690e:190a:b0:672:bfb4:5f4c with SMTP id
 956f58d0204a3-679ca8ba8e4mr865975d50.101.1792260770968; Sat, 17 Oct 2026
 11:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Sat, 17 Oct 2026 20:12:39 +0200
X-Gm-Features: AclHuK8q0ZEdbWSNUVhbZCnGdHVTchHenWG8zKZHj-4Fgpc_0AV5gJPIA2AKsck
Message-ID: <CAFAa3YB2SOswBA=5rUUYDaKPo-ZArc-K8KEL3bnC3LEunWzz=Q@mail.gmail.com>
Subject: ROSE fixes submitted for the 6.12.y stable kernels
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello all,

Today I sent ten ROSE fixes to the stable kernel maintainers (Greg
Kroah-Hartman and Sasha Levin) for the 6.12.y long-term kernels.
The list received a copy, in the "[stable request] ROSE memory-safety
fixes" thread, with the patches attached as an mbox.

Why it matters to you:
6.12 is the kernel of Debian 13 (trixie) and of Raspberry Pi OS bookworm.
Until now, 6.12.y had only 10 of the ROSE fixes that 6.18.y already carries.

What the batch contains:
- five teardown and use-after-free fixes that were held back from
6.12.y on October 1st;
- the four fixes that went into 6.18.55: routing loop detection (two
nodes relaying the same call to each other endlessly), a NULL
neighbour crash in rose_transmit_link(), a t0timer use-after-free
reported by syzbot, and two harmless "unknown in state 3" console
warnings;
- the fix for a regression of one of my earlier patches, which could
crash a node when a call was cleared before it was accepted.

Nothing is in a released 6.12.y yet.
The maintainers first have to accept the patches, and the usual review
cycle follows.
They were built and checked on 6.12.113, but none of my nodes runs 6.12.
If you run ROSE on a 6.12 kernel and can build a test kernel, your
feedback would be welcome.

Note for 6.18 users:
6.18.37 to 6.18.57 contain the patch that introduced that regression,
without its fix.
The fix is queued for the next 6.18.y release.
Until then, keep using the patched modules from
linux-netdev/mod-orphan on those kernels.

I keep a status page of the LTS kernels on my web site (link "Recent
publication" in the side menu).
It shows which release contains each fix, and when the Raspberry Pi
kernels follow.
It is updated automatically at each new release or merged fix.

73,
Bernard, F6BVP
