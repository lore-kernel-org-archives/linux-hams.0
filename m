From: Leo Bistmans <on1aad.no.spam@amsat.org>
Subject: 2.6.[012] register_netdev kernel bug
Date: Fri, 6 Feb 2004 22:48:58 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040206224858.07bc8e9e.on1aad.no.spam@amsat.org>
References: <20040201215530.GA572@strauss.udel.edu>
	<20040201215530.GA572@strauss.udel.edu>
	<3.0.6.32.20040201220959.0079bd30@pop.telus.net>
	<1075724381.1263.19.camel@oh2bns.ampr.org>
	<20040201215530.GA572@strauss.udel.edu>
	<20040201215530.GA572@strauss.udel.edu>
	<3.0.6.32.20040201220959.0079bd30@pop.telus.net>
	<20040201215530.GA572@strauss.udel.edu>
	<20040201220920.GA18771@cloud.net.au>
	<20040202153824.GA15819@strauss.udel.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040202153824.GA15819@strauss.udel.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

 When loading soundmodem or baycomepp the mkiss and ax25 modules are
loaded, ax0 interface is created.  So far so good.  When stopping the
user-space application and restarting it some time later, the application
stalls, ifconfig stalls ... and kernel error is logged:

Feb  6 19:06:11 xyz kernel: NET: Registered protocol family 3
Feb  6 19:06:11 xyz kernel: mkiss: AX.25 Multikiss, Hans Albas PE1AYX

Feb  6 19:08:10 xyz kernel: ------------[ cut here ]------------
Feb  6 19:08:10 xyz kernel: kernel BUG at net/core/dev.c:2703!
Feb  6 19:08:10 xyz kernel: invalid operand: 0000 [#1]
Feb  6 19:08:10 xyz kernel: CPU:    0
Feb  6 19:08:10 xyz kernel: EIP:    0060:[<c0220419>]    Not tainted
Feb  6 19:08:10 xyz kernel: EFLAGS: 00210202
Feb  6 19:08:10 xyz kernel: EIP is at register_netdevice+0x61/0x1e4
Feb  6 19:08:10 xyz kernel: eax: 00000001   ebx: cf12a058   ecx: c0308d40 
 edx: 00000000
Feb  6 19:08:10 xyz kernel: esi: 00000001   edi: cf12a058   ebp: cf12a000 
 esp: c8c6fe8c
Feb  6 19:08:10 xyz kernel: ds: 007b   es: 007b   ss: 0068
Feb  6 19:08:10 xyz kernel: Process soundmodem (pid: 1043,
threadinfo=c8c6e000 task=cef34cc0)
Feb  6 19:08:10 xyz kernel: Stack: cf12a058 00000001 cf12a058 cf12a000
c01fa1ea cf12a058 cf12a058 c9bfc000
Feb  6 19:08:10 xyz kernel:        00000000 d09ec7d5 cf12a058 c9bfc00c
c038b538 c9bfc050 c9bfc000 c01d6883
Feb  6 19:08:10 xyz kernel:        c9bfc000 bffff8e4 c9bfc000 0000001a
c9c04000 00000050 00000000 00000000
Feb  6 19:08:10 xyz kernel: Call Trace:
Feb  6 19:08:10 xyz kernel:  [<c01fa1ea>] register_netdev+0x5e/0x70
Feb  6 19:08:10 xyz kernel:  [<d09ec7d5>] ax25_open+0xdd/0x16c [mkiss]
Feb  6 19:08:10 xyz kernel:  [<c01d6883>] tty_set_ldisc+0x133/0x220
Feb  6 19:08:10 xyz kernel:  [<c01dc95b>] set_termios+0x197/0x1a4
Feb  6 19:08:10 xyz kernel:  [<c01db82c>] n_tty_open+0x0/0x94
Feb  6 19:08:10 xyz kernel:  [<c01db800>] n_tty_close+0x0/0x2c
Feb  6 19:08:10 xyz kernel:  [<c01d9d08>] n_tty_flush_buffer+0x0/0x40
Feb  6 19:08:10 xyz kernel:  [<c01d9d48>] n_tty_chars_in_buffer+0x0/0x6c
Feb  6 19:08:10 xyz kernel:  [<c01db8c0>] read_chan+0x0/0x8ac
Feb  6 19:08:10 xyz kernel:  [<c01dc16c>] write_chan+0x0/0x1f8
Feb  6 19:08:10 xyz kernel:  [<c01dcb2c>] n_tty_ioctl+0x0/0x3f4
Feb  6 19:08:10 xyz kernel:  [<c01db650>] n_tty_set_termios+0x0/0x1b0
Feb  6 19:08:10 xyz kernel:  [<c01dc364>] normal_poll+0x0/0x134
Feb  6 19:08:10 xyz kernel:  [<c01da614>] n_tty_receive_buf+0x0/0x1000
Feb  6 19:08:10 xyz kernel:  [<c01da5ac>] n_tty_receive_room+0x0/0x38
Feb  6 19:08:10 xyz kernel:  [<c01da5e4>] n_tty_write_wakeup+0x0/0x30
Feb  6 19:08:10 xyz kernel:  [<c01d8bf4>] tiocsetd+0x18/0x24
Feb  6 19:08:10 xyz kernel:  [<c01d9047>] tty_ioctl+0x2ef/0x3d4
Feb  6 19:08:10 xyz kernel:  [<c015e979>] sys_ioctl+0x209/0x260
Feb  6 19:08:10 xyz kernel:  [<c010af2f>] syscall_call+0x7/0xb
Feb  6 19:08:10 xyz kernel:
Feb  6 19:08:10 xyz kernel: Code: 0f 0b 8f 0a 63 c1 2a c0 8b 43 2c c7 83
24 01 00 00 ff ff ff


Thus the second time the user-space soundmodem does call register_netdev
there is this error.  As far as I can remember rmmod'ing mkiss and ax25
between the first and second run of soundmodem did not help.  

Results are identical for 2.6.0 and .1 and .2
The .config file I used came from www.backports.org/debian. The current
used ( for 2.6.2 ) can be found at http://users.pandora.be/nespa/kernoops

Is there some dependency I missed, either inside our outside kernel ?

Thanks in advance.

Leo, on1aad

--
wake up-what's in that room, wake up- what's in that house?   King Ink
