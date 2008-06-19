From: Al <awvger@sunnyside.com>
Subject: Re: [PATCH] ax25.h unsigned long type for ax25 timers
Date: Thu, 19 Jun 2008 12:38:10 -0700
Message-ID: <485AB5A2.20806@sunnyside.com>
References: <200806171504.38702.bpidoux@free.fr> <20080617.223050.266166325.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20080617.223050.266166325.davem@davemloft.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

David
My impression was that the proposed change did NOT change binary 
interfaces to the kernel, but correctly labeled fields for the first 
time specifically as "long" instead of the fuzzy definition as "int".
While it's true that a non-386 system where "int" is not a "long" would 
be adversely affected, there appear not to be any of those (rare) 
systems running this software, so the point seems entirely moot.
The proposed change improves strict type checking and makes a cleaner 
definition.
I say let it in.
Al

David Miller wrote:
> From: Bernard Pidoux <bpidoux@free.fr>
> Date: Tue, 17 Jun 2008 15:04:38 +0200
>
>   
>> In linux/include/linux/ax25.h
>> ax25_info_struct timers types remain unsigned
>>
>> struct ax25_info_struct {
>> 	unsigned int	n2, n2count;
>> 	unsigned int	t1, t1timer;
>> 	unsigned int	t2, t2timer;
>> 	unsigned int	t3, t3timer;
>> 	unsigned int	idle, idletimer;
>>         .....
>> };
>>
>> while in linux/include/net/ax25.h timers are unsigned long according
>> to kernel 2.6 timers.
>>
>> typedef struct ax25_cb {
>>         .....
>>         struct timer_list       t1timer, t2timer, t3timer, idletimer;
>>         unsigned long           t1, t2, t3, idle, rtt;
>>         ....
>>
>> Although ax25_info_struct is not much used it is refered at least
>> into libax25 and xfbb BBS application program.
>>
>> It seems thus reasonable to make the change.
>>
>> Signed-off-by: Bernard Pidoux <f6bvp@amsat.org>
>>     
>
> Unfortunately this datastructure is exported to userspace,
> and therefore we cannot change the structure layout without
> breaking userspace.
>
> We cannot, as a result, make this change.
>
> The only way to fix this is to make a new fixed structure, and add new
> ax25 calls that accept this new structure.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   
