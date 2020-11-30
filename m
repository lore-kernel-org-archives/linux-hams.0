From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 109/141] net: netrom: Fix fall-through warnings for Clang
Date: Mon, 30 Nov 2020 15:51:37 +0300
Message-ID: <20201130125137.GE2767@kadam>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <c9a262ebaebd704e66c264fb68462bd8b9664d38.1605896060.git.gustavoars@kernel.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=iOSOzG9McZzuR7elPCodrNp8EvMHOEUV9ZwrGMMBHTc=;
 b=oQBOeWMrw8UceHrB/Wbw9Wdu1egQkl9bwNgFn489dVu4gBLcwMbNCxConO5X18gEzuSR
 En9Xgh3beCIufoft2mmjTEdXCkXG48K8iU6vZ6QhxQiru0S/wkwUW/kLvSRGCoZ1YDFi
 zXFMtfnFBZ+H3K7wizffM7KWjQjZRIO//LGVkprjZScpKS1XJw43dPPhI0U9jeOBaOpJ
 ihs/kNOvZmXaKeNCIStfv9bxQcD2UUBAFaQOSgv2BS8tokAeSLppr7/OHo9hGzLUjzDc
 PhtsjHl+TXP9CGsmDl1ZkNZlr44WsVNG9gHu8S1WhBjqJJpPUBzRtqSwcj3ZX4kV8gYi 1g== 
Content-Disposition: inline
In-Reply-To: <c9a262ebaebd704e66c264fb68462bd8b9664d38.1605896060.git.gustavoars@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org

On Fri, Nov 20, 2020 at 12:38:15PM -0600, Gustavo A. R. Silva wrote:
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
> index 78da5eab252a..de0456073dc0 100644
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
> +					fallthrough;

Make this one a break like the others.

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

regards,
dan carpenter
