From: Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH] net: rose: fix unregistered netdevice: waiting for rose0
 to become free
Date: Fri, 22 Jul 2022 19:05:34 +0200
Message-ID: <CANn89i+-THx+jTzsLDxaX9diV4hz7z4mYqwn2CjtydFp+U4gow@mail.gmail.com>
References: <20220715154314.510ca2fb@kernel.org> <9c033c36-c291-1927-079b-b4aee5f7ac08@free.fr>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aw2PaK01gLFUmg2cehol2FzcRVoOSHEH5YEZkfy6lqI=;
        b=jHvD23AgyIr8lOrwD83G+oMuXTrXNyLfcfoAdokDMgTU9L3AeRBxQ8SDFKu85ydP3y
         nn3qDbmovqF4KxCoZ32sZu8CSe85F2Bkrr/bqosnmjFgDNQbRv6IO2pMQxojFcZWVT7p
         XuKRoAVmjQKTc/YqY0jKU2NXgUlzrcSFIPR+HRaCa4+gWNuT4dm03sn2NdR72xKjFeJH
         Df+Xd+l5y05qJ2Q9bhJKHj3NwbcOzJPRfMm4Xd8WL4qmpHbWf0yvlkX4mjDFdFnDVS3t
         U12KIGDOj9+1hoAuQNB6kuU7FDKyQOZxYrK15Tng9gmlJEm7sSPJhXiYzPIoq7Pe3ynM
         D4fQ==
In-Reply-To: <9c033c36-c291-1927-079b-b4aee5f7ac08@free.fr>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard f6bvp <f6bvp@free.fr>
Cc: Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>, Duoming Zhou <duoming@zju.edu.cn>, linux-hams@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>, Ralf Baechle <ralf@linux-mips.org>

On Fri, Jul 22, 2022 at 6:41 PM Bernard f6bvp <f6bvp@free.fr> wrote:
>
> Here is the context.
>
> This patch adds dev_put(dev) in order to allow removal of rose module
> after use of AX25 and ROSE via rose0 device.
>
> Otherwise when trying to remove rose module via rmmod rose an infinite
> loop message was displayed on all consoles with xx being a random number.
>
> unregistered_netdevice: waiting for rose0 to become free. Usage count = xx
>
> unregistered_netdevice: waiting for rose0 to become free. Usage count = xx
>
> ...
>
> With the patch it is ok to rmmod rose.
>
> This bug appeared with kernel 4.10 and has been only partially repaired
> by adding two dev_put(dev).
>
> Signed-off-by: Bernard Pidoux <f6bvp@free.fr>
>
> ---
>   net/rose/af_rose.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
> index bf2d986a6bc3..4163171ce3a6 100644
> --- a/net/rose/af_rose.c
> +++ b/net/rose/af_rose.c
> @@ -711,6 +711,8 @@ static int rose_bind(struct socket *sock, struct
> sockaddr *uaddr, int addr_len)
>       rose_insert_socket(sk);
>
>       sock_reset_flag(sk, SOCK_ZAPPED);
> +
> +    dev_put(dev);

But, we have at line 698 :

rose->device        = dev;

So we can not keep a pointer to a device without holding a reference on it.

As a bonus we could convert these dev_put() to new infra added with
CONFIG_NET_DEV_REFCNT_TRACKER=y



>
>       return 0;
>   }
> --
> 2.34.1
>
> [master da21d19e920d] [PATCH] net: rose: fix unregistered netdevice:
> waiting for rose0 to become free
>   Date: Mon Jul 18 16:23:54 2022 +0200
>   1 file changed, 2 insertions(+)
>
>
