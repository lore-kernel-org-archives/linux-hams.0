Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C605945C6FD
	for <linux-hams@vger.kernel.org>; Fri, 16 Oct 2026 09:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142568; cv=pass; b=E7Q1X3zpJibccEpinalUS/c5YcxdgR5fj5PTtEBGRaft6W/+BfGQaKzKtsXAm+mlK+Up9ljmbMSQmJ13p/ixYsOMks/ULoHiXcjRwnEmioCI1BV8ZmLGRb/+an7H5Pvu7P8oqPM8X9MMKWlS+YbG5/V8ra2JfE9ZGIdL81/XxYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142568; c=relaxed/simple;
	bh=PcyjuMPRgTIGpwiknF+//2pAxXq7yqXXn8l+73C6pKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gr6cyPUG6VLgtfcv67Fa+HuKSuMOB6qsDcr7BYs21tULLv8eWNCxJS2cOHUrXRrz6oh7Zklt4ED0ldXQ005O7OQSZkFNa8z3nWCjgRTSiP6pzVzvvSnJRN5I6xFbqxdCeDHyO8LxSTRJ2KYiVILw3KWgH8psopTDUbitBguMGmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6u0M2d4; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6u0M2d4"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ac9d666d4eso29404787b3.3
        for <linux-hams@vger.kernel.org>; Fri, 16 Oct 2026 02:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792142567; cv=none;
        d=google.com; s=arc-20260327;
        b=p2ZJx7u4pJZlJnxb/jM+EPwkMSW3YUxBiEMAyS4oli2Us6lQiZwe42JuHCa1F8NE/H
         qprq25PmQ3px4DN/u18dqbR6SxLZkd9w1kxYoEu02dvmX3QihbKiN1PR40y2hLv9xZvO
         YzrUXaKhvW9GipKVnGkakV+I0bGHLcgHBbNEtNY8UrikCFS/gc4lYZjrUcWkzbmIUlwc
         A5zbj88SDd40xZNIHHvt6CQPojw/m7AxYS3i2+pgo5tos+LbjQeG/mL3MZxVV086R2kW
         7TWmbJfQE+jIb9+/sAQPnqbzcVwlnArI+1iiMSYZuqxUb8N19IpasC1CIu1RpWea5OJv
         2hgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PcyjuMPRgTIGpwiknF+//2pAxXq7yqXXn8l+73C6pKk=;
        fh=i+/a9EEeca38JzKwk9X22Ngci9Bv/0PhHHM2P0y5saI=;
        b=oD3RASuTfwep4Us6h3CAb38+KgbsVkhxeiefYwbGmRrmUjHrXpFbpHlPNevg9jp/dR
         apCflbSlPendqOIy+jr5/SmZS7cY4cQ6nv98aSCQkT+LshBFoYKYkn7I37VNV95i1wQV
         z8bHxTWDZYszQYwSNGgxqQwB0nTGB3xz27BdCRVdazt/h/5PpfcF3rj7zkGrt0mQnCq1
         KHlKwTqCYpXbQ3ZgnmiUSaR8UHBTe6ahtSCCBnNGT/j41Y0PyaidzWoU6e9gh/nYplP8
         TMccVBk7a6wN2xsjCviPsjbxCh92qsLpouM5pCd9GZYZ+pZyTpQmouQkiV3+0/AujRW5
         8vLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792142567; x=1792747367; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PcyjuMPRgTIGpwiknF+//2pAxXq7yqXXn8l+73C6pKk=;
        b=P6u0M2d4g9cgAp7BXCAM96L1E18YIKmDO+qIdxwRo6qhK4ovva5+rcFU6WeM7iSfz+
         3ul87xuSUDsL0s6MDHMp4OK/xXGVJ8vjQC3C0DHLuQxkzQj8LKfsFH5h0F61JycQuVVr
         UnXV3htnNUgMjfBHcjuDteytAMGCD5ee7qr2N+aff9CG6W3SJzNLuZP89JZlbQZ0bqz9
         mAxy1ZnjqF5ModX1POhNult2h6VjXWDtdm1U/98jsmzzY9IiWPMoNEwVH+dh7JKe7EYR
         MFGwmqXgVkq9SRaSKiPdIIehP8XI3YyMixZvSxoi9lTx8psNSHZXKXeVYnOgoU3iSuAO
         EXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142567; x=1792747367;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PcyjuMPRgTIGpwiknF+//2pAxXq7yqXXn8l+73C6pKk=;
        b=BOmcG7QPGtTeCHqpl43jOmvWJz1CFzeON2+5OFiKDNtYOSB+aoPf+tWRTOPCptT/Pi
         VvNK7npUzwoBdJPcNMYk9bvGT6OI/j3mVVtE4Q42RWqlL3RCgEpvWWHUgVgmwVdsNjJM
         /SMKdeGF+ugUfmRPwWlU9FRxaS0h/8N29c9Bw82jpqPulXtoOYj9+DsBH5tUBICAe2EJ
         pX42ybDTGSrebTdJVqXEL1TtFWvQz8UOAU+OLm+Ixkg2UdpNV90G4AriCznvnq2ItZIo
         FoP8EGc9ZvALTUt6KVrqNoy7hZQO2acxZW0GS5qMa9cC3MogjHOfYXIQmE1GTy4x6QhD
         gR7A==
X-Gm-Message-State: AFq9FYLWhZATaq3uZDQoognUWZOYvNnA5lwbYb98rpsY4e5DiKjFoiRk
	osPFzB//nQgvPnhuazMvcnCTpTwiMKymQv7WT+prZt54cJw1wQuQh6qb7/QCU0H+gaSzSLcIiIF
	bvlSuiTRakNTbP2vgFUmLRbaYkugPqKCyeL2H
X-Gm-Gg: AYBFou2c2LIeE8bQlQ54cOcyXITx5HE9GRup+vwVOGzSCmEpadL8UrCV+xpnoH6tcH4
	YsVuaGRK4Kuf7HWjFQiZw7NtPVxcnooFjiWOoSwHYNzr/HpMDHDpGiqupQo+STsk8yY/kNzYipl
	vVCcj86xoI4T8EU9C91jhEtvEgxlxVBmZMOZmnHX5YETgpBrQ/9EDQ51R2g0cWp5IU+5SpjOSu1
	+mogUoQgtsXo7XuqlWkjlKC/NIHWHjPEqw0lhlXDQ7uquVC52AMa9qO/RFC7ECPRGJC5FH5GrM8
	kvdgkU7D+FjHPzWbh+jwtFFlgfSICCFz6dxJm0QpkEHvLRk29+LAjRs=
X-Received: by 2002:a05:690c:6d81:b0:8b0:ce9f:2993 with SMTP id
 00721157ae682-8b0ce9f2e02mr18891177b3.5.1792142566563; Fri, 16 Oct 2026
 02:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFAa3YA-RPyiDpT7-A+f0W2T8OBY8Ltgc=nR=BYUc-chXWb-pg@mail.gmail.com>
 <C19C830A-1408-4727-8303-2327AF08CE91@osterried.de>
In-Reply-To: <C19C830A-1408-4727-8303-2327AF08CE91@osterried.de>
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Fri, 16 Oct 2026 11:22:35 +0200
X-Gm-Features: AclHuK-AtKVRtJpK-l0MeRKRMP9AgyZGOWukdMjxYx7H_p9neaximbwbG5SWAyk
Message-ID: <CAFAa3YCAyqdOYk=4HtP9eZ4Cmq8VtgxTMee90xy7fdZ3muyhWA@mail.gmail.com>
Subject: Re: [ax25-tools/ax25-apps] security and robustness fixes for the
 user-space AX.25 utilities
To: linux-hams@vger.kernel.org
Cc: thomas@osterried.de
Content-Type: text/plain; charset="UTF-8"

Hello,

A short follow-up: pull requests #28 to #33 are now merged into the
master branch of the ve7fet/linuxax25 tree on GitHub. The head of
master is commit de2a504.

#28 ax25ipd
#29 user_call (including Thomas' change: the connect attempt now ends
from the alarm handler)
#30 ax25d, including the fix for the AX25.IP mode VC check, where a
forged callsign could run a command as root
#31 ax25mond, ax25rtd, call/yapp
#32 axspawn (Huffman decompression overflow reachable before login on
unsigned-char platforms such as ARM), mheardd, axgetput, netromd
#33 listen

The pull requests touch disjoint files, and the merged master builds
without errors (ax25apps and ax25tools) on Ubuntu 26.04 with glibc 2.43.

As Thomas wrote, the same fixes are also in his unix-ax25-stack tree,
and he is porting them to the old linux-ax25 repository hosted at
in-berlin.

For package maintainers: the two items that matter most for security
are #30 (ax25d, only with the VC options of parameters_extAX25) and
#32 (axspawn, whenever ax25d starts it). Taking master at de2a504, or
at least these two pull requests, is advised.

All of these fixes have been running on the eight nodes of our
network since 14 and 15 October without regression so far.

73,
Bernard, F6BVP
