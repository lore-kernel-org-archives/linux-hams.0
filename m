From: 9a4gl@9a0tcp.ampr.org (Tihomir Heidelberg)
Subject: Re: AX.25 unaccepted socket makes problems
Date: Wed, 28 May 03 14:29:08 CEST
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <2313@9A0TCP>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thomas@osterried.de
Cc: linux-hams@vger.kernel.org

Hi,

>> also I think that skb->sk->pair should be set to NULL, because from this
>> point the pair (listening socket) does not exist any more and reference
>> to this can cause problem, right ?
>
>hmm. the listening socket exists as long the userspace application does
>listen().
>but i do not really understand the sk->pair concept.

yap, but I am talking about when listening socket is going to be
destroyed and there are some unaccepted connections made by listening
socket (lets call them CHILDs)... those CHILDs keeps living in kernel after
listening socket is destroyed... CHILDs have sk->pair pointing
to its listening socket (I really do not know who use/need that sk->pair)
but after listening socket is destroyed I think that CHILDs must not have
a reference to it anymore...

> also i have problems in understanding the concept in ax25_destroy_socket():
> skb->sk->dead is set to 1, then ax25_start_heartbeat() is called, which
> is a timer (which expires in +5s).

yap, CHILDs are destroyed after +5s (heardbeat expirity), I really do not
know why they are destroyed this way with a delay ?! Why dont we call
ax25_destroy_socket recursivly to destroy all CHILDs ? Anyone know the
reason ? They are anyway destroyed the same way on heardbeat exipirity.

> if we set it to skb->sk->state = TCP_LISTEN and our state is
> AX25_STATE_0, then this timer will call ax25_destroy_socket() again.

again, but first time it destroyed listening socket, and from timer it
destroy unaccepted socket...

> potentially running ax25_std_heartbeat_expiry(), which will use
> ax25->sk->... we have just free'd.

no, timer is handling nondestroyed socket (the CHILD)

> i have done this (interested in?). after the observation that when
> ax25rtd is running, the oops problem on ax25 cb's (which are independend
> of the ax25 route list) occorued.

yup, but when ax25_route_list is unprotected, it get broken, it is very
probably that new element in ax25_list is at memory which was used a bit
ago in ax25_route_list, anyone know if ax25_route_list also get broken
when ax25_list is broken ?

73 de Tihomir, 9a4gl@9a0tcp.ampr.org

