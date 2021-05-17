From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH RESEND][next] net: netrom: Fix fall-through warnings for
 Clang
Date: Mon, 17 May 2021 15:09:47 -0500
Message-ID: <a3fa4bac-2b30-0954-30e6-e4202949e773@embeddedor.com>
References: <20210305092210.GA139864@embeddedor>
 <5047001a-e5a8-ec64-0dc7-662e7cb0d100@embeddedor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nNkGB/SMOVehPker/eeuybln3ISVaMpsQpy10U9fYN8=; b=OIDqYC1WeuePW1/YMttvu6mq1o
        tjzh7lKTt3baCQZH7Oh96AzHUhM2a6b+ERMwpJMivnV+wMd5a8P/zDui4b7rvb5u2mKWfzUvnWlCK
        X5EYUVkzsRvUd+8pe1/lNR2bNtUcZuDd279Q+e8eny/jCHNnm9bTti9a3nJWzvMdaAhlA0j/XhlHe
        gN2SI91KafFKqXTcNEYiO1PM1nzpi3if6RTJWsF+bcQKX4Gzkaq8zk+WyPjy2TqaRG/yyH4k83UQi
        dRHuCN7ORsFmjjsrXskk4CLh8BjWwb03x7hLrNKpwbVAR6HmLpIUs6kTZMfqYZy2mBFVtKDKtkSuC
        LCtL 
In-Reply-To: <5047001a-e5a8-ec64-0dc7-662e7cb0d100@embeddedor.com>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org

Hi Dave,

I haven't received any feedback about these patches after resending them.

We had thousands of these warnings and now we are down to less than a hundred in
linux-next. I'm planning to take these patches in my -next tree for 5.14 as
I'm planning to enable -Wimplicit-fallthrough for Clang for that release, too.

Are you OK with this?

Thanks
--
Gustavo

On 4/20/21 15:11, Gustavo A. R. Silva wrote:
> Hi all,
> 
> Friendly ping: who can take this, please?
> 
> Thanks
> --
> Gustavo
> 
> On 3/5/21 03:22, Gustavo A. R. Silva wrote:
>> In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
>> warnings by explicitly adding multiple break statements instead of
>> letting the code fall through to the next case.
>>
>> Link: https://github.com/KSPP/linux/issues/115
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>  net/netrom/nr_route.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
>> index 78da5eab252a..de9821b6a62a 100644
>> --- a/net/netrom/nr_route.c
>> +++ b/net/netrom/nr_route.c
>> @@ -266,6 +266,7 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
>>  		fallthrough;
>>  	case 2:
>>  		re_sort_routes(nr_node, 0, 1);
>> +		break;
>>  	case 1:
>>  		break;
>>  	}
>> @@ -359,6 +360,7 @@ static int nr_del_node(ax25_address *callsign, ax25_address *neighbour, struct n
>>  					fallthrough;
>>  				case 1:
>>  					nr_node->routes[1] = nr_node->routes[2];
>> +					break;
>>  				case 2:
>>  					break;
>>  				}
>> @@ -482,6 +484,7 @@ static int nr_dec_obs(void)
>>  					fallthrough;
>>  				case 1:
>>  					s->routes[1] = s->routes[2];
>> +					break;
>>  				case 2:
>>  					break;
>>  				}
>> @@ -529,6 +532,7 @@ void nr_rt_device_down(struct net_device *dev)
>>  							fallthrough;
>>  						case 1:
>>  							t->routes[1] = t->routes[2];
>> +							break;
>>  						case 2:
>>  							break;
>>  						}
>>
