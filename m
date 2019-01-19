From: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH] NET:AX25:ROSE NULL ax25_cb kernel panic
Date: Sat, 19 Jan 2019 12:39:11 +0100
Message-ID: <CACT4Y+b_Wpn3FHhE3q=4_7Qu+M+ELYTG-a89-Tky0qnk9wEjZQ@mail.gmail.com>
References: <57ADC4F4.6080707@free.fr> <19a0a879-8a8d-4c84-5de9-5ce222377fcb@free.fr>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=suLcAnf+ktw4GsUMvFu3PlGX8SDHlmNNwBja2pNWMRM=;
        b=dmSVaTBnIxisyg36MeIUkUS7tDmQS+Kp+AYzhHWvIEoX0T+FYzjhTvC0Hm1/nhEPGn
         ahqt38jCwmsrGz+J9IXk1rykmXXliLRapD//0LPJeJ6PkVJT8IzmKObLVqx4xBh9a6g9
         NPnHH4hPF2z5YzmX2tJ7KiFhWCYoFfkDoWTKfp8njfgiUHylwcpiZci+MOJRYRJvSRSg
         o94e/SAL1vBv51ZfIy5p3LJPWjBuVIQ3ItT8xJk76AZf9IVqy4Pgt36AXW6MGLaMreG3
         ei5G9OmIiaOIDlodNQvjqLFQJjjKD+8i3XDSIiZBjkrzHTQ4H/wlQKF9eiyV5POqs4hO
         OGfg==
In-Reply-To: <19a0a879-8a8d-4c84-5de9-5ce222377fcb@free.fr>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: f6bvp <f6bvp@free.fr>
Cc: linux-hams <linux-hams@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, David Miller <davem@davemloft.net>, Linux Netdev List <netdev@vger.kernel.org>, brian@support.uroweb.net

On Sat, Jan 19, 2019 at 11:58 AM f6bvp <f6bvp@free.fr> wrote:
>
>
> [PATCH] [ROSE] NULL ax25_cb kernel panic
>
> When an internally generated frame is handled by rose_xmit(),
> rose_route_frame() is called:
>
>         if (!rose_route_frame(skb, NULL)) {
>                 dev_kfree_skb(skb);
>                 stats->tx_errors++;
>                 return NETDEV_TX_OK;
>         }
>
> We have the same code sequence in Net/Rom where an internally generated
> frame is handled by nr_xmit() calling nr_route_frame(skb, NULL).
> However, in this function NULL argument is tested while it is not in
> rose_route_frame().
> Then kernel panic occurs later on when calling ax25cmp() with a NULL
> ax25_cb argument as reported many times and recently with syzbot.
>
> We need to test if ax25 is NULL before using it.
>
> Here is the patch:
>
> diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
> index 77e9f85a2c92..7f075255a372 100644
> --- a/net/rose/rose_route.c
> +++ b/net/rose/rose_route.c
> @@ -850,6 +850,7 @@ void rose_link_device_down(struct net_device *dev)
>
>  /*
>   *     Route a frame to an appropriate AX.25 connection.
> + *     a NULL ax25_cb indicates an internally generated frame.
>   */
>  int rose_route_frame(struct sk_buff *skb, ax25_cb *ax25)
>  {
> @@ -867,6 +868,10 @@ int rose_route_frame(struct sk_buff *skb, ax25_cb
> *ax25)
>
>         if (skb->len < ROSE_MIN_LEN)
>                 return res;
> +
> +       if (!ax25)
> +               return rose_loopback_queue(skb, NULL);
> +
>         frametype = skb->data[2];
>         lci = ((skb->data[0] << 8) & 0xF00) + ((skb->data[1] << 0) & 0x0FF);
>         if (frametype == ROSE_CALL_REQUEST &&
>
> Signed-off-by: Bernard Pidoux, f6bvp <f6bvp@free.fr>

Please also add:

Reported-by: syzbot+1a2c456a1ea08fa5b5f7@syzkaller.appspotmail.com

It's this report we are fixing, right?
https://syzkaller.appspot.com/bug?id=fd0b0b00fc26abb4b35663a0e2f1c91d8e6e5725
