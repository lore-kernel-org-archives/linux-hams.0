Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFF853B5F2
	for <linux-hams@vger.kernel.org>; Tue, 13 Oct 2026 19:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.109.42.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918293; cv=none; b=HE2ua+V9nu84c1Bk+j/9kxSMOrCP7E3X1vDiDKf4Fn3uvnhsaxRs6C/3Mo7oupviDx8REo+Mg2QJwDySQt444wv2NgjkJBDE7ipnBx98pFo1NemfzINZCtKRPfiPfnE13Lo0mxfAwg8u9muaGBy2l2qDQkSON98gaLiM80/TZPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918293; c=relaxed/simple;
	bh=aJf6HZstm9kHSHtrniTOOa3inThsc5LxZkPYIZf6Z0A=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Bs3fDM4Q+Uq9aPxj7iFqk8/vzL+O2kw/YFApq6/CQHceJcCpo2qos/NgQRfgJPxZpqAjfVHUs8Hts3Ov0JzDR8pDK8rQt4K8ChxTJSsaufZilZfM9NVjBC4Jausk9EWjMMsw1akQE+Cdu0A7IwyLbPuOoolNGc7b1STrh7Q1xx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osterried.de; spf=pass smtp.mailfrom=osterried.de; arc=none smtp.client-ip=192.109.42.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osterried.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=osterried.de
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de ([IPv6:2a0a:4580:1018:0:5054:ff:feb2:aa6a])
        by einhorn.in-berlin.de  with ESMTPS id 69DJ2neZ1947671
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 21:02:49 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
	by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
	(envelope-from <thomas@osterried.de>)
	id 1xGhlx-0002ue-5e; Tue, 13 Oct 2026 21:02:49 +0200
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
In-Reply-To: <CAFAa3YCbFFNNWLwDEd6u7dGE=5xfb72CSLwJgJVAtP_+=8beDg@mail.gmail.com>
Date: Tue, 13 Oct 2026 21:02:38 +0200
Cc: linux-hams@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <19B86BF2-D959-4D1A-81ED-8DADD729042B@osterried.de>
References: <CAFAa3YCbFFNNWLwDEd6u7dGE=5xfb72CSLwJgJVAtP_+=8beDg@mail.gmail.com>
To: Bernard Pidoux <bernard.f6bvp@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hello Bernard,

thank you for the patch. The fixes look good and address real issues =
(EAGAIN data drops and the SA_RESTART connect timeout).

One small but important detail: write_frame() as written returns success =
on the first successful write() even if only part of the buffer was =
written. On TCP sockets with small write space, write() can return < len =
with no error - your code would then silently skip the rest.

Please change write_frame() in user_io.c to loop until all bytes are =
written (handling partial writes), e.g.:

static int write_frame(int fd, const unsigned char *byte, int len)
{
	struct pollfd pfd;
	int written =3D 0;
	while (written < len) {
		int n =3D write(fd, byte + written, len - written);
		if (n < 0) {
			if (errno =3D=3D EINTR)
				continue;
			if (errno !=3D EAGAIN && errno !=3D EWOULDBLOCK)
				return -1;
			pfd.fd =3D fd;
			pfd.events =3D POLLOUT;
			pfd.revents =3D 0;
			if (poll(&pfd, 1, -1) < 0 && errno !=3D EINTR)
				return -1;
			continue;
		}
		written +=3D n;
	}
	return 0;
}

This ensures no data is lost on partial writes. AX.25 sequenced sockets =
are less likely to see this, but it's correct and safe for TCP too.

Two minor suggestions:
- Always call alarm(0) after connect (success or failure) to clear any =
pending alarm.
- The hardcoded 30s connect timeout doesn't fit all cases; it was =
intended, but you found it does not work. =20
  The protocols already have their timeouts, some adjustable -> AX.25 =
kernel timeouts can differ, and TCP due to standards defaults to 120s).
  I'll -T <seconds> with default 0 to skip the internal timeout. That =
preserves compatibility with existing ax25d/node usage.

Thanks for catching these issues.

vy 73,

  - Thomas  dl9sau

