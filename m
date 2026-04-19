Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C453C21D3E4
	for <linux-hams@vger.kernel.org>; Sun, 19 Apr 2026 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776631056; cv=none; b=T6L4tgCd1I9NJ9aAo3F+BspQ+7pegvst3xTyGZTwg9RgUfwdzT4e3GfwR0vnCdo553yXD/l+zHMvMZCZtUAbC1Xl6eVCnlMznxZ7IE2Oec8PKdKhukEgtde3erwxKpCUvfDFvl/5hC808LRI1uqWtNlkQXZRVQPX5F+n5RQhU7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776631056; c=relaxed/simple;
	bh=fxma6hnAY8h5CxFfT4pE+oGNy0CNvqOeTNyHN3rr3ow=;
	h=From:Subject:To:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=g6mPj3muZs6wX/j0SA98IkZHme0Uaut13aKn0+Ci6Y569ak+CT7qhCvKrenomsZ4zLFijUrVFChfhc5LxNXflCyU/rEx9r/cTCDWROon+gopOHbUIKfXG2i9+ZLysRCNoYqGtIBRXxok9Y5+T/hIZoTCyGXBXX0IgAuxAxvO7Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/8.15.2) with ESMTP id 63JKbPS3017550;
	Sun, 19 Apr 2026 13:37:25 -0700
From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Discuss: Future of AX25, NETROM and ROSE in the kernel ?
To: hugh@blemings.id.au, linux-hams@vger.kernel.org
References: <54da3df9-6c91-4df0-87ff-1975d536761d@blemings.org>
Message-ID: <07d8ced7-fda8-9471-351d-6416f089d3db@trinnet.net>
Date: Sun, 19 Apr 2026 13:37:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <54da3df9-6c91-4df0-87ff-1975d536761d@blemings.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


Hello Hugh,

<snip>

> There's also been some very good points raised in that thread by hams 
> around whether it makes sense to move the implementation into 
> userspace or to out of tree kernel code. Both can be done in such a 
> way as to cause little to no impact from the actual application code 
> that makes use of the protocols.

I've done a little bit of research on the LD_PRELOAD concept and it 
seems that one major gap here is compiling those tools and their 
dependencies.  Specifically, if the AX25 headers are removed from the 
kernel tree, some if not all of these libraries and/or programs will 
file to compile.  The key dependencies consist of:

    - the libax25 library compiled which requires the AX.25 kernel headers
       - My preferred source (more up to date): 
https://github.com/ve7fet/linuxax25
            or
       - Original AX.25 userland repos that are a bit stale: 
https://linux-ax25.in-berlin.de/wiki/Main_Page


To solve the maintenance issue, there once was an ARDC grant ( 
https://www.ardc.net/apply/grants/2021-grants/grant-fixing-the-linux-kernel-ax-25/ 
) to have someone take on this responsibility but the person who 
originally accepted the grant, backed out and that need remains 
unfulfilled.   I have also considered proposing a grant to rewrite the 
libax25 code to offer both in-kernel support but also offer the ability 
to translate requests to a remote AGW/PE stack and remove any in-kernel 
AX.25 code.  That could be an excellent alternative but the current 
defacto AGW API interface is limiting and either needs to be extended or 
a parallel control interface needs to be implemented.


> If the consensus is that trying to keep the drivers in thee tree up to 
> date is the way ahead I'm happy to put my hand up to do this if no one 
> else is so inclined - I've a couple friends I can bug to help me get 
> back up to speed.
> But I'm also mindful there are other hams that have been more recently 
> involved in kernel work, so am going to give them a gentle nudge 
> offline too :)

Until some *real* options exist, I would dearly appreciate if you'd be 
willing to take this role up and I (as well as I'm sure others) would be 
happy to help on the testing side.  It should also be noted that Dan 
Cross's comprehensive post did highlight some keys points as well.  The 
Linux AX.25 v2.1 stack is behind the times as the AX.25 v2.2 spec added 
several valuable improvements.  A few userland AX.25 stacks such as from 
WB2OSZ Direwolf, G8BPQ LinBPQ, VE4KLM JNOS, etc. have added AX.25 v2.2 
support, FX.25 FEC support, etc. It would be great to see Linux natively 
add them too but maybe Linux go even further?  Ideas like adding native 
Flexnet routing support would be an excellent addition.

Ultimately, my preference of in-linux support is all the fantastic 
routing flexibility that UNIX is naturally good at.  I suppose that 
userland could do this too but when you might be running multiple AX.25 
userland programs talking to another Userland program acting as a 
router, I imagine things will get complicated for totally different reasons.


--David
KI6ZHD
Maintainer of the Linpac packet terminal program
Silicon Valley 44-Net AMPR coordinator
Maintainer of the Linpac and AX25mail-tools programs
Long time Linux advocate since the linux-1.2 days including being a long 
run IP Masquerade HOWTO maintainer
Maintainer of other many Linux-centric documentation programs like the 
TrinityOS HOWTO, Packet Radio on Raspberry Pi HOWTO, etc.

