From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH] net: ax25: replace bh_lock_sock with lock_sock_fast in
 ax25_rt_autobind
Date: Wed, 3 Apr 2019 20:51:53 -0700
Message-ID: <c5f89148-0d0a-f81c-5d0d-b631c36196ca@gmail.com>
References: <1554339063-28712-1-git-send-email-lirongqing@baidu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=u2DTdhZiQP1PGkx0eyTRuGtaHSuG6EqxXECeN3Tccgc=;
        b=VjN+sru3iI3wgpNpTh/ZrWX6+I71XDqZUn4A4DhbtjJi/JTsbd0VwHRIDg3IMNWEHY
         a99ZrqG6NvWD5UosXn4RGs5zqgIZGQDPc5sLbIsjSTQFNm7IOUlAondDK2v5xQhWLoLH
         8u/WrDTco9ws5tObEhTnau6fwaIMfVsWWon6fREibZCkdSAYOehXgHMYVD6kQ2ta9r4H
         OquWHBY4YTSAL/ZS/yNpdb6jXWNYFS2hNLzko4bkHSX4J1qiaNGf2q+QhOhI1Qea4mY7
         Youn4/GCNAQvyxQydhtTiEUjbMarO0NwyIuzsyqqkh9kVC56xSir9bIp9yuOd/xTe/um
         qxyw==
In-Reply-To: <1554339063-28712-1-git-send-email-lirongqing@baidu.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Li RongQing <lirongqing@baidu.com>, ralf@linux-mips.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org



On 04/03/2019 05:51 PM, Li RongQing wrote:
> ax25_rt_autobind is always called in user context, so lock_sock_fast
> should be used, and bh_lock_sock should only be used in BH context
> this replacement fixes a possible deadlock
> 


> 
> Reported-by: syzbot+e350b81e95a6a214da8a@syzkaller.appspotmail.com
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>  net/ax25/ax25_route.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ax25/ax25_route.c b/net/ax25/ax25_route.c
> index 66f74c85cf6b..28e21259ff08 100644
> --- a/net/ax25/ax25_route.c
> +++ b/net/ax25/ax25_route.c
> @@ -429,9 +429,11 @@ int ax25_rt_autobind(ax25_cb *ax25, ax25_address *addr)
>  	}
>  
>  	if (ax25->sk != NULL) {
> -		bh_lock_sock(ax25->sk);
> +		bool slow;
> +
> +		slow = lock_sock_fast(ax25->sk);
>  		sock_reset_flag(ax25->sk, SOCK_ZAPPED);
> -		bh_unlock_sock(ax25->sk);
> +		unlock_sock_fast(ax25->sk, slow);
>  	}
>  
>  put:
> 

How have you tested this patch exactly ?
