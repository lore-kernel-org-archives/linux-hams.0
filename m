From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: AVR32 Oops: Unhandled exception in kernel mode, sig: 7 [#1] at
 arp.c line 725 ax25 related.
Date: Wed, 3 Nov 2010 01:21:30 +0000
Message-ID: <20101103012130.GA23498@linux-mips.org>
References: <AANLkTikJhcYfYEFC2RtUoBRv-m8DdEdeqpeAPrmU70C1@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikJhcYfYEFC2RtUoBRv-m8DdEdeqpeAPrmU70C1@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Eatough <simon.eatough@gmail.com>
Cc: linux-hams@vger.kernel.org

On Thu, Oct 21, 2010 at 10:43:40PM +1300, Simon Eatough wrote:

> Hi
> I have uncovered a AX25 related memory misalignment issuse in kernel
> 2.6.25.10  and also in the latest 2.6.35.7 running on the AVR32 micro.
> 
> When a kiss ax25 ticpip port Is pinged  I get the following kernel oops:-
> 
> 
> Oops: Unhandled exception in kernel mode, sig: 7 [#1]
> FRAME_POINTER chip: 0x01f:0x1e82 rev 2
> Modules linked in: mkiss
> PC is at arp_process+0xa8/0x4d8
> LR is at 0x91d2e140
> pc : [<90127438>]    lr : [<91d2e140>]    Not tainted
> sp : 91c1fddc  r12: 91d2e140  r11: 00000000
> r10: 00000003  r9 : 00000004  r8 : 91d81c04
> r7 : 91c1fe30  r6 : 91d2e140  r5 : 00000003  r4 : 00000000
> r3 : 91961821  r2 : 91d62800  r1 : 91c1fe78  r0 : 91d81c00
> Flags: qvnZc
> Mode bits: hjmde....g
> CPU Mode: Supervisor
> Process: events/0 [4] (task: 91c13900 thread: 91c1e000)
> Stack: (0x91c1fddc to 0x91c20000)
> fdc0:                                                                91d2e140
> fde0: 91c87600 901f7b1c 00000000 00000000 00410024 900183d8 91c1fe18 91d4bf6c
> fe00: 901f7b10 00000000 00000001 901f7b1c 00000000 00000000 9002758e 91c1fe2c
> fe20: 91d4bf6c 91d81c00 00000000 90017802 90127932 91c1fe54 91d2e140 91d2e140
> fe40: 00000000 00000000 91d62800 91c1fe78 00000000 900fd266 91c1fe7c 91d2e140
> fe60: 902168a8 00000000 91d62800 00000806 91c1fe78 00000000 90216890 900fd3f0
> fe80: 91c1fea0 91d62800 90216a34 00000000 00000001 ffff1e77 00000040 00000000
> fea0: 900fc7e4 91c1fec4 90216a34 00000040 00000000 0000012c ffff1e77 00000000
> fec0: 00000000 9001ea7e 91c1fee8 00000000 90210198 00000000 0000000a 902102a0
> fee0: 00000000 00000000 9001eade 91c1ff0c 00400022 91d62b60 00000000 91961810
> ff00: 0000002f 91c0d000 00000000 9001ec50 91c1ff20 91d2e140 91d62b60 00000000
> ff20: c0878566 91c1ff48 91d2e140 91d62b60 00000000 00000000 91960d4f 919a5400
> ff40: c0878312 91960c4f 900d29fe 91c1ff6c 91960c00 00000000 00000000 919a5400
> ff60: 00000000 919a540c 00400024 90025150 91c1ff90 91c00300 900d2964 00000000
> ff80: 901d4d70 901bafa0 901baf68 91c15f10 900254cc 91c1ffc8 91c1e000 91c1e000
> ffa0: 00000000 91c00300 ffffe000 90027368 91c15f10 00000000 91c13900 90027584
> ffc0: 91c1ffc0 91c1ffc0 90027394 91c1ffec 91c00300 90025424 00000000 00000000
> ffe0: 9001d694 90027368 91c15f10 9001d694 00000000 00000000 00000000 00000000
> Call trace:
>  [<90127932>] arp_rcv+0xca/0xf0
>  [<900fd266>] netif_receive_skb+0x1fc/0x21e
>  [<900fd3f0>] process_backlog+0x48/0xa4
>  [<900fc7e4>] net_rx_action+0x28/0xf0
>  [<9001ea7e>] __do_softirq+0x32/0x70
>  [<9001eade>] do_softirq+0x22/0x3c
>  [<9001ec50>] local_bh_enable+0x40/0x5c
>  [<c0878566>] mkiss_receive_buf+0x282/0x3a4 [mkiss]
>  [<900d29fe>] flush_to_ldisc+0x9a/0xf0
>  [<90025150>] run_workqueue+0x58/0xcc
>  [<900254cc>] worker_thread+0xa8/0xb4
>  [<90027394>] kthread+0x2c/0x44
>  [<9001d694>] do_exit+0x0/0x438
> 
> Kernel panic - not syncing: Fatal exception in interrupt
> 
> 
> The instruction that causes the oops is at pc
> 0x90127438 <arp_process+168>:   ld.uh r9,r3[0x2] and r3 loaded with a odd
> address 0x91961821 which on the avr32 generates the exception.
> This is at line 725 in arp.c
>         if (arp->ar_pro != htons(ETH_P_IP) ||
>                     htons(dev_type) != arp->ar_hrd)
> 
> 
> I have fixed the problem by creating local copys of ar_pro,ar_hrd and ar_op.
> 
> My question is is this the right place to fix the code or should I be looking
> at fixing the alignment issue in the ax25 layers instead .

In Linux we write protocol stacks assuming that headers are correctly
aligned on rx.  There are historically a few notorious offenders, for
example DEC tulip (I think - it's a long time ...) cards.  Tulips can only
place rx packets on addresses that are a multiple of 4.  With the ethernet
header being 14 bytes that means that IP addresses in the IP header always
end up on an address that is 2-byte but never 4-byte aligned.

The deal here is that the Linux protocol stack just doesn't care about
such inferior network hardware designs.  On some hardware like M68k or x86
the hardware deals with missalignment at a minor slowdown.  On others such
as Alpha or MIPS misalignment is punished with an exception and the kernel
has to complete the offending load or store in software.  AVR32 seems to
belong into the latter group of architectures but not have the required
unalignment fixup handlers.  Which the arch code must provide or the shit
will regularly hit a jet engine.

That said, the mkiss handler has to copy the packet around anyway.  With
very little code we could bit a little more efficient on M68k and x86 and
a lot more on most RISCs.  A totally untested patch is appended below.

Can you test this patch?

  Ralf

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

 drivers/net/hamradio/mkiss.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/net/hamradio/mkiss.c b/drivers/net/hamradio/mkiss.c
index 66e88bd..83f3ce8 100644
--- a/drivers/net/hamradio/mkiss.c
+++ b/drivers/net/hamradio/mkiss.c
@@ -42,6 +42,7 @@
 #include <net/ax25.h>
 
 #define AX_MTU		236
+#define AX_RX_OFFSET	3
 
 /* SLIP/KISS protocol characters. */
 #define END             0300		/* indicates end of frame	*/
@@ -292,7 +293,7 @@ static void ax_bump(struct mkiss *ax)
 
 	count = ax->rcount;
 
-	if ((skb = dev_alloc_skb(count)) == NULL) {
+	if ((skb = dev_alloc_skb(count + AX_RX_OFFSET)) == NULL) {
 		printk(KERN_ERR "mkiss: %s: memory squeeze, dropping packet.\n",
 		       ax->dev->name);
 		ax->dev->stats.rx_dropped++;
@@ -300,6 +301,7 @@ static void ax_bump(struct mkiss *ax)
 		return;
 	}
 
+	skb_reserve(skb, AX_RX_OFFSET);
 	memcpy(skb_put(skb,count), ax->rbuff, count);
 	skb->protocol = ax25_type_trans(skb, ax->dev);
 	netif_rx(skb);
