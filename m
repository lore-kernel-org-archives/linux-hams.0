From: 9a4gl@9a0tcp.ampr.org (Tihomir Heidelberg)
Subject: Re: AX.25 unaccepted socket makes problems
Date: Wed, 28 May 03 08:46:03 CEST
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <2278@9A0TCP>
References: <20030528000411.GA1391@osterried.de>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: your message of Wed, 28 May 2003 02:04:11 +0200.
             <20030528000411.GA1391@osterried.de>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thomas@osterried.de
Cc: linux-hams@vger.kernel.org

Hi,

>> are NOT destroyed here ! A condition:
>>         (ax25->sk->state == TCP_LISTEN && ax25->sk->dead)
>> is not true because state of those connections are not
>
>as far as i got into the code when i looked for the reason for the
>segfault problem, former connected sessions come to the state TCP_LISTEN
>when they get disconnected.

I couldnt get TCP_LISTEN state, ax25_rcv in ax25_in.c set that state
to TCP_ESTABLISHED, dont see where it can be changed to TCP_LISTEN,
debugging messages reports TCP_ESTABLISHED or TCP_CLOSE, depending
if remote station disconnected or not.

>> +               skb->sk->state     = TCP_LISTEN;
>> +               if (!skb->sk->dead) {
>> +                       skb->sk->state_change(skb->sk);
>> +               }
>
>by insuring with with your patch should at least do not harm.

yap, but TCP_LISTEN state is not proper state for such connections,
so think there should be more reasonable fix for this

also I think that skb->sk->pair should be set to NULL, because from this
point the pair (listening socket) does not exist any more and reference
to this can cause problem, right ?

> there's a list of active ax25 control blocks (ax25_cb *ax25_list).
> this list gets corrupted. while walking through ax25_list->next->....->next,
> somewhere in this reference is pointing to somewhere where it should not.
...
> i looked several times over the code (routines adding and removing list
> elements, checking for cli() and restore_flags()). everything looks ok
> for me.

yap, I also spent a lot of hours looking in code that handle this list,
but cannot find anything that can hurt that list

> [as i mentioned also, ax25rtd which adds ax25 route lists to the kernel,
> causes troubles to the kernel. perhaps it's one of those routines which
> messes up the ax25 cb lists as side effect]

ax25rtd/axparms calls ioctl(SIOCADDRT) on ax.25 socket, I see that
ax25_route_list is not protected with cli() stuff, maybe we should
protect this list too ? dont know how this can hurt ax25_list, but
protecting this list will not hurt anyone...

anyway, I read that Ralf is doing some things in 2.5 kernel tree,
spinlock instead cli() protection should be used in future ax.25
kernel, as I read Ralf works on spinlock in ax.25 code... should
we move to spinlocks in 2.4 kernels too or we will wait for 2.6 ?

>> Also, some months ago I mention here that regulary I get this
>> AX.25 kernel behavior after few days of running 9A0TCP gateway
>> machine. I noticed that very often ax25d died or had to restart
>> ax25d because it was not handling connections. Think this
>> bind/non-accept kernel problem is very probably the reason.
>
>afik, it's caused by the inkonsistent list:
>ax25_find_listener() walks over ax25_list. and may not find the ax25
>control block which actually listens.
>ax25_find_listener() is called by ax25_rcv() in ax25_in.c when an SABM
>is received.

yup, but if ax25d stops accepting connections, you will get ooops, dont know
what came first, ax25d problem or kernel problem... but for sure ax25d
problem may cause kernel problem...

73 de Tihomir Heidelberg, 9a4gl@9a0tcp.ampr.org
