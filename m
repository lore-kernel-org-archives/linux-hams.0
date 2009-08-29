From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: debugging KISS basics
Date: Sun, 30 Aug 2009 08:25:06 +1000
Message-ID: <4A99AAC2.9050805@exemail.com.au>
References: <200811271410.mAREAO6t019051@moose.dimebank.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200811271410.mAREAO6t019051@moose.dimebank.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Kantarjiev <cak@dimebank.com>
Cc: linux-hams@vger.kernel.org

Chris,

I use KISS only EPROMs so can't offer any help re the TNC. You may find 
this HOWTO provides some useful kernel ax25 info.

http://rose.fpac.free.fr/MINI-HOWTO/

Don't be put off by the title.

Ray vk2tv

Chris Kantarjiev wrote:
> Sorry for the n00b questions, but: how do I go about debugging
> the basic KISS functionality? As I said, I can talk to my
> FTDI-based TNC with minicom and it works to control the radio
> and pass packets in CONV mode. But any attempt to use, say,
> the call program in KISS mode fails. 
>
> Since it's a USB modem, I really don't have any good way to tap 
> into the signal lines going to the TNC (and wouldn't know
> how to interpret them). Are there options that I can use
> to debug the communications?
>
> And while I'm asking ... what's the typical way of putting
> a TNC into KISS mode at boot time, and what do people use
> to get things started from /etc/rc? I had sort of expected
> to find a prototype /etc/init.d script for ax25d, but didn't...
>
> 73 de chris K6DBG
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

