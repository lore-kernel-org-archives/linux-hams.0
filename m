From: Thomas Sailer <sailer@scs.ch>
Subject: Re: Need help with serial card + baycom
Date: Mon, 15 Nov 2004 08:07:07 +0100
Message-ID: <1100502427.8341.37.camel@kronenbourg.scs.ch>
References: <6.1.2.0.2.20041114202646.02842888@in.aliceposta.it>
	 <6.1.2.0.2.20041114234158.0283e7a8@popmail.libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <6.1.2.0.2.20041114234158.0283e7a8@popmail.libero.it>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio IZ4AFW <iz4afw@libero.it>
Cc: linux-hams@vger.kernel.org

On Sun, 2004-11-14 at 23:47 +0100, Fabio IZ4AFW wrote:

> is there a reason why dev->base_addr must be less than (0x1000-SER12_EXTENT)?
> If, like in this case, SER12_EXTENT==8, then my card at base address 0xb408 
> doesn't pass this check...

This is just a sanity check that the parameters are in the ISA range.
Which doesn't make sense any more...

> I'll try to remove the check as soon as possible to see if this solves the 
> problem... but probably that check is there for a good reason ;)

If it works for you, please submit a patch to the kernel lieutenants
(Dave Miller in this case probably).

Thanks,
Tom

