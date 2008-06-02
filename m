From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: SCC Card Driver
Date: Mon, 02 Jun 2008 15:03:45 +1000
Message-ID: <48437F31.80909@exemail.com.au>
References: <4841C45E.7010405@exemail.com.au> <48420B85.10601@exemail.com.au> <200806010845.05055.m.kozlowski@tuxland.pl> <48424D60.5080308@exemail.com.au> <48428FFD.2080802@w1nr.net> <4843123E.2000008@exemail.com.au> <484313E1.706@w1nr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <484313E1.706@w1nr.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Mike McCarthy, W1NR" <lists@w1nr.net>
Cc: Mariusz Kozlowski <m.kozlowski@tuxland.pl>, linux-hams@vger.kernel.org

Mike McCarthy, W1NR wrote:

>>>
>> Mike,
>>
>> I'm compiling on Debian 4.0 but as you say, it shouldn't be relevant. 
>> The kernel source came from kernel.org.
>>
>> Just to be sure I wasn't fooling myself, with both 2.6.25.1 and 
>> 2.6.25.4 I deleted the unzipped source and unzipped again. For each 
>> source I ran make menuconfig. The ax25 options were not selected by 
>> default in 2.6.25.4 but they were in 2.6.25.1.
>>
>> I haven't been able to go back into 2.6.25.4 to see if ISA was 
>> selected re the SCC problem but I'll do that probably today.
>>
>> Ray vk2tv
>>
>
> The raw kernel from kernel.org has bare minimum enabled.  You need to 
> get a "config" file from your running system to enable all that the 
> distro does by default.  I have also found that there are usually a 
> lot of other drivers that need to be enabled just to make it run at all.
>
> Mike, W1NR
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
Mike,

I normally use my old config file but because I'm jumping quite a few 
kernel releases I decided to start from scratch.

I did some more investigating this morning and this is what I found.....
1. The SCC driver not appearing in 2.6.25.4 is due to ISA not being 
selected - my oversight.
2. In kernel 2.6.25.1 ISA is preslected, and all ax25 is preselected as 
modules
3. In kernel 2.6.25.4 ISA is not preslected and all ax25 is not preselected

Looks like there has been some serious culling of unessential drivers 
between 2.6.25.1 and 2.6.25.4. Takes me back to 2.0.x kernels.

Ray vk2tv
