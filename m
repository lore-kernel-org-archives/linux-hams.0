Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328CD19C546
	for <linux-hams@vger.kernel.org>; Sat, 11 Apr 2026 07:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775892958; cv=none; b=Wb4/5aIqyaZflAxSQvfC/Auk47auJKQR8Vvz/Q4PwDM9cL4QbC+yYmNRfSmZPmLTYK56e1jdMgcT3Zkqll7XVafkl0K0Vyq5k3zu4fgP3fasbvI9cy/oXFn0blW5UcVQll78bnsIklm0s0Ho3FfBAYa7Izsy1rhNe+kr7dyRPRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775892958; c=relaxed/simple;
	bh=45DL5i4aFxBsN844QSfZKyAMaVvEDeLrwcZVp4HVEhQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=ZGTgAfVx7LbV3QiqhzxR93eYU2Z3KUbLzTKmRB4CI2odJuopgvN0997w7cMSaK2kjckIeaA8QHiD936tKa5RSx5ARxHdddQNUPabdJ+efbKsYmA5COJ3BO+ABfql3NNhjhy0x9tTD3NYwGTvNnpWfj5m4wGQprrGmb+3pjB9SZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blemings.org; spf=pass smtp.mailfrom=blemings.org; dkim=pass (2048-bit key) header.d=blemings.org header.i=@blemings.org header.b=d9VFBn7m; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blemings.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blemings.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blemings.org header.i=@blemings.org header.b="d9VFBn7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blemings.org;
	s=202501; t=1775892955;
	bh=ZxeObIjNiHxPxr2zQdH6ockY4/jNU8NeIH3s1eQDbO8=;
	h=Date:From:Subject:Reply-To:To:From;
	b=d9VFBn7mIGFZ+jIdpcIcDpWA2Oy1afb1tcToV3GHp5hO2K+f08tzFgDaCr6XFaQy/
	 X4uPENuQxtH3eTSmRtFwXWZKsVuZFz/jxFX9pVaaeZGK5w1zlYj32dwH5UHRwLjbSp
	 6yub1pDOb5OC8r+uvLr6yfXovm1hLCtYwiKcPQd41yreudIlIss+kCiKktbrGE5zBL
	 Rx783iudNlsbWIZEGq0R8JvOTMO7E5IuryekP0zqtLNf/Zz0onc7gEc9vM5TjwbgqO
	 2yyPuD3pWG6i4ck4hfvRenKPoRPVuM/4BG+l+iGMjt4ECP6zZ55rFdrJhP2IKx9QgS
	 z/UxIke5Z6Eyw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ft57b5ndgz4wJ2
	for <linux-hams@vger.kernel.org>; Sat, 11 Apr 2026 17:35:55 +1000 (AEST)
Message-ID: <54da3df9-6c91-4df0-87ff-1975d536761d@blemings.org>
Date: Sat, 11 Apr 2026 17:35:55 +1000
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hugh Blemings <hugh@blemings.org>
Subject: Discuss: Future of AX25, NETROM and ROSE in the kernel ?
Reply-To: hugh@blemings.id.au
To: linux-hams@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Long time lurker, (nearly) first time poster as the saying goes[0].

My email here seeks to see that we, as a technical community, navigate a 
potentially tricky point in the hobbies presence in the Linux kernel as 
well as possible.  I've a decent long term view of the matters at hand, 
but lack a good "current" picture[1].

There's a thread[2] that kicked off, primarily in linux-hams that 
initially focused on bug fixes in the Netrom code. This has broadened 
into a discussion about the future of the AX25, NETROM and ROSE code in 
the kernel.

A couple of well respected mainline kernel maintainers have noted the 
maintenance overhead of these (relatively) lightly used protocols. This 
has led to, quite reasonably I think, some discussion of whether they 
should be removed or deprecated - the perception being they're not used 
much. Note that none of this a judgement on the hobby itself or the 
utility to the broader community.

There's also been some very good points raised in that thread by hams 
around whether it makes sense to move the implementation into userspace 
or to out of tree kernel code. Both can be done in such a way as to 
cause little to no impact from the actual application code that makes 
use of the protocols.

My intuition is that we probably have folks here on linux-vger that have 
the requisite skills and reputation, or ability to gain them, to keep 
the in tree drivers up to date. But perhaps that's just "old" thinking 
on my part?

So I figure a thread here to discuss how we go forward made some sense - 
stay with the current in kernel model, look to go oot or userspace.

If the consensus is that trying to keep the drivers in thee tree up to 
date is the way ahead I'm happy to put my hand up to do this if no one 
else is so inclined - I've a couple friends I can bug to help me get 
back up to speed.

But I'm also mindful there are other hams that have been more recently 
involved in kernel work, so am going to give them a gentle nudge offline 
too :)

Cheers/73,
Hugh
VK3YYZ/AD5RV


[0] First licensed in the late 80's and can even remember the smell and 
sound of a Model 33 teletype connected to a TNC :)

[1] Installed Slackware in the early 90's and never fully recovered, 
some of my code still in the kernel to this day :)

[2] 
https://lore.kernel.org/linux-hams/761f83cc-58eb-4b4a-ba91-d11412e7b2a6@gmail.com/T/#t



-- 
I am slowly moving tohugh@blemings.id.au as my main email address.
If you're usinghugh@blemings.org please update your address book accordingly.
Thank you :)

