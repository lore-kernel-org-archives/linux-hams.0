Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5463CAE8D
	for <linux-hams@vger.kernel.org>; Tue, 13 Oct 2026 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882840; cv=pass; b=Z0jrNKynWznyRKM5+IPdWzo+YnaqK6x2Em3EWugisRI1VCACeTR+hyQqbNP7XDFMfYdVpo0ufXRD1XtWdmY7u2RenjOphBiOqjBeV+OtEvd2zdYz+dI4esPZOuoIWRbP9qgFAeYHbST9mg+65tQx2fvyFpnOOTyMugtQfZLgmgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882840; c=relaxed/simple;
	bh=mJxFjt9WFEGlZhgUFtkVJewA4Efpz8xxd7eAUKwRsy4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=onWteS77i6MXDjUcO8T1ZeqpNW6LVhGon1f3GiCv/Dui38DsJrqLa1UY3Pcf/qkTp5qsXfMHi+wA5TQ8q5BcqPEiLFaF1gPEBQIDNSHpq3bmbXlU7rukIUVrLEU+rxztgjjpLOPEHA+GoLinL17Tuu+2xZaoVqFBWCrYeuREZk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKcoPSBG; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKcoPSBG"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67489c8202cso2000576d50.3
        for <linux-hams@vger.kernel.org>; Tue, 13 Oct 2026 02:13:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791882837; cv=none;
        d=google.com; s=arc-20260327;
        b=qjLDS5to1Cdvz/M781xl3gutafbkoc5orIJy8kue11zvsLgpBpzilvWLL7rt2Ab3+S
         Tkeu2OzmLY8KkhsibGujblbYhIwalQsNAZ6LHrMeKS3mSImZKW5dbk+HzzwN0t3AArao
         6A4uyaGb2nIrxKzFebD6FVuvO4gVaF80BNNBz8nu3y+U6GFnOmtpD4/PU3NdU29Mr4lT
         g+lmPsEJisAANIkt5TziERpvs75bHxv5ChAyjpyG17sjNnChFMF+p0vlBY/YGIEeZ3a2
         3UfRh8hiUgjAb6mW3uLK5uP0P/lw6dI8CM6YjL5DZitHjNnhJFjsMOPEI3q9CzR8+UHX
         8zWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mJxFjt9WFEGlZhgUFtkVJewA4Efpz8xxd7eAUKwRsy4=;
        fh=yvyQ0fNR7evt9jL2wClrmYYCzRjxmggS8kmKCqDY7Yw=;
        b=JEui9g3CJ73yg4Q6U91eafERONhPSN/IUZh9t22VIseqDUB57UoYlI3QjTMjICmaFx
         VflvuqRqVMy7+j3JHu1knhrH+URL+gpXK/wks1XCYGkaBIyJb4e8UpgkXtxLbwVHlLhk
         Y3I7RkbVfMmuqQ0aRFc7rUS9M/7O6biN9eZiB7fa7GvwBNW5lmxj++xh+Vr+ImL9q/sH
         1mqB8s7X5VxTtxcJxF+Ic8iaLQljogG6fzHpGwl85ZgucmJ7zfu4A28QmoW4z/mURP0m
         bzeJlqLtws9P8Hthx/uhiecDfB30vFV9JPbh4KQvxAqbaOcnXf/IN5Cftt5MnpwYp26g
         Vepg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791882837; x=1792487637; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mJxFjt9WFEGlZhgUFtkVJewA4Efpz8xxd7eAUKwRsy4=;
        b=HKcoPSBGikuORotRhjobkl6HlTs+S9FvD57/dG56BeAdB8Zn619cdKnhfZM1wdEqOt
         ZPeH38Qg785bz9e4OZPvHC+3HD2tOn5r6gu6tPFaUlF9asZT5uHxSSJpf1oue2YuTIpu
         mp/jOCR+jVFDj9bSlQ/MRab+BHf9kuJ7vzhPmvPpxVB8n5UweqWVxb9vfbnf62Z1ZptW
         3gvzr2ztjdekYOZLGO+hPTwnOpzyXQUtASBxpmXQAqFbC7mEhMj+ceV0stS2CWpEeUAv
         KS0MciyHW7LREjM0U2xnn8tiShuVXQPG9wFFrx3yillg76YcCiwPIu+rosH6kBB1Gu3s
         XkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882837; x=1792487637;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mJxFjt9WFEGlZhgUFtkVJewA4Efpz8xxd7eAUKwRsy4=;
        b=IvmyhK5J+h6oDQf+67CoqE5ahq9eI+PQ1rUQqDplLxL8QLnGJ4qOprdYPHBMmfJjtx
         eA4vEcSpH64UOD1oxLDD+2Zs8kAnKR2XrGkaaW3zrF6jFegG3INFIvEtFL5gYWvLN7YQ
         s6fOA9TLVYAj3e++4tsO70P0viup0paS4CNV300sOTY6tlyF9DPXQ1n9sM9ZeVrvuKYh
         NK+ayvwrV+KmyrpKEN3zk7IqEmaTlrAD+oOLLO0Pv8dGdJbdx7wxv3kVbPm2r1JJJpAK
         IDrYo5SSyBCaPoCdRZFJc0md2pVa0cGWyxmlGN8jkHjmic0fTdsJt8Dwh4L10h9schDk
         AqoA==
X-Gm-Message-State: AFq9FYIDJ/eNzB/kOKM4lCG4eylku2znQDoW3ZKK6QYHsvybR8bdivfR
	roKkjs9Wy90TOEDCPZkyM5EjYks0FCfmnEsCozMiF44U3Px9qM9qptTSHKM2FSaIrhkSoOlkg8B
	pa87XtJ4mu6R7Fao3SZHdfIJTetWn8IIotStc
X-Gm-Gg: AYBFou20Yv5rR9vbwKTtIHBLLvNM/YjpinXjFBL7vs/yWNRD+saRyD53auXpEhGbyKk
	tNzfxTolKDaYmrarxUMdNOO49i0eE1FAUA9oiCSeX0s9PMumYeEkXQTAtgbwPSS51D/c4ruLPYO
	c9Xp60CaDh6wsqLrCbiqr8zljI+Fhj4wTTnZZxwqOMvhOdIOrgAkTT6O1KDwonj8BGGhAsoGHdh
	qOeUyGjZuIAbKiCITK9lDgHPKmzrc5QcvYP/jkGSYR4RHPx1MioUVp8jdOH18n8g9fixNLcWxPW
	w3DPiCxd1zG3y1S7+YQZ7aZPB97P826QAmoRUJfNzs1453qhUr+roqU=
X-Received: by 2002:a05:690e:1518:b0:678:3418:8ceb with SMTP id
 956f58d0204a3-6793630f4femr3678435d50.91.1791882837136; Tue, 13 Oct 2026
 02:13:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Tue, 13 Oct 2026 11:13:46 +0200
X-Gm-Features: AclHuK-O0bzWVvIp9WIJN5fJIkuiTC2rN8GBTk2rTBSYadTT1cvErbckYenhkj0
Message-ID: <CAFAa3YD_+KPFuWr7B8V2VaEPG0F+4PWxFNhboDLVjhLhYoh+oQ@mail.gmail.com>
Subject: ax25ipd: fixes and glibc 2.42 build, testers wanted on real serial lines
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello all,

Many NET/ROM, ROSE and plain AX.25 stations are linked through
ax25ipd (AXIP / AXUDP). I went through its source in the linuxax25
package and prepared a set of fixes. They are in a pull request
waiting for review:

https://www.google.com/url?q=https://github.com/ve7fet/linuxax25/pull/28&source=gmail&ust=1791968872589000&sa=E

One part of it could not be tested here: ax25ipd on a real serial
line. I would be grateful if someone with a TNC or a serial cable
could try it and report the result.

What changes
------------

- It builds again with recent C libraries. <termio.h> is gone from
glibc 2.42, so ax25apps no longer configures on a recent
distribution (Ubuntu 26.04 for instance). ax25ipd now uses
termios, through tcgetattr() and tcsetattr().
- Memory leak: the hourly DNS refresh started a thread that was
never released, so ax25ipd kept one more thread stack (8 MB of
address space) every hour. On a 32-bit machine such as a
Raspberry Pi 3 the address space runs out after about two weeks.
- Route lines in ax25ipd.conf: any word after the host name was read
as a string of flags (b, d, p, l), including a comment at the end
of the line. Now "#" ends the line and an unknown word is reported
and ignored.
- The address field of a received frame is checked before the
digipeaters are walked (at most 8), instead of reading past the
end of a short or malformed frame.
- Signals are handled in the main loop. SIGHUP used to reopen the
pseudo terminal, which left kissattach on a dead one: the ax0
interface stayed up but silent. SIGHUP is now logged and ignored.
Transmission retries to a full terminal are bounded.

What has been tested
--------------------

All of it was done in UDP mode with a pseudo terminal, which is how
my nodes are linked:

- old and new binaries compared on x86_64 (glibc 2.43) and on ARM
32 bits (glibc 2.41): same terminal settings, and 2000 random
frames in each direction identical byte for byte;
- in service since October 9 on a 32-bit Raspberry Pi 3 carrying
NET/ROM and ROSE traffic: links established without retries, no
error on ax0, and the address space of ax25ipd stays around
12 MB, where the previous binary had reached about 390 MB after
two days.

What I could not test
---------------------

Nothing was tried on a real serial line (a "device /dev/ttyS0" or
USB adapter with a "speed" line in ax25ipd.conf), and the raw IP mode
was not tried either.

The serial case is the one that worries me, because of the history:
in 2011 ax25ipd was switched back from termios to termio after
reports that it "randomly sends garbage traffic on some platforms".
My reading is that the old code passed the C library structure
straight to the kernel ioctl, which the new code no longer does, but
I could not reproduce the original problem, so only a test on real
hardware can tell.

If you can try it on a serial line, I would like to know:

- whether it builds, on which architecture and C library version;
- the serial device and speed used, and what is at the other end
(TNC in KISS mode, another computer);
- whether frames pass cleanly in both directions over a few hours,
or whether garbage, lost frames or a stalled line show up;
- how it compares with the ax25ipd you were running before.

To get the source:

git clone -b fix/ax25ipd-robustness \
https://www.google.com/url?q=https://github.com/f6bvp/linuxax25.git&source=gmail&ust=1791968872589000&sa=E

then build ax25apps as usual. Keep a copy of your current ax25ipd
binary so that you can go back. Reports are welcome here or as a
comment on the pull request, and "works, nothing to report" is
useful too.

Thanks in advance, 73,

Bernard, F6BVP
