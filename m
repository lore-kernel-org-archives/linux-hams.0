From: Thomas Osterried <thomas@osterried.de>
Subject: Re: AX.25 unaccepted socket makes problems
Date: Wed, 28 May 2003 02:04:11 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030528000411.GA1391@osterried.de>
References: <2197@9A0TCP>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2197@9A0TCP>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tihomir Heidelberg <9a4gl@9a0tcp.ampr.org>
Cc: linux-hams@vger.kernel.org

> are NOT destroyed here ! A condition:
>         (ax25->sk->state == TCP_LISTEN && ax25->sk->dead)
> is not true because state of those connections are not

as far as i got into the code when i looked for the reason for the
segfault problem, former connected sessions come to the state TCP_LISTEN
when they get disconnected.

> +               skb->sk->state     = TCP_LISTEN;
> +               if (!skb->sk->dead) {
> +                       skb->sk->state_change(skb->sk);
> +               }

by insuring with with your patch should at least do not harm.

perhaps there's the problem for this phaenome:
|    DB0TUD-0   DB0TUD-1   ax0     LISTENING    007/005  0       320
|    DL6MPG-1   DB0TUD-15  ax0     LISTENING    005/007  0       432
|    DB0TUD-0   DB0TUD-4   ax0     LISTENING    002/005  0       80
|    DB0DSD-0   DB0TUD-1   ax0     LISTENING    001/000  0       80
|    DL6MPG-4   DB0TUD-15  ax0     LISTENING    002/001  0       816

> Cannot get the reason why
> segmentation fault is happening, but hope someone else can find
> a reason when problem is reproducable.

as i noted abt a month ago in a mail to this list, i tracked the
problem down to the following point:
there's a list of active ax25 control blocks (ax25_cb *ax25_list).
this list gets corrupted. while walking through ax25_list->next->....->next,
somewhere in this reference is pointing to somewhere where it should not.

ax25_get_info(), which is called when doing "netstat -a" or
"cat /proc/net/ax25" from userspace, walks through this list. i had a chance
to let show me the data of all ax25_cb elements while walking through
the list (after i spicked my kernel with debug routines).
somewhere in the middle of the list, the reference to "next" was inkonsistant
in comparison to the time it was before, and the kernel oopsed while walking
over the next list element pointer.

i looked several times over the code (routines adding and removing list
elements, checking for cli() and restore_flags()). everything looks ok
for me.

currently, i assume this error is such difficile, because it may not
be caused by the routines which change the list, but because _maybe_
another routine in ax25.o allocates a buffer / struct, writes more
data as it should to it, and overwrites parts of the struct where
the ax25 control block is stored, causing corrupted data in the linked
list.

[as i mentioned also, ax25rtd which adds ax25 route lists to the kernel,
causes troubles to the kernel. perhaps it's one of those routines which
messes up the ax25 cb lists as side effect]

btw, a few days ago i announced a bugfix (the [invalid] to [invalid] SABM
problem). it does fix the problem. but my hope that the kernel oopses
will go away was not proven: they still occured.

> Also, some months ago I mention here that regulary I get this
> AX.25 kernel behavior after few days of running 9A0TCP gateway
> machine. I noticed that very often ax25d died or had to restart
> ax25d because it was not handling connections. Think this
> bind/non-accept kernel problem is very probably the reason.

afik, it's caused by the inkonsistent list:
ax25_find_listener() walks over ax25_list. and may not find the ax25
control block which actually listens.
ax25_find_listener() is called by ax25_rcv() in ax25_in.c when an SABM
is received.

a linux with a flexnet digipeater as neighbour (which connects quite often
for link test probes) gets most oopses this way.


on the other hand, an ax25 socket which is listening for incoming connections,
for e.g. by ax25d, gets sometimes
[pid  4924] accept(7, 0xbffff714, [72]) = -1 ECONNABORTED (Software caused connection abort)
that should never happen.


73,
	- thomas  dl9sau

