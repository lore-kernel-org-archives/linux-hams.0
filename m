From: Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH] net: 6pack: fix slab-out-of-bounds in decode_data
Date: Sat, 14 Aug 2021 17:17:44 +0300
Message-ID: <1021b8cb-e763-255f-1df9-753ed2934b69@gmail.com>
References: <20210813112855.11170-1-paskripkin@gmail.com>
 <20210813145834.GC1931@kadam> <20210814002345.GA19994@auricle.kd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LmN8AjLyVtZIe0c8A8b2Bofe2fcHgxC16V0C8hTy0RA=;
        b=GLvRpM7DDVbbViD09WZVyRPPCR9PHvtB3Qgoj65HXazddUlbbgyihC+4bg6jbwIkSz
         MFCHvmPMM1MUBFGFfKkXl9dxMRwMSMD1LNvlftvLe6wLIsUkUiGauNEej1nphCrYDv4r
         AlF85v+Rrynvq12W+UK55uQ1oDd3Ko/dmTqzjlFOg/zecaV8pKdcprnEN7aSm+eIMwhx
         Sh+R3sDVcXBwpkXZOLoOVV3NGP0igG0BSLhwUyR+J8VQg8XA6rHg9UVWVj3/HvCbz88Y
         BLOiOnp0Am9GF4008pfP64+JcQEATtcrhBl8zfytvilU7+E2Pj9swRUEdvKeqXPe7F13
         FShA==
In-Reply-To: <20210814002345.GA19994@auricle.kd>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kevin Dawson <hal@kd.net.au>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+fc8cd9a673d4577fb2e4@syzkaller.appspotmail.com

On 8/14/21 3:23 AM, Kevin Dawson wrote:
> On Fri, Aug 13, 2021 at 05:58:34PM +0300, Dan Carpenter wrote:
>> On Fri, Aug 13, 2021 at 02:28:55PM +0300, Pavel Skripkin wrote:
>> > Syzbot reported slab-out-of bounds write in decode_data().
>> > The problem was in missing validation checks.
>> > 
>> > Syzbot's reproducer generated malicious input, which caused
>> > decode_data() to be called a lot in sixpack_decode(). Since
>> > rx_count_cooked is only 400 bytes and noone reported before,
>> > that 400 bytes is not enough, let's just check if input is malicious
>> > and complain about buffer overrun.
>> > 
>> > ...
>> > 
>> > diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
>> > index fcf3af76b6d7..f4ffc2a80ab7 100644
>> > --- a/drivers/net/hamradio/6pack.c
>> > +++ b/drivers/net/hamradio/6pack.c
>> > @@ -827,6 +827,12 @@ static void decode_data(struct sixpack *sp, unsigned char inbyte)
>> >  		return;
>> >  	}
>> >  
>> > +	if (sp->rx_count_cooked + 3 >= sizeof(sp->cooked_buf)) {
>> 
>> It should be + 2 instead of + 3.
>> 
>> We write three bytes.  idx, idx + 1, idx + 2.  Otherwise, good fix!
> 
> I would suggest that the statement be:
> 
> 	if (sp->rx_count_cooked + 3 > sizeof(sp->cooked_buf)) {
> 
> or even, because it's a buffer overrun test:
> 
> 	if (sp->rx_count_cooked > sizeof(sp->cooked_buf) - 3) {
>

Hmm, I think, it will be more straightforward for someone not aware 
about driver details.

@Dan, can I add your Reviewed-by tag to v3 and what do you think about 
Kevin's suggestion?


> This is because if there are three bytes being written, that is the number that should be obvious in the test.
> 
> I haven't looked at the surrounding code and there may be some other consideration why the "+ 2 >=" rather than "+ 3 >" (and from the description of "idx, idx + 1, idx + 2", I suspect it's visual consistency), so if that is important, feel free to adjust as required.
>



With regards,
Pavel Skripkin


