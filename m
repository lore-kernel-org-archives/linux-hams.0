Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603347;
	b=WhhGAXJakRFwtXQlSj4emW0oE1LXFdoXmQetlxt+1F0hAFqYyW4ge1oaU1L2c6lsVLUf
	 qqxykDGl1iei8eXtaUJ2zyeasza9YHrkxN0rZZn/e22UDfUiV4Aak1LsIbWyZDOq9GFfZ
	 guFe9yzxReoeGS8z6l748FvhClcmOKed7858br6+Se+ggMI0fNoruUOxBgorR1VfeSH+i
	 2nQe6QkprLIooiFc3CDcrYCtmTRj9WrUwai544RMyBTGSbysRZUqt+uY7wpjSEXu93d43
	 +EFLoHiLPonA+RRJbY7cAHVxeyTCygee4MRbGMF7qAFKMZno6ACWdeXumeYExT9nzCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2itv7AcVBputKhN6p3kMxHNEdUzZvUrvuaoBxgjz4ao=;
	b=yBHgIFtY5KfFxq/3wMhA8MuOjdePi1cMSf/hTegutmwlT0RHAYO65cL5/XJMbFXq30ct
	 rMEInaKmIppkAHOSpTsV86Y+p2lbu2uLKMvbbuuTSKnvLClS1MD41qure/N2PR3rkVILF
	 HGviJ+QqWvFmoA8n8tShTh0DjDHdHk2gTgAAz+3iIoIfv++Pg1RojvGh3meUOwijOm2Sh
	 ZGpkBvT6J3ScB7vBiu2ctppagJHvR0k8FfhFG+HIbkE0ZiiPhrwF1hnG0FkNI0QoHuKNH
	 QNOqbW8xEhnMbaXQ0MIjk914JNSLg6ekaFodVV/3SuEX1Ut1ekrKLU/SbZSVxj23raQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GTOC9omH;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E690606A326
	for <linux-hams@vger.kernel.org>; Wed, 25 Nov 2026 10:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E690606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GTOC9omH
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso58140385e9.0
        for <linux-hams@vger.kernel.org>; Wed, 25 Nov 2026 02:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795603344; x=1796208144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2itv7AcVBputKhN6p3kMxHNEdUzZvUrvuaoBxgjz4ao=;
        b=GTOC9omHlN755K9A45vsxlj2kZzH2TydJr26tT2j1VdKH9AuU2YpjdDZrdVu+PvyNw
         FjD3/41LirizaeyE51QeopzgMvhb00wccT5F+DmamieIWvGOpYd8mhXlkklBrAqpUEPB
         eX1cFlBg0IZ6I06TcveXFCS1CsxjnhOYxeTOJv/4P/fYS21byIWQa0uWI0wcCYEoJiY7
         I3xO4QUwcocd5fZN31rbnVLiZejYU+mGtwBRIKZNz3IGyN1ZLOE+eEorxL5pA/9p7YkJ
         6/w4cqjt8ZnhZ/zTdb6HCv5SxBGWFIMsWYgQeArmIA2xsnkr7bLOSmuHz9mG4+ftnZsX
         Qaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603345; x=1796208145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2itv7AcVBputKhN6p3kMxHNEdUzZvUrvuaoBxgjz4ao=;
        b=sZckqqXWLfOMuci9IW5DvYKtziKqI6uicNBmUcaaKgaqN6eEv7nATKrbQQ22qmw643
         4F7REs27QC6rIhs/lZN9Y6NoOmQiqec3PhFE/UoDiuLHaH7YYdHNwgI8X/LmUWCLC6bf
         9ZzMUkF2zMtkcSq97wKxfykftdnVFmRPYvq1nHeeSNo/L25omlkOpyqPYN2Z0+m3SgJB
         P4YGQ0P5kyz5Moss/trWXj2qW2WG8UC1pPm/B/q9cFi1J39X9xDmPNdzH8iGaijbZ6BN
         75ObfJtrRrpmVTDoTdOrFO8HpYyuUpc8v66GD6++ecoqjjaBRk649DWs5eKnbsnyKswo
         hDkg==
X-Forwarded-Encrypted: i=1; AL+hErExNwFKhzmp+lGT0we/fr46sPQcVehZeJCnGL7BJ5ysanoTeSsy61vMAynE56iiUXDjNzTitethFAWP@vger.kernel.org
X-Gm-Message-State: APuU4Z94cDqZ3isb/148UzZJpn3wSouTuAiq6PQYT50I9c0v4osFs2yy
	vxvHWbHWFXw4++c31m2SMn0rLl2FYykJZrV9N//T9z2yOlRL3LSeEfcR
X-Gm-Gg: AZFdTZcX5aklfvaENvOs6Kgwqo8kVTmgBfbpuTFQ6MDZQwpScQUPaXZ8dprSw+VtXSz
	e7XfhWGxs0RGQOtmmWmzOA6Zh3lgHic4vtuIYCC4tXi4LGDipPS22wSoVjebjONOqg1v7ROIGdv
	n9y2vxmpD3+ZgfWWfSSLKrNU0M1p5UkIVtdc8So1qHwn5kr3SvWqU6fkSrZ+Gug1BmvNMpAtm/j
	3DYGydVQVuwcqq68ES9fEuVm4MgPziyeSvZWiTgxBd2beBn3hSNjxcFSgrmC06OGCZc9BVsYx8p
	A+buvq0gWpnNyyPj67bCueyjSNmjo0f20DXPDi8f/tKr37ofhxZSI6Cq2TahY+L0ZyDxo7L79zK
	LO9V5r9Ja33b86xfMuasZU8OH+CQcArRb759eLV8LjDbV5iG3+bdHU0QV5GXIEAu//Ipw5I/uy0
	oPWIq0KPHeueKed1Go3nhtAFysl/2mT9gexbrvwAaP4EOTcg5Ng3HRvFbUIemGnI7fHwZBYUL2G
	rppAYG3QtVYviXWlo3UXMnVuqcbyBvQpXOAxY+4lS008lDMawoHF7jUJ5/VOY3hGAgzKYRog4RO
	DEulhyg06kkiSGw0bxG+t01OplXHEmzdiY70T80VoGvRCIeGoMy+kKaQW7fkvrY6Qol9qkkVaG/
	axuk3xQ==
X-Received: by 2002:a7b:cbc8:0:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb860f6ae9mr298157935e9.2.1795603344300;
        Wed, 25 Nov 2026 02:42:24 -0800 (PST)
Received: from ubuntu-f6bvp (lfbn-idf1-1-304-238.w86-195.abo.wanadoo.fr. [86.195.26.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm33160630f8f.38.2026.11.25.02.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:42:23 -0800 (PST)
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
To: ertanuj96@gmail.com
Cc: Greg KH <gregkh@linuxfoundation.org>,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ralf@linux-mips.org,
	netdev@vger.kernel.org,
	linux-hams@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: rose: fix OOB read in CCITT facility parsing
Date: Wed, 25 Nov 2026 11:41:57 +0100
Message-ID: <20261125104157.265662-1-bernard.f6bvp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026112418-freebee-tasting-68ba@gregkh>
References: <20261123183818.24508-1-ertanuj96@gmail.com> <2026112418-freebee-tasting-68ba@gregkh>
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:linux-hams@vger.kernel.org>
List-Help: <mailto:linux-hams+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hams+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tanuj,

Thank you for the fix. I take care of the ROSE code in the out-of-tree
repository Greg mentioned, and I run these modules on a small ROSE/FPAC
network, so here is a review.

The bug is real. rose_parse_ccitt() never checks that the 0xC0 entry
fits in what is left of the facilities field, while
rose_parse_national() does. I reproduced it in user space by building
rose_parse_facilities(), rose_parse_national() and rose_parse_ccitt()
unchanged with AddressSanitizer: a 4-byte facilities field
"00 0F C9 0A" (CCITT, DEST_NSAP, l = 10, the 10 bytes missing) at the
end of the buffer gives a heap-buffer-overflow read in
rose_parse_ccitt() (the memcpy() from p + 7). With your patch the entry
is rejected and AddressSanitizer stays quiet.

Two points in the commit message are not right, though:

- It is not only 6.12 and older. 6.18.y has the same code (checked in
  v6.18.65), and so does the out-of-tree repository.

- The data read past the buffer does not reach user space. When
  rose_parse_ccitt() returns more than it was given,
  rose_parse_facilities() catches it with
  WARN_ON(len >= facilities_len) and returns 0. Both callers,
  rose_rx_call_request() and rose_route_frame(), then clear the call,
  and the facilities struct, a local variable, is dropped. getsockname()
  and getpeername() never see it. The user-space test above goes the
  same way: the WARN_ON fires and the parse fails.

So the effect is an out-of-bounds read of up to about 20 bytes past the
facilities field, and a WARN that any ROSE neighbour can trigger from
the air or over AXUDP with a crafted CALL REQUEST, which means a reboot
on a system with panic_on_warn set. That is still worth fixing, and
your two lines are the right fix.

As Greg said, please open a pull request at

  https://github.com/linux-netdev/mod-orphan

with the commit message updated as above (and the answer to the netdev
bot's question about how the bug was found). Once it is merged there,
it will go to the stable maintainers for 6.12.y and 6.18.y with the
next batch of fixes from that repository. If you would rather not deal
with GitHub, tell me and I will carry it there with you as the author.

Reviewed-by: Bernard Pidoux <bernard.f6bvp@gmail.com>

73 de Bernard, F6BVP
