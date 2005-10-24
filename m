From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: 2.6.14-r4 crashing
Date: Mon, 24 Oct 2005 12:19:56 +0100
Message-ID: <20051024111956.GD2605@linux-mips.org>
References: <61062.192.168.1.2.1129943887.squirrel@192.168.1.12> <20051022124642.GA3951@linux-mips.org> <60264.192.168.1.2.1130068144.squirrel@192.168.1.12>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <60264.192.168.1.2.1130068144.squirrel@192.168.1.12>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aa6qn@aa6qn.sytes.net
Cc: linux-hams@vger.kernel.org

On Sun, Oct 23, 2005 at 04:49:04AM -0700, aa6qn@aa6qn.sytes.net wrote:

> Ok, this time I captured the dump screen. It did stay up longer..

It may not be the perfect method but screenshots with digital cameras
have provent to be very useful in the past where crash messages don't
get caught in syslog.

Or serial console, clearly the best thing since sliced brear ;-)

> At the kernel panic screen:
> -------------
> call trace
> _spin_lock_irqsave
> lock_timer_
> del timer
> ax25_destroy_socket
> ax25_heartbeat_expiry
> run_timer_softirq
> __do_softirq
> do_softirq

Delayed socket destruction code.  That's giving me some idea.  I tried to
cleanup that code earlier in the hope to come up with something that can
obviously shown to be correct but it turned out to be a non-trivial
project.

> Some things I have set and tried:
> -I do not have to add the far end 44 address routing.

Linux will automatically establish a route for every interface, that's
why you don't have to.

> -I have tried both tunl0 and eth0 for connection dev's
> -For my tunl0, I configured it with a local 44 domain IP address
> -I have attached ax25ipd via the ax5 device and it does allow me to
> exchange netrom data with the far end using the far ends 44 domain IP.

NET/ROM.  I guess that is the common factor between you and OH1MRR who
is experiencing a problem that's looking vaguely similar.  Time to turn
NET/ROM upside down; the code is certainly incorrect on any system
running a SMP or preemptible kernel.

> -I am not doing IPv6 just IPv4

That just oldfashioned but not wrong :-)

> I picked up pointer from this site:
> http://www.deepspace6.net/docs/iproute2tunnel-en.html
> 
> Hope I am doing it right!

Missconfiguration is not an acceptable cause for a crash, so yes.

Btw, you may want to switch to GRE tunneling; GRE is a superior tunneling
technology compared to IP-over-IP.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
