From: Jarmo <oh1mrr@nic.fi>
Subject: 6pack related bug
Date: Tue, 8 Jun 2004 11:40:36 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200406081140.37004.oh1mrr@nic.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I don't know if my mails ever reaches DL5BR so I try this
way also.

Hi Ralf

Now I got this one...

I have sent it already into kernel list,but thought you
maybe are intrested also..
It seems,that nobody in kerne list cares,no response...:-(.

Jun  7 15:34:20 oh1rdf kernel: ------------[ cut here ]------------
Jun  7 15:34:20 oh1rdf kernel: kernel BUG at include/linux/list.h:164!
Jun  7 15:34:20 oh1rdf kernel: invalid operand: 0000 [#1]
Jun  7 15:34:20 oh1rdf kernel: Modules linked in: ipip netrom 6pack ax25 3c509
Jun  7 15:34:20 oh1rdf kernel: CPU:    0
Jun  7 15:34:20 oh1rdf kernel: EIP:    0060:[del_timer+111/128]    Not tainted 
VLI
Jun  7 15:34:20 oh1rdf kernel: EIP:    0060:[<c011aa8f>]    Not tainted VLI
Jun  7 15:34:20 oh1rdf kernel: EFLAGS: 00010893   (2.6.7-rc2-mm2) 
Jun  7 15:34:20 oh1rdf kernel: EIP is at del_timer+0x6f/0x80
Jun  7 15:34:20 oh1rdf kernel: eax: 00000286   ebx: c5e88c68   ecx: c114ccf0   
edx: c031d8a0
Jun  7 15:34:20 oh1rdf kernel: esi: c5e88a20   edi: c8884980   ebp: 00000001   
esp: c7fbfcf0
Jun  7 15:34:20 oh1rdf kernel: ds: 007b   es: 007b   ss: 0068
Jun  7 15:34:20 oh1rdf kernel: Process events/0 (pid: 3, threadinfo=c7fbe000 
task=c1128b70)
Jun  7 15:34:20 oh1rdf kernel: Stack: c5e88c68 c8885042 00000001 80000042 
00000080 00000000 c5e88a20 c888532a 
Jun  7 15:34:20 oh1rdf kernel:        c5e88a00 c7fbfd34 00000000 c45a7111 
c7fbfd35 c45a7511 c8884944 c5e88a20 
Jun  7 15:34:20 oh1rdf kernel:        c45a7000 34141380 212c0640 00000000 
00000000 00000000 00000000 00000000 
Jun  7 15:34:20 oh1rdf kernel: Call Trace:
Jun  7 15:34:20 oh1rdf kernel:  
[__crc_blk_queue_hardsect_size+1199275/7563859] 
decode_prio_command+0xa2/0x170 [6pack]
Jun  7 15:34:20 oh1rdf kernel:  [<c8885042>] decode_prio_command+0xa2/0x170 
[6pack]
Jun  7 15:34:20 oh1rdf kernel:  
[__crc_blk_queue_hardsect_size+1200019/7563859] sixpack_decode+0x7a/0xa0 
[6pack]
Jun  7 15:34:20 oh1rdf kernel:  [<c888532a>] sixpack_decode+0x7a/0xa0 [6pack]
Jun  7 15:34:20 oh1rdf kernel:  
[__crc_blk_queue_hardsect_size+1197485/7563859] sixpack_receive_buf+0x94/0xd0 
[6pack]
Jun  7 15:34:20 oh1rdf kernel:  [<c8884944>] sixpack_receive_buf+0x94/0xd0 
[6pack]
Jun  7 15:34:20 oh1rdf kernel:  [__rmqueue+207/304] __rmqueue+0xcf/0x130
Jun  7 15:34:20 oh1rdf kernel:  [<c012c4df>] __rmqueue+0xcf/0x130
Jun  7 15:34:20 oh1rdf kernel:  [buffered_rmqueue+200/384] 
buffered_rmqueue+0xc8/0x180
Jun  7 15:34:20 oh1rdf kernel:  [<c012c778>] buffered_rmqueue+0xc8/0x180
Jun  7 15:34:20 oh1rdf kernel:  [buffered_rmqueue+200/384] 
buffered_rmqueue+0xc8/0x180
Jun  7 15:34:20 oh1rdf kernel:  [<c012c778>] buffered_rmqueue+0xc8/0x180
Jun  7 15:34:20 oh1rdf kernel:  [ide_build_sglist+45/160] 
ide_build_sglist+0x2d/0xa0
Jun  7 15:34:20 oh1rdf kernel:  [<c024a38d>] ide_build_sglist+0x2d/0xa0
Jun  7 15:34:20 oh1rdf kernel:  [ide_build_dmatable+375/400] 
ide_build_dmatable+0x177/0x190
Jun  7 15:34:20 oh1rdf kernel:  [<c024a6c7>] ide_build_dmatable+0x177/0x190
Jun  7 15:34:20 oh1rdf kernel:  [__delay+9/16] __delay+0x9/0x10
Jun  7 15:34:20 oh1rdf kernel:  [<c01ff2d9>] __delay+0x9/0x10
Jun  7 15:34:20 oh1rdf kernel:  [__ide_dma_begin+33/48] 
__ide_dma_begin+0x21/0x30
Jun  7 15:34:20 oh1rdf kernel:  [<c024abe1>] __ide_dma_begin+0x21/0x30
Jun  7 15:34:20 oh1rdf kernel:  [__ide_dma_write+169/176] 
__ide_dma_write+0xa9/0xb0
Jun  7 15:34:20 oh1rdf kernel:  [<c024abb9>] __ide_dma_write+0xa9/0xb0
Jun  7 15:34:20 oh1rdf kernel:  [dma_timer_expiry+0/144] 
dma_timer_expiry+0x0/0x90
Jun  7 15:34:20 oh1rdf kernel:  [<c024a7c0>] dma_timer_expiry+0x0/0x90
Jun  7 15:34:20 oh1rdf kernel:  [__ide_do_rw_disk+736/1312] 
__ide_do_rw_disk+0x2e0/0x520
Jun  7 15:34:20 oh1rdf kernel:  [<c024d3f0>] __ide_do_rw_disk+0x2e0/0x520
Jun  7 15:34:20 oh1rdf kernel:  [as_dispatch_request+305/736] 
as_dispatch_request+0x131/0x2e0
Jun  7 15:34:20 oh1rdf kernel:  [<c022c121>] as_dispatch_request+0x131/0x2e0
Jun  7 15:34:20 oh1rdf kernel:  [__delay+9/16] __delay+0x9/0x10
Jun  7 15:34:20 oh1rdf kernel:  [<c01ff2d9>] __delay+0x9/0x10
Jun  7 15:34:20 oh1rdf kernel:  [ide_wait_stat+214/288] 
ide_wait_stat+0xd6/0x120Jun  7 15:34:20 oh1rdf kernel:  [<c0244416>] 
ide_wait_stat+0xd6/0x120
Jun  7 15:34:20 oh1rdf kernel:  [uart_tasklet_action+60/80] 
uart_tasklet_action+0x3c/0x50
Jun  7 15:34:20 oh1rdf kernel:  [<c021c2bc>] uart_tasklet_action+0x3c/0x50
Jun  7 15:34:20 oh1rdf kernel:  [tasklet_action+67/112] 
tasklet_action+0x43/0x70Jun  7 15:34:20 oh1rdf kernel:  [<c0117a23>] 
tasklet_action+0x43/0x70
Jun  7 15:34:20 oh1rdf kernel:  [__do_softirq+124/128] __do_softirq+0x7c/0x80
Jun  7 15:34:20 oh1rdf kernel:  [<c011782c>] __do_softirq+0x7c/0x80
Jun  7 15:34:20 oh1rdf kernel:  [do_IRQ+199/224] do_IRQ+0xc7/0xe0
Jun  7 15:34:20 oh1rdf kernel:  [<c0107447>] do_IRQ+0xc7/0xe0
Jun  7 15:34:20 oh1rdf kernel:  [schedule+648/1104] schedule+0x288/0x450
Jun  7 15:34:20 oh1rdf kernel:  [<c02ca7e8>] schedule+0x288/0x450
Jun  7 15:34:20 oh1rdf kernel:  [flush_to_ldisc+115/208] 
flush_to_ldisc+0x73/0xd0
Jun  7 15:34:20 oh1rdf kernel:  [<c020d163>] flush_to_ldisc+0x73/0xd0
Jun  7 15:34:20 oh1rdf kernel:  [worker_thread+415/576] 
worker_thread+0x19f/0x240
Jun  7 15:34:20 oh1rdf kernel:  [<c0120c3f>] worker_thread+0x19f/0x240
Jun  7 15:34:20 oh1rdf kernel:  [activate_task+90/112] activate_task+0x5a/0x70
Jun  7 15:34:20 oh1rdf kernel:  [<c011117a>] activate_task+0x5a/0x70
Jun  7 15:34:20 oh1rdf kernel:  [flush_to_ldisc+0/208] flush_to_ldisc+0x0/0xd0
Jun  7 15:34:20 oh1rdf kernel:  [<c020d0f0>] flush_to_ldisc+0x0/0xd0
Jun  7 15:34:20 oh1rdf kernel:  [default_wake_function+0/16] 
default_wake_function+0x0/0x10
Jun  7 15:34:20 oh1rdf kernel:  [<c0111a50>] default_wake_function+0x0/0x10
Jun  7 15:34:20 oh1rdf kernel:  [__wake_up_common+55/96] 
__wake_up_common+0x37/0x60
Jun  7 15:34:20 oh1rdf kernel:  [<c0111a97>] __wake_up_common+0x37/0x60
Jun  7 15:34:20 oh1rdf kernel:  [default_wake_function+0/16] 
default_wake_function+0x0/0x10
Jun  7 15:34:20 oh1rdf kernel:  [<c0111a50>] default_wake_function+0x0/0x10
Jun  7 15:34:20 oh1rdf kernel:  [worker_thread+0/576] worker_thread+0x0/0x240
Jun  7 15:34:20 oh1rdf kernel:  [<c0120aa0>] worker_thread+0x0/0x240
Jun  7 15:34:20 oh1rdf kernel:  [kthread+148/160] kthread+0x94/0xa0
Jun  7 15:34:20 oh1rdf kernel:  [<c0123c54>] kthread+0x94/0xa0
Jun  7 15:34:20 oh1rdf kernel:  [kthread+0/160] kthread+0x0/0xa0
Jun  7 15:34:20 oh1rdf kernel:  [<c0123bc0>] kthread+0x0/0xa0
Jun  7 15:34:20 oh1rdf kernel:  [kernel_thread_helper+5/24] 
kernel_thread_helper+0x5/0x18
Jun  7 15:34:20 oh1rdf kernel:  [<c0103cfd>] kernel_thread_helper+0x5/0x18
Jun  7 15:34:20 oh1rdf kernel: 
Jun  7 15:34:20 oh1rdf kernel: Code: 4a 04 89 11 c7 43 04 00 02 20 00 c7 03 00 
01 10 00 c7 43 18 00 00 00 00 50 9d b8 01 00 00 00 5b c3 0f 0b a5 00 51 c4 2d 
c0 eb d4 <0f> 0b a4 00 51 c4 2d c0 eb c3 8d b4 26 00 00 00 00 55 89 cd 57 


Greetings
Jarmo
OH1MRR
