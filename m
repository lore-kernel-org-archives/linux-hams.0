Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793444836;
	b=fPfHAh7TsOxu3Bufx/F6sQKio8V3v04SQTTqKwdLYIl3lFBwjwBH4Y5iSpQkTMXdPqsc
	 U3cB0sp5bpYzWwo8mX/tBtF6KUw1F8QGPtok6AYZOX4yNQxN/Dpi5QhvA2tI7HEb/8yKX
	 Mo8nM/Yf4wEB0a3vs82FXcRH2QLc//QchGxiGD13kPVU0wYison7tp2ssI5n4CMvup98u
	 z9Wg3HNhQAqjdnIGoGjFcoS64rmyrYObZEJ8RaXgn1p0G7bQerESmHz/BruP8WD7CXth6
	 kP08xn+xQRZOWKLVCWdpyfZMG6BhVjfq7ksxsMULU2yaNbD9XOLcXiY4WlHgqAKqcBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793444836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=eKG3J4cYPROuxSWRzc4xtE+tKlgb5DFhK7OK955DScA=;
	b=DXTNIoROagdZlu1mXgHNNqCo4nouSUoJkgMexA77iwscEjg/sGrrDAoefMIOiVvmTLHl
	 R97XvZiZb6DlGb7VZxZyxVpG/6Oi4Vgm9+xWdz53YCC/YCFYgUVJHyEtFz4Vic7qYL/sU
	 ineuKKBzD8za27X2BqfoD0nHddfLg+ctF59uvDqjp2HV/kDoPWRB3VGY2vkStwhpArLIS
	 genY9t+8bDiNxneUeUdj5f+7sTlM0wMGNYgj2E5FQBVtP2vy2oR5j7AMnt3m2aMxj2DaU
	 rBoACsl3+uxYl1BjI5AUFvjxyJ2PlGzsm3ZEW8Tm3EGjk/4iP94godMqrxJn2wWXclw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQi0c9sQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBD4606A31A
	for <linux-hams@vger.kernel.org>; Sat, 31 Oct 2026 11:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCBD4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQi0c9sQ
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8acda240937so12278117b3.3
        for <linux-hams@vger.kernel.org>; Sat, 31 Oct 2026 04:07:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793444835; cv=none;
        d=google.com; s=arc-20260327;
        b=hrc69KOR067sbmWsg/4uOzktMf3Rvx642nr4iRbzyTICh3CFRXE9um7a1gv0HtVmOC
         WFQYi4ctDxrZlwFkDfxqhVklaS6IG5AXgaI855sR1gBbUg0WshC+KP9Xg3hiVg9BvOm9
         3qnWhGSye5xnadUuoEVlNtp9uj1/6nMvM3IYbHItzIa0IDJcHzIERW3yJtBGBog0HJQY
         m37hTDDi7u9HArSSJdmKGfjH6aItcsjSOP64Cf8VBEm7lpRm91DtcSZvVN1z5vNlF3zE
         IsbRwYzPqLA7mTi2vS6ZmsP/mYGWtX2mY15iW3XEV3A2qKS3txgdYK4TvCao/upzcu/D
         ML0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=eKG3J4cYPROuxSWRzc4xtE+tKlgb5DFhK7OK955DScA=;
        fh=yvyQ0fNR7evt9jL2wClrmYYCzRjxmggS8kmKCqDY7Yw=;
        b=iCvvq+nIw/Bp6+oK8zz4I10Glpzj/lgYzjCtednFg/2/fufFOp/AXX/3Db2QhLST/E
         cLOBRXDNA4T+Isiy5ame1cAEq2Vh0Wms/dhFu1UWAJsgw7EV1tPDGJNRfiFILAoV+Csv
         fEscW30g8fz4D9yHMH8b+r6JpqaXOu7iUowZ0yGSHO3M7wImVd2Nkz1RtkZz1uqnCwGQ
         sfYxYmBfiODbAIKCx6oEQgaEaf0JlWYPjDLgZ2TGm687rekgnxa6jC5jz0rMtKYzJw2J
         NvwgdpCT92HF/xcFZDRyHGMT3flX28OvCWDBHxQkIaDdfWtTw/8FHCckzJv+Z9sjaHAH
         FeoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793444835; x=1794049635; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eKG3J4cYPROuxSWRzc4xtE+tKlgb5DFhK7OK955DScA=;
        b=OQi0c9sQ5mfxwq+v5z1neFJUjQn+kLppfpntIb2yexcfI4absi1b6dnEz4moJ7FgRY
         WLd6N2KsjJmDBxuZcyip75biWLHKn52JHFwpKUgAIUvylrRoTe82mLeS6QPgt+ZFcffo
         MZT8VUTDXXSCn9nu0FRI+oVWqzR+f8OCDn2pG6i1KnLvsh5MQZNFxdRsIO02wD4YnchJ
         chh/o/H48ajROvSJSIiFaYhX5aJTS3fNMTBvMbS/L7bJ1ApezzBsN/Ic2ml/gF706fta
         uamTBoqCiYmobx0DzMyWRiugjYp5YlfcJTPGh4yxujlGF8FAKvf/0MIBdRNcBpfELobb
         w1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793444835; x=1794049635;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eKG3J4cYPROuxSWRzc4xtE+tKlgb5DFhK7OK955DScA=;
        b=mn7OIiYL6MrQDivDqFgr1BmI1tfbqPzfF6J/uoVqkti39VNTqomhYCdbdCj1RUu8I3
         nSS0UA/2/RFkEZ34JSDVwvEWSxWOq3JubWtEHsqTMPQz1BeyJJIbr1MQXjgWJwH8T9VP
         6CXcA/7U3eTfY+glJb3+6v5OKUdVSIq24ZzoY765n864DgCJIhSipu+RKASmUSSLn+aH
         tVe96DSRGfpEIjn7EOYkXQocvg5pL0g19eWK43jYB3Y0Iua3QhPq6p75G0jjbtQJo/JD
         LBXEB+IWiB8u/M8MOThddsPhxV2mwWIcUxX65BdQqd2IZZtzQWDVF5ajZW2uHwoMkXl4
         NBPA==
X-Gm-Message-State: AFq9FYKIrkM/WrPC4nhiQtfSnUuHA2qNMa6o81qIdxDLJvxRy8EAloFh
	PgSawvJeb3elEXh6R4nYIMVvW9LILkmAvmx3HBH/HCJq0sqNEzWTn9+WepYa+D9VmLpgDvC4oa+
	sF5u7R8nsVikN5nkk4aVquwCij5sd9ILXOO8O
X-Gm-Gg: AYBFou31cxu/qz2OUMuYUJWluMw4Hh8Wvj++3VisA7G+pByjU/AB3cEsTG0sgze+irL
	u/BPHjtYMjmRGEJqtdrUymE8zz+C/EeBwbNhR8DX3kxhLPYxhiviOzvqtUvZok4Q9rRhmVQdE1A
	FRexQ9rWzFZ2xsP3VEzg5YPacXeG6QXYSq81Led2gkCutiL7Q6koK0l5sIGBG3i8tweqwvHm1bL
	Qk8q+7r9Glo76h3NdWDHIv9izm4oOcxStPHZ39S3BK9uXvn7Bg618Za1UBmsXdqeOyWLCpWVtjj
	HDMxb8pmg4hD/RNAGu2QM9wio7e6IAdkV1TD2zC/XcvxQHEiIavZq+fx96UftfDRKRvH46Y5r0p
	AQESafMaxHqC6z6MiNPH87u3yz3Fx7U7e3oRj
X-Received: by 2002:a05:690e:1915:b0:679:c8c1:3e96 with SMTP id
 956f58d0204a3-67ba4c90a7dmr2574776d50.17.1793444834620; Sat, 31 Oct 2026
 04:07:14 -0700 (PDT)
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
Date: Sat, 31 Oct 2026 12:07:03 +0100
X-Gm-Features: AclHuK-yWViQogk8yBlefJPRqsw-BFRHOJCA-mn_fbc7d1WYpBxj9VeaOVMJlzE
Message-ID: <CAFAa3YB_FCtSZThMs5vYpDJWVXEvsiWEQZMwSqhAp7TX5cdzDA@mail.gmail.com>
Subject: mod-orphan: mkiss, NET/ROM and AX.25 fixes merged after field testing
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Three pull requests were merged today in the linux-netdev/mod-orphan
repository on GitHub.
Each one ran on live nodes before the merge.

1. mkiss (pull request #40, two commits)

- The transmit buffer is now sized for worst-case KISS escaping, and
the MTU has an upper bound.
Before, a maximum length frame made of END or ESC bytes could write
past the end of the buffer with an MTU above 502.
- A negative return from the tty write() is no longer used as a byte count.

In service since 21-25 October on six nodes (kernel 7.0 on x86_64,
6.18 on Raspberry Pi in 32 and 64 bit), one mkiss port each to
ax25ipd.
About 272,000 frames sent and 625,000 received, with no error and no
kernel message.
A station in Hobart also ran it from 24 October on a real VHF port, a
TNC-Pi on a serial line, with no error.

2. NET/ROM (pull request #41)

- nr_rx_frame() no longer drops a connect acknowledgement that carries
the CHOKE flag.

3. AX.25 (pull request #42)

- ax25_frames_acked() no longer queues a NULL skb.

These two have run together since 25 October on seven live AX.25,
NET/ROM and ROSE nodes, six nights without a kernel warning.
Sasha Levin had already queued the matching stable fixes for 6.18.y and 6.12.y.

How to get them

If you build the modules from mod-orphan, pull the main branch, then
rebuild and reinstall as usual:

git pull
make
sudo make install
sudo depmod -a

Build on the machine that will load the modules.

Still open and still looking for testers: bpqether (#38) and hdlcdrv (#39).
I will follow up on them in the "testers wanted" thread of 23 October.

73,
Bernard F6BVP
