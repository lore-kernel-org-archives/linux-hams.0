From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Subject: Re: [PATCH] rose: check NULL rose_loopback_neigh->loopback
Date: Wed, 17 Aug 2022 11:20:20 +0200
Message-ID: <23ba9201-f2e0-ae32-62fc-1b34c356e690@gmail.com>
References: <20220816185140.9129-1-bernard.f6bvp@gmail.com>
 <YvwSxBhoMl0ueJ3z@electric-eye.fr.zoreil.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=7ikS/qYVcv7wXWd3CVl9CZRmAH6FRtV4e+F1Li60Jxc=;
        b=e9PYfA+7XIjfCnelW8fRFC+mer4w5uHsuXU7z0/pgXLd1vzzoV37G3pyMEgEv+cvq5
         mUQUpQXkKN60DAmTB0lrjHz/m59ttO+V2km1sWQvsZ9HvWcIu11UV2dH+6iyJEfgE4BF
         k3dnxAPJQkP7SKW8m7+kb+MPPlxCPWpqBE+O3XUVz9RFXCMHrlzxo7LTfm2knERxT8HV
         oEmoxnIxMSN/SPiVkEYGCVJwK4H0CldAnBztSpJOyR+9ro3gTgGmvv2LtQrqzJoRlW6v
         R5Ev3MyUsJ3RGKw3cX8PdaI8AQuo0VqYnFmfNrIJ8VvaAfPfQZOGbSrBaZNKWvzgs7PX
         3a6Q==
Content-Language: en-US
In-Reply-To: <YvwSxBhoMl0ueJ3z@electric-eye.fr.zoreil.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Francois Romieu <romieu@fr.zoreil.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, "Bernard f6bvp@free" <f6bvp@free.fr>

Hi,

I absolutely agree with all your remarks, suggestions and nice 
improvement to my patch.

As I am definitively an amateur and not familiar with git send-email, 
may I ask you to resubmit the modified patch for me including:

Suggested-by Francois Romieu <romieu@fr.zoreil.com>

Thanks a lot.

Bernard

Le 16/08/2022 à 23:57, Francois Romieu a écrit :
> bernard.f6bvp@gmail.com <bernard.f6bvp@gmail.com> :
>> From: Bernard <bernard.f6bvp@gmail.com>
>>
>> Since kernel 5.4.83 rose network connections were no more possible.
>> Last good rose module was with kernel 5.4.79.
>>
>> Francois Romieu <romieu@fr.zoreil.com> pointed the scope of changes to
>> the attached commit (3b3fd068c56e3fbea30090859216a368398e39bf
>> in mainline, 7f0ddd41e2899349461b578bec18e8bd492e1765 in stable).
> 
> The attachment did not follow the references from the original mail. :o/
> 
> The paragraph above may be summarized as:
> 
> Fixes: 3b3fd068c56e ("rose: Fix Null pointer dereference in rose_send_frame()")
> 
> ("Suggested-by" would be utter gourmandise)
> 
> [...]
>> IMHO this patch should be propagated back to LTS 5.4 kernel.
> 
> 3b3fd068c56e is itself tagged as 'Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")',
> i.e. 'problem exists since git epoch back in 2005'. Stable people will
> probably apply your fix wherever 3b3fd068c56e has been applied or backported,
> namely anything post v5.10, stable v5.4, stable v4.19 and stable v4.14.
> 
>> Signed-off-by: Bernard Pidoux <f6bvp@free.fr>
>> ---
>>   net/rose/rose_loopback.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
>> index 11c45c8c6c16..1c673db52636 100644
>> --- a/net/rose/rose_loopback.c
>> +++ b/net/rose/rose_loopback.c
>> @@ -97,8 +97,10 @@ static void rose_loopback_timer(struct timer_list *unused)
>>
>> 		if (frametype == ROSE_CALL_REQUEST) {
>> 			if (!rose_loopback_neigh->dev) {
>> -				kfree_skb(skb);
>> -				continue;
>> +				if (!rose_loopback_neigh->loopback) {
>> +					kfree_skb(skb);
>> +					continue;
>> +				}
> 
> FWIW, avoiding the extra indentation may be marginally more idiomatic:
> 
> @@ -96,7 +96,8 @@ static void rose_loopback_timer(struct timer_list *unused)
> 		}
> 
> 		if (frametype == ROSE_CALL_REQUEST) {
> -			if (!rose_loopback_neigh->dev) {
> +			if (!rose_loopback_neigh->dev &&
> +			    !rose_loopback_neigh->loopback) {
>   				kfree_skb(skb);
>   				continue;
> 			}
> Good night.
> 
