From: Fabio IZ4AFW <iz4afw@libero.it>
Subject: Re: Need help with serial card + baycom
Date: Sun, 14 Nov 2004 23:47:34 +0100
Message-ID: <6.1.2.0.2.20041114234158.0283e7a8@popmail.libero.it>
References: <6.1.2.0.2.20041114202646.02842888@in.aliceposta.it>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <6.1.2.0.2.20041114202646.02842888@in.aliceposta.it>
References: <6.1.2.0.2.20041114202646.02842888@in.aliceposta.it>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

At 20:47 14/11/2004, you wrote:

>Hi guys,
>     I'm new to the list, and I need help to use a baycom modem with linux.
[...]

I'm looking at the source code in baycom_ser_fdx.c just now, and noticed 
this line in ser12_open():

if (!dev->base_addr || dev->base_addr > 0x1000-SER12_EXTENT || dev->irq < 2 
|| dev->irq > 15)
                 return -ENXIO;

is there a reason why dev->base_addr must be less than (0x1000-SER12_EXTENT)?
If, like in this case, SER12_EXTENT==8, then my card at base address 0xb408 
doesn't pass this check...
I'll try to remove the check as soon as possible to see if this solves the 
problem... but probably that check is there for a good reason ;)
Anyone?

Thanks,
Fabio IZ4AFW



