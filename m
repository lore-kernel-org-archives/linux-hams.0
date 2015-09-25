From: Jean-Christian de Rivaz <jc@eclis.ch>
Subject: AX25 mkiss interface not deleted when the serial port is removed
Date: Fri, 25 Sep 2015 19:21:18 +0200
Message-ID: <5605828E.5010104@eclis.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hello,

On a embedded system we use AX25 over an USB serial port with the 
kissattach command. For some hardware reason the microcontroller that 
act as a TNC and USB CDC device can be rested while the system is 
running, causing a USB disconnect of the USN CDC device and the removal 
of the corresponding serial port in the kernel. But the ax0 interface is 
not removed in this case and after a few seconds the kernel panic with 
the crash below:

[<c0595468>] (skb_panic) from [<c0401f70>] (skb_push+0x4c/0x50)
[<c0401f70>] (skb_push) from [<bf0bdad4>] (ax25_hard_header+0x34/0xf4 
[ax25])
[<bf0bdad4>] (ax25_hard_header [ax25]) from [<bf0d05d4>] 
(ax_header+0x38/0x40 [mkiss])
[<bf0d05d4>] (ax_header [mkiss]) from [<c041b584>] 
(neigh_compat_output+0x8c/0xd8)
[<c041b584>] (neigh_compat_output) from [<c043e7a8>] 
(ip_finish_output+0x2a0/0x914)
[<c043e7a8>] (ip_finish_output) from [<c043f948>] (ip_output+0xd8/0xf0)
[<c043f948>] (ip_output) from [<c043f04c>] (ip_local_out_sk+0x44/0x48)
[<c043f04c>] (ip_local_out_sk) from [<c04721f4>] (igmpv3_sendpack+0x54/0x58)
[<c04721f4>] (igmpv3_sendpack) from [<c04734bc>] 
(igmp_ifc_timer_expire+0x1c0/0x2ac)
[<c04734bc>] (igmp_ifc_timer_expire) from [<c00696cc>] 
(call_timer_fn+0x4c/0x1ac)
[<c00696cc>] (call_timer_fn) from [<c0069d20>] 
(run_timer_softirq+0x21c/0x340)
[<c0069d20>] (run_timer_softirq) from [<c0024ea8>] (__do_softirq+0xa4/0x370)
[<c0024ea8>] (__do_softirq) from [<c002540c>] (irq_exit+0x88/0xc4)
[<c002540c>] (irq_exit) from [<c005b550>] (__handle_domain_irq+0x74/0xdc)
[<c005b550>] (__handle_domain_irq) from [<c000872c>] (aic5_handle+0xe8/0xf4)
[<c000872c>] (aic5_handle) from [<c059aca8>] (__irq_usr+0x48/0x60)

I suspect that some code is missing somewhere in the serial port release 
part to remove the AX25 interface that is attached to it. But I am not 
certain about this, and I don't know where to look into the kernel to 
fix this. The kernel version is 3.19.0 running on a ARMv7 processor in 
case that matter.

Any hint would be appreciate.

Best Regards,
Jean-Christian de Rivaz
