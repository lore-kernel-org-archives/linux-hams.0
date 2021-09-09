From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: 6pack: Fix tx timeout and slot time
Date: Thu, 09 Sep 2021 16:27:21 +0100 (BST)
Message-ID: <20210909.162721.1267526781289116670.davem@davemloft.net>
References: <20210909035743.1247042-1-linux@roeck-us.net>
        <20210909.123442.1648633411296774237.davem@davemloft.net>
        <751f5079-2da1-187e-573c-d7d2d6743bbf@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <751f5079-2da1-187e-573c-d7d2d6743bbf@roeck-us.net>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux@roeck-us.net
Cc: ajk@comnets.uni-bremen.de, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Guenter Roeck <linux@roeck-us.net>
Date: Thu, 9 Sep 2021 07:53:29 -0700

> On 9/9/21 4:34 AM, David Miller wrote:
>> From: Guenter Roeck <linux@roeck-us.net>
>> Date: Wed,  8 Sep 2021 20:57:43 -0700
>> 
>>> tx timeout and slot time are currently specified in units of HZ.
>>> On Alpha, HZ is defined as 1024. When building alpha:allmodconfig,
>>> this results in the following error message.
>>>
>>> drivers/net/hamradio/6pack.c: In function 'sixpack_open':
>>> drivers/net/hamradio/6pack.c:71:41: error:
>>> 	unsigned conversion from 'int' to 'unsigned char'
>>> 	changes value from '256' to '0'
>>>
>>> In the 6PACK protocol, tx timeout is specified in units of 10 ms
>>> and transmitted over the wire. Defining a value dependent on HZ
>>> doesn't really make sense. Assume that the intent was to set tx
>>> timeout and slot time based on a HZ value of 100 and use constants
>>> instead of values depending on HZ for SIXP_TXDELAY and SIXP_SLOTTIME.
>>>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>> No idea if this is correct or even makes sense. Compile tested only.
>> These are timer offsets so they have to me HZ based.  Better to make
>> the
>> structure members unsigned long, I think.
>> 
> 
> Hmm, ok. Both tx_delay and slottime are updated in sp_encaps(),
> though,
> from data in the transmit buffer. The KISS protocol description states
> that the values are in units of 10ms; that is where my assumption
> came from.

They are ms and must be converted using to HZ in order to use the values as timer offsets.

The values are perfectly fine, the types used to store them need to be fixed.

> Anyway, I am inclined to just mark the protocol as dependent on
> !ALPHA. Would you accept that ?

No, fix this properly.  Make the unsigfned char members be unsigned long.

Why do you not want to fix it this way?

Thank you.
