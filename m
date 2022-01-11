From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH net] ax25: use after free in ax25_connect
Date: Tue, 11 Jan 2022 12:56:52 -0800
Message-ID: <f35292c0-621f-3f07-87ed-2533bfd1496e@gmail.com>
References: <20220111042048.43532-1-hbh25y@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=I//pyM+0NfxLPjUaJ8ZXZZdYGI++moJMA1nJi8tZH+o=;
        b=Ok/PDzMkTw6P44/G4KrU3iGJ/ZsVyhMol3icu9sBF2ttwdbfdMZszVGko3SE50eScw
         uw8uvKOiyHRTuPhOhos5LW/3H+wW3rwkhPMvMBc9TdBiqtBsThFQGX3KATp6p3qWD79B
         HMhXLpT1Osld5SYKApulNPuAY+RjqoI0shSxK2n8jbWomm5EnI1nUcoAd2vj0RN1io8o
         4OLUCju+PGbH6ic1a2pCIBTKqiCTtRMl50SzkPhjdOUKMiq5rmaSHvN2/0z6Lwag/7Ll
         voDWK3bEeS+Z6igwrXf5jpppxPKaGldGTsTw33DqTZC4uTJ6CDg9e9trczDFsOL7tSdB
         txmg==
Content-Language: en-US
In-Reply-To: <20220111042048.43532-1-hbh25y@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hangyu Hua <hbh25y@gmail.com>, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org


On 1/10/22 20:20, Hangyu Hua wrote:
> sk_to_ax25(sk) needs to be called after lock_sock(sk) to avoid UAF
> caused by a race condition.

Can you describe what race condition you have found exactly ?

sk pointer can not change.


> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>   net/ax25/af_ax25.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index cfca99e295b8..c5d62420a2a8 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -1127,7 +1127,7 @@ static int __must_check ax25_connect(struct socket *sock,
>   	struct sockaddr *uaddr, int addr_len, int flags)
>   {
>   	struct sock *sk = sock->sk;
> -	ax25_cb *ax25 = sk_to_ax25(sk), *ax25t;
> +	ax25_cb *ax25, *ax25t;
>   	struct full_sockaddr_ax25 *fsa = (struct full_sockaddr_ax25 *)uaddr;
>   	ax25_digi *digi = NULL;
>   	int ct = 0, err = 0;
> @@ -1155,6 +1155,8 @@ static int __must_check ax25_connect(struct socket *sock,
>   
>   	lock_sock(sk);
>   
> +	ax25 = sk_to_ax25(sk);
> +
>   	/* deal with restarts */
>   	if (sock->state == SS_CONNECTING) {
>   		switch (sk->sk_state) {
