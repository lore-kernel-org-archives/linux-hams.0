From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH RESEND][next] net: netrom: Fix fall-through warnings for
 Clang
Date: Tue, 20 Apr 2021 15:11:00 -0500
Message-ID: <5047001a-e5a8-ec64-0dc7-662e7cb0d100@embeddedor.com>
References: <20210305092210.GA139864@embeddedor>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=CkRrAR3rCpK4uliJ7LJ71iNQodpgSH1kYlP/RKhfhGo=; b=Ueb+udY2kyoTD5pHw4Y8wqYIni
        nIQy8U6Ne3ALQYgfy/x0h1iEGgKxTEWlmbOT/CI/7GCpn6hu14Wa0b+PoORM7ZKHKKggosQA+Ip9l
        CcmjjD4Wp+ApERE6f8OCqMO5l/xH92PHIlJReKlxuC+TL06N/NOvLkkOoVVV/4KIslHMQhAgFUI0j
        taGG9CVVtPFUlvBTNxstk+vwd3dEcbymBOM0ye//KqaG0NHaY/JrVYYi6inJJMadKIFkqfUelRjs3
        mkHzi4B1oT9bPCPX2CzNlq3seQW0Xo1CtEzEya8CQuieGZxSrRpUAphnfejKyT5oOuOSBp+7GH7Ie
        qG+8 
In-Reply-To: <20210305092210.GA139864@embeddedor>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org

Hi all,

Friendly ping: who can take this, please?

Thanks
--
Gustavo

On 3/5/21 03:22, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
> warnings by explicitly adding multiple break statements instead of
> letting the code fall through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  net/netrom/nr_route.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
> index 78da5eab252a..de9821b6a62a 100644
> --- a/net/netrom/nr_route.c
> +++ b/net/netrom/nr_route.c
> @@ -266,6 +266,7 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
>  		fallthrough;
>  	case 2:
>  		re_sort_routes(nr_node, 0, 1);
> +		break;
>  	case 1:
>  		break;
>  	}
> @@ -359,6 +360,7 @@ static int nr_del_node(ax25_address *callsign, ax25_address *neighbour, struct n
>  					fallthrough;
>  				case 1:
>  					nr_node->routes[1] = nr_node->routes[2];
> +					break;
>  				case 2:
>  					break;
>  				}
> @@ -482,6 +484,7 @@ static int nr_dec_obs(void)
>  					fallthrough;
>  				case 1:
>  					s->routes[1] = s->routes[2];
> +					break;
>  				case 2:
>  					break;
>  				}
> @@ -529,6 +532,7 @@ void nr_rt_device_down(struct net_device *dev)
>  							fallthrough;
>  						case 1:
>  							t->routes[1] = t->routes[2];
> +							break;
>  						case 2:
>  							break;
>  						}
> 
