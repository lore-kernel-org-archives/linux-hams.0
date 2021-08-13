From: Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH] net: 6pack: fix slab-out-of-bounds in decode_data
Date: Fri, 13 Aug 2021 18:09:16 +0300
Message-ID: <0c5bc329-6555-edb1-82ad-038cae6b0299@gmail.com>
References: <20210813112855.11170-1-paskripkin@gmail.com>
 <20210813145834.GC1931@kadam>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W2ooleetOGxDv6uA8BJbyCwodwSrc5h12weH35wLF8I=;
        b=LJ9tvuR18O6i0e/19G+GiF5PLODO5+OHXzP8X61oleHa7rd6+QZyTd6vEpzqW2nXn+
         JDqJfOqlhI8p6liS+aKZsi6CckOgV/mBo8Dzrlo8LzuzZN3w0uAsjztKJ6aFy+ufc7cK
         129Rolwxw+GSezhVuAAHNlKRpk4nHjreaayZaNc49Yaj1IqmdANowcLxZeu9ZHDVnX06
         bWXMHSJiLIQYEI7I/LZLRvxON0xhRKY1f/dl6ly4db+NMPe+CaN7ku0/Nl33rX8W94DA
         JZeJjhLohf4vBFmm0lGY92hwz1jsKutn6FLLA0VYrG7fEHYCWsYGsOIwyzaoieZ8SBo+
         FAbw==
In-Reply-To: <20210813145834.GC1931@kadam>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+fc8cd9a673d4577fb2e4@syzkaller.appspotmail.com

On 8/13/21 5:58 PM, Dan Carpenter wrote:
> On Fri, Aug 13, 2021 at 02:28:55PM +0300, Pavel Skripkin wrote:
>> Syzbot reported slab-out-of bounds write in decode_data().
>> The problem was in missing validation checks.
>> 
>> Syzbot's reproducer generated malicious input, which caused
>> decode_data() to be called a lot in sixpack_decode(). Since
>> rx_count_cooked is only 400 bytes and noone reported before,
>> that 400 bytes is not enough, let's just check if input is malicious
>> and complain about buffer overrun.
>> 
>> Fail log:
>> ==================================================================
>> BUG: KASAN: slab-out-of-bounds in drivers/net/hamradio/6pack.c:843
>> Write of size 1 at addr ffff888087c5544e by task kworker/u4:0/7
>> 
>> CPU: 0 PID: 7 Comm: kworker/u4:0 Not tainted 5.6.0-rc3-syzkaller #0
>> ...
>> Workqueue: events_unbound flush_to_ldisc
>> Call Trace:
>>  __dump_stack lib/dump_stack.c:77 [inline]
>>  dump_stack+0x197/0x210 lib/dump_stack.c:118
>>  print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
>>  __kasan_report.cold+0x1b/0x32 mm/kasan/report.c:506
>>  kasan_report+0x12/0x20 mm/kasan/common.c:641
>>  __asan_report_store1_noabort+0x17/0x20 mm/kasan/generic_report.c:137
>>  decode_data.part.0+0x23b/0x270 drivers/net/hamradio/6pack.c:843
>>  decode_data drivers/net/hamradio/6pack.c:965 [inline]
>>  sixpack_decode drivers/net/hamradio/6pack.c:968 [inline]
>> 
>> Reported-and-tested-by: syzbot+fc8cd9a673d4577fb2e4@syzkaller.appspotmail.com
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
>> ---
>>  drivers/net/hamradio/6pack.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
>> index fcf3af76b6d7..f4ffc2a80ab7 100644
>> --- a/drivers/net/hamradio/6pack.c
>> +++ b/drivers/net/hamradio/6pack.c
>> @@ -827,6 +827,12 @@ static void decode_data(struct sixpack *sp, unsigned char inbyte)
>>  		return;
>>  	}
>>  
>> +	if (sp->rx_count_cooked + 3 >= sizeof(sp->cooked_buf)) {
> 
> It should be + 2 instead of + 3.
> 
> We write three bytes.  idx, idx + 1, idx + 2.  Otherwise, good fix!
> 

Indeed. Will fix in v2, thank you for pointing it out!


With regards,
Pavel Skripkin
