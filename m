Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE2D3BBFD8
	for <linux-hams@vger.kernel.org>; Sun, 20 Sep 2026 08:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893254; cv=pass; b=UE/WkAr5GfTnbMSPFk5y88v7HWLsscBlJE12n+RWzvLurJW54Y5Gqmolm1X8TyDmIwGWKRhFs+knL3xY9E1b8XWCkjIrQcR+TFwf4YcH/c9v2jCSZa2h5NoaVBUCwvQ5cRsBljKrBRj+g0geIZi83yEnnlEXZxQiLt8X11OFU6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893254; c=relaxed/simple;
	bh=Y8CbexPXsfGSV3e7RrD/B2um2am647BZZefm2OXnXtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMA5sg9D4BMWFS45rqcP5uA2HJZGICMrr7+vPCPWNpUaglAGTCIPqH384XjGqwzXB88k58RwkRMmzo06hXtSKjmVBHm9BTk6z0KNBgXS9iga2WY78MhzcKQN53apVvoyediCcF1/HnYtzeCddHY4KNm2jbWZMo40xXzehjtuiLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bk14J77i; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bk14J77i"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-86382f10801so6316677b3.1
        for <linux-hams@vger.kernel.org>; Sun, 20 Sep 2026 01:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789893252; cv=none;
        d=google.com; s=arc-20260327;
        b=c2dxMtCYhCpgD0N+H5goKkVU3g6e6zbu9A1sMBKeyArRm/1Jp2bBaUDHidRScD5Xk/
         J1LOnA7LwTvVQILz3ugIKduIjpHRz1ebcY+3RmI1AfLxLgKBpps1MC+3mN3d4Hb57KaK
         SpIqLTNPP+yAohTgnPA3p6NZ++DE2HsgWJ7VBMX7sKHMdL6LaUSxAtfcQFKuBLGtXmCR
         Bukkuego9V4CzXKidIJO3R2Ep4n3iQAQFvxF8EkROfgpUW8sTCPuWF5mCkE9clyUx3rK
         PGA9UROlkuCyCXLPep26VUOeyYko9hBpbZgBxIUcE/Ht0uMPwA0miRwb+5YSQC/OhgLJ
         IXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y8CbexPXsfGSV3e7RrD/B2um2am647BZZefm2OXnXtI=;
        fh=ezjpbmUcTosFHrM3cDegKJaDfR0aQuT7MCHTD50Vk7U=;
        b=BDQa77DpF5ZZ7rRLnT3OuMBB95A6WDyy/dRIr4FntFINtR5XlE2nx9Bvkl49hbMvgZ
         MHRLdEy37eDBsCiotXouH6jXxoa5zlys+pn6UvHNZKvFHshSCoEFYf+ERBSWM/YEoyCu
         O9uQ0Rny/r2qqKA497o5I7rDFGf+fVC56NEC4W+/syPuLYasjEeNot804jZKtvTfzNLH
         2XcObIeEWko7LvnNAx7Mf8tVsx/xbzaKw2YK24FxMBC00QhEZaG1RUw9+0sii4W4BJiM
         TSAR7zT06fJeyDqwJj/+ZyHAh6f5Ig2g6Q37ucxgdHKYhcmibC15C1DqJaIU+cTtiX/e
         /TMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789893252; x=1790498052; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8CbexPXsfGSV3e7RrD/B2um2am647BZZefm2OXnXtI=;
        b=bk14J77iFNjldKN0s7TyJhL+ghF2gTfbXSmIcYk7A6AyhP8J30bin72n4RBiVRok9C
         nCk4N21HESg7j1hyllqbxNHtDam4nRqDq6izuTEbEfQlIjKHbeUiujMLBMlpMGpqa8j+
         41VyGAGmXswdqjFFmL1I7BjPqiMmjS2+TCqOTSGr0w4P3OUg1SLXCeR34Qg4WBXe+uiV
         po9leDCPrsORQVqqGt8CjTh59GBNJAriGzdM0Q1VQ6UVFyjl8ILVDRkttXksGosG8RBF
         z05y77r/6/FzXPQT929ujUrq9AXhAJipl+uTPpouesYe8dkjPRc5SAerL81KkdOMWsxg
         r4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789893252; x=1790498052;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y8CbexPXsfGSV3e7RrD/B2um2am647BZZefm2OXnXtI=;
        b=QEVcZK5rG4z5tqa2b0L9A86wX/ZkgMlBP2j3eO0Y3jkLGrJgfA7JdEgvR/Kq/eqXGI
         mJqxh//XazjYDkN7R8oxiiv7KQW4/tqi7mN3QItbszQsLaF/CelYQqU35fSC5vWPQZ8z
         kwWb6FuIy076kfiiJ5QNCZCi+AvNmvmqzROHJRE6HYUotE5Gq7eD5aFi1Z7SiFPIPap5
         sXTnkXNQf79HwqXxIKqLuU3e38EkzHWBv+/SuAaax3sFkKsLL4keBZNvMxybB9iaGNO4
         ryTjK3bwbkLKSNMgdgRvy4Rmve9lmB/JXf65htBzMr/pkaKjwWwJr2xzuhB2QksnBNuQ
         zjqg==
X-Gm-Message-State: AFuF++nvgd4zAY4u7msCdoAuIEqx7tPMITUkKMfY+vhes5+LFaZ6H96E
	8/9SgSg9yeTnQxScy1et1CDQ312NFXCs+feEDskrsCbbg7hIAh3xRQJ1BgsNvLm+kRqOWBRjIIE
	5OUyUCFTAF1ucBh7Qk0kKVPUkvw+Kgec=
X-Gm-Gg: AYBFou27khPq3bCO6Lep4RS5jJEnUCbdI8k4kZ4JZbsG91aIQXNaTeycmFJhtrHmRvY
	wkUhjlhoFvWYIFxHgdbYiCib9gj5p4XUyjzI2oRJGMujwH9UojL32N/pOYa8ylRrJaBZOFcksOW
	9ROw74IZ76B+WPF+X1fHDhRBHpCqfBPauNVntre98LFt4OgNm3G5mUcycYIPtdTwQV/y/H1kQWV
	8lh/ylD3gx1wMwUrXZwXYKQ7u/CZU4Cvbjo+4SoYVqxu/A/ys69P2rjhn9Bq5MEkwc1ChU/vkUz
	JRXzz75Gdf8boDxvy40CrZ5T86kHsBHVrWufFsLIyCAFQYosS25rp4A=
X-Received: by 2002:a05:690c:f05:b0:81e:d001:e0ca with SMTP id
 00721157ae682-897331412f9mr21853617b3.17.1789893252052; Sun, 20 Sep 2026
 01:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFAa3YBjj46RJRseda_CzOQ8C9Vt4RJq2h0ysoYvUUqmhhb1Vg@mail.gmail.com>
In-Reply-To: <CAFAa3YBjj46RJRseda_CzOQ8C9Vt4RJq2h0ysoYvUUqmhhb1Vg@mail.gmail.com>
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Sun, 20 Sep 2026 10:34:00 +0200
X-Gm-Features: AcwNN1Xps0pECiLw0G9a_hRuuC8x_X6hmw0-PEOAFRvGglXkfNZaJpqQkGW_pZo
Message-ID: <CAFAa3YDHZNww6ugxjEty8rBQHQX+MnX9CBdbddSmEyEs1VJ6WQ@mail.gmail.com>
Subject: Fwd: ax25: could you test/review the REJ-storm fix (mod-orphan PR #8)?
To: Chris Maness <christopher.maness@gmail.com>
Cc: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chris, hi all,

Chris, in July you described AX.25 links where a flood of RR/REJ frames
ignores the transmit window, and in September you confirmed that no ROSE
was involved on your link -- plain AX.25, Slackware, 6.1 series. I chased
the same symptom here and have a small fix that I would like you to look
at, and I would welcome comments from anyone else on the list.

Background: on 16 April Jakub Kicinski asked this list to set up a git
tree so that the amateur radio community can handle AX.25/ROSE/NETROM
fixes itself, sent as pull requests. That tree is linux-netdev/mod-orphan
on GitHub, so the fix lives there as pull request #8 rather than on
netdev. A pull request there gets more attention when more than one
person has looked at it, which is why I am asking here.

What the fix does, in one function (ax25_std_state3_machine() in
net/ax25/ax25_std_in.c): a received REJ triggers an immediate go-back-N
retransmission, on purpose bypassing the T1 backoff. That is right for one
lost frame, but this path is the only recovery path in the state machine
that never touches n2count, so it has no bound. If every retransmitted
burst draws a fresh REJ (lossy RF, or reordering over a UDP transport),
the link retransmits at CPU speed forever and never reaches the N2 give-up
that limits every other path.

The change counts consecutive REJ-driven retransmits in the existing
n2count. Once N2 of them have failed it falls back to the normal, paced
state 4 enquiry, which gives up after N2 further tries if the link stays
bad. A frame accepted in sequence resets the counter, so an isolated REJ
on healthy traffic never gets near the limit. It reuses only fields and
functions already used the same way elsewhere in the same file.

Status: it has been running since 13-14 September on three of my nodes
(ROSE/FPAC over AX.25 on axudp) with no regression observed. I have only
seen the storm itself live on a link with ROSE inside, so a test on a
plain AX.25 link such as yours would be the most useful evidence. The
change is small and applies unchanged to a 6.1 tree.

Chris, if you can, please try it on your link and leave a short comment on
the pull request saying whether the storm still happens, or whether
anything gets worse. Reviewers and testers are all welcome, and a comment
that says the change does not help is just as useful as one that says it
does.

Thanks for your time,
Bernard Pidoux, F6BVP
