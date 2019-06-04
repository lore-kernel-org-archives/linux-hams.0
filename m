From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH] rose: af_rose: avoid overflows in rose_setsockopt()
Date: Tue, 4 Jun 2019 06:31:29 -0700
Message-ID: <a3ac9063-b11a-347d-713b-846907765366@gmail.com>
References: <1559650290-17054-1-git-send-email-92siuyang@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=3b5aub+eecNpo+4U92Rj62KFwfdLX+w3MzlhVC2SeQ0=;
        b=nDr3GyLSyEbLOjZ9Kc+s6Gi2ZoFfHg9lNRMq6CdYJRbZJrSjQnpOJZ1/A21Zr+7Jz8
         Bjr2dkpMZu6188dW0lBPP5JSEYTPmjlCXRnbtKMTBzMOO1bvVj01fkQiD6eNMotQ6p+N
         0rCYw3UkWqbvUFw3LCUvtF6sI4iL34c7cNgg4JYHgC/0ObVA+BN5q1C/Jmc0eYfivG+J
         eTrk46MFrtKj/4xjj/ZrQQxsPnwdg6+hH+bejYT5ePWNkVMvt0m3sB2NwM2LcAtHVGPf
         BflIm5CRvE0Nm3swYtM70TbGRXCaimgvLr3KQWN4pkNQUd1gUDe1tge6v9xwH3zB0HIG
         WZaA==
In-Reply-To: <1559650290-17054-1-git-send-email-92siuyang@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Young Xiao <92siuyang@gmail.com>, ralf@linux-mips.org, davem@davemloft.net, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org



On 6/4/19 5:11 AM, Young Xiao wrote:
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
>  
>  	case ROSE_IDLE:
> -		if (opt < 0)
> +		if (opt < 0 || opt > ULONG_MAX / HZ)

Buggy check.

>  			return -EINVAL;
>  		rose->idle = opt * 60 * HZ;
>  		return 0;
> 
