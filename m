From: "Tom Vavra" <wb8zrl@avalon.net>
Subject: linux crashes
Date: Sun, 9 Jan 2005 20:59:51 -0000
Message-ID: <000501c4f68e$5457b6c0$3d4689d8@oem7paq6co5hph>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams <linux-hams@vger.kernel.org>

In mid December I replaced my DOS based packetcluster system with a Linux
based DXSpider system.  Since that time I have had 5 system crashes.  I
think all are the same.  Enclosed at the end is the transcribed crash
screen.  I tried to proof it, but I would not bet too much that I got it
correct.

I am running RedHat 9.0 with a 2.4.20 kernel.  The netrom/ax25 packages are:

  ax25-apps-0.0.6
  ax25-tools-0.0.8
  libax25-0.0.11
  node-0.3.1

I am using three serial ports to drive tncs.  Two of the tncs are tapr-2
(MFJ-1270b) with BPQKISS eproms, and the other tnc is a two port KPC-9612,
using both ports.  So I am driving all three ports with mkiss, followed by
kissattach.  Two netrom ports are defined.  And I am running mheardd.

The cpu is a 450mhz pentium that idles at less than 2%, and there is 256Mb
of memory so swap is almost nonexistant.

Anyone have any ideas about what I need to do to eliminate the crashes?

             Tom  WB8ZRL

here is the crash screen

[<d08a8c04>] ax25_packet_type [ax25] 0x0 (0cx0341e60))
[<d089eca4>] ax25_kiss_rcv [ax25] 0x84 (0xc0341e68))
[<d08a8c04>] ax25_packtet_type [ax25] 0x0 (0xc0341e78))
[<c01ee677>] deliver_to_old_ones [kernel]] 0x77 (0xc0341e80))
[<d08a8c04>] ax25_packet_type [ax25] 0x0 (0xc0341e8c))
[<c01ee88b>] netif_receive_skb [kernel] 0x12b (0xc034e98))
[<d08a8c04>] ax25_packet_;type [ax25] 0x0 0xc0341e9c))
[<c01ee9dd>] process_backlog [kernel] 0x6d (0xc0341eb8))
[<c01eeaea>] net_rx_action [kernel] 0x6a (0xc0341ed0))
[<c0121555>] do_softirq [kernel] 0x95 (0xc0341eec))
[<c010ac8e>] do_IRQ [kernel] 0xbe (0xc0341f04))
[<c010d768>] call_do_IRQ [kernel] 0x5 (0xc0341f24))
[<c011569e>] apm_bios_call_simple [kernel] 0x6e (0xc0341f70))
[<c0115807>] amp_do_idle [kernel] 0x27 (0xc0341fa8))
[<c011595b>] amp_cpu_idle [kernel] 0xbb (0xc0341fc0))
[<c01158a0>] amp_cpu_idle [kernel] 0x0 (0xc0341fc4))
[<c0107040>] default_idle [kernel] 0x0 (0xc0341fd0))
[<c01070f2>] cpu_idle [kernel] 0x42 (0xc0341fd4))
[<c0105000>] stext [kernel] 0x0 (0xc0341fe0))

Code: 8b 53 fc 8b 02 85 c7 75 17 8b 1b 39 f3 75 f1 ff 75 f0 9d 83
 <0>Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing

