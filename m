From: Fabio IZ4AFW <iz4afw@libero.it>
Subject: Re: Need help with serial card + baycom
Date: Mon, 15 Nov 2004 13:19:58 +0100
Message-ID: <6.1.2.0.2.20041115131558.02623da0@popmail.libero.it>
References: <6.1.2.0.2.20041114202646.02842888@in.aliceposta.it>
 <6.1.2.0.2.20041114234158.0283e7a8@popmail.libero.it>
 <1100502427.8341.37.camel@kronenbourg.scs.ch>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1100502427.8341.37.camel@kronenbourg.scs.ch>
References: <6.1.2.0.2.20041114202646.02842888@in.aliceposta.it>
 <6.1.2.0.2.20041114234158.0283e7a8@popmail.libero.it>
 <1100502427.8341.37.camel@kronenbourg.scs.ch>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Thomas Sailer <sailer@scs.ch>
Cc: linux-hams@vger.kernel.org

At 08:07 15/11/2004, you wrote:
>This is just a sanity check that the parameters are in the ISA range.
>Which doesn't make sense any more...
>
> > I'll try to remove the check as soon as possible to see if this solves the
> > problem... but probably that check is there for a good reason ;)
>
>If it works for you, please submit a patch to the kernel lieutenants
>(Dave Miller in this case probably).
>
>Thanks,
>Tom

OK, I'll let you know ASAP and eventually I'll contact Dave to submit the 
patch.
Probably I'll also have to set the correct divisor in the UART because 
baud_base is 921600 on my PCI board instead of 115200... and I assume that 
using setserial is pointless, because the module doesn't use the standard 
serial support of the kernel...

Thanks a lot for the info Tom!

Ciao
Fabio IZ4AFW



