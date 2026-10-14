Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B0348662E
	for <linux-hams@vger.kernel.org>; Wed, 14 Oct 2026 20:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.109.42.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008782; cv=none; b=DUAs6+uD3MstLFksxVRQ3ooQDq235hkRl4fAfGebZNqOTWopgCk8bly80vdtaDqpwqSklxMOwOOl7cnaXXmt4dDb+IWFVqIWwnJg8PxKJIuFbuH2XARxXxWAWajlFYrO9HqWMWWKbujvKT5CZlvFwBy/jMW86Wh/XZbG5rcnCTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008782; c=relaxed/simple;
	bh=zTbuSO/Idz609956wneIP6EBrC2OCd0tucJpOmZK+T4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=pYtxJXyT9hvaF0FYdOS7IoSqFov4CpCWukF7lhZ/CTNrUOa6bYPDCqyE1ORJXqanXnqmvSwiL3Zk9NdmBhzXk26NQs1xT+0cK26SP/xCT4oX7EyTJHBU7lrk09jlt3BAR+y4DdtAf2bncTUP4Libf5qXRiaJFhdxwhDeuQmz51Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osterried.de; spf=pass smtp.mailfrom=osterried.de; arc=none smtp.client-ip=192.109.42.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osterried.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=osterried.de
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de ([IPv6:2a0a:4580:1018:0:5054:ff:feb2:aa6a])
        by einhorn.in-berlin.de  with ESMTPS id 69EKCi0k3967076
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 22:12:44 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
	by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
	(envelope-from <thomas@osterried.de>)
	id 1xH5L9-00086x-7b; Wed, 14 Oct 2026 22:12:43 +0200
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH] ax25-tools user_call: data dropped on a slow link,
 connect timeout that never fires
From: Thomas Osterried <thomas@osterried.de>
In-Reply-To: <CAFAa3YDzx6XGDH0wL+=YYq7uGaccJkdT0a7UUYOiFrdu5WFL9Q@mail.gmail.com>
Date: Wed, 14 Oct 2026 22:12:32 +0200
Cc: linux-hams@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <28347904-28FF-45C2-B7C5-0FF9CFF4CA31@osterried.de>
References: <CAFAa3YCbFFNNWLwDEd6u7dGE=5xfb72CSLwJgJVAtP_+=8beDg@mail.gmail.com>
 <19B86BF2-D959-4D1A-81ED-8DADD729042B@osterried.de>
 <CAFAa3YDzx6XGDH0wL+=YYq7uGaccJkdT0a7UUYOiFrdu5WFL9Q@mail.gmail.com>
To: Bernard Pidoux <bernard.f6bvp@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hello Bernard.


> Am 14.10.2026 um 14:51 schrieb Bernard Pidoux =
<bernard.f6bvp@gmail.com>:
>=20
[..]
> 1. Partial writes
>=20
> You are right. write_frame() now loops until the whole frame is
> written, as in your proposal, and still waits with poll() on EAGAIN.
>=20
> I could show the loss with tcp_call: 32 MB sent from stdin to a TCP
> server that reads slowly, with -o 65536. The previous version hit 22
> partial writes and lost 81408 bytes. The new one delivers the 32 MB,
> checksum identical.

Thany you for that test!


> 2. alarm(0)
>=20
> It is now called right after connect(), whether it succeeded or not,
> in the four programs.
>=20
> 3. -T <seconds>
>=20
> Added to ax25_call, netrom_call, rose_call and tcp_call, and to the
> ax25_call(8) manual page. The default 0 sets no timeout of our own and
> leaves it to the protocol timers. As you say, this is how ax25d and
> node setups actually behaved until now, since the 30 seconds never
> worked. A negative value is refused.
>=20
> You wrote "I'll -T": if you meant to add it yourself to the official
> ax25-tools tree, tell me, and I will adapt or drop that part.
>=20
> Testing:
>=20
> - builds without warning with and without zlib (gcc 15 on x86_64,
> gcc 12 on aarch64)
> - tcp_call -T 5 to a silent address gives up after 5.0 s; without -T
> it was still waiting at 40 s;

On my linux it waited without -T 120 s (tcp default). Tested against a =
server with stupid packet-dropping firewall.

> a refused connection fails at once
> - rose_call -T 15 on a real node to our BBS over ROSE: banner,
> prompt, and the session lasted 30 s without being cut by the alarm
> - rose_call -T 10 to a ROSE address whose neighbour link is down:
> "Connection timed out - aborting" after 10.03 s, no circuit left
>=20
> Still not tested: ax25_call and netrom_call in real use, and the -c
> compression path beyond compiling.

I did only test ax25_call and tcp_call. No netrom and no rose here.


About the connect-timeout patch:
I have to _spoiler_ a topic.
I'll tell more in a few days after finishing things on my roeadmap. For =
the life without kernel-AX25, I have extended libax25 in a way that it =
can interprete socket/bind/connec/listen/accept-syscalls and may pass it =
AX.25-stack-capable programs.
The alarm-fix did only work for syscalls like connect that went directly =
to the kernel.
I had to slightly modify the alarm handler. See =
https://github.com/unix-ax25-stack/ax25-tools/commits/main/user_call


vy 73,

	- Thomas  dl9sau


