From: Richard Adams <pa3gcu@zeelandnet.nl>
Subject: Re: DRSI configuration
Date: Sun, 14 Apr 2002 10:15:09 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <0204141015090W.00302@unix.pa3gcu>
References: <ICENJPNBBIBGNDMIANCPMEBCCCAA.john.buttery@btinternet.com>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <ICENJPNBBIBGNDMIANCPMEBCCCAA.john.buttery@btinternet.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Buttery <john.buttery@btinternet.com>, Linux-Hams <linux-hams@vger.kernel.org>

On Sunday 14 April 2002 09:52, John Buttery wrote:
> Hi All
>
> I'm new on this list, so my question may have been answered previously.
>
> I am trying to set up DRSI boards on a RH 7.2 kernel 2.4.7-10 installation.
> I have z8530drv-utils-3.0.3 and have set the configuration as in the
> documentation.  I have installed the files but, when I run sccinit, I get
> the error message:
>     'SIOCSCCINI: : Invalid argument'
> What causes this error, and how do I sort it?

SIOSCCINI is i belive;
The kernel is saying it cant find you card,
Either the irq is wrong on the irq is in use.
Or the port addresses are wrong.
If you use IRQ 7 for example make sure your kernel does not have any printer 
modules loaded.

>
> Regards
>
> John, G7OPJ, SysOp GB7WDX

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

