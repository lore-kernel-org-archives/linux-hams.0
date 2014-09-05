From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH] rose: use %*ph specifier
Date: Fri, 05 Sep 2014 08:17:06 -0700
Message-ID: <1409930226.26422.135.camel@edumazet-glaptop2.roam.corp.google.com>
References: <1409929311-3225-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:content-transfer-encoding:mime-version;
        bh=0bUrFQhrX9ElntEIlaYOnS6TDG/auwkR31KARpMyL0Q=;
        b=SmfnWtvLnqHjglFJvbRGKpUtO9+3pqDvvyHCAmlsyMLINWYfK+79hmHQiZzC7ev8nJ
         JGYywXav4DCqe/dFLcasENyUBaCIjbc9z2/2p3UU6aPO6IOZfzBzSBYsLy8bLOkcyHRg
         a2JuzfnjxiN0yv6jd1IWCvbugkw/Kc9zO/pllviBtr9uEM/cqeTaPMydbpDObfYHrFfn
         0jn12RPCqGixtG2YZnYYyg15gjmb7fMjeS9eH4lZfB9nRgKBwnSZ8AcV6vCziguV6cQf
         H1q3uiePTqcsRagOrjsSwXUFLVYdavMqSdlphHJDc4+s62QdIVQ1srDqXjBntHmdHMKp
         +llw==
In-Reply-To: <1409929311-3225-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "David S. Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org

On Fri, 2014-09-05 at 18:01 +0300, Andy Shevchenko wrote:
> Instead of dereference each byte let's use %*ph specifier in the printk()
> calls.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  net/rose/rose_link.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> index bc55142..ce60771 100644
> --- a/net/rose/rose_link.c
> +++ b/net/rose/rose_link.c
> @@ -160,7 +160,7 @@ void rose_link_rx_restart(struct sk_buff *skb, struct rose_neigh *neigh, unsigne
>  		break;
>  
>  	case ROSE_DIAGNOSTIC:
> -		printk(KERN_WARNING "ROSE: received diagnostic #%d - %02X %02X %02X\n", skb->data[3], skb->data[4], skb->data[5], skb->data[6]);
> +		pr_warn("ROSE: received diagnostic #%d - %4ph\n", skb->data + 3);
>  		break;
>  
>  	default:

That can not be correct.

Have you even compiled this ?



