From: Francois Romieu <romieu@fr.zoreil.com>
Subject: Re: [PATCH net-next 1/1] MAINTAINERS: update amateur radio status.
Date: Fri, 19 Aug 2022 17:50:20 +0200
Message-ID: <Yv+xPBPpxDOSxny7@electric-eye.fr.zoreil.com>
References: <Yv6fCCB3vW++EGaP@electric-eye.fr.zoreil.com>
 <Yv9NOmXjRLf6WSCB@x-berg.in-berlin.de>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 violet.fr.zoreil.com 27JFoLs62790716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fr.zoreil.com;
        s=v20220413; t=1660924221;
        bh=QplMSTV2SCiraGoyFJdZ9D1otqNUvkjIiL0MWjlYKyo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LnzCSfk+z2E0XjtdqfHLhC8nL1RHxVAL7rdJ9UWkO5QMYQMPJl6ehcxOEHX2awiGS
         0BfbCPMTGa1DwKZf0o6CJbH6bHkQ8mtn9diW8zf8+qB1sk9EYW9xVdVqNdr82SpFTq
         MUgbWBa4OE/IKSSTuhzKr3ePp/iKkJ+pU7QveqZQ=
Content-Disposition: inline
In-Reply-To: <Yv9NOmXjRLf6WSCB@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Osterried <thomas@osterried.de>
Cc: netdev@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, Bernard Pidoux <f6bvp@free.fr>

Thomas Osterried <thomas@osterried.de> :
[...]
> I disagree.

There's no tag for "Organically Maintained" :o)

I issued 'git log -- net/ax24 net/netrom net/rose' and wandered through the
linux-ham archive.

"Odd Fixes" in Ralf's statement as "scattered, occasional, infrequent"
- thank you wiktionary ! - changes seemed to describe the current state more
accurately than plain "Maintained".

> I hoped Ralf will come back and waited with my offer to do the maintainership.
>
> A question for the process: What needs to be done to get listet as maintainer?

Someone sends a patch, there's no obvious consensus against the victim (was
there ever ?) as he is usually known for some decent track of work or
unformal, de-facto maintainership and he get listed within a few days.

-- 
Ueimor
