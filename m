From: Frank Smith <frankiansmith@gmail.com>
Subject: Re: debugging KISS basics
Date: Sat, 29 Aug 2009 20:50:48 -0300
Message-ID: <02E88D3E-63AA-4450-A3DD-FC31AF631371@gmail.com>
References: <200811271410.mAREAO6t019051@moose.dimebank.com> <4A99AAC2.9050805@exemail.com.au>
Mime-Version: 1.0 (iPod Mail 7A341)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:in-reply-to:x-mailer
         :subject:references:message-id:content-type
         :content-transfer-encoding:mime-version:date:cc;
        bh=m+Etpp/4Kq7mfWpxw3KQSCLga5q923zFCOtP9FqZs08=;
        b=N197hUGRTG9JPAkTqNp7HOuUrp5b3YNmBOaDRJ5Q1Er9DUTNuZh5sVj7Rex19VgImJ
         OjvFyTaH6zfksfpCTJkocCo6lDL2unIGEpLEA9p9qgeXeCAW53z6exfDe+q5TgmuQFPm
         piu7111IKbP0OXt6FUIVOM7XURtM7VxZ79e70=
In-Reply-To: <4A99AAC2.9050805@exemail.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Ray Wells <vk2tv@exemail.com.au>
Cc: Chris Kantarjiev <cak@dimebank.com>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

Have you tried using 'strace' to see what data is being sent to and  
received from the TNC?

On 2009-08-29, at 7:25 PM, Ray Wells <vk2tv@exemail.com.au> wrote:

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
