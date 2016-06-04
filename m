From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Can only connect to RMS gateway once
Date: Sat, 4 Jun 2016 13:57:17 -0700
Message-ID: <575340AD.5090604@trinnet.net>
References: <20160603131613.6037bcd0@brox.localnet>
 <20160604134348.38e3c4dd@brox.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20160604134348.38e3c4dd@brox.localnet>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Basil Gunn <basil@pacabunga.com>, linux-hams@vger.kernel.org
Cc: davem@davemloft.net


+ David Miller for comments


I see a change on June 25, 2015, and a few others on that file that seem 
like they could be the issue:

https://github.com/torvalds/linux/commits/master/net/ax25/af_ax25.c


--David


On 06/04/2016 01:43 PM, Basil Gunn wrote:
> This isn't a final solution but the problem is in:
>
>   sock_set_flag(sk, SOCK_DESTROY);
>
> in routine ax25_release() in file net/ax25/af_ax25.c which does what it
> is supposed to do in kernel 4.1.21 but NOT in kernels 4.2.8 & above. It
> should destroy & free the socket when disconnecting.
>
> For my 4.2.8 kernel If I add this after the sock_set_flag() call in
> ax25_release() then the connection is released after disconnect & I can
> reconnect again.
>
>      release_sock(sk);
>      ax25_disconnect(ax25, 0);
>      lock_sock(sk);
>      ax25_destroy_socket(ax25);
>
> >From the af_ax25 code in the 4.1.21 kernel, it expects sock_set_flag(sk, SOCK_DESTROY); to
>   ax25_destroy_socket
>   ax25_free_sock
>
>
>> /Basil n7nix
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

