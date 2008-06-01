From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: Re: SCC Card Driver
Date: Sun, 01 Jun 2008 17:25:53 -0400
Message-ID: <484313E1.706@w1nr.net>
References: <4841C45E.7010405@exemail.com.au> <48420B85.10601@exemail.com.au> <200806010845.05055.m.kozlowski@tuxland.pl> <48424D60.5080308@exemail.com.au> <48428FFD.2080802@w1nr.net> <4843123E.2000008@exemail.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4843123E.2000008@exemail.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ray Wells <vk2tv@exemail.com.au>
Cc: Mariusz Kozlowski <m.kozlowski@tuxland.pl>, linux-hams@vger.kernel.org

>>
> Mike,
> 
> I'm compiling on Debian 4.0 but as you say, it shouldn't be relevant. 
> The kernel source came from kernel.org.
> 
> Just to be sure I wasn't fooling myself, with both 2.6.25.1 and 2.6.25.4 
> I deleted the unzipped source and unzipped again. For each source I ran 
> make menuconfig. The ax25 options were not selected by default in 
> 2.6.25.4 but they were in 2.6.25.1.
> 
> I haven't been able to go back into 2.6.25.4 to see if ISA was selected 
> re the SCC problem but I'll do that probably today.
> 
> Ray vk2tv
> 

The raw kernel from kernel.org has bare minimum enabled.  You need to 
get a "config" file from your running system to enable all that the 
distro does by default.  I have also found that there are usually a lot 
of other drivers that need to be enabled just to make it run at all.

Mike, W1NR

