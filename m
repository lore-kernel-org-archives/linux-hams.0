From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] net: 6pack: Fix tx timeout and slot time
Date: Thu, 9 Sep 2021 07:53:29 -0700
Message-ID: <751f5079-2da1-187e-573c-d7d2d6743bbf@roeck-us.net>
References: <20210909035743.1247042-1-linux@roeck-us.net>
 <20210909.123442.1648633411296774237.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TM4uR7MYSBmGP5NBL1zBrMe7eUBmghAcfkl2JUGwpAI=;
        b=O10es/ON911runMDSkfuH0UU/Qc1B70lCG/VlA8X2egEqUF3DaobxWWLhSaxWcrkyd
         Hx9itcKE7CFlcaKNJrW7kzDw6vq90btHnnui3yX/llEUYOZxBYhix1YZOw8uExbQITfA
         rPfCeaM7T7j1yURY03JgBnAR+PSyzjQAjmlvhuFlNxnRYbYWKRywZzVAWX/jhLBI1uJD
         KR0bq67fm5NwM4X1BGkYFvMIalTZEY9RA6Q+ll1OlY1d+c0Wf0CE04N3PCiqpz9u26On
         Nc1ljwIGs9jn/z96fpr4t0a8Q9aMp81QrhNzthPMR2Ptrke1qHh2tgP6YAxdP3CRKah9
         WG2w==
Sender: Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <20210909.123442.1648633411296774237.davem@davemloft.net>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Miller <davem@davemloft.net>
Cc: ajk@comnets.uni-bremen.de, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On 9/9/21 4:34 AM, David Miller wrote:
> From: Guenter Roeck <linux@roeck-us.net>
> Date: Wed,  8 Sep 2021 20:57:43 -0700
> 
>> tx timeout and slot time are currently specified in units of HZ.
>> On Alpha, HZ is defined as 1024. When building alpha:allmodconfig,
>> this results in the following error message.
>>
>> drivers/net/hamradio/6pack.c: In function 'sixpack_open':
>> drivers/net/hamradio/6pack.c:71:41: error:
>> 	unsigned conversion from 'int' to 'unsigned char'
>> 	changes value from '256' to '0'
>>
>> In the 6PACK protocol, tx timeout is specified in units of 10 ms
>> and transmitted over the wire. Defining a value dependent on HZ
>> doesn't really make sense. Assume that the intent was to set tx
>> timeout and slot time based on a HZ value of 100 and use constants
>> instead of values depending on HZ for SIXP_TXDELAY and SIXP_SLOTTIME.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> No idea if this is correct or even makes sense. Compile tested only.
> 
> These are timer offsets so they have to me HZ based.  Better to make the
> structure members unsigned long, I think.
> 

Hmm, ok. Both tx_delay and slottime are updated in sp_encaps(), though,
from data in the transmit buffer. The KISS protocol description states
that the values are in units of 10ms; that is where my assumption
came from.

Command        Function         Comments
    0           Data frame       The  rest  of the frame is data to
                                 be sent on the HDLC channel.

    1           TXDELAY          The next  byte  is  the  transmitter
                                 keyup  delay  in  10 ms units.
                 		The default start-up value is 50
                                 (i.e., 500 ms).

    2           P                The next byte  is  the  persistence
                                 parameter,  p, scaled to the range
                                 0 - 255 with the following
                                 formula:

                                          P = p * 256 - 1

                                 The  default  value  is  P  =  63
                                 (i.e.,  p  =  0.25).

    3           SlotTime         The next byte is the slot interval
                                 in 10 ms units.
                                 The default is 10 (i.e., 100ms).

But then slottime is indeed used with jiffies, which is odd.

tx_delay is used (before it is updated) in encode_sixpack()
and added to a character buffer. I thought that was the value sent
on the wire (which would again be supposed to be in 10ms units).
I don't see where else it is used, but I may be missing it.
That means though it can not easily be changed to anything
but unsigned char.

Anyway, I am inclined to just mark the protocol as dependent on
!ALPHA. Would you accept that ?

Thanks,
Guenter
