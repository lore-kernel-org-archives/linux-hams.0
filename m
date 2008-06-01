From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: SCC Card Driver
Date: Sun, 01 Jun 2008 17:18:56 +1000
Message-ID: <48424D60.5080308@exemail.com.au>
References: <4841C45E.7010405@exemail.com.au> <48420B85.10601@exemail.com.au> <200806010845.05055.m.kozlowski@tuxland.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200806010845.05055.m.kozlowski@tuxland.pl>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: linux-hams@vger.kernel.org

Mariusz

You raise a good point and I didn't check. I did notice that all ax25 
kernel stuff is no longer enabled as modules by default.

I suspect there has been a change between 2.6.25.1 and 2.6.25.4 because 
in 2.6.25.1 (which I'm compiling now) the ax25 stuff, including SCC, is 
enabled as modules by default.

Perhaps I was to used to what used to be!! Slap on wrist.

Thank you for your suggestion.

Ray vk2tv


Mariusz Kozlowski wrote:

>Hello,
>
>  
>
>>>I grabbed kernel 2.6.24.4 yesterday and there is no option in the ax25 
>>>configuration for the SCC driver.
>>>
>>>Can anyone advise if this is an oversight?
>>>      
>>>
>>Oops. That should read 2.6.25.4
>>    
>>
>
>Did you enable ISA support?
>
>config SCC
>        tristate "Z8530 SCC driver"
>        depends on ISA && AX25 && ISA_DMA_API
>
>
>	Mariusz
>--
>To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>

