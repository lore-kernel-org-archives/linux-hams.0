From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v2 08/17] baycom_epp: Replace rdtscl() with native_read_tsc()
Date: Mon, 15 Jun 2015 16:15:45 -0700
Message-ID: <CALCETrU0b3u5jiSQe-Z97cNXhRD4Dq2tNbBf=YG9Pdom+CU1PA@mail.gmail.com>
References: <cover.1434152603.git.luto@kernel.org> <1195ce0c7f34169ff3006341b77806184a46b9bf.1434152603.git.luto@kernel.org>
 <557C09B0.3020301@bfs.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <557C09B0.3020301@bfs.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de
Cc: Andy Lutomirski <luto@kernel.org>, X86 ML <x86@kernel.org>, Borislav Petkov <bp@suse.de>, Peter Zijlstra <peterz@infradead.org>, John Stultz <john.stultz@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Len Brown <lenb@kernel.org>, Huang Rui <ray.huang@amd.com>, Denys Vlasenko <dvlasenk@redhat.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org

On Sat, Jun 13, 2015 at 3:45 AM, walter harms <wharms@bfs.de> wrote:
> Hello,
> please add a line what is the difference between V1 and V2.
>

There is none.  v1 was screwed up elsewhere in the series.

This is part of a larger series to clean up the rdtsc inlines and
macros.  I'm hoping for an ack so this can go in through -tip.

Thanks,
Andy

> re,
>  wh
>
> Am 13.06.2015 01:44, schrieb Andy Lutomirski:
>> This is only used if BAYCOM_DEBUG is defined.
>>
>> Cc: Thomas Sailer <t.sailer@alumni.ethz.ch>
>> Cc: linux-hams@vger.kernel.org
>> Signed-off-by: Andy Lutomirski <luto@kernel.org>
>> ---
>>  drivers/net/hamradio/baycom_epp.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
>> index 83c7cce0d172..44e5c3b5e0af 100644
>> --- a/drivers/net/hamradio/baycom_epp.c
>> +++ b/drivers/net/hamradio/baycom_epp.c
>> @@ -638,7 +638,7 @@ static int receive(struct net_device *dev, int cnt)
>>  #define GETTICK(x)                                                \
>>  ({                                                                \
>>       if (cpu_has_tsc)                                          \
>> -             rdtscl(x);                                        \
>> +             x = (unsigned int)native_read_tsc();              \
>>  })
>>  #else /* __i386__ */
>>  #define GETTICK(x)



-- 
Andy Lutomirski
AMA Capital Management, LLC
