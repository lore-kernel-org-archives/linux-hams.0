From: Thomas Osterried <thomas@osterried.de>
Subject: Re: AX.25 unaccepted socket makes problems
Date: Wed, 28 May 2003 12:25:31 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030528102531.GB4379@osterried.de>
References: <20030528000411.GA1391@osterried.de> <2278@9A0TCP>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2278@9A0TCP>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tihomir Heidelberg <9a4gl@9a0tcp.ampr.org>

> also I think that skb->sk->pair should be set to NULL, because from this
> point the pair (listening socket) does not exist any more and reference
> to this can cause problem, right ?

hmm. the listening socket exists as long the userspace application does
listen().
but i do not really understand the sk->pair concept.


also i have problems in understanding the concept in ax25_destroy_socket():
skb->sk->dead is set to 1, then ax25_start_heartbeat() is called, which
is a timer (which expires in +5s).

if we set it to skb->sk->state = TCP_LISTEN and our state is
AX25_STATE_0, then this timer will call ax25_destroy_socket() again.
due to the timer it is not a loop (hopefully), but after our first
ax25_destroy_socket() goes further down (ax25->sk == NULL), we will call
ax25_free_cb(ax25). what will our timer do, which we restarted above and
which will work on this ax25 control block?

and: if ax25->sk is != NULL and there are no in/outstanding buffer, there's
only an sk_free(ax25->sk). the socket is not destroyed, but ax25->sk is not
set to NULL. does it refer now to an unassigned memory segment? should'n
in this case ax25_free_cb() called too? here also the problem with a
potentially running ax25_std_heartbeat_expiry(), which will use ax25->sk->...
we have just free'd.

well, i deeply hope there's someone out there who knows how this code works ;)


> > [as i mentioned also, ax25rtd which adds ax25 route lists to the kernel,
> > causes troubles to the kernel. perhaps it's one of those routines which
> > messes up the ax25 cb lists as side effect]
> 
> ax25rtd/axparms calls ioctl(SIOCADDRT) on ax.25 socket, I see that
> ax25_route_list is not protected with cli() stuff, maybe we should
> protect this list too ? dont know how this can hurt ax25_list, but
> protecting this list will not hurt anyone...

just thought the same some weeks ago.

i have done this (interested in?). after the observation that when
ax25rtd is running, the oops problem on ax25 cb's (which are independend
of the ax25 route list) occorued.

unfotunately, i never found a way to produce the corrupted ax25 cb list
by force. thus i only could wait for oopses. and my system where i tried
this never oopsed :(

> anyway, I read that Ralf is doing some things in 2.5 kernel tree,
> spinlock instead cli() protection should be used in future ax.25
> kernel, as I read Ralf works on spinlock in ax.25 code... should
> we move to spinlocks in 2.4 kernels too or we will wait for 2.6 ?

i'd advice not to hack too much in the current code. we may get more
problems or side-effects.


73,
	- thomas

