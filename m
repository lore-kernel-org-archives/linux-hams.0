From: f6bvp <f6bvp@free.fr>
Subject: Re: [PATCH 0/7] ROSE: Misc fixes
Date: Fri, 19 Aug 2011 15:07:53 +0200
Message-ID: <4E4E6029.5020207@free.fr>
References: <cover.1311152437.git.ralf@linux-mips.org> <4E270D35.9070306@free.fr> <20110720175950.GA13753@linux-mips.org> <4E293E96.3030708@free.fr> <20110722105641.GA24477@linux-mips.org> <4E33351A.2040907@free.fr> <4E3FE760.1050909@free.fr> <20110808140614.GB2120@linux-mips.org> <4E4001D4.5030003@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070406080608050404030003"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4E4001D4.5030003@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

This is a multi-part message in MIME format.
--------------070406080608050404030003
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Hello Ralf,

Running kernel 3.0.3 with rose patches.
Looking at the following code it seems that first spin_unlock is misplaced
just before memcpy().

I tried to move spin_unlock just after the call to memcpy without change.
The DEADLOCK is still there.


static void rose_get_neigh_callsign(ax25_address *rose_call,
         struct rose_neigh *neigh)
{
         spin_lock(&rose_callsign_lock);
         if (ax25cmp(&rose_callsign, &null_ax25_address) =3D=3D 0) {
                 spin_unlock(&rose_callsign_lock);
                 memcpy(rose_call, neigh->dev->dev_addr, sizeof(rose_call));

                 return;
         }

When examining the inconsistent lock state report I may understand the=20
reason.
The sequence is :

rose_route_frame()
rose_link_rx_start()
rose_send_frame()
rose_get_neigh_callsign()

However, rose_route_frame() is locking rose_route_list and=20
rose_route_neigh_list with spin_lock_bh and if lci=3D=3D0 there is a call i=
n=20
the function to rose_link_rx_restart before unlocking the lists.
If (neigh->restarted) rose_send_frame() is called and in turn will call=20
rose_get_neigh_callsign() that tries to spin_lock rose_callsign_lock and=20
here comes the conflicting situation.

Thus I modified rose_route_frame() in order to spin_unlock both lists=20
before calling rose_link_rx_start().

Here are my patches.

However, another inconsistent lock state remains as you will see in the=20
following attached file.


73 de Bernard


Le 08/08/2011 17:33, f6bvp a =E9crit :
> Hello Ralf,
>
> Booting 3.0.1 kernel with ROSE patches in SMP mode gives systematically
> the following Inconsistent Lock State.
> See attached file.
>
> Bernard
>
>


--------------070406080608050404030003
Content-Type: text/x-patch;
 name="ROSE_8.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ROSE_8.patch"

--- a/net/rose/rose_link.c	2011-07-20 21:51:35.397778246 +0200
+++ a/net/rose/rose_link.new.c	2011-08-19 14:40:33.223383885 +0200
@@ -99,8 +99,8 @@ static void rose_get_neigh_callsign(ax25
 {
 	spin_lock(&rose_callsign_lock);
 	if (ax25cmp(&rose_callsign, &null_ax25_address) == 0) {
-		spin_unlock(&rose_callsign_lock);
 		memcpy(rose_call, neigh->dev->dev_addr, sizeof(rose_call));
+		spin_unlock(&rose_callsign_lock);
 
 		return;
 	}
--- a/net/rose/rose_route.c	2011-07-20 22:00:57.104846408 +0200
+++ a/net/rose/rose_route.new.c	2011-08-19 15:01:07.498780039 +0200
@@ -910,8 +910,10 @@ int rose_route_frame(struct sk_buff *skb
 	 * 	frame.
 	 */
 	if (lci == 0) {
+		spin_unlock_bh(&rose_neigh_list_lock);
+		spin_unlock_bh(&rose_route_list_lock);
 		rose_link_rx_restart(skb, rose_neigh, frametype);
-		goto out;
+		return res;
 	}
 
 	/*

--------------070406080608050404030003
Content-Type: text/plain;
 name="raw_spinlock_3.0.3"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="raw_spinlock_3.0.3"

=================================
[ INFO: inconsistent lock state ]
3.0.3 #2
---------------------------------
inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
kworker/1:1/20 [HC0[0]:SC1[1]:HE1:SE0] takes:
 (rose_callsign_lock){+.?...}, at: [<ffffffffa0583128>] rose_get_neigh_callsign+0x28/0x80 [rose]
{SOFTIRQ-ON-W} state was registered at:
  [<ffffffff81096ef4>] __lock_acquire+0x5f4/0x1620
  [<ffffffff81098512>] lock_acquire+0xa2/0x120
  [<ffffffff813fec21>] _raw_spin_lock+0x31/0x40
  [<ffffffffa02ab068>] 0xffffffffa02ab068
  [<ffffffff81002043>] do_one_initcall+0x43/0x190
  [<ffffffff810a4730>] sys_init_module+0x90/0x1f0
  [<ffffffff81407592>] system_call_fastpath+0x16/0x1b
irq event stamp: 24814
hardirqs last  enabled at (24814): [<ffffffff813ff420>] _raw_spin_unlock_irqrestore+0x40/0x70
hardirqs last disabled at (24813): [<ffffffff813fed1e>] _raw_spin_lock_irqsave+0x2e/0x70
softirqs last  enabled at (24772): [<ffffffffa0184532>] mkiss_receive_buf+0x2e2/0x3dc [mkiss]
softirqs last disabled at (24773): [<ffffffff8140881c>] call_softirq+0x1c/0x30

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(rose_callsign_lock);
  <Interrupt>
    lock(rose_callsign_lock);

 *** DEADLOCK ***

3 locks held by kworker/1:1/20:
 #0:  (events){.+.+.+}, at: [<ffffffff810772c7>] process_one_work+0x137/0x520
 #1:  ((&tty->buf.work)){+.+...}, at: [<ffffffff810772c7>] process_one_work+0x137/0x520
 #2:  (rcu_read_lock){.+.+..}, at: [<ffffffff81340a4b>] __netif_receive_skb+0xeb/0x6a0

stack backtrace:
Pid: 20, comm: kworker/1:1 Not tainted 3.0.3 #2
Call Trace:
 <IRQ>  [<ffffffff810953d5>] print_usage_bug+0x225/0x270
 [<ffffffff810961c3>] mark_lock+0x323/0x3f0
 [<ffffffff81096e7e>] __lock_acquire+0x57e/0x1620
 [<ffffffff81097413>] ? __lock_acquire+0xb13/0x1620
 [<ffffffff81018fbf>] ? save_stack_trace+0x2f/0x50
 [<ffffffff81098512>] lock_acquire+0xa2/0x120
 [<ffffffffa0583128>] ? rose_get_neigh_callsign+0x28/0x80 [rose]
 [<ffffffff813fec21>] _raw_spin_lock+0x31/0x40
 [<ffffffffa0583128>] ? rose_get_neigh_callsign+0x28/0x80 [rose]
 [<ffffffff81096525>] ? trace_hardirqs_on_caller+0x65/0x180
 [<ffffffffa0583128>] rose_get_neigh_callsign+0x28/0x80 [rose]
 [<ffffffffa05832d3>] rose_send_frame+0x33/0xb0 [rose]
 [<ffffffff81333446>] ? skb_dequeue+0x66/0x90
 [<ffffffffa058366b>] rose_link_rx_restart+0x6b/0x170 [rose]
 [<ffffffffa0584dc7>] rose_route_frame+0x187/0x6f0 [rose]
 [<ffffffff8106ab6c>] ? lock_timer_base+0x3c/0x70
 [<ffffffffa056a96c>] ? ax25_protocol_function+0x1c/0x70 [ax25]
 [<ffffffff813ff420>] ? _raw_spin_unlock_irqrestore+0x40/0x70
 [<ffffffffa0584c40>] ? rose_link_failed+0x90/0x90 [rose]
 [<ffffffffa056b8f7>] ax25_rx_iframe+0x77/0x350 [ax25]
 [<ffffffffa056df6e>] ax25_std_frame_in+0x8be/0x920 [ax25]
 [<ffffffffa057141c>] ? ax25_find_cb+0xcc/0x120 [ax25]
 [<ffffffffa056b1da>] ax25_rcv+0x3aa/0x9a0 [ax25]
 [<ffffffff810962fb>] ? mark_held_locks+0x6b/0xa0
 [<ffffffff813ff420>] ? _raw_spin_unlock_irqrestore+0x40/0x70
 [<ffffffff8132f18a>] ? sock_def_readable+0x8a/0xb0
 [<ffffffff8132f100>] ? sock_get_timestamp+0xc0/0xc0
 [<ffffffffa056b86f>] ax25_kiss_rcv+0x9f/0xb0 [ax25]
 [<ffffffff81340b6d>] __netif_receive_skb+0x20d/0x6a0
 [<ffffffff81340a4b>] ? __netif_receive_skb+0xeb/0x6a0
 [<ffffffff813410d4>] process_backlog+0xd4/0x1e0
 [<ffffffff81342c75>] net_rx_action+0x125/0x280
 [<ffffffff81062196>] __do_softirq+0xc6/0x210
 [<ffffffff8140881c>] call_softirq+0x1c/0x30
 <EOI>  [<ffffffff8100d43d>] ? do_softirq+0x9d/0xd0
 [<ffffffffa0184532>] ? mkiss_receive_buf+0x2e2/0x3dc [mkiss]
 [<ffffffff81062efb>] local_bh_enable_ip+0xeb/0xf0
 [<ffffffff813ff394>] _raw_spin_unlock_bh+0x34/0x40
 [<ffffffffa0184532>] mkiss_receive_buf+0x2e2/0x3dc [mkiss]
 [<ffffffff812a602a>] flush_to_ldisc+0x18a/0x1a0
 [<ffffffff81077336>] process_one_work+0x1a6/0x520
 [<ffffffff810772c7>] ? process_one_work+0x137/0x520
 [<ffffffff812a5ea0>] ? tty_schedule_flip+0x60/0x60
 [<ffffffff81079ca3>] worker_thread+0x173/0x400
 [<ffffffff81079b30>] ? manage_workers+0x210/0x210
 [<ffffffff8107e8a6>] kthread+0xb6/0xc0
 [<ffffffff810965fd>] ? trace_hardirqs_on_caller+0x13d/0x180
 [<ffffffff81408724>] kernel_thread_helper+0x4/0x10
 [<ffffffff813ff7d4>] ? retint_restore_args+0x13/0x13
 [<ffffffff8107e7f0>] ? __init_kthread_worker+0x70/0x70
 [<ffffffff81408720>] ? gs_change+0x13/0x13


--------------070406080608050404030003--
