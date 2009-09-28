From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] ax25: Add missing dev_put in ax25_setsockopt
Date: Mon, 28 Sep 2009 12:26:38 -0700 (PDT)
Message-ID: <20090928.122638.52076650.davem@davemloft.net>
References: <4ABA9058.3010605@free.fr>
	<20090928071211.GA8658@ff.dom.local>
	<20090928125313.GA14250@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20090928125313.GA14250@linux-mips.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: ralf@linux-mips.org
Cc: jarkao2@gmail.com, f6bvp@free.fr, bernard.pidoux@upmc.fr, netdev@vger.kernel.org, linux-hams@vger.kernel.org

From: Ralf Baechle <ralf@linux-mips.org>
Date: Mon, 28 Sep 2009 13:53:13 +0100

> ax25_setsockopt SO_BINDTODEVICE is missing a dev_put call in case of
> success.  Re-order code to fix this bug.  While at it also reformat two
> lines of code to comply with the Linux coding style.
> 
> Initial patch by Jarek Poplawski <jarkao2@gmail.com>.
> 
> Reported-by: Bernard Pidoux F6BVP <f6bvp@free.fr>
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
> 
> ---
> Counter-proposal.  Reordering all the code avoids the need for a 2nd dev_put
> and is more readable.

Looks good to me, applied.
