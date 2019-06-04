From: walter harms <wharms@bfs.de>
Subject: Re: [PATCH] rose: af_rose: avoid overflows in rose_setsockopt()
Date: Tue, 04 Jun 2019 15:13:50 +0200
Message-ID: <5CF66E8E.1050100@bfs.de>
References: <1559650290-17054-1-git-send-email-92siuyang@gmail.com>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1559654031; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uuat3jEUgV8d8Ls/g6U2agD8YFGq9VD0MoYpCf6RTtE=;
        b=jbJA1LoMy6ZCrN+Yt7gIMk/+5Jeb1t7lbzGGwwakeH3JdRsN51rsO47xUy2PvFva9lwLUb
        lLykpLmrMnIIwKNyFtk7ZJS/oEvge4iO6O+2PRd9o2lJtMPKb34xkQq5WOPrzBsEJd585J
        g7WiJMjlrwqyfNy9nkH7CypdTokQJgR4It37Oq9YyP0CVqEZaIXTLK2G60XF3Fbtih0r6g
        EZxwPmTpYnuP0i1+JdFnadHY98R8jRmYZcPtAVWGuAHo5X2Nq4eM58zSkWkX6FTHvW++5o
        AipUvdLe1rM0SKWdvVgUidigbKTpUUOzyhBpTEibLMCSjWLOLb9P5EIrtTOtxA==
In-Reply-To: <1559650290-17054-1-git-send-email-92siuyang@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Young Xiao <92siuyang@gmail.com>
Cc: ralf@linux-mips.org, davem@davemloft.net, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org



Am 04.06.2019 14:11, schrieb Young Xiao:
> Check setsockopt arguments to avoid overflows and return -EINVAL for
> too large arguments.
> 
> See commit 32288eb4d940 ("netrom: avoid overflows in nr_setsockopt()")
> for details.
> 
> Signed-off-by: Young Xiao <92siuyang@gmail.com>
> ---
>  net/rose/af_rose.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
> index e274bc6..af831ee9 100644
> --- a/net/rose/af_rose.c
> +++ b/net/rose/af_rose.c
> @@ -372,15 +372,15 @@ static int rose_setsockopt(struct socket *sock, int level, int optname,
>  {
>  	struct sock *sk = sock->sk;
>  	struct rose_sock *rose = rose_sk(sk);
> -	int opt;
> +	unsigned long opt;
>  
>  	if (level != SOL_ROSE)
>  		return -ENOPROTOOPT;
>  
> -	if (optlen < sizeof(int))
> +	if (optlen < sizeof(unsigned int))
>  		return -EINVAL;

I do not thing that this will change much,
but maybe you would like to check against the sizeof (opt) here ?


>  
> -	if (get_user(opt, (int __user *)optval))
> +	if (get_user(opt, (unsigned int __user *)optval))
>  		return -EFAULT;
>  
>  	switch (optname) {
> @@ -389,31 +389,31 @@ static int rose_setsockopt(struct socket *sock, int level, int optname,
>  		return 0;
>  


>  	case ROSE_T1:
> -		if (opt < 1)
> +		if (opt < 1 || opt > ULONG_MAX / HZ)
>  			return -EINVAL;
>  		rose->t1 = opt * HZ;
>  		return 0;
>  
>  	case ROSE_T2:
> -		if (opt < 1)
> +		if (opt < 1 || opt > ULONG_MAX / HZ)
>  			return -EINVAL;
>  		rose->t2 = opt * HZ;
>  		return 0;
>  
>  	case ROSE_T3:
> -		if (opt < 1)
> +		if (opt < 1 || opt > ULONG_MAX / HZ)
>  			return -EINVAL;
>  		rose->t3 = opt * HZ;
>  		return 0;
>  
>  	case ROSE_HOLDBACK:
> -		if (opt < 1)
> +		if (opt < 1 || opt > ULONG_MAX / HZ)
>  			return -EINVAL;
>  		rose->hb = opt * HZ;
>  		return 0;

 you can simplify this jungle by checking and calculation first
 and then set the correct rose->XX

>  
>  	case ROSE_IDLE:
> -		if (opt < 0)
> +		if (opt < 0 || opt > ULONG_MAX / HZ)
>  			return -EINVAL;

You made opt unsigned or ?

>  		rose->idle = opt * 60 * HZ;
>  		return 0;

my 2 cents,

re,
 wh
