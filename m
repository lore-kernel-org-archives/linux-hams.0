Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5C046AA9F
	for <linux-hams@vger.kernel.org>; Fri, 16 Oct 2026 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141886; cv=pass; b=U/kLOc1W5jyDuTSBllR9UJmbQAB+QzpPrF6VZzUKzMwszLfnx6e/dznyFs3S8hJER16CJQO5pKw9/xgzWMNk3rJmgwthvxVNrFf+Pb4pFn83w1qIuXsTtvrp5HmvlN1UWVPnOtOvO7TtB5okf1bU2l5RfX0OgGlNh7JZVnpWPhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141886; c=relaxed/simple;
	bh=+SBJ4rhrPMqUYlg6r5gpfML6CrNcjz6Nu2ZltuF/Ppc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tURT0m2NzF1HUkPhvukZbw4LCuqmdUbK+Br8+5ta4V5vTDl9quOcmM4aPULBr0i2tp4Bk8EZdg4f7cTc3IfK/2ROMI5igPlMjQ28ytcaJR+7QAuQAzF7ZG8jRaVQRxYFUDcmKsZmfPJAo6Zb1zALJby9TesAPFSuLFAbG6itoUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAe6eS5M; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAe6eS5M"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6798c43a3d6so2112719d50.1
        for <linux-hams@vger.kernel.org>; Fri, 16 Oct 2026 02:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792141883; cv=none;
        d=google.com; s=arc-20260327;
        b=M6dM0aVDOU7AYeaY8Quz/pFBI8BY1SKqwPn2oPCow2bbSM7HwKTZhsBkPorgrm7Oow
         VCmDFHAu9N2P5vajsJvMEfb7POof94ID7EvTvi7bEDyiQqGTGIGOER2T11sRdrB1aeqI
         NBbfscKDY3zUon661sjA+nilDy+Y9WKZF1Uv/SKSFGOFzBmytfl4wewax5RpZmMoVgOl
         xd6u/lz6vs4NTXZeNx/MOyZ4snzIOFIhN6Cf0YdphxkDwFp3EGJj6LnFT1I9gXKRXmLV
         gXWA6POoeuyxgL4YLnj9sL+bfPhjZcDJhrQfVhoheEcT7o5anzqNQXLE4+2nBcKoh49d
         vSpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yTDwflEq8S4Ppb2FuYq21QXh2XsTOjqeFnNgFy24r50=;
        fh=Su3QtX70+yAWarwvyBxaE3rwmtekL6Cn6/lSEnFn1O0=;
        b=NRdGPM0XHjujUx04xsZUu17yCR/6F4E/ySWPMixvQfEDG8OhqblceawtLdDXbI2bjk
         Ccz5e83qWHSF1t72ndf6LOU4T/qbyVV9adWJeKCIBKjzZVxUm9ZY7ReEdKbbut5Y+ZrK
         SF85btrPKYj8dJugeyKFLZvrXVPPPDw0aEp0PhGYP7CxAd4YhOlHgBKRS1lhAxT2H5Pp
         zw9fkouwZ/B0ZjFDJ2SJAdppRcjlx9jriMORDW3jPSZPzYbDzMiBpDfFS5yM1PKUSnO6
         /7pWiWzwDOrv5fMMZWT2z/R4Q8iIQZhplsBXZ3C0+hUhgpQBae5UKpiv0tzCPYcXVo8o
         Nnxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141883; x=1792746683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yTDwflEq8S4Ppb2FuYq21QXh2XsTOjqeFnNgFy24r50=;
        b=nAe6eS5M5fIFWtH3xH8tf1ZE1AjVAInYzHSqEWnidKAFW2+67Ux/JfZjJOJGWpa7ec
         LehraG+lXyKipLMRwRD/bCygDQ6kDp/OHawof+xoW+IaU9FF2E9UPQJ5gSPOcBAeo6I1
         KEVK5k9AQIbWqMBE2ABW44lC1KQzX3z8a1eI1+SOjmPM9EfeL3p6fDnvTozoSUYJNyFB
         Rxm/VLPVNK39BjpPovWvJA/4oXSeBnu+EyRjb6BnpuzUSMPyOaIx+ZW6ZG6YElno1VyV
         uel2NLssGn15pWzPyngrIFrmleUbfEHuXMrghIpQ730a4BU2P8rwz0B67O/JrX4CIQH7
         g6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141883; x=1792746683;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTDwflEq8S4Ppb2FuYq21QXh2XsTOjqeFnNgFy24r50=;
        b=cpRSxmsRhAOwmUoeyjhdZIFDJhjqf3an7pE01MEtAw6YGSG86EdhktH8YxXgVn0CiI
         DNLnLY2g3KCGkgIs6vA+3cs+Fyz1rNQHjLXnrBFf5l9N426Y9YxWYgXqaYrrMZYJdk9q
         HqZ7iqdgK3vZ+KYjjgqLbVv5jOwqnhGfpLu34CLw1rszgMVwGdPJATXZkC5sax1ivuqj
         dyRT4Srt8qmv9uh8u+Zh2xSHL+/uq7Evrtus/ozgfyIab4NmTMIG3zdFXVgcbI4IO5p7
         jz6bWVxJeiRML61JVaGvtGlELyG56le4fCK+RN0hnNFkEamkrKXLj+s+aJ2mRuwoQqD5
         w2Dw==
X-Gm-Message-State: AFq9FYKCYnvhWYIbnBAT9hF8qtLFy6oec6wFyCzaSMicWCJc+HRGGHK1
	0KPsL/wJpvK3mzcxCzsWNSEWH5LGPVPKN3itrTXoqVUzjiYIbGueIuUwxR/t3TsJPVNGEPtadvp
	Y4eJOJZF4fyxaOqsSlFY7cTExWFj1fjwRRFSD
X-Gm-Gg: AYBFou0uQX3K0pnpe8eqWEnAiGgJBAo4JLI13n5hyHh6LHojKK3gS6jTdU7tWeykHcZ
	p/3bfxgZEc/D6xhfzL8a35RBCf+/T08PxnVis0K1n9xMiKrMCqnjhyaUnZrUnLXQ9uRpR0nMULI
	MaPKLumQ/sj/XYIvF+0JuZ9NHlYRcuQIVnru7JGfH8U2SJ8aCRMxiquQeuij/atAEETxPSvglAL
	YWhVnjdvnm8Fm68SniYkKK6ZxFVuyi2W17Wz1/Ij5e79BD9wkURL9TY8nr9D0DHtkM2/A6TYuzZ
	JkvhXFkxSDkqmvyx4gCYLApkVuTTwrTvQJphbiXELPdX+hebOwDsvL8=
X-Received: by 2002:a05:690c:113:b0:8b0:d646:95ae with SMTP id
 00721157ae682-8b0d646abd6mr15666877b3.18.1792141882977; Fri, 16 Oct 2026
 02:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFAa3YCbFFNNWLwDEd6u7dGE=5xfb72CSLwJgJVAtP_+=8beDg@mail.gmail.com>
 <19B86BF2-D959-4D1A-81ED-8DADD729042B@osterried.de> <CAFAa3YDzx6XGDH0wL+=YYq7uGaccJkdT0a7UUYOiFrdu5WFL9Q@mail.gmail.com>
 <28347904-28FF-45C2-B7C5-0FF9CFF4CA31@osterried.de> <CAFAa3YCJCDURH1bUAE0PAdMXVNzY2GgQGNWCX5q6grP=TGxJsw@mail.gmail.com>
 <BA380815-F216-4D9F-8B91-ED7283D04053@osterried.de>
In-Reply-To: <BA380815-F216-4D9F-8B91-ED7283D04053@osterried.de>
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Fri, 16 Oct 2026 11:11:11 +0200
X-Gm-Features: AclHuK9_FFORLWmr9Ry9WEDOcRXrupHtsTg0r6aM435eL3CipOyTznPYniikxAU
Message-ID: <CAFAa3YCki2QC_JrJFB+SM7cN-iRi9sP3KyCd9Xa1fy49GGRgmA@mail.gmail.com>
Subject: Re: ax25d - very severe bug!! - was: Re: [PATCH] ax25-tools
 user_call: data dropped on a slow link, connect timeout that never fires
To: thomas@osterried.de
Cc: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

Thank you for taking this so seriously, and for porting pull requests
#28 to #33 to the unix-ax25-stack tree so quickly.

I agree that distribution maintainers should be told now. Two
precisions, so that the warning is accurate:

1. ax25d, remote command execution as root (fixed in PR #30)

This one is in the AX25.IP mode VC check, i.e. only when ax25d.conf
contains "parameters_extAX25 VC-wait-login" or "VC-reject-login".
In that case the caller's callsign is put into a shell command line
passed to system(). The kernel does not check the characters of a
callsign, so a station sending a forged callsign can have a command
run as root, without any login. Without these VC options the code
path is not reached. The fix lets through only letters, digits and
the SSID dash; any other callsign is not looked up.

2. Compression overflow, in axspawn rather than ax25d (fixed in PR #32)

axspawn is started as root by ax25d. The "//COMP ON" switch is
handled inside read_ax25(), so a peer can turn on compression
already at the login or password prompt, that is before any
authentication. The decoder (decstathuf) read the length byte as a
plain char: where char is unsigned (ARM, so the Raspberry Pi), a
first byte of 0xFF selects the "no compression" path, which copies
the peer-controlled frame length into a 260-byte stack buffer
(about 2 KiB overflow under AddressSanitizer). On x86, where char is
signed, the path is not reachable. Exposed: any system where
ax25d.conf starts axspawn, on ARM or another unsigned-char platform.

For the old repository at
https://www.google.com/url?q=3Dhttp://linux-ax25.in-berlin.de&source=3Dgmai=
l&ust=3D1792227413302000&sa=3DE:
the two fixes are
self-contained. If it helps, I can prepare them as plain patches
against that tree.

For the distributions, my suggestion: since the fixes are already
public on GitHub and on this list, there is nothing left to keep
under embargo, so a direct report seems best. For Debian, a bug
against ax25-tools tagged "security", addressed to the Debian
Hamradio Maintainers, with a copy to the Debian security team, who
can also assign CVE identifiers. I am happy to file the Debian
reports myself, pointing to your tree and to Lee's pull requests,
unless you prefer to do it. Please tell me which you prefer, so we
do not send them twice.

For what it is worth, on our own network none of the eight nodes uses
the VC options, and the only node that starts axspawn is an i686
machine; all eight have run the fixed ax25d since 14 October and the
fixed axspawn since 15 October.

Good luck with the timing of the user-space stack announcement; it
does not have to wait for this.

73,
Bernard, F6BVP


Le ven. 16 oct. 2026 =C3=A0 01:43, Thomas Osterried <thomas@osterried.de> a=
 =C3=A9crit :
>
>
> Some _important_ points below.
>
> > Am 15.10.2026 um 19:44 schrieb Bernard Pidoux <bernard.f6bvp@gmail.com>=
:
> >
> > Hello Thomas,
> >
> > Thank you for testing, and for taking the user_call fixes into your
> > ax25-tools tree with my name on them.
> >
> > Your alarm handler change makes sense: ending the attempt from the
> > handler itself no longer depends on connect() returning EINTR, whatever
> > serves the socket. I will bring it into pull request 29 of the
> > linuxax25 tree of Lee VE7FET, so that both trees keep the same
> > user_call.
>
> tnx.
>
>
> You and your friend Cla.. had other findings, in your latest 4 PR to ve7f=
et's github repo.
> Actually you discovered two bugs in ax25d (which needs to run as root for=
 allowing unix-login via axspawn):
>   1. a bug which allows a remote-root-exploit. Very critical.
>   2. a bug which allows a user to gain root permissions by a buffer overf=
low in the lzw-compression feature
>
>
> Imho we need to proactively inform package maintainers for the linux dist=
ributions, _asap_.
>
>
> That leads us to a decision problem.
> For the new userspace ax25-stack capability, I moved the development proj=
ect to github (because it makes collaboration much easier) and intended to =
move the old repo to retirement.
>
> But these fixes need to go to the old repo for those who refer it. And be=
cause ve7fet's clone is also used by others, at least these two patches nee=
d to go in quickly.
>
>
>
> > About your spoiler: an AX.25 stack in userspace is good news, all the
> > more since AX.25, NET/ROM and ROSE leave the mainline kernel with 7.1.
> > My own work is on the other side, and I see the two as complementary.
> > Many stations will keep running the kernel stack for years with the
> > kernels that still carry it. So I am trying to repair and secure it in
> > those versions: the 6.18 LTS series first (four ROSE fixes are in
> > 6.18.55), soon the 6.12 LTS series, and also 7.0, the kernel shipped
> > with Ubuntu 26.04 LTS.
>
> I read about and it's a good and worthy project!
>
> The new libax25 / ax25-apps / -tools project is backwards compatible and =
should work on kernel-ax25-only systems as well as on user-space, and even =
if both is used at the same time.
>
> The timing (in respect of the security fiadiags) is a bit bad, because I =
have some things on my todo list before I like to advert it.
>
>
> vy 73,
>         - Thomas  dl9sau
>
