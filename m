Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774272;
	b=fCaIZ7pn2pbUCPaJW/kwA/oPlM4Y5hisFdgW6scjKBkqqQgKKZfkL5ihnHPDyTBndmjV
	 ntw2+icHUgf0MliOnI8t9Hx2iVKcRAnhh4mGxGUma3/bgJC3PtQ17LM/ogJGW7gfn77C8
	 T6zRlIONy8sMpmXX//9BVpWbiwr3P9JurItZ9c/MPJVmBtkWbOg8xZnsIWh5YiO7HHlxk
	 oQ0WTO4k/GFiSRFvlk2ObWt88YvDe2U5vHHpFN2jWpuE62u9KMgf/mAzWX5n5wDyIR6Ch
	 J6KYigCTO3YTod33ubg7J7j3mN4KG8xPNGfQKLLjI3P5tcgxTXyG5dDUzJqsn/4C7YQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=V88VlWfSYXQWPnmhUeO+I4q9xUc2ISSwUfbQQvrkk3Y=;
	b=pF7H1d4O9ZQZ8ktRY1g+bK6OqyfOLlHaynI49DNDMXXMVdlxfXhrDvpj8kBHwWZO0Z0x
	 JpWauldOcP4wh/w5w1JwDZgIP//ARO00XudPTp1jBNIrSWxgzpmljZo8Cq46vtLHav3Yf
	 WHlg5z3qyOMTJg9qIJNQHoUmMR3C/bi+3et34yDTyQ0J0KKNdUrMmmRtIlcCkFDBTYSV5
	 +pU5ejGgPFfiDVYU7I7SuiCGdlVmra6iLkGE0ybgtHsRtUPWRmeePoxXZNaAnTsPZ198q
	 2Vo6981GGbLoKplcAP45elQyCRWKlWoCDa0CHSP7DeOLmMt9nZNed1Y28S07cznaI+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFnJ2aF6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9C7606A31E
	for <linux-hams@vger.kernel.org>; Fri, 27 Nov 2026 10:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF9C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFnJ2aF6
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67921b515a7so8165575d50.2
        for <linux-hams@vger.kernel.org>; Fri, 27 Nov 2026 02:11:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795774271; cv=none;
        d=google.com; s=arc-20260327;
        b=asLvNvDQLI+tg/oHFlDCm//mZXJbxNdF7G0QbGVmDJYJC96EG7yp+hynrAb3ncuAfu
         /zk96/Hmhl9GLJ+fGashXkoooZtMpIdroX8BmlJYte0szVux7vKA6ZT5NHN1pF5wnPjM
         KRkuIsEJ4GMQbDXm3KNl6ko5koARg4F4QeTvvFkxgOhR1BLkPNs4rWstMJuPXR6QReZB
         +SAyeKxbdIQQsuPy4aX6OV+MCIOUr23fj/oowLfuTwaQ8xjDqGWFsJCWCSo65/MiqM/R
         zMjdAh3brdQUC34sd4/tMtKQ+kVa823eH22ggM4MvqscQWJQuHsLj9wiCvUSJXPryr9y
         wDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V88VlWfSYXQWPnmhUeO+I4q9xUc2ISSwUfbQQvrkk3Y=;
        fh=/tinSIrZUUIOe1Z4ElaFgZuu5KhaephRZAL140VlOyo=;
        b=HajhpHpVpvuIt7mAtCWOXCghJqYDYvuCXuhkjQ5cWpihtaLtyx1gqB+RdvMfiUnXgw
         Hn8tCJfAo8qPPpKdDbgBqESn84xf/tp7qrX24kwhmh/OKOwzpa5RZPGyeSIih9a3qsOT
         yG2oTxV9vOz0vED5uF7nmgL6yNxTrdW7kEg5OKVKVpzqT3F1jcCKUrxFBTv2YxYsVNGk
         oOfOg+9dB/s7Vd5WrEw2BuMSZskQXflQS6spxg6/joIx3OLwEfUcSD7r+tXjeXIG5e5K
         +csjXF/sMTxDxtK0pulmcEoMoFSXlSVt4AULk7NFGtQUZk8Ro9TYx4ip2H4PKOwJmfME
         bLgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774271; x=1796379071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V88VlWfSYXQWPnmhUeO+I4q9xUc2ISSwUfbQQvrkk3Y=;
        b=iFnJ2aF6eD6jkmcYgu9ZCuGIzDQKolltdAiOL3+XTXbqi4864E8JSoARp9SYfNx2Qt
         Nd/P04yir7VnXpuCeDxp5wVinXsxWNlQGFxUPXMI0aytaVDD2YYaXyHDJLNVmEuCOCo6
         vAEdxEwbKu/dhANLqJGUR4vr87NEn+d4ykAz7+KmU8HD0stmcru6lQbaQAh2bdWKNSeD
         Cd0y+4Yls2DDTA2vd/Dod7PBKYaM074uusBbLF90wi+6IZjl9LJrpUh1OD04rZS9BTfm
         +9zqexvH8pddLKdn6MTgLfgxbCei/2OhD2dNiu6oIsqfz3cfbSyCAsHmkfYjBgh+gAac
         fyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774271; x=1796379071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V88VlWfSYXQWPnmhUeO+I4q9xUc2ISSwUfbQQvrkk3Y=;
        b=wilNlURKe69Ve8ncz7nqxzfpW2b7lemuzw9Sgxwtp492ETB14SKv5CI9PnuEFyY2Wl
         n/jV7GtTyqMrswl19ej6nmI+mQY8iOKdxuA6XPuTlEE5oG75muKeSPasXOi0LobS0bcR
         fEUxjrb9Ey35V1ilfSckCQMc0Fa5dSsO74fqWTOuMQ/wqzSXzF7RBNV0lWE5JrQSVyQ8
         m3HNKfwQee3HipKEjeVmFnXcq/brhlnbVQapa11NJY0hNl+95HlKnPJsHom3lFjAVamI
         uXHfHasfPMmwM51adHgi2C68jjTa6iVPvbgn2WBHYKfezpdrqM6rfnraCjVLpV8lyfjo
         VTug==
X-Gm-Message-State: APuU4Z8QEHe5YW8+eMQ3V3z73eGm3vwepa5XXRxR28woM+FGFZ0QcfLY
	6IawVyIVZCa+NhAETf/XYpRrHgQS+gLWuqK3V60h5tbysZXDH5rH8Aa42m+OPdBDx7g35Qk+lNF
	76JkNpGggqyHQYe7qzCk+ak9EU7VkZA8Rcg==
X-Gm-Gg: AZFdTZesoFPwgvciI8L5AFVXjsCzKozCzdtVMhXF2Eb4lxVQBS776c5aUkNJpVSorKk
	D+1HCHCRGga8jVvcrZTcIrtIWlmYn6U3aVRrT9F1nbn0LAXuqkrOgSpAgb96lpYNsKSwAKVRJhd
	M6TZQnbnTENbHA7KxyxGRPq1cJF31nv99UH1ML23g6ORV6r2yLPqAtIp/TtS+0F9wctv4ymrwIh
	n7L5jsevTFJVKTipVQiZIZC6nxgqU1aCdfYnkywkXj0pW46mC52cZ+q/0SITK2EOFiVac+qcB2t
	EZFMgkR61odX9j2fs3P7My9kP/a5mgRh2dlO8Lb4sJoXwOf77wSOXIZgKIXcUhIX4QDiRKxNkwm
	bzVeZ8CHFA8p/+ZEHYL7BI9rxg7woEiIvEA3JVw==
X-Received: by 2002:a05:690e:1341:b0:67d:c045:d0ca with SMTP id
 956f58d0204a3-67df43cf81fmr9903755d50.25.1795774270638; Fri, 27 Nov 2026
 02:11:10 -0800 (PST)
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:linux-hams@vger.kernel.org>
List-Help: <mailto:linux-hams+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hams+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFAa3YCCQ7ksv2DD3fV9DGgBaHJKrFUGfTLA_ThipPOTDjM1wA@mail.gmail.com>
In-Reply-To: <CAFAa3YCCQ7ksv2DD3fV9DGgBaHJKrFUGfTLA_ThipPOTDjM1wA@mail.gmail.com>
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Fri, 27 Nov 2026 11:10:59 +0100
X-Gm-Features: Aa3M54rl2eM4KIy8Y4DNkQYV6CN-WDllFVffESr_GxUhrI32vni4KTSVaHAN-YI
Message-ID: <CAFAa3YBLyfegCa5iZr+kPd7ci_RA5bX06KT7jAQhJVc-G5uPkw@mail.gmail.com>
Subject: Re: mod-orphan: ten AX.25, NET/ROM, ROSE and mkiss fixes for testing
 (end of connection, busy receiver, KISS)
To: chirp-devel@trinnet.net
Cc: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello David,

Thank you for your kind words.

> Can you tell us what specific LTS kernel versions will receive all
> these kernel fixes?

The two LTS branches that still have AX.25, NET/ROM and ROSE in the
tree are 6.12.y and 6.18.y.
Every fix merged in mod-orphan so far has been sent to the stable
maintainers for both of them.
101 fixes are already in 6.12.119 and 6.18.65.
Nine more (ax25, netrom, rose and bpqether) are in 6.12.120-rc2 and
6.18.66-rc2, now under review.
The ten pull requests of this thread are not merged yet.
Once they are, they will go to stable with the next batch, usually a
few weeks later.
Kernels 7.1 and later no longer have the code, so there the modules
have to be built from mod-orphan.

I keep a table giving, for each fix, the first 6.12.y and 6.18.y
release that has it, and where the Raspberry Pi kernels (rpi-update
and apt) stand.
It is the page kernels-lts.html on my web site, f6bvp dot org.

Here is how the fixes are tested.

In the field: our ROSE/FPAC network of eight nodes, Raspberry Pi and
x86 PCs, with kernels from 6.1 to 7.0, linked over AXUDP, also to a
node in Australia.
Each batch runs for several nights on two of these nodes before I open
the pull requests.

In the lab: QEMU benches with KASAN and lockdep.
Since this week they form a single test suite of 59 scenarios, each
run on 6.12.119, 6.18.65 and 7.3.6 (mod-orphan built out of tree for
7.3.6).
For 53 of them, the suite checks that the scenario fails with the
module just before the fix and passes with the fix.
With the ten pull requests of this thread, all their scenarios pass on
the three kernels (54 out of 54), with no kernel report.
The current main branch fails all of them, as expected.

> Ultimately, do you have the intentions to see if the Linux kernel
> people would be willing to re-add the stacks back into the kernel

Yes, that is the goal, but it is not my decision.
When Jakub moved the code out of the tree in April, he wrote that it
could come back if it is cleaned up and reworked out of tree.
He also asked for tests and, for NET/ROM, to merge the two table locks
and simplify the code as much as possible.

So the plan is, in this order:

1. Finish the current batch (the ten pull requests) and the test
suite: one command to run it all, then GitHub Actions on mod-orphan.

2. The simplifications: NET/ROM with a single table lock and without
reference counts on nodes and neighbours, and ROSE with a single route
lock.
Both are written and pass the scenarios of the fixes already merged,
but they are not sent yet.

3. Then ask Jakub what "cleaned up and reworked" means for him in
practice, and whether a return to the tree is possible.

What comes next depends on his answers.
If the door is open, the code would go back to netdev in steps small
enough to review, together with the test suite.
If not, it stays in mod-orphan, and I would make building the modules
easier, for example with a DKMS package, so that users of 7.1 and
later do not have to build a whole kernel.
In both cases, fixes will keep going to 6.12.y and 6.18.y for as long
as these branches are maintained.

73 de Bernard, F6BVP


Le jeu. 26 nov. 2026 =C3=A0 11:23, Bernard Pidoux <bernard.f6bvp@gmail.com>=
 a =C3=A9crit :
>
> Hello all,
>
> I have opened ten new pull requests on the mod-orphan repository
> (linux-netdev/mod-orphan on GitHub), numbers 97 to 106.
> They fix the behaviour of AX.25, NET/ROM, ROSE and mkiss in everyday
> situations: the end of a connection, a busy receiver, and packets on a
> call that no longer exists.
>
> End of a connection (#104 AX.25, #105 NET/ROM, #106 ROSE)
> -----------------------------------------------------------
>
> This is the usual way a node program or a user session ends, and the
> last lines ("73", a prompt, the end of a file) are often lost today.
> close() threw away the data written just before it and not yet acknowledg=
ed.
> It now waits until that data is sent, with a time limit; SO_LINGER 0
> still gives an abortive close.
> recvmsg() returned -ENOTCONN as soon as the link went down, even with
> data still waiting to be read.
> The application now reads that data first.
> In QEMU, with 12 messages written and the socket closed at once, the
> peer received 0 of 12 on AX.25, 4 of 12 on NET/ROM and 7 of 12 on
> ROSE.
> With the patches it receives 12 of 12 in all three cases.
> Behaviour change: close() on a connected socket can now block while
> the data drains.
>
> Busy receiver (#102 AX.25, #99 NET/ROM, #103 ROSE, #97 NET/ROM)
> -----------------------------------------------------------------
>
> When an application reads slowly, only the heartbeat left the busy
> state, up to 5 seconds after the read, so the flow stopped and started
> in 5 second steps.
> The busy state is now left as soon as the application has read half of
> its buffer.
> ROSE could deliver the same data twice after resetting a call on a
> full buffer (15 messages read instead of 12 in the test).
> NET/ROM could grow its resequencing queue without limit while busy,
> and could leave one frame undelivered until the peer's T1.
> NET/ROM also kept the choke flag on frames sent again (#97), so the
> peer stopped sending for up to 180 seconds.
>
> ROSE packets on an unknown logical channel (#98)
> -------------------------------------------------
>
> A packet arriving on a channel with no call was dropped silently, so
> the neighbour kept a call we no longer had.
> The node now answers as X.25 does: it confirms a Clear Request and
> clears the channel for anything else.
>
> KISS (#100 mkiss, #101 AX.25)
> -----------------------------
>
> mkiss could store a wrong byte after an invalid escape sequence (FESC
> followed by a byte other than TFEND or TFESC).
> AX.25 now drops data frames from a KISS port other than 0, with one
> message in the log.
> Behaviour change: a setup that received ports 1, 4 or 5 of a
> multi-port TNC through one device stops receiving them.
>
> Testing
> -------
>
> Each change was reproduced and checked between two QEMU guests (6.12,
> KASAN, lockdep) linked by KISS, with no KASAN, lockdep or WARN report.
> The ten pull requests merge without conflict with each other and with
> mod-orphan main.
> They have been running together on two nodes of the French packet
> network, F6BVP-12 (x86_64) since 2026-11-23 and F6BVP-8 (arm64
> Raspberry Pi) since 2026-11-24, with real AX.25, NET/ROM and ROSE
> traffic and no kernel message.
>
> Each pull request is a branch of the same name in my fork,
> f6bvp/mod-orphan on GitHub, and the descriptions give the details and
> the test results.
> Reports, good or bad, are welcome on this list or on the pull requests.
> Please mention the kernel version, the architecture and which protocols y=
ou use.
>
> 73,
> Bernard Pidoux, F6BVP
