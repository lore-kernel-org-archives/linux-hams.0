From: 9a4gl@9a0tcp.ampr.org (Tihomir Heidelberg)
Subject: ax25 kernel problem sometimes accur
Date: Wed, 04 Dec 02 08:21:29 CET
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <19399@9A0TCP>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi

After few days of running 9a0tcp gateway, ax25 kernel at
9a0tcp get broken. When the problem occur, all connections
are running well, so I think that ax25_list is not broken
because ax25_find_socket and ax25_find_cb functions are doing
good work, but running netstat or cat /proc/net/ax25 will
do "segementation fault". This makes big problems to some
of my applications.

The problem occur on kernels 2.4.18, 2.4.19 and 2.4.20, but
I notice it only on 9a0tcp gateway, even am running it on
several machines. Maybe, because 9a0tcp have few times more
traffic.

I analyzed the kernel ax25 source, and I tried to find what
can make ax25_get_info function crash. I don't know much
about how kernel and sockets exactly work, but want to know
if someone have the same problem, and maybe one of kernel
guru will catch a problem.

But, what I suspect, in af_ax25.c we define a destructor for
our sockets:
         sk->destruct = ax25_free_sock;
I guess that somebody/sometimes call this destructor when
destroying a socket. I think that after that, socket cannot be
considered as valid, but as control block still exists,
shouldn't we set sk in control block to NULL ? ax25_get_info
will still find that control block with sk set to destroyed
socket, isn't it ?
I added to the end of ax25_free_sock function this line:
        sk->protinfo.ax25->sk=NULL;
and I am waiting to see if this will help.
Is there any expert that can tell me whats wrong here.

Many thanks,

73 de Tihomir Heidelberg, 9a4gl@9a0tcp.ampr.org
