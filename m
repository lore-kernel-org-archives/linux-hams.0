Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794307383;
	b=FzUKxjdiVJ6mJ+SsM8jT991JOVhJKlavbSl6wkQe/unG3Cf+kFKTItk/qjbcpL4EpRA+
	 OQ3omvy1uKozqH+c9S/GvENOVyfOrvfGGF6NH8hfMM8G0zPQ19AIybocvdYxA7TYP4uB9
	 OrU5QIUDLzqVuEOXxyZXKkkfdDGITFRT+Ck6mAo4anZgnhyc6boxw+CoUvB4/fc3Y70Xn
	 ZYwtWXas0DUOa4hzgSugR4MllaLX/P50nUIDStfFR5HTBPj3JMcVT1WBeR2jva2Ifwsx4
	 gYPkyqeQwc/LMZraArVnlRcEt5CTm7pC67Ycq5Zu5iTV4CwBVQjdzI3KD9lSc/+5Zzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=mctheXTrk9Go817YtcVONK4F2RL7Q5C5FbWcBtDNEOs=;
	b=s73nw1jE9JpcC8lAQ8c/6AeC9eZ2k2EhCrYZJGcqJbBNN5F5oIpsIAQ82pM9TXcPCbao
	 E2B3FCKDwLAeaQo1KYVJnfFKYunLJMjpQ7TlmNxTSoJL0IV4MjBoGxKblkkAoKIxV3r0N
	 Z0xq4geOToafENAzDorEcbsK7qklLH+xHGrNwQSfQZpxY5u6kCaVtqM93FE58spP2NfvT
	 IIN0tURRXG80+Oyb8vA7KjRqXjqIGS8xEcEr97EIZSaHzHoQ/HbtdogU0rqWuTB8wp22C
	 BwjTAhIm/qe3Sy8cVSUIbUoNNuyHhNmib22HjgyI0hgW33tcTMs861v6qvMrERG0U2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rKi9Y5m+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B755606A321
	for <linux-hams@vger.kernel.org>; Tue, 10 Nov 2026 10:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B755606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rKi9Y5m+
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b394e2af9cso3828567b3.1
        for <linux-hams@vger.kernel.org>; Tue, 10 Nov 2026 02:43:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794307382; cv=none;
        d=google.com; s=arc-20260327;
        b=ak+CE5X6ldNQzCs3jfuvLN/zdQRNM4dTGBP+sNk0wOGKzhqjvfBSLDA1vaQLbSCk+Q
         kHVpu+uetHffz5+05lJm2L9z6k6yqkcN1fgYi38R7uCU0zzLenof+Re0fbrtYlk2hq5a
         vREpk0KhSNvehDFCzM/aSv3KXzSBI7EdIrPpN3vdu834ypyGtnE32Q0a++IpijhzPc8Y
         CGS0EN4JRN5PG3IXTfzITTm/e+LdRqmUYQgUiamBDF4izQG7oipdGbagcALAYZWA8CpT
         55sHysJjK+AltEnTQyTUVXIOWFFXrbjPmYTUFNTALc5flpYkkSs7UEnXaFVDlqfP1aK1
         m+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mctheXTrk9Go817YtcVONK4F2RL7Q5C5FbWcBtDNEOs=;
        fh=yvyQ0fNR7evt9jL2wClrmYYCzRjxmggS8kmKCqDY7Yw=;
        b=jTriI7KEnfSPmHAc8/xfVWgYI3qFS+Kt2TxOQgsmosa9YHOCn9AyLm7w5mgdkQ1SKx
         Tr/4EZ3ATibaU7hWJQIAQA/SvXmQhG+96TXiqUXuw00N+MVssPIgOXMiu16wJMeYhtIB
         NbdSUakAXJ94elvG1UF60DWGAKR916CIqeaPUd9mWrw5riytdWIb6VaiKi6XgVJJ7R/Z
         ixsTLftCviRIOgDXdCwmSpOLfGIs3KxuDIRSzXw8GduheAop4+zWDWVLv7Sk8m1RdocP
         uKgNlTElfYATCLOsxOnUn1fvCBMwsX5u1Q+ZiuCsPzd5vaPAHxP91i+NffRmXQtWLnUm
         VaDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794307382; x=1794912182; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mctheXTrk9Go817YtcVONK4F2RL7Q5C5FbWcBtDNEOs=;
        b=rKi9Y5m+EJVqmdmizw/ZPvo+zhyjgmL1bk+1t4hdwNVpZoqEviEtz+YWONNgvvJHO5
         /veJ4lYiJkxBlJAMwPg+gHfiKa2ylSz7gv/N6v9yso0HiqTo9i5oL2V8Yn9whtapfb7J
         G1S4W4YLOl0FKr6rAuqJcy5BMyzUcsemyPWg2x82l/xcKP3y6YbF97Hmxd53jVbk6Iof
         spnw1VTeBqplj5c837xRsusot72S86/DK+csDa3+Y+k4Zsk7aMO0xn4W9DSjXpH1+uzK
         DkQTqJEAb2Eugp5B+5KJWpaoxLRVbJFzfX5zD1mCoB96j4VGfIAKJ3ZNwCxinK2YXpd0
         +tHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307382; x=1794912182;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mctheXTrk9Go817YtcVONK4F2RL7Q5C5FbWcBtDNEOs=;
        b=EjAhMGEGbR3LUwy1U6sL0vPY08XmXNQ0OzJ+wG7C/qR4Q2ndN+iURxznUHtDhQbiG4
         3urzTEwMNNknJYlQwFAoawZg/PKTc8uyUSUpZY0yqZY0KBOF/TReQ7rBPzkDpjv+0e3E
         ZRbs4sdX2mE/8DMWwIpign8F/E5fmU4rUvrFKwJ20t8KncezB82hfWNc4301IDyxEtyG
         jtRbhT4jMcrKhOzpyWamD2BmIUP3I1H2fLA78PI5ZLtcFLYW0YU8Qo9B57C5bruh5hyF
         0+4oUxReG+/lQSeSpjCuYbFK6m+v0VoAxYALiNFefBei3+5lcWzwF7XA9IWQTpEw0fZJ
         PpwA==
X-Gm-Message-State: APuU4Z8e29bJyG0cUUzNK5ddXJLf/j/6I0XPaNoQC61qTmQ9Ye7R2INY
	asR2/JHtQVoe1ff6TNus+hgrH8OGEEQ5cTxAmrHBxV2RvoQAUe18sGDf/aOjTp5MHOHwQt7mE9Q
	gHsXnil+F0T5oMX7MZnm7JfC9X5AsBLzKIA==
X-Gm-Gg: AYBFou378SUh2Dd9z7HtFI63Q3Oxgq5d73K00v1pWNzsogqQFEZ4M7tZFNGmV43sINs
	OleXGmo+uuDUUXYnsNyHCyZ4518oaisPJeK+Z8I0Fu0EHc9Z64kxifgvciAUfpXUcqkPYRDnj1n
	FNPDUA9MGELviRVv2leCRXJfjBiGhkyJPnc+iTf/Bs5GAK7n/lZZ32Si7zBEZvm6Q6VuwBZ9DvM
	oMxQ9DKHjVpCDvSZw0H+qMo2yKudPqOz2QnIxVDWtFzUyJoJZMqcpd7BzfnvXPbeDBgonldsvKb
	+IRnw8fk2JLr/U03K4tkNkEn5XZP2hJmGa4V2sep01qK7KDxDN5qtjoeI8IZ5b3hyX5pUDkPSf9
	JYOg0fzBvbBzdoWCJaKmQcxq06Dp7cC5mIB9o
X-Received: by 2002:a05:690c:e3cc:b0:8b1:e7c:cdcf with SMTP id
 00721157ae682-8b392820aa9mr13469927b3.1.1794307381938; Tue, 10 Nov 2026
 02:43:01 -0800 (PST)
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:linux-hams@vger.kernel.org>
List-Help: <mailto:linux-hams+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hams+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Tue, 10 Nov 2026 11:42:50 +0100
X-Gm-Features: AclHuK-Mrc0rNsy8K8JcMIw19NWz5sm3NWhukEBpjZ0JwfgFxfjqAZSVxmBOY5U
Message-ID: <CAFAa3YB-dpHi_357hOt_=Rc5hb_Wn9B0-NRgiLUroqiD=9QGKQ@mail.gmail.com>
Subject: [mod-orphan] nine more ROSE fixes up for review (PR 78-86)
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello all,

Following the ROSE audit of 5 November, the six serious defects were
fixed in pull requests 72 to 77, merged on 9 November, and are now
part of the 41 fixes that Sasha Levin queued for 6.12.y and 6.18.y.

Nine smaller ROSE defects found by the same audit are now up for
review on GitHub, in linux-netdev/mod-orphan, pull requests 78 to 86:

78 walk the neighbour list under its lock when a device goes down
79 hold RTNL while a route is added or deleted
80 change the loopback nodes under the neighbour list lock too
81 check the length of Restart Request and Diagnostic frames
(a short frame from a peer made the kernel read past its end)
82 keep a socket unbound when connect() fails to autobind it
(a second connect() placed a call with an empty callsign)
83 refuse an empty message when the Q bit is included
(an empty frame went out with a Q bit from uninitialised memory)
84 give loopback answers LCIs that calls cannot be given
(with more than 50 virtual circuits, calls to the node's own
address were never answered)
85 clear the other half of a through route a new call takes over
(the far end kept a dead circuit up)
86 disconnect sockets under their lock when a neighbour goes away

Each one applies on its own on the current main branch. They were
run together on a QEMU bench with KASAN and lockdep: no kernel
report, and the same number of calls and messages through as
before.

The same code has been running since 6 and 7 November on two of my
nodes (F6BVP-8 on a Raspberry Pi 6.18, and a PC on 7.0), with clean
nights so far, and since today on three more nodes of our network
(two Raspberry Pi on 6.18, one PC on 7.0).

Reports from anyone running ROSE, in particular with FPAC or with a
large maximum_virtual_circuits, are welcome, either on the pull
requests or here.

73 de Bernard, F6BVP
