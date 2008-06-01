From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: SCC Card Driver
Date: Mon, 02 Jun 2008 07:18:54 +1000
Message-ID: <4843123E.2000008@exemail.com.au>
References: <4841C45E.7010405@exemail.com.au> <48420B85.10601@exemail.com.au> <200806010845.05055.m.kozlowski@tuxland.pl> <48424D60.5080308@exemail.com.au> <48428FFD.2080802@w1nr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <48428FFD.2080802@w1nr.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Mike McCarthy, W1NR" <lists@w1nr.net>
Cc: Mariusz Kozlowski <m.kozlowski@tuxland.pl>, linux-hams@vger.kernel.org

Mike McCarthy, W1NR wrote:

> Ray Wells wrote:
>
>> Mariusz
>>
>> You raise a good point and I didn't check. I did notice that all ax25 
>> kernel stuff is no longer enabled as modules by default.
>>
>> I suspect there has been a change between 2.6.25.1 and 2.6.25.4 
>> because in 2.6.25.1 (which I'm compiling now) the ax25 stuff, 
>> including SCC, is enabled as modules by default.
>>
>> Perhaps I was to used to what used to be!! Slap on wrist.
>>
>> Thank you for your suggestion.
>>
>> Ray vk2tv
>
> Ray,
>    What distro are we talking about?  mkiss and ax25 modules are 
> present on Fedora 9 with the 2.6.25.3 kernel.  Including them or not 
> is normally a distro specific thing.
>
> Mike, W1NR
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
Mike,

I'm compiling on Debian 4.0 but as you say, it shouldn't be relevant. 
The kernel source came from kernel.org.

Just to be sure I wasn't fooling myself, with both 2.6.25.1 and 2.6.25.4 
I deleted the unzipped source and unzipped again. For each source I ran 
make menuconfig. The ax25 options were not selected by default in 
2.6.25.4 but they were in 2.6.25.1.

I haven't been able to go back into 2.6.25.4 to see if ISA was selected 
re the SCC problem but I'll do that probably today.

Ray vk2tv
