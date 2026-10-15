Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887F3A9619
	for <linux-hams@vger.kernel.org>; Thu, 15 Oct 2026 17:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085290; cv=pass; b=N0M1E6Y5KDAGfCZ3bR0R3N5K2npaaHkxaT+ScVU398bJEjBjJjyir0QXSBFkakwplleGrFX3rItXE+Rpb5eIi51Ezrt4BFi59Q2lC9f6Lx3K1LAghwLHdZdqY5/EUwjIWbH4T4BjVRxZCamAwWQxM1tliW5z7KPqCrC5Gf9d7CM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085290; c=relaxed/simple;
	bh=tG5n/4fzDIMmNVnGLdCedJF83kiCKie7Y54doRWAiNA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=rr3ih642FfO7gAh5qq5hEbkYos70wUTafwMscLjdnTaoSg/0hlIFeHvNaX1EK8uN19Gom4yOgtinXBY9DeNgKMlFQF5n1jHDxptBus4sFIlv5he6I33zZpmuqBK6gvlLupZX5fbrOkU4QaYdXRayZ33DBi5T8E37+7tr5KOsGZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCCfyjHe; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCCfyjHe"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6756a01fa01so5514604d50.0
        for <linux-hams@vger.kernel.org>; Thu, 15 Oct 2026 10:28:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792085280; cv=none;
        d=google.com; s=arc-20260327;
        b=X0jbFxClZy7cMMbTGMna05CnXEMqFQXCg1AC6EIwXr1YG18xWYQh7OQZrhtunoZ4iD
         CiIhR6yulXKofVdnW8wP2FDsQXx1Cq9UcrhOaG2cE1JTzWg5//LoAnHBcMZbZ2RdNE6f
         XhzkYSHboCieFGx/hqTqmlH+xADdOvqf/gYq1cvgrLgks97uRahFXVDOK7m56CXs96su
         VxMaUerEkh54jdvvscAojLR9P8J1Dz5EnxT+dgu2QAl3DRB37+Kg9GTI/koq6VHC/WCH
         Xa1SKqPW0PoD3Ga9FPzUkXNBoDqIR2ihFfO7AzwiL1MGzZL5VVt1zs5aufqsVUPHivEK
         rZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=tG5n/4fzDIMmNVnGLdCedJF83kiCKie7Y54doRWAiNA=;
        fh=yvyQ0fNR7evt9jL2wClrmYYCzRjxmggS8kmKCqDY7Yw=;
        b=jowlw7xzFTG6mf6b3LzQXkD6pt3dUJlqfLYfjghykzDtcrURXDDS6qxr2SF+5eNwVq
         tvrREG6RRQHNqqxdVcOiAU/ZgK/Nb2aP0FhAGDAcwqiwPn875hOJ5W2QF0uRSF7Y0/WF
         cm/Jagcc4yPnSdT4IO2IRV9aFczBsN0qCJqpmFl6D0kNbo2uE6tRiHTdD9qHTrx1z502
         Po9T3H8WwSt64YHPe+lFVG5xRJlKRtMLSoDmAtL/QPTNu7CZrk6QXb3PG3KYrDyAVqg4
         bWA1S87vRdtpHIIfOgXHF3dwagt/T57L0A1K6JiJT1XfKyAAbxwQ5IqBZYAiTOdio0jr
         JHxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792085280; x=1792690080; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tG5n/4fzDIMmNVnGLdCedJF83kiCKie7Y54doRWAiNA=;
        b=VCCfyjHeo5091HIjvkKcxkQanwXkLtpn2hqF5F3ZD2eRpikYy3IPAmOqJfj45tKRjn
         EbQhSDb3kismbPCZhRNKSZH61Yr3uEvWx36RIfXcXpuO0DozwCbsz2Nv0bJAd4VSJ/TL
         rU8zsVv7J913/BFbK9Id76MzvAiZMyP1l1lkrMxZ8xFPEejWcK8IkGyn8caaMyq3bsdQ
         oJj7kAb3ni0FtrU3fYuUUzj45kYwf4/otI408O5IOtXA4Vn8RboTJ17cCHET+qhUWZW0
         1EjG1k2VbFwYJp/ryO8y3J9V1/0gW6/o6qxlVuj+hDK4JuzH9jjrEzXOuAePIk66fmBz
         CNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085280; x=1792690080;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG5n/4fzDIMmNVnGLdCedJF83kiCKie7Y54doRWAiNA=;
        b=u8l8qiHNgfeH9TZw040WnlwQOjSvbQNQxqoFMPpVETEi4AdfUS+3Pc/2PHvLR2P4Zr
         SDhkAtkoXsGa7oApepxe8R/kLV+Mz25U6nul1DC/5UNL7UAcCx75/+Y/wVGkDJl0YnjT
         R7NXLp3C3y5bpmCUsoaz2Ah5acR5UXOBktnEJmRRDcPoTJGxT/xBi8NiQZcLrZI/yDKJ
         Bd/4BC+x/eLvcZw6mmNMbCLmcAvxl23yUCriuuBaBYiXs76NnKvTez89LPSFFgd4//oI
         3Jj3bAb0NpuEzv1rJpQxxgUT/03lJ41YWvnhh5SgkmhAPoIVamn7zk3MItEsm72r6PNr
         pT1Q==
X-Gm-Message-State: AFq9FYLdatd7EUAsyEVLdZM9s9hCE8NB4ZElvXxQKL3x6n98f6c4Rzzh
	8TbrVnrKkvHn3m9y/Zwaw5BX+peQABhjX2mesbmLTxD2OLCMKimeXxvTWzycPcy1MQK4MMXM6im
	dSnuj2gPFtj2mdINVSsYDmXg6WIIyzuF/NiZ6
X-Gm-Gg: AYBFou135OeCSzdKjABCxa0p7Wf92SwdU0hGSdKOXmOEWfsbTVmcnYycd7W5DlE0y0b
	VA2TGRTLM+ug5pCtDfrJxwiYGjGMD4WNr/tZtIGDYhVEu3aJt6OVVPne+P2Phnzw0DSSCvrnuIZ
	bE/Pp5QLOq0x1PHsviaJ9SZoNdXUQERuWOTRKgxUbIgfJXkouJFvDuxY53suMqDgUT8XC8lLmYm
	vsgHbd7fwD+SN6oU8MlMgdX7+JBJQV/DCZj+oz6rommcR/AjEsQeWEiLh//Z4D/Av6u5QY20cVa
	S7e6660842tGLTxdcQu74XC0lfv2uBlA5Xvs7Y5C9Zq45bxXZCJtJoc=
X-Received: by 2002:a05:690e:1914:b0:676:97e6:d7ac with SMTP id
 956f58d0204a3-679369b7774mr7664006d50.43.1792085279931; Thu, 15 Oct 2026
 10:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Thu, 15 Oct 2026 19:27:47 +0200
X-Gm-Features: AclHuK8LWgaQhTHGYIrsB6gOrafMctDR5hoQGlQTA04Pj0NpTjvSQv1FL-EUkcg
Message-ID: <CAFAa3YA-RPyiDpT7-A+f0W2T8OBY8Ltgc=nR=BYUc-chXWb-pg@mail.gmail.com>
Subject: [ax25-tools/ax25-apps] security and robustness fixes for the
 user-space AX.25 utilities
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Over the past weeks I have been reviewing the user-space AX.25 utilities
(libax25 / ax25-apps / ax25-tools, ve7fet tree) for robustness, and in the
process found a number of memory-safety bugs. Several of them are reachable
from a remote peer, or simply from any station on the air, without any
authentication, so I think they are worth flagging here beyond the pull
requests themselves.

Each defect below was reproduced with an AddressSanitizer test harness that
reuses the upstream parsing logic verbatim, in isolation, before being fixed;
none of the fixes changes behaviour on well-formed traffic.

Pull requests opened against ve7fet/linuxax25:

#28 ax25ipd - unbounded address-field walk, detached DNS thread leak,
SIGHUP handling, signal-safe main loop
#30 ax25d - single-instance lock, signal-safe reload, safer argument
and virtual-circuit handling
#31 ax25apps - ax25mond, ax25rtd, call/yapp
#32 ax25tools - axspawn, mheardd, axgetput

The security-relevant items, by how exposed they are:

* mheardd (unauthenticated, any station on the air)
mheardd listens to all AX.25 traffic via PF_PACKET and copies the
digipeater addresses of each frame into a fixed digis[AX25_MAX_DIGIS]
array. The copy loop had no bound - it ran as long as the HDLC
address-extension bit was clear - so a frame whose address field never
sets that bit overruns the array and reads past the receive buffer.
ASan: global-buffer-overflow. (The same unbounded-digipeater pattern
exists in the listen/monitor decoders in ax25dump.c, which I am fixing
separately.)

* axspawn (runs as root, reachable by a connecting user)
axspawn is started as root by ax25d and, after a "//COMP ON" handshake,
decompresses the frames a peer sends. The decoder read the claimed length
from the first byte as a signed char; where char is unsigned (ARM, i.e.
the Raspberry Pi nodes a lot of us run) a first byte of 0xFF selected a
"no compression" path that memcpy()s the peer-controlled frame length into
a 260-byte stack buffer. ASan (built -funsigned-char to model ARM) shows a
~2 KiB stack overflow. As a side effect the same path was simply dead on
signed-char platforms, so "no compression" never worked there.

* call / yapp (reachable by the connected peer)
The AutoBin / 7plus / YAPP receivers are driven by peer-supplied data and
had several unbounded parses: a YAPP SOH header with four or more fields
overran a 3-element pointer array; Send_HD() overran a 257-byte buffer with
a long filename; the 7plus header parser read past its buffer; and an
unterminated command line longer than the compare buffer overran a static
buffer. All confirmed with ASan.

* ax25mond (reachable over the network if a TCP socket is configured)
The accept() loop wrote into the connection tables without checking the
MAX_CONNECTS bound; the 51st simultaneous client overran them
(global-buffer-overflow).

* axgetput, ax25rtd, netromd - smaller length/strcpy/sprintf hardening along
the same lines (details in the PRs).

I would appreciate review, and of course correction if I got any of the
protocol details wrong. I have been running the ax25ipd fix in service on a
32-bit Pi node without regression; the rest is not yet deployed.

73,
Bernard, F6BVP
