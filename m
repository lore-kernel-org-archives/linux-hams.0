From: Alan Crosswell <alan@columbia.edu>
Subject: Re: debugging KISS basics
Date: Sat, 29 Aug 2009 19:11:08 -0400
Message-ID: <4A73508C-FE9A-41CD-A48B-F483E32F1706@columbia.edu>
References: <200811271410.mAREAO6t019051@moose.dimebank.com> <4A99AAC2.9050805@exemail.com.au>
Mime-Version: 1.0 (iPhone Mail 7A400)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4A99AAC2.9050805@exemail.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Ray Wells <vk2tv@exemail.com.au>
Cc: Chris Kantarjiev <cak@dimebank.com>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

Chris,

Have you considered using a soundmodem instead of that 1980's  
technology TNC?  With a sound card and parallel or serial port for PTT  
you can get better results than most TNCs.

I run 3, soon to be 4 digipeaters 7x24 with both PCI and USB sound  
cards.
/a


On Aug 29, 2009, at 6:25 PM, Ray Wells <vk2tv@exemail.com.au> wrote:

> Chris,
>
> I use KISS only EPROMs so can't offer any help re the TNC. You may  
> find this HOWTO provides some useful kernel ax25 info.
>
> http://rose.fpac.free.fr/MINI-HOWTO/
>
> Don't be put off by the title.
>
> Ray vk2tv
>
> Chris Kantarjiev wrote:
>> Sorry for the n00b questions, but: how do I go about debugging
>> the basic KISS functionality? As I said, I can talk to my
>> FTDI-based TNC with minicom and it works to control the radio
>> and pass packets in CONV mode. But any attempt to use, say,
>> the call program in KISS mode fails.
>> Since it's a USB modem, I really don't have any good way to tap  
>> into the signal lines going to the TNC (and wouldn't know
>> how to interpret them). Are there options that I can use
>> to debug the communications?
>>
>> And while I'm asking ... what's the typical way of putting
>> a TNC into KISS mode at boot time, and what do people use
>> to get things started from /etc/rc? I had sort of expected
>> to find a prototype /etc/init.d script for ax25d, but didn't...
>>
>> 73 de chris K6DBG
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux- 
>> hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux- 
> hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
