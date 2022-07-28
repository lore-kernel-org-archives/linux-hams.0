From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net v2] netrom: fix sleep in atomic context bugs in
 timer handlers
Date: Wed, 27 Jul 2022 18:36:47 -0700
Message-ID: <20220727183647.23ae46f8@kernel.org>
References: <20220726032420.5516-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658972208;
        bh=DnonMiuWXIiuzZDXL8pNnHlEBP04K89tqhUudaTWyW4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dNCsZuXFlDoDjpOHeM3xi6E8xS9DNsogbnl15CBPmj7ogMT7BmE0UR54KlN6yJ6EX
         GhEB/jVRpViOcoVlRVjkNgyK03DeMJ87yZxrLPbCcIpPkKnBqN2D/wreTzQVd8e0MO
         cmV7Q3EzBCLPzZT6zI/3ghxQkEsH4xwRuk8+40sRDs3n5Aux2FkoNH/4nPvQyqDyRP
         1Mi8kCO7CinKNrt6zeRYs0zluWjr1q5YUwG0/SeuY6O8W6duObF5l67FhXLKlURpPJ
         myGZC29GJ+ZTLhUJJeIBj0U6hCE8OPwEAYSxUEsl3V9miv2dGnNUktfMJIqP8ibyM+
         JdeacHjPn9qtQ==
In-Reply-To: <20220726032420.5516-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 26 Jul 2022 11:24:20 +0800 Duoming Zhou wrote:
> nr_heartbeat_expiry
>   nr_write_internal
>     nr_transmit_buffer

void nr_transmit_buffer(struct sock *sk, struct sk_buff *skb)
{
[...]
	if (!nr_route_frame(skb, NULL)) {

>       nr_route_frame

int nr_route_frame(struct sk_buff *skb, ax25_cb *ax25)
{
[...]
	if (ax25 != NULL) {
		ret = nr_add_node(nr_src, "", &ax25->dest_addr, ax25->digipeat,

ax25 must be NULL on this path AFAICT.

>         nr_add_node
>           kmemdup(..,GFP_KERNEL) //may sleep
