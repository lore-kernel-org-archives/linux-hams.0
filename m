Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE8A2DC791
	for <linux-hams@vger.kernel.org>; Thu, 15 Oct 2026 23:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.109.42.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792107804; cv=none; b=ENTCSwMBGQAynJ8LTFFyc8wwYT+EerhjOmniikWZwcytvTTJJEtUrDE9YQDVSJ1B4QFo2lINYMGYWhwqGujWMPdAZuCubrO3VnAcqj/ov1mI4J8OJkg14cZwgcf0pw9KlSr0Eca8XTKi6b8Nz+hV4YgV1Er5+9uOODaTB2wEyU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792107804; c=relaxed/simple;
	bh=bnWWKvrITEcNYOqUA9EwoFQIjq0v6K7sxAQEVogsbCE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NG9y7BQY7IGYVbQJP0S7RQcnCjl+W3n/F7IfqABEx93tJIl+u14ZcfmWwN28VqgN4zHLpaSvuv5mt6kIsks+nBltregg93IbyD0yisiNLQ5HzXjsVmDu5ixx0WzD5GisSktYuXO2IaTqpCKlcXJUvUtCMwLgz0x6BjslWf3s69c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osterried.de; spf=pass smtp.mailfrom=osterried.de; arc=none smtp.client-ip=192.109.42.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osterried.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=osterried.de
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de ([IPv6:2a0a:4580:1018:0:5054:ff:feb2:aa6a])
        by einhorn.in-berlin.de  with ESMTPS id 69FNhB1Q2523634
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 01:43:11 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
	by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
	(envelope-from <thomas@osterried.de>)
	id 1xHV6N-0005fv-Aa; Fri, 16 Oct 2026 01:43:11 +0200
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: ax25d - very severe bug!! - was: Re: [PATCH] ax25-tools user_call:
 data dropped on a slow link, connect timeout that never fires
From: Thomas Osterried <thomas@osterried.de>
In-Reply-To: <CAFAa3YCJCDURH1bUAE0PAdMXVNzY2GgQGNWCX5q6grP=TGxJsw@mail.gmail.com>
Date: Fri, 16 Oct 2026 01:43:00 +0200
Cc: linux-hams@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BA380815-F216-4D9F-8B91-ED7283D04053@osterried.de>
References: <CAFAa3YCbFFNNWLwDEd6u7dGE=5xfb72CSLwJgJVAtP_+=8beDg@mail.gmail.com>
 <19B86BF2-D959-4D1A-81ED-8DADD729042B@osterried.de>
 <CAFAa3YDzx6XGDH0wL+=YYq7uGaccJkdT0a7UUYOiFrdu5WFL9Q@mail.gmail.com>
 <28347904-28FF-45C2-B7C5-0FF9CFF4CA31@osterried.de>
 <CAFAa3YCJCDURH1bUAE0PAdMXVNzY2GgQGNWCX5q6grP=TGxJsw@mail.gmail.com>
To: Bernard Pidoux <bernard.f6bvp@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81.1.8)


Some _important_ points below.

> Am 15.10.2026 um 19:44 schrieb Bernard Pidoux =
<bernard.f6bvp@gmail.com>:
>=20
> Hello Thomas,
>=20
> Thank you for testing, and for taking the user_call fixes into your
> ax25-tools tree with my name on them.
>=20
> Your alarm handler change makes sense: ending the attempt from the
> handler itself no longer depends on connect() returning EINTR, =
whatever
> serves the socket. I will bring it into pull request 29 of the
> linuxax25 tree of Lee VE7FET, so that both trees keep the same
> user_call.

tnx.


You and your friend Cla.. had other findings, in your latest 4 PR to =
ve7fet's github repo.
Actually you discovered two bugs in ax25d (which needs to run as root =
for allowing unix-login via axspawn):
  1. a bug which allows a remote-root-exploit. Very critical.
  2. a bug which allows a user to gain root permissions by a buffer =
overflow in the lzw-compression feature


Imho we need to proactively inform package maintainers for the linux =
distributions, _asap_.


That leads us to a decision problem.
For the new userspace ax25-stack capability, I moved the development =
project to github (because it makes collaboration much easier) and =
intended to move the old repo to retirement.

But these fixes need to go to the old repo for those who refer it. And =
because ve7fet's clone is also used by others, at least these two =
patches need to go in quickly.



> About your spoiler: an AX.25 stack in userspace is good news, all the
> more since AX.25, NET/ROM and ROSE leave the mainline kernel with 7.1.
> My own work is on the other side, and I see the two as complementary.
> Many stations will keep running the kernel stack for years with the
> kernels that still carry it. So I am trying to repair and secure it in
> those versions: the 6.18 LTS series first (four ROSE fixes are in
> 6.18.55), soon the 6.12 LTS series, and also 7.0, the kernel shipped
> with Ubuntu 26.04 LTS.

I read about and it's a good and worthy project!

The new libax25 / ax25-apps / -tools project is backwards compatible and =
should work on kernel-ax25-only systems as well as on user-space, and =
even if both is used at the same time.

The timing (in respect of the security fiadiags) is a bit bad, because I =
have some things on my todo list before I like to advert it.


vy 73,
	- Thomas  dl9sau

