From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] net: 6pack: fix slab-out-of-bounds in decode_data
Date: Fri, 13 Aug 2021 17:58:34 +0300
Message-ID: <20210813145834.GC1931@kadam>
References: <20210813112855.11170-1-paskripkin@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=nIy5kOhV2tmCy63FhT/+hM0XM9wOm94PgL6RWcV/TAM=;
 b=eJ/YZw8Ad+v4CbUD8jyX1vTl/OT/tmyrHbLqNSI2RqsgXWNN+7XUDgUl1Gx9Ed6vEfx6
 sAWHWKu5urBBy4QgYeRsE8IAXHDX7EQN/fT6+0WcQuqiayQLXZKYHd7baMF9hd9HaPII
 EIXWQb2VPIFSPj49kxkid2+xX44iPj1VWm427/NHTYl0KhH5JIZhQ01RaJX3WC/O/M/K
 Y3v6Vh7mZuDCICKu3ok2TcNa9vF0FNBZhX6gR62Y2t1Msif+PywRFEXqoNlVZ5utpFYA
 4mR2dQduLY1DX+LsDMxRQ5a9iMtHQPvIPml4bMglKqte+oPrOB1mlLaaHo4S7YVswMQI 1A== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=nIy5kOhV2tmCy63FhT/+hM0XM9wOm94PgL6RWcV/TAM=;
 b=bFKe5wHhkOOkbITLsUkL7YyMiWnBpxScOLhy7jy/mYisA7PuGcKdkVzJ9EMxMFjs9bzh
 rj6kZbEmWUZsVIqXqxCHOGO2KzAI199F5FtvNrR/ikDar5HRKru4B8tM+VpCwv/Mz4xq
 lp/GRaSFTZzkcXpl0H1/LvMGXHmecg+SEOzMresTIHp1NX4Doi/Co1xgyDsQP86CSqBl
 wwpYBlec5FnA5e+xLuMhC6FjMJVuzD1TlQmS5XVH+CWJ7j0X5kIDpyM6yNQ1Hyur0dxp
 epAlmTQ33+c1cpYpIjbF/9+JwTaoXlVCglknj96x3XPcYC35RB5JDCkm0mj4O7h4b+sl Pw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIy5kOhV2tmCy63FhT/+hM0XM9wOm94PgL6RWcV/TAM=;
 b=uov2IZwLyjUX2xo96tMeW3fXm8apfrlqa7Ua85ezEpZOw6js5xOA+S9AwSRIcvR7nOLsvDEk0d6CecHWAurvd6hWKaymWR/drNvmspkfuePPlWbQuVJrKVLA5cJ2vFXCQK1HjcSx7xBQZa7zNpw4qz4j9nXjFvMAv8MYXYwJHYg=
Content-Disposition: inline
In-Reply-To: <20210813112855.11170-1-paskripkin@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+fc8cd9a673d4577fb2e4@syzkaller.appspotmail.com

On Fri, Aug 13, 2021 at 02:28:55PM +0300, Pavel Skripkin wrote:
> Syzbot reported slab-out-of bounds write in decode_data().
> The problem was in missing validation checks.
> 
> Syzbot's reproducer generated malicious input, which caused
> decode_data() to be called a lot in sixpack_decode(). Since
> rx_count_cooked is only 400 bytes and noone reported before,
> that 400 bytes is not enough, let's just check if input is malicious
> and complain about buffer overrun.
> 
> Fail log:
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in drivers/net/hamradio/6pack.c:843
> Write of size 1 at addr ffff888087c5544e by task kworker/u4:0/7
> 
> CPU: 0 PID: 7 Comm: kworker/u4:0 Not tainted 5.6.0-rc3-syzkaller #0
> ...
> Workqueue: events_unbound flush_to_ldisc
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x197/0x210 lib/dump_stack.c:118
>  print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
>  __kasan_report.cold+0x1b/0x32 mm/kasan/report.c:506
>  kasan_report+0x12/0x20 mm/kasan/common.c:641
>  __asan_report_store1_noabort+0x17/0x20 mm/kasan/generic_report.c:137
>  decode_data.part.0+0x23b/0x270 drivers/net/hamradio/6pack.c:843
>  decode_data drivers/net/hamradio/6pack.c:965 [inline]
>  sixpack_decode drivers/net/hamradio/6pack.c:968 [inline]
> 
> Reported-and-tested-by: syzbot+fc8cd9a673d4577fb2e4@syzkaller.appspotmail.com
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  drivers/net/hamradio/6pack.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
> index fcf3af76b6d7..f4ffc2a80ab7 100644
> --- a/drivers/net/hamradio/6pack.c
> +++ b/drivers/net/hamradio/6pack.c
> @@ -827,6 +827,12 @@ static void decode_data(struct sixpack *sp, unsigned char inbyte)
>  		return;
>  	}
>  
> +	if (sp->rx_count_cooked + 3 >= sizeof(sp->cooked_buf)) {

It should be + 2 instead of + 3.

We write three bytes.  idx, idx + 1, idx + 2.  Otherwise, good fix!

regards,
dan carpenter

