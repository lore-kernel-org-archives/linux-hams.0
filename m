Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5D035F8C5
	for <linux-hams@vger.kernel.org>; Sun, 18 Oct 2026 04:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.109.42.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792299585; cv=none; b=Qaq5+mXlKv9avHtqe9xxh9tGixQiHIcIY3bAyCOfuz22CkkDmbAnIoo1jK+islOBYgaui9dFfrbk46yMmr8etmGlgt9lNpi8JBZJyOIQwlE9K+703CuIG2EvH38BN8QLHlfRJ8GZOdzil610sQsjur8KTT7YIw4ooxShwiFwGKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792299585; c=relaxed/simple;
	bh=fBMUqWe0vD69KtSxuAseMn8x9EoUTVvlekZns1Wd4yU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Ts5EdTAjtVWgiSKvCcKKIYFH4qcbL0ZkCpLfrmwCI+bjPPPbxI6qT1beHsJKfelAp/gacQHJuy7S49m7oIUpQIt1pVsbSE+s7J2Ms2KpvKMDf7tiiwjzKr7kBigieRrnDOa5p7HU11ObVx7NEuyLelIeEo1ic9W8vlrGAorgIkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osterried.de; spf=pass smtp.mailfrom=osterried.de; arc=none smtp.client-ip=192.109.42.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osterried.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=osterried.de
X-Envelope-From: thomas@osterried.de
Received: from x-berg.in-berlin.de ([IPv6:2a0a:4580:1018:0:5054:ff:feb2:aa6a])
        by einhorn.in-berlin.de  with ESMTPS id 69I4xWMS2440661
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 18 Oct 2026 06:59:32 +0200
Received: from x-berg.in-berlin.de ([217.197.86.42] helo=smtpclient.apple)
	by x-berg.in-berlin.de with esmtpa (Exim 4.94.2)
	(envelope-from <thomas@osterried.de>)
	id 1xIIzc-0007lm-AW; Sun, 18 Oct 2026 06:59:32 +0200
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [ax25-tools/ax25-apps] security and robustness fixes for the
 user-space AX.25 utilities
From: Thomas Osterried <thomas@osterried.de>
In-Reply-To: <C19C830A-1408-4727-8303-2327AF08CE91@osterried.de>
Date: Sun, 18 Oct 2026 06:59:21 +0200
Cc: linux-hams@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B6E5B0AB-4EC0-4A06-823A-1E48B4FCD0C8@osterried.de>
References: <CAFAa3YA-RPyiDpT7-A+f0W2T8OBY8Ltgc=nR=BYUc-chXWb-pg@mail.gmail.com>
 <C19C830A-1408-4727-8303-2327AF08CE91@osterried.de>
To: Bernard Pidoux <bernard.f6bvp@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81.1.8)



> Am 16.10.2026 um 04:16 schrieb Thomas Osterried <thomas@osterried.de>:
>=20
> fyi:
>=20
> all patches #28-#33 from https://github.com/ve7fet/linuxax25/pulls are =
now added or ported to https://github.com/unix-ax25-stack .
>=20
> Old repo at linux-ax25.in <http://linux-ax25.in/>-berlin.de: still =
working on it. Needs about 30 hours until finished.

Yesterday, I upgraded the old git repos with the needed fixes.
  git://linux-ax25.in-berlin.de/pub/scm/libax25
  git://linux-ax25.in-berlin.de/pub/scm/ax25-apps
  git://linux-ax25.in-berlin.de/pub/scm/ax25-tools

vy 73,
	- Thomas  dl9sau=
