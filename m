From: Basil Gunn <basil@pacabunga.com>
Subject: Re: Can only connect to RMS gateway once
Date: Sat, 4 Jun 2016 14:32:14 -0700
Message-ID: <20160604143214.0f97393f@brox.localnet>
References: <20160603131613.6037bcd0@brox.localnet>
	<20160604134348.38e3c4dd@brox.localnet>
	<575340AD.5090604@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <575340AD.5090604@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: David Ranch <linux-hams@trinnet.net>

It looks like the SOCK_DESTROY flag should be serviced off the
ax25_ds_timer or ax25_std_timer but that's not happening.

/Basil

On Sat, 4 Jun 2016 13:57:17 -0700
David Ranch <linux-hams@trinnet.net> wrote:

>
> + David Miller for comments
>
>
> I see a change on June 25, 2015, and a few others on that file that
> seem like they could be the issue:
>
> https://github.com/torvalds/linux/commits/master/net/ax25/af_ax25.c
>
>
> --David
>
>
> On 06/04/2016 01:43 PM, Basil Gunn wrote:
> > This isn't a final solution but the problem is in:
> >
> >   sock_set_flag(sk, SOCK_DESTROY);
> >
> > in routine ax25_release() in file net/ax25/af_ax25.c which does
> > what it is supposed to do in kernel 4.1.21 but NOT in kernels 4.2.8
> > & above. It should destroy & free the socket when disconnecting.
> >
> > For my 4.2.8 kernel If I add this after the sock_set_flag() call in
> > ax25_release() then the connection is released after disconnect & I
> > can reconnect again.
> >
> >      release_sock(sk);
> >      ax25_disconnect(ax25, 0);
> >      lock_sock(sk);
> >      ax25_destroy_socket(ax25);
> >
> > >From the af_ax25 code in the 4.1.21 kernel, it expects
> > >sock_set_flag(sk, SOCK_DESTROY); to
> >   ax25_destroy_socket
> >   ax25_free_sock
> >
> >> /Basil n7nix
