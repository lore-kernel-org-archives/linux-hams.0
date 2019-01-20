From: f6bvp <f6bvp@free.fr>
Subject: Re: [PATCH] NET:AX25:ROSE NULL ax25_cb kernel panic
Date: Sun, 20 Jan 2019 10:58:32 +0100
Message-ID: <9802433c-7f50-160f-5246-8e9e2cfb571b@free.fr>
References: <57ADC4F4.6080707@free.fr>
 <19a0a879-8a8d-4c84-5de9-5ce222377fcb@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <19a0a879-8a8d-4c84-5de9-5ce222377fcb@free.fr>
Content-Language: fr
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dmitry Vyukov <dvyukov@google.com>
Cc: linux-hams <linux-hams@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, David Miller <davem@davemloft.net>, Linux Netdev List <netdev@vger.kernel.org>, n1uro@n1uro.ampr.org, C Schuman <k4gbb1@embarqmail.com>

Hi,

Dmitry wrote:

>Please also add:
>Reported-by: syzbot+1a2c456a1ea08fa5b5f7@syzkaller.appspotmail.com

I did mention syzbot report but without the exact reference, thanks.

>It's this report we are fixing, right?
>https://syzkaller.appspot.com/bug?id=fd0b0b00fc26abb4b35663a0e2f1c91d8e6e5725

Yes exactly !
This is a long date well know bug I reported two years ago.

Bernard


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
>         lci = ((skb->data[0] << 8) & 0xF00) + ((skb->data[1] << 0) &
0x0FF);
>         if (frametype == ROSE_CALL_REQUEST &&
>
> Signed-off-by: Bernard Pidoux, f6bvp <f6bvp@free.fr>

Please also add:

Reported-by: syzbot+1a2c456a1ea08fa5b5f7@syzkaller.appspotmail.com

It's this report we are fixing, right?
https://syzkaller.appspot.com/bug?id=fd0b0b00fc26abb4b35663a0e2f1c91d8e6e5725
