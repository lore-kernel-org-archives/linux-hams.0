From: csmall@eye-net.com.au (Craig Small)
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Sat, 27 Jul 2002 09:24:26 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020726232426.GB18207@eye-net.com.au>
References: <20020726134216.A4126@dea.linux-mips.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020726134216.A4126@dea.linux-mips.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@uni-koblenz.de>
Cc: linux-hams@vger.kernel.org

On Fri, Jul 26, 2002 at 01:42:16PM +0200, Ralf Baechle wrote:
> No substancial changes have been done to the AX.25 kernel stack in a extended
> period of time.  As the result it is still doing crude stuff like globally
> enabling and disabling interrupts, has no understanding of shared skb, isn't
> fully multithreaded and probably plenty more problems I haven't spotted yet.
> Now that we're about to remove global cli() / sti() from the kernel this
> means the AX.25 stack will soon break entirely.
> 
> Is there any ongoing development I'm not aware of?  Just in case I've
> started doing some cleanup last night ...

No, if there is something going on I don't know about it, which is not
that surprising anyway.  If you're doing only internal stuff than go
right ahead.  If you want to fiddle with anything that changes the API
let me know so that the libraries and programs can handle it.

  - Craig
-- 
Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE  95CB C76C E5AC 12CA DFA5
Eye-Net Consulting http://www.eye-net.com.au/        <csmall@eye-net.com.au>
MIEEE <csmall@ieee.org>                 Debian developer <csmall@debian.org>
