From: Bernard f6bvp <f6bvp@free.fr>
Subject: Re: rose timer t error displayed in /proc/net/rose
Date: Mon, 1 Aug 2022 10:54:10 +0200
Message-ID: <d94a6cbd-b729-1221-82be-107b5cc57482@free.fr>
References: <d5e93cc7-a91f-13d3-49a1-b50c11f0f811@free.fr>
 <YucgpeXpqwZuievg@electric-eye.fr.zoreil.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
        s=smtp-20201208; t=1659344054;
        bh=t7ZcggIzfCGKdZm279PAEvgOxISgHCQPXK3G3Hen8rw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=MPeOBtmTawwuNHHYlISwqdeuglYQSg0Bq7JagmDZjZnnZL3fhgyKEyxCRjBnSiWLm
         cUFjna0LLdoxrqvrJ2Yb88lAtLZw1u4x6yUu/7lcwYlwFewmCzOrWKW7mP6TAd38QW
         YUZcr9UXoNR5uSrSwX2LeAM5raCQjz81woSHKIiTpztVscMhHHeQfd5ZNB4TjVBqn3
         xw/gc5e7uy9Zf3Y0VgBfc3eWAvCQc1HVIQ/EwzWlomazy/r3dYN8UybcFLIWL2QuW2
         5egf/vpUFln3P2iANav7uZRORQz5mMMe5O45nXKizWMMDQPUE/zVc/QQIZg4eMK2GW
         kqMdhQa332ePA==
Content-Language: en-US
In-Reply-To: <YucgpeXpqwZuievg@electric-eye.fr.zoreil.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Francois Romieu <romieu@fr.zoreil.com>
Cc: Eric Dumazet <edumazet@google.com>, linux-hams@vger.kernel.org, Thomas Osterried DL9SAU <thomas@x-berg.in-berlin.de>, netdev@vger.kernel.org

After applying patch rose->timer displays still t underflow value

dest_addr  dest_call src_addr   src_call dev   lci neigh st vs vr va   
t  t1  t2  t3  hb    idle Snd-Q Rcv-Q inode
2080175524 WP-0      2080175524 NODE-0    rose0 002 00001  1  0 0  0 122 
200 180 180   5   0/000     0     0 37356
*          *         2080175524 ROUTE-0   rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 35195
*          *         2080175524 F6BVP-15  rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 35194
2080835201 WP-0      2080175524 WP-0      rose0 032 00002  1  0 0  0   1 
200 180 180   5   0/000     0     0 41389
2080175520 WP-0      2080175524 WP-0      rose0 032 00003  1  0 0  0   1 
200 180 180   5   0/000     0     0 41388
2080175527 WP-0      2080175524 WP-0      rose0 032 00004  1  0 0  0   1 
200 180 180   5   0/000     0     0 41387
*          *         2080175524 WP-0      rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 36456
2080175524 WP-0      2080175524 FPAD-0    rose0 001 00001  1  0 0  0 
73786976294838206 200 180 180   5   0/000     0     0 36437
*          *         2080175524 ??????-?  rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 36436
root@ubuntu-f6bvp:/home/bernard# cat /proc/net/rose
dest_addr  dest_call src_addr   src_call  dev   lci neigh st vs vr va   
t  t1  t2  t3  hb    idle Snd-Q Rcv-Q inode
2080175524 WP-0      2080175524 NODE-0    rose0 002 00001  1  0 0  0 115 
200 180 180   5   0/000     0     0 37356
*          *         2080175524 ROUTE-0   rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 35195
*          *         2080175524 F6BVP-15  rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 35194
2080835201 WP-0      2080175524 WP-0      rose0 032 00002  2  0 0  0 178 
200 180 180   5   0/000     0     0 41389
2080175520 WP-0      2080175524 WP-0      rose0 032 00003  2  0 0  0 178 
200 180 180   5   0/000     0     0 41388
2080175527 WP-0      2080175524 WP-0      rose0 032 00004  2  0 0  0 178 
200 180 180   5   0/000     0     0 41387
*          *         2080175524 WP-0      rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 36456
2080175524 WP-0      2080175524 FPAD-0    rose0 001 00001  2  0 0  0 178 
200 180 180   5   0/000     0     0 36437
*          *         2080175524 ??????-?  rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 36436

Le 01/08/2022 à 02:39, Francois Romieu a écrit :
> Bernard f6bvp <f6bvp@free.fr> :
>> Rose proc timer t error
>>
>> Timer t is decremented one by one during normal operations.
>>
>> When decreasing from 1 to 0 it displays a very large number until next clock
>> tic as demonstrated below.
>>
>> t1, t2 and t3 are correctly handled.
> "t" is ax25_display_timer(&rose->timer) / HZ whereas "tX" are rose->tX / HZ.
>
> ax25_display_timer() does not like jiffies > timer->expires (and it should
> probably return plain seconds btw).
>
> You may try the hack below.
>
> diff --git a/net/ax25/ax25_timer.c b/net/ax25/ax25_timer.c
> index 85865ebfdfa2..b77433fff0c9 100644
> --- a/net/ax25/ax25_timer.c
> +++ b/net/ax25/ax25_timer.c
> @@ -108,10 +108,9 @@ int ax25_t1timer_running(ax25_cb *ax25)
>   
>   unsigned long ax25_display_timer(struct timer_list *timer)
>   {
> -	if (!timer_pending(timer))
> -		return 0;
> +	long delta = timer->expires - jiffies;
>   
> -	return timer->expires - jiffies;
> +	return jiffies_delta_to_clock_t(delta) * HZ;
>   }
>   
>   EXPORT_SYMBOL(ax25_display_timer);

