From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Subject: Re: SCC Card Driver
Date: Sun, 1 Jun 2008 08:45:04 +0200
Message-ID: <200806010845.05055.m.kozlowski@tuxland.pl>
References: <4841C45E.7010405@exemail.com.au> <48420B85.10601@exemail.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <48420B85.10601@exemail.com.au>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ray Wells <vk2tv@exemail.com.au>
Cc: linux-hams@vger.kernel.org

Hello,

> > I grabbed kernel 2.6.24.4 yesterday and there is no option in the ax25 
> > configuration for the SCC driver.
> >
> > Can anyone advise if this is an oversight?
>
> Oops. That should read 2.6.25.4

Did you enable ISA support?

config SCC
        tristate "Z8530 SCC driver"
        depends on ISA && AX25 && ISA_DMA_API


	Mariusz
