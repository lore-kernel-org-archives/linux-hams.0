From: Mathias Krause <minipli@googlemail.com>
Subject: Re: [PATCH -next] netrom: fix invalid use of sizeof in nr_recvmsg()
Date: Tue, 9 Apr 2013 07:49:00 +0200
Message-ID: <CA+rthh8DXCULOX7HUt2+mrQCZn3e=WzP7ZPSjY5kNmSWDDd=FA@mail.gmail.com>
References: <CAPgLHd-yEmt_BJ52uZNsCA_-w85VhnN_HbfjG1QLVvR5kp7Xvw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=PaX3BlccjjJ4jS8TKoTdaqpUZ2IkQWuQF552hLikDjU=;
        b=zGrJeObiMlLa+6Dww0gliMXuJRxWU2N8fJkduc3sLByCyg3zCu5kmj9b4wv19en+qu
         AWtenNP6zKAW5MRdARFI22vfJ50ncpATRVaiRDiXeel9L0LQHUmtCZuk9QIp2z+KWoTq
         lbEg8Cbao21ekW49xRjgihhdS/bUv/YNHT+fgnSdiLoPVCqwHdJc/vgtQ8LmbxFn2ISp
         365JtJM9SjIIuhTB2W+147KOVHj4s9p+4qkOy0g95BMUoAhj7OCeaHhJEEkkKbNfCRHg
         n6rlN3C8jnYulmksgAZXE+PAst9G7COyczM1DK174GgzHeRJIym0wXGxfwfcILTEq3nX
         Wo3g==
In-Reply-To: <CAPgLHd-yEmt_BJ52uZNsCA_-w85VhnN_HbfjG1QLVvR5kp7Xvw@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: ralf@linux-mips.org, "David S. Miller" <davem@davemloft.net>, yongjun_wei@trendmicro.com.cn, linux-hams@vger.kernel.org, netdev@vger.kernel.org

On Tue, Apr 9, 2013 at 4:07 AM, Wei Yongjun <weiyj.lk@gmail.com> wrote:
>
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> sizeof() when applied to a pointer typed expression gives the size of the
> pointer, not that of the pointed data.
> Introduced by commit 3ce5ef(netrom: fix info leak via msg_name in nr_recvmsg)
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  net/netrom/af_netrom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
> index 7fcb307..103bd70 100644
> --- a/net/netrom/af_netrom.c
> +++ b/net/netrom/af_netrom.c
> @@ -1173,7 +1173,7 @@ static int nr_recvmsg(struct kiocb *iocb, struct socket *sock,
>         }
>
>         if (sax != NULL) {
> -               memset(sax, 0, sizeof(sax));
> +               memset(sax, 0, sizeof(*sax));
>                 sax->sax25_family = AF_NETROM;
>                 skb_copy_from_linear_data_offset(skb, 7, sax->sax25_call.ax25_call,
>                               AX25_ADDR_LEN);
>

Thanks for fixing this nasty little typo! My keyboard must be broken
as sizeof(*sax) was the intended change in the first place. ;)

Acked-by: Mathias Krause <minipli@googlemail.com>
