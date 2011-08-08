From: f6bvp <f6bvp@free.fr>
Subject: Re: [PATCH 0/7] ROSE: Misc fixes
Date: Mon, 08 Aug 2011 17:33:40 +0200
Message-ID: <4E4001D4.5030003@free.fr>
References: <cover.1311152437.git.ralf@linux-mips.org> <4E270D35.9070306@free.fr> <20110720175950.GA13753@linux-mips.org> <4E293E96.3030708@free.fr> <20110722105641.GA24477@linux-mips.org> <4E33351A.2040907@free.fr> <4E3FE760.1050909@free.fr> <20110808140614.GB2120@linux-mips.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090406030603090406000402"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20110808140614.GB2120@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

This is a multi-part message in MIME format.
--------------090406030603090406000402
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Hello Ralf,

Booting 3.0.1 kernel with ROSE patches in SMP mode gives systematically
the following Inconsistent Lock State.
See attached file.

Bernard


Le 08/08/2011 16:06, Ralf Baechle a =E9crit :
> On Mon, Aug 08, 2011 at 03:40:48PM +0200, f6bvp wrote:
>
>> Hello Ralf,
>>
>> Since my last post my two ROSE/FPAC nodes have been running
>> flawlessly with last ROSE patches for nearly 17 days.
>> Situation remains the same, i.e. from time to time use can still be
>> negative.
>>
>> Here is a /proc/net/rose/neigh dump from the machine running dual
>> core CPU with SMP kernel :
>>
>> /proc/net/rose_neigh
>> addr  callsign  dev  count use mode restart  t0  tf digipeaters
>> 00005 F6BVP-5   ax2      1   0  DTE      no   0   0
>> 00004 F8COJ-11  ax2      2  -1  DTE      yes   0   0
>> 00003 F6BVP-11  ax1     11   0  DTE      no   0   0
>> 00002 K4GBB-12  ax2      9   0  DCE     yes   0   0
>> 00001 RSLOOP-0  ???      1   2  DCE     yes   0   0
>>
>> For the present time "use" parameter has returned to 0 for F8COJ-11
>> node neighbor on the other system without
>> manual change.
>> Thus I guess some situations can reinitialize "use" counter.
>> I will then investigate if use can also become negative on this
>> second system if I do not switch to UMP
>> mode at boot (removing maxcpus=3D1 boot option).
>>
>> /proc/net/rose_neigh
>> addr  callsign  dev  count use mode restart  t0  tf digipeaters
>> 00020 F6BVP-5   ax0      1   0  DTE      no   0   0
>> 00019 F6BVP-7   ax0      2   0  DTE      no   0   0
>> 00018 F6BVP-9   ax2      2   0  DTE      no   0   0
>> 00017 F3KT-11   ax0      3   0  DCE     yes   0   0
>> 00016 F8COJ-11  ax0      2   0  DCE     yes   0   0
>> 00015 F6GGY-9   ax0      3   0  DTE      no   0   0
>> ....
>> 00002 TI2HAS-9  ax0      5   0  DTE      no   0   0
>> 00001 RSLOOP-0  ???      1   0  DCE     yes   0   0
> This at least means there should be no regressions by my patch series and
> it's getting time to send it upstream in a few days when I sorted out my
> b0rked DSL line and new workstation.  With these holes plugged finding
> what's actually causing the use counters to go negative should also have
> gotten a little easier.
>
> Thanks,
>
>    Ralf


--------------090406030603090406000402
Content-Type: text/plain;
 name="Inconsistent_lock_state"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Inconsistent_lock_state"

=================================
[ INFO: inconsistent lock state ]
3.0.1 #1
---------------------------------
inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
kworker/0:1/11 [HC0[0]:SC1[5]:HE1:SE0] takes:
 (rose_callsign_lock){+.?...}, at: [<ffffffffa05d2128>] rose_get_neigh_callsign+0x28/0x80 [rose]
{SOFTIRQ-ON-W} state was registered at:
  [<ffffffff81096ed4>] __lock_acquire+0x5f4/0x1620
  [<ffffffff810984f2>] lock_acquire+0xa2/0x120
  [<ffffffff813fece1>] _raw_spin_lock+0x31/0x40
  [<ffffffffa021d068>] 0xffffffffa021d068
  [<ffffffff81002043>] do_one_initcall+0x43/0x190
  [<ffffffff810a4630>] sys_init_module+0x90/0x1f0
  [<ffffffff81407652>] system_call_fastpath+0x16/0x1b
irq event stamp: 17758
hardirqs last  enabled at (17758): [<ffffffff813ff4e0>] _raw_spin_unlock_irqrestore+0x40/0x70
hardirqs last disabled at (17757): [<ffffffff813fedde>] _raw_spin_lock_irqsave+0x2e/0x70
softirqs last  enabled at (17720): [<ffffffffa0184532>] mkiss_receive_buf+0x2e2/0x3dc [mkiss]
softirqs last disabled at (17721): [<ffffffff814088dc>] call_softirq+0x1c/0x30

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(rose_callsign_lock);
  <Interrupt>
    lock(rose_callsign_lock);

 *** DEADLOCK ***

5 locks held by kworker/0:1/11:
 #0:  (events){.+.+.+}, at: [<ffffffff810772c7>] process_one_work+0x137/0x520
 #1:  ((&tty->buf.work)){+.+...}, at: [<ffffffff810772c7>] process_one_work+0x137/0x520
 #2:  (rcu_read_lock){.+.+..}, at: [<ffffffff81340c2b>] __netif_receive_skb+0xeb/0x6a0
 #3:  (rose_neigh_list_lock){+.-...}, at: [<ffffffffa05d3c29>] rose_route_frame+0x79/0x6c0 [rose]
 #4:  (rose_route_list_lock){+.-...}, at: [<ffffffffa05d3c35>] rose_route_frame+0x85/0x6c0 [rose]

stack backtrace:
Pid: 11, comm: kworker/0:1 Not tainted 3.0.1 #1
Call Trace:
 <IRQ>  [<ffffffff810953b5>] print_usage_bug+0x225/0x270
 [<ffffffff810961a3>] mark_lock+0x323/0x3f0
 [<ffffffff81096e5e>] __lock_acquire+0x57e/0x1620
 [<ffffffff810973f3>] ? __lock_acquire+0xb13/0x1620
 [<ffffffff810984f2>] lock_acquire+0xa2/0x120
 [<ffffffffa05d2128>] ? rose_get_neigh_callsign+0x28/0x80 [rose]
 [<ffffffff813fece1>] _raw_spin_lock+0x31/0x40
 [<ffffffffa05d2128>] ? rose_get_neigh_callsign+0x28/0x80 [rose]
 [<ffffffff81096505>] ? trace_hardirqs_on_caller+0x65/0x180
 [<ffffffffa05d2128>] rose_get_neigh_callsign+0x28/0x80 [rose]
 [<ffffffffa05d22d3>] rose_send_frame+0x33/0xb0 [rose]
 [<ffffffff81333956>] ? skb_dequeue+0x66/0x90
 [<ffffffffa05d266b>] rose_link_rx_restart+0x6b/0x170 [rose]
 [<ffffffffa05d3d21>] rose_route_frame+0x171/0x6c0 [rose]
 [<ffffffff8106ab6c>] ? lock_timer_base+0x3c/0x70
 [<ffffffffa05bf96c>] ? ax25_protocol_function+0x1c/0x70 [ax25]
 [<ffffffff813ff4e0>] ? _raw_spin_unlock_irqrestore+0x40/0x70
 [<ffffffffa05d3bb0>] ? rose_get_neigh+0x1a0/0x1a0 [rose]
 [<ffffffffa05c08f7>] ax25_rx_iframe+0x77/0x350 [ax25]
 [<ffffffffa05c2f6e>] ax25_std_frame_in+0x8be/0x920 [ax25]
 [<ffffffffa05c641c>] ? ax25_find_cb+0xcc/0x120 [ax25]
 [<ffffffffa05c01da>] ax25_rcv+0x3aa/0x9a0 [ax25]
 [<ffffffff810962db>] ? mark_held_locks+0x6b/0xa0
 [<ffffffff813ff4e0>] ? _raw_spin_unlock_irqrestore+0x40/0x70
 [<ffffffff8132f69a>] ? sock_def_readable+0x8a/0xb0
 [<ffffffff8132f610>] ? sock_get_timestamp+0xc0/0xc0
 [<ffffffffa05c086f>] ax25_kiss_rcv+0x9f/0xb0 [ax25]
 [<ffffffff81340d4d>] __netif_receive_skb+0x20d/0x6a0
 [<ffffffff81340c2b>] ? __netif_receive_skb+0xeb/0x6a0
 [<ffffffff813412b4>] process_backlog+0xd4/0x1e0
 [<ffffffff81342e55>] net_rx_action+0x125/0x280
 [<ffffffff81062196>] __do_softirq+0xc6/0x210
 [<ffffffff814088dc>] call_softirq+0x1c/0x30
 <EOI>  [<ffffffff8100d43d>] ? do_softirq+0x9d/0xd0
 [<ffffffffa0184532>] ? mkiss_receive_buf+0x2e2/0x3dc [mkiss]
 [<ffffffff81062efb>] local_bh_enable_ip+0xeb/0xf0
 [<ffffffff813ff454>] _raw_spin_unlock_bh+0x34/0x40
 [<ffffffffa0184532>] mkiss_receive_buf+0x2e2/0x3dc [mkiss]
 [<ffffffff812a5f4a>] flush_to_ldisc+0x18a/0x1a0
 [<ffffffff81077336>] process_one_work+0x1a6/0x520
 [<ffffffff810772c7>] ? process_one_work+0x137/0x520
 [<ffffffff812a5dc0>] ? tty_schedule_flip+0x60/0x60
 [<ffffffff81079ca3>] worker_thread+0x173/0x400
 [<ffffffff81079b30>] ? manage_workers+0x210/0x210
 [<ffffffff8107e886>] kthread+0xb6/0xc0
 [<ffffffff810965dd>] ? trace_hardirqs_on_caller+0x13d/0x180
 [<ffffffff814087e4>] kernel_thread_helper+0x4/0x10
 [<ffffffff813ff894>] ? retint_restore_args+0x13/0x13
 [<ffffffff8107e7d0>] ? __init_kthread_worker+0x70/0x70
 [<ffffffff814087e0>] ? gs_change+0x13/0x13
mkiss: ax1: Trying crc-flexnet
mkiss: ax0: Trying crc-smack
type=1305 audit(1312815573.499:96604): auid=4294967295 ses=4294967295 op="remove rule" key=(null) list=4 res=1
type=1305 audit(1312815573.499:96605): audit_enabled=0 old=1 auid=4294967295 ses=4294967295 res=1
mkiss: ax0: Trying crc-flexnet
[root@f6bvp-8 bernard]# 


--------------090406030603090406000402--
