From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: kernel 2.4.21 and mkiss
Date: Thu, 21 Aug 2003 19:32:22 -1200 (GMT+12)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0308211908130.12131-100000@zl2bsj.ampr.org>
References: <1061516425.2064.28.camel@homer.spoo.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1061516425.2064.28.camel@homer.spoo.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian J Maude <ian@gb7mbc.net>
Cc: linux-hams <linux-hams@vger.kernel.org>


Hi Ian,

All my drivers are modules, and I can confirm kissattach works with kernel
2.4.21. I can't see why built-in drivers would refuse to work, but I
haven't tried that myself. Maybe you compiled the kernel but didn't
install it. Or you are still booting the old kernel (verify the compile
timestamp with 'uname -a' )

If you can't track down the problem, my suggestion would be to roll a new
kernel, with ax25 support as modules. You'll find the mkiss module under:

/lib/modules/<kernel-version/kernel/drivers/net/hamradio/mkiss.o

Also, your apps/tools/libax25 are all outdated.
The latest ones are 0.0.6 ,  0.0.8 and 0.0.11 respectively.

It would be a good starting point to upgrade. Make sure to uninstall the
rpms before compiling from the latest sources.

Hope this helps.


Wilbert, ZL2BSJ



