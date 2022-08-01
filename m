From: Thomas Osterried <thomas@osterried.de>
Subject: Re: rose timer t error displayed in /proc/net/rose
Date: Mon, 1 Aug 2022 10:06:40 +0200
Message-ID: <A9A8A0B7-5009-4FB0-9317-5033DE17E701@osterried.de>
References: <d5e93cc7-a91f-13d3-49a1-b50c11f0f811@free.fr>
 <YucgpeXpqwZuievg@electric-eye.fr.zoreil.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <YucgpeXpqwZuievg@electric-eye.fr.zoreil.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Francois Romieu <romieu@fr.zoreil.com>
Cc: Bernard f6bvp <f6bvp@free.fr>, Eric Dumazet <edumazet@google.com>, linux-hams@vger.kernel.org, Thomas Osterried DL9SAU <thomas@x-berg.in-berlin.de>, netdev@vger.kernel.org

Hello,

> Am 01.08.2022 um 02:39 schrieb Francois Romieu <romieu@fr.zoreil.com>:
> 
> Bernard f6bvp <f6bvp@free.fr> :
>> Rose proc timer t error
>> 
>> Timer t is decremented one by one during normal operations.
>> 
>> When decreasing from 1 to 0 it displays a very large number until next clock
>> tic as demonstrated below.
>> 
>> t1, t2 and t3 are correctly handled.
> 
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
> unsigned long ax25_display_timer(struct timer_list *timer)
> {
> -	if (!timer_pending(timer))
> -		return 0;
> +	long delta = timer->expires - jiffies;
> 
> -	return timer->expires - jiffies;
> +	return jiffies_delta_to_clock_t(delta) * HZ;
> }
> 
> EXPORT_SYMBOL(ax25_display_timer);


1. why do you check for pending timer anymore?

2. I'm not really sure what value jiffies_delta_to_clock_t() returns. jiffies / HZ?
   jiffies_delta_to_clock_t() returns clock_t.

ax25_display_timer() is used in ax25, netrom and rose, mostly for displaying states in /proc.

In ax25_subr.c, ax25_calculate_rtt() it is used for rtt calculation. Is it proven that the the values that ax25_display_timer returns are still as expected?
I ask, because we see there a substraction ax25_display_timer(&ax25->t1timer) from ax25->t1, and we need to be sure, that your change will not break he ax.25 stack.

# grep ax25_display_timer ../*/*c|cut -d/ -f2-
ax25/af_ax25.c:         ax25_info.t1timer   = ax25_display_timer(&ax25->t1timer)   / HZ;
ax25/af_ax25.c:         ax25_info.t2timer   = ax25_display_timer(&ax25->t2timer)   / HZ;
ax25/af_ax25.c:         ax25_info.t3timer   = ax25_display_timer(&ax25->t3timer)   / HZ;
ax25/af_ax25.c:         ax25_info.idletimer = ax25_display_timer(&ax25->idletimer) / (60 * HZ);
ax25/af_ax25.c:            ax25_display_timer(&ax25->t1timer) / HZ, ax25->t1 / HZ,
ax25/af_ax25.c:            ax25_display_timer(&ax25->t2timer) / HZ, ax25->t2 / HZ,
ax25/af_ax25.c:            ax25_display_timer(&ax25->t3timer) / HZ, ax25->t3 / HZ,
ax25/af_ax25.c:            ax25_display_timer(&ax25->idletimer) / (60 * HZ),
ax25/ax25.mod.c:SYMBOL_CRC(ax25_display_timer, 0x14cecd59, "");
ax25/ax25_subr.c:               ax25->rtt = (9 * ax25->rtt + ax25->t1 - ax25_display_timer(&ax25->t1timer)) / 10;
ax25/ax25_timer.c:unsigned long ax25_display_timer(struct timer_list *timer)
ax25/ax25_timer.c:EXPORT_SYMBOL(ax25_display_timer);
netrom/af_netrom.c:                     ax25_display_timer(&nr->t1timer) / HZ,
netrom/af_netrom.c:                     ax25_display_timer(&nr->t2timer) / HZ,
netrom/af_netrom.c:                     ax25_display_timer(&nr->t4timer) / HZ,
netrom/af_netrom.c:                     ax25_display_timer(&nr->idletimer) / (60 * HZ),
netrom/netrom.mod.c:    { 0x14cecd59, "ax25_display_timer" },
rose/af_rose.c:                 ax25_display_timer(&rose->timer) / HZ,
rose/af_rose.c:                 ax25_display_timer(&rose->idletimer) / (60 * HZ),
rose/rose.mod.c:        { 0x14cecd59, "ax25_display_timer" },
rose/rose_route.c:                         ax25_display_timer(&rose_neigh->t0timer) / HZ,
rose/rose_route.c:                         ax25_display_timer(&rose_neigh->ftimer)  / HZ);


3. Back to the initial problem:

>> When decreasing from 1 to 0 it displays a very large number until next clock
>> tic as demonstrated below.

I assume it's the information when timer for rose expired.
If it has been expired 1s ago, the computed time diff diff becomes negative ->  -(jiffies).
We are unsigned long (and imho need to b), but the "underflow" result is something like (2**64)-1-jiffies -- a very large positive number that represents a small negative number.

=> If my assumptions for rose behavior are correct:
1. I expect rose->timer to be restarted soon. If it does not happen, is there a bug?
2. The time window with that large value is large.
3. Are negative numbers (-> timer expired) are of interest? Else, 0 should be enough to indicate that the timer has expired.
   linux/jiffies.h:
     extern clock_t jiffies_to_clock_t(unsigned long x);
    static inline clock_t jiffies_delta_to_clock_t(long delta)
    {
            return jiffies_to_clock_t(max(0L, delta));
    }

   => Negative may be handled due to Francois' patch now correctly. delta as signed long may be negative. max(0L, -nnnn) sould result to 0L.
   This would result to 0. Perhaps proven by Francois, because he used this function and achieved a correct display of that idle value. Francois, am I correct, is "0" really displayed?




