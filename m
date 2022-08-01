From: Bernard f6bvp <f6bvp@free.fr>
Subject: Re: rose timer t error displayed in /proc/net/rose
Date: Mon, 1 Aug 2022 12:43:53 +0200
Message-ID: <3f7e8d1b-e020-9cb1-1e3b-c039ad6d4a0b@free.fr>
References: <d5e93cc7-a91f-13d3-49a1-b50c11f0f811@free.fr>
 <YucgpeXpqwZuievg@electric-eye.fr.zoreil.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
        s=smtp-20201208; t=1659350637;
        bh=PTP/sOHdQVF2QHTamQFRQVvZwN35dhliEDm6YoYZfkk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SQKHZtyEmx9/VDKrA6/BuQKth4CwTZUQIBrP0pELKT8PdaZvv6vlqmpoBLLkIFnZD
         jUokk2Qg9jwIS8WACK9kfYJsntPnoC1uk1vW7Tdezpg0y5JdE1ehv0QbM8XxXjld+M
         Vnd9AKEI4ZWRFXas3WIJy3OspQ58W3160imjWDhKj+P8XSki84UFBOS8QnXILCYE/h
         KPQJpIHcYkO83EMP0aJMUM5TNK+BhlDyx0EHU9aHso3BRL+TP5E7t+GgHjXC/vFMQ9
         Fk1BSukIEhnC+93n0pQO76PqpYe0KQpvikh+KAGyv0r3twVsJnSlYsDT9r+xne0dJp
         b0wS3TO4Aehrw==
Content-Language: en-US
In-Reply-To: <YucgpeXpqwZuievg@electric-eye.fr.zoreil.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Francois Romieu <romieu@fr.zoreil.com>
Cc: Eric Dumazet <edumazet@google.com>, linux-hams@vger.kernel.org, Thomas Osterried DL9SAU <thomas@x-berg.in-berlin.de>, netdev@vger.kernel.org

I used concurrently ~/ax25tools/user_call/rose_call in order to perform 
a connect request to my local node :

./rose_call rose0 f6bvp f6bvp-4 2080175524

Looking again at /proc/net/rose it seems that rose->timer is not stopped 
immediately when 0 value is reached and counts down result to an 
underflow (long -1 value).

After a few more clock tics rose->timer is reinitialized to 180 and rose 
state st changes from 1 to 2.

dest_addr  dest_call src_addr   src_call  dev   lci neigh st vs vr va   t  t1  t2  t3  hb    idle Snd-Q Rcv-Q inode
2080175524 WP-0      2080175524 NODE-0    rose0 001 00001  1  0  0  0   6 200 180 180   5   0/000     0     0 77873
2080175524 F6BVP-4   2080175524 F6BVP-0   rose0 002 00001  2  0  0  0 147 200 180 180   5   0/000     0     0 76283
*          *         2080175524 ROUTE-0   rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 35195
*          *         2080175524 F6BVP-15  rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 35194
*          *         2080175524 WP-0      rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 36456
bernard@ubuntu-f6bvp:~$ cat /proc/net/rose
dest_addr  dest_call src_addr   src_call  dev   lci neigh st vs vr va   t  t1  t2  t3  hb    idle Snd-Q Rcv-Q inode
2080175524 WP-0      2080175524 NODE-0    rose0 001 00001  1  0  0  0 73786976294838200 200 180 180   5   0/000     0     0 77873
2080175524 F6BVP-4   2080175524 F6BVP-0   rose0 002 00001  2  0  0  0 135 200 180 180   5   0/000     0     0 76283
*          *         2080175524 ROUTE-0   rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 35195
*          *         2080175524 F6BVP-15  rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 35194
*          *         2080175524 WP-0      rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 36456
bernard@ubuntu-f6bvp:~$ cat /proc/net/rose
dest_addr  dest_call src_addr   src_call  dev   lci neigh st vs vr va   t  t1  t2  t3  hb    idle Snd-Q Rcv-Q inode
2080175524 WP-0      2080175524 NODE-0    rose0 001 00001  1  0  0  0 73786976294838195 200 180 180   5   0/000     0     0 77873
2080175524 F6BVP-4   2080175524 F6BVP-0   rose0 002 00001  2  0  0  0 131 200 180 180   5   0/000     0     0 76283
*          *         2080175524 ROUTE-0   rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 35195
*          *         2080175524 F6BVP-15  rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 35194
*          *         2080175524 WP-0      rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 36456
bernard@ubuntu-f6bvp:~$ cat /proc/net/rose
dest_addr  dest_call src_addr   src_call  dev   lci neigh st vs vr va   t  t1  t2  t3  hb    idle Snd-Q Rcv-Q inode
2080175524 WP-0      2080175524 NODE-0    rose0 001 00001  2  0  0  0 178 200 180 180   5   0/000     0     0 77873
2080175524 F6BVP-4   2080175524 F6BVP-0   rose0 002 00001  2  0  0  0 129 200 180 180   5   0/000     0     0 76283
*          *         2080175524 ROUTE-0   rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 35195
*          *         2080175524 F6BVP-15  rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 35194
*          *         2080175524 WP-0      rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 36456

At the end of state st 2 count down rose->timer is correctly stopped 
while displaying 0

and rose client applications time out.

dest_call src_addr   src_call  dev   lci neigh st vs vr va   t  t1  t2  t3  hb    idle Snd-Q Rcv-Q inode

2080175524 WP-0      2080175524 NODE-0    rose0 001 00001  2  0  0  0   2 200 180 180   5   0/000     0     0 77873

*          *         2080175524 ROUTE-0   rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 35195

*          *         2080175524 F6BVP-15  rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 35194

*          *         2080175524 WP-0      rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 36456

bernard@ubuntu-f6bvp:~$ cat /proc/net/rose

dest_addr  dest_call src_addr   src_call  dev   lci neigh st vs vr va   t  t1  t2  t3  hb    idle Snd-Q Rcv-Q inode

2080175524 WP-0      2080175524 NODE-0    rose0 001 00001  2  0  0  0   1 200 180 180   5   0/000     0     0 77873

*          *         2080175524 ROUTE-0   rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 35195

*          *         2080175524 F6BVP-15  rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 35194

*          *         2080175524 WP-0      rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 36456

bernard@ubuntu-f6bvp:~$ cat /proc/net/rose

dest_addr  dest_call src_addr   src_call  dev   lci neigh st vs vr va   t  t1  t2  t3  hb    idle Snd-Q Rcv-Q inode

2080175524 WP-0      2080175524 NODE-0    rose0 001 00001  2  0  0  0   0 200 180 180   5   0/000     0     0 77873

*          *         2080175524 ROUTE-0   rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 35195

*          *         2080175524 F6BVP-15  rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 35194

*          *         2080175524 WP-0      rose0 000 00000  0  0  0  0   0 200 180 180   5   0/000     0     0 36456


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

-- 
73 de Bernard f6bvp / ai7bg

http://radiotelescope-lavillette.fr/au-jour-le-jour/

