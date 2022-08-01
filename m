From: Francois Romieu <romieu@fr.zoreil.com>
Subject: Re: rose timer t error displayed in /proc/net/rose
Date: Mon, 1 Aug 2022 02:39:01 +0200
Message-ID: <YucgpeXpqwZuievg@electric-eye.fr.zoreil.com>
References: <d5e93cc7-a91f-13d3-49a1-b50c11f0f811@free.fr>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 violet.fr.zoreil.com 2710d2S42336390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fr.zoreil.com;
        s=v20220413; t=1659314342;
        bh=Zxv04oT1Cg4jN72m0ayc33xrbu48Tl96Y3zZxHd+yR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OSyI+AUBfRVw5UjMTX0g9/HhOzc/DxiAb0Oy1ruUwgx2MNTkiWHLsmm3bWkSemlls
         pIRTkoltGcLYch6yIVXNPuEv+tu451qsXFzGjNmzONu4eifUxkG2KodrYncb8zHBn6
         L/qsj3tXw7Lb05wQ9qy0NwFBFtSltT768AHVwV7k=
Content-Disposition: inline
In-Reply-To: <d5e93cc7-a91f-13d3-49a1-b50c11f0f811@free.fr>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard f6bvp <f6bvp@free.fr>
Cc: Eric Dumazet <edumazet@google.com>, linux-hams@vger.kernel.org, Thomas Osterried DL9SAU <thomas@x-berg.in-berlin.de>, netdev@vger.kernel.org

Bernard f6bvp <f6bvp@free.fr> :
> Rose proc timer t error
> 
> Timer t is decremented one by one during normal operations.
> 
> When decreasing from 1 to 0 it displays a very large number until next clock
> tic as demonstrated below.
> 
> t1, t2 and t3 are correctly handled.

"t" is ax25_display_timer(&rose->timer) / HZ whereas "tX" are rose->tX / HZ.

ax25_display_timer() does not like jiffies > timer->expires (and it should
probably return plain seconds btw).

You may try the hack below.

diff --git a/net/ax25/ax25_timer.c b/net/ax25/ax25_timer.c
index 85865ebfdfa2..b77433fff0c9 100644
--- a/net/ax25/ax25_timer.c
+++ b/net/ax25/ax25_timer.c
@@ -108,10 +108,9 @@ int ax25_t1timer_running(ax25_cb *ax25)
 
 unsigned long ax25_display_timer(struct timer_list *timer)
 {
-	if (!timer_pending(timer))
-		return 0;
+	long delta = timer->expires - jiffies;
 
-	return timer->expires - jiffies;
+	return jiffies_delta_to_clock_t(delta) * HZ;
 }
 
 EXPORT_SYMBOL(ax25_display_timer);
