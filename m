From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: spinlock in kernel 2.6.17.1
Date: Thu, 29 Jun 2006 13:09:23 +0200
Message-ID: <44A3B4E3.3090306@ccr.jussieu.fr>
References: <620c90570606031248i6b02af9ao4c872b96e53e3359@mail.gmail.com> <20060604231859.GA20158@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060604231859.GA20158@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi Ralf,

I installed linux kernel 2.6.17.1 on my ROSE-FPAC switch box and get 
systematically spinlocks within a few minutes, that did not came out 
with previous 2.6.16.18 and your patched applied.

After enabling compilation of sysrq for spinlocks and allowing sysrq 
options (see linux/Documentation/sysrq.txt) I found that rose module was 
involved.

Here is a summary of the screen dump obtained using console level 5 and 
't' key action :

            softlockup_tick
            update_process_times
            timer_interrupt
            handle_IRQ_event
            __do_IRQ
            do_IRQ
            common_interrupt
            delay_tsc
            delay_tsc
            _raw_spin_lock
            _spin_lock_bh
<c8a25646> rose_get_neigh   +0x16 /0xa0  [rose]
<c8a25c2c> rose_route_frame +0x41c/0x580 [rose]
<c89d3bfe> ax25_check_iframes_acked +0x5e/0x70 [ax25]
<c89d55e1> ax25_std_frame_in +0x741/0x7e0 [ax25]
            ax25_find_cb
            ax25_kiss_rcv
            autoremove_wake_function

Since spinlock address is always lock: c8a2b3a4
I guess that the problem is in rose_route_frame ?

What other report can I provide in order to help ?

73 de Bernard, f6bvp

http://f6bvp.org
http://rose.fpac.free.fr/MINI-HOWTO/
http://rose.fpac.free.fr/MINI-HOWTO-FR/

