From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: Re: 2.6.13 mkiss update?
Date: Thu, 5 Jan 2006 09:17:57 -0500
Message-ID: <001901c61202$d3f79310$680ea8c0@LoJackOne.LoJack.com>
References: <003301c6114b$180ecb80$680ea8c0@LoJackOne.LoJack.com> <8BD9A378-7AF9-41DB-BE04-1EAD876ECB5D@oz.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: linux-hams@vger.kernel.org

I was successful in building 2.6.14-5 from source via kernel.org and loading 
and configuring ax25 on my 10.0 test system.  I have not yet connected a TNC 
and radio yet.  That will come next.  At least the modules load and 
kissattach works.

There are too many changes to easily back patch the sources to the 2.6.13 
kernel.  The SuSE kotd 2.6.15 build from January 2 hard locks the system 
when doing kissattach.  I hope that isn't a bad sign for future releases.

Once OpenSuSE 10.1 beta is available, I'll try loading that.  My production 
servers will stay at 9.3 until 10.1 gets officially released and I have 
tested it thoroughly.

Mike, W1NR

----- Original Message ----- 
From: "Bob Nielsen" <nielsen@oz.net>
To: "Mike McCarthy, W1NR" <lists@w1nr.net>
Cc: <linux-hams@vger.kernel.org>
Sent: Wednesday, January 04, 2006 12:03 PM
Subject: Re: 2.6.13 mkiss update?


>I thought it was the ax25 module that was broken.  In any case,  2.6.14 
>(and presumably 2.6.15) works, so you could try one of them.   If there is 
>some other reason why you need 2.6.13, download a later  kernel and try 
>replacing ax25.c and mkiss.c with the later versions  and recompiling the 
>kernel (this may or may not work, depending on  other changes).  You can 
>get the source from ftp.kernel.org in the / pub/linux/kernel/v2.6 
>directory.
>
> Bob, N7XY
> On Jan 4, 2006, at 8:22 AM, Mike McCarthy, W1NR wrote:
>
>> I am running opensuse 10.0 with kernel 2.6.13-15.7 and the mkiss  module 
>> is broken.  In looking through the archives it appears that  it got fixed 
>> in 2.6.14.  Will there be a patch released for the  2.6.13 kernel that 
>> will propagate to the opensuse online update?   Where can I get the 
>> latest source file for mkiss that I can  manually compile it under 
>> 2.6.13?
>>
>> Thanks,
>> Mike, W1NR
>>
>> -
>> To unsubscribe from this list: send the line "unsubscribe linux- hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

