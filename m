From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net] ax25: Fix ax25 session cleanup problem in
 ax25_release
Date: Fri, 27 May 2022 17:33:12 -0700
Message-ID: <20220527173312.71122dbe@kernel.org>
References: <20220525112850.102363-1-duoming@zju.edu.cn>
        <YpCHtRoxEXU7UAji@x-berg.in-berlin.de>
        <0213B378-9CFF-456E-814E-B27A132CF8F3@osterried.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653697993;
        bh=QhmLgEpPPw1/1KVYSO27vTby9GZi+L2aRX/Xkb3AAaU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MVuKI2fcHuCyb711Y95EMT4hRextWHGbYn+W0yz6T1GqzLfL2ZEONS50VH3BS4uvG
         Mhqaap5fdQv+FU5o59zikVBFut9oVM+9OljBhWTnY3HyOJWMN19zxTlmcbjmzf4Lg9
         57yVK+AlNwUt922AFz3jxXz6POI562KhncyBvnd2Clw/FEXbnBJU6Sd9fQ41OKcH6e
         KRg5CvlYxSQOdScRgtgvdZ2X1G9KgrjBNIXoav+JJurzXDHxS7MGqnxS6l4/qYtqHf
         jRKCrLkQVJhHaG6fHcYNEvr2OS3Z92wbu7XQmVnhCpwLO59CNrMVpzz++yPjgZT2+o
         Wdkn6dEIfMnAw==
In-Reply-To: <0213B378-9CFF-456E-814E-B27A132CF8F3@osterried.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Osterried <thomas@osterried.de>
Cc: Duoming Zhou <duoming@zju.edu.cn>, "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, linux-hams@vger.kernel.org

On Fri, 27 May 2022 13:29:30 +0200 Thomas Osterried wrote:
> > I Tested several cases: this patch works as expected.  
> If you agree, that no concurrent process is able to re-use this ax25_cb,
> and because all timers are stoppeed, the cleanup with  ax25_cb_del(s);
> should be safe.
> 
> 
> My successfull test was this:
> 
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 363d47f94532..de417b974c07 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -91,6 +92,7 @@ static void ax25_kill_by_device(struct net_device *dev)
>                                 spin_unlock_bh(&ax25_list_lock);
>                                 ax25_disconnect(s, ENETUNREACH);
>                                 s->ax25_dev = NULL;
> +                               ax25_cb_del(s);
>                                 spin_lock_bh(&ax25_list_lock);
>                                 goto again;
>                         }

Thanks a lot for the testing and analysis! We'll give v2 [1] another
day or two on the list and merge it into net.

[1]
https://lore.kernel.org/all/20220527151822.23217-1-duoming@zju.edu.cn/
