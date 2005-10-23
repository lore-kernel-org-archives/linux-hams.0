From: aa6qn@aa6qn.sytes.net
Subject: Re: 2.6.14-r4 crashing
Date: Sun, 23 Oct 2005 04:49:04 -0700 (PDT)
Message-ID: <60264.192.168.1.2.1130068144.squirrel@192.168.1.12>
References: <61062.192.168.1.2.1129943887.squirrel@192.168.1.12>
    <20051022124642.GA3951@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20051022124642.GA3951@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Ok, this time I captured the dump screen. It did stay up longer..

At the kernel panic screen:
-------------
call trace
_spin_lock_irqsave
lock_timer_
del timer
ax25_destroy_socket
ax25_heartbeat_expiry
run_timer_softirq
__do_softirq
do_softirq
=====================
irq_exit
apic_timer
mwait_idle
mwait_idle
cpu_idle
start_kernel

kernel panic -not syncing: fatal exception in interupt

------------------------
Thats it.

I am also having a small bit of growing pains with iproute2 ipip
configuration and routing. I am getting a tunnel up with the remote
destination using:
>ip tunnel add (callsign of remote end) mode ipip remote (far end tunnel
ip) local (my secondary 44 address for eth0) dev tunl0

Some things I have set and tried:
-I do not have to add the far end 44 address routing.
-I have tried both tunl0 and eth0 for connection dev's
-For my tunl0, I configured it with a local 44 domain IP address
-I have attached ax25ipd via the ax5 device and it does allow me to
exchange netrom data with the far end using the far ends 44 domain IP.
-I am not doing IPv6 just IPv4

I picked up pointer from this site:
http://www.deepspace6.net/docs/iproute2tunnel-en.html

Hope I am doing it right!

JohnF
