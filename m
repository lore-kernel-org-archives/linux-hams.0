From: Chris Kantarjiev <cak@dimebank.com>
Subject: Re: funny kiss trace
Date: Fri, 28 Nov 2008 15:19:38 -0800
Message-ID: <49307C8A.4090905@dimebank.com>
References: <200811270501.mAR51Xax025859@moose.dimebank.com> <26532428.304427.1227782165570.JavaMail.www@wwinf1c19>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <26532428.304427.1227782165570.JavaMail.www@wwinf1c19>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chion Jacques <f6cwo@orange.fr>
Cc: linux-hams@vger.kernel.org

Chion Jacques wrote:
> I had the same problem with a kernel-2.6.26.3
> i upgraded to kernel 2.6.27 and the problem disappeared with a clean
> response of kissattach.

I'm running 2.6.27 and still getting traces when I try to connect in to my linux box.

Interestingly enough, the TNC seems to respond by itself to the CONN dialog - I can see the radio Tx 
light coming on, and the TNC that I'm calling from gets connected and then immediately disconnected.

What should I set "MYCALL" to on the TNC itself? Does it also get K6DBG-10 (my Linux port's 
call/ssid), or something else?

This is interesting, too:

k6dbg-10:/home/cak# mheard
Callsign  Port Packets   Last Heard
K6B        0         9   Fri Nov 28 15:15:13

I'm calling from K6DBG-7, not K6B ... I'm using mkiss, maybe I should try without?

[42949467.650000] NET: Registered protocol family 3
[42949477.640000] mkiss: AX.25 Multikiss, Hans Albas PE1AYX
[42949551.590000] mkiss: ax0: crc mode is auto.
[42949551.600000] ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
[42949584.490000] mheardd uses obsolete (PF_INET,SOCK_PACKET)
[42949646.780000] mkiss: ax0: Trying crc-smack
[  108.300000] ------------[ cut here ]------------
[  108.300000] WARNING: at kernel/softirq.c:136 local_bh_enable+0x4c/0xb0()
[  108.300000] Modules linked in: mkiss crc16 ax25 ipv6 ext2 ftdi_sio usbserial evdev ixp4xx_eth 
ixp4xx_npe ixp4xx_qmgr ixp4xx_beeper ohci_hcd ext3 jbd mbcache sd_mod crc_t10dif ehci_hcd 
usb_storage usbcore scsi_mod
[  108.300000] [<c002a108>] (dump_stack+0x0/0x14) from [<c003e0e4>] (warn_on_slowpath+0x4c/0x84)
[  108.300000] [<c003e098>] (warn_on_slowpath+0x0/0x84) from [<c0043768>] (local_bh_enable+0x4c/0xb0)
[  108.300000]  r6:00000001 r5:00000000 r4:c02da4c0
[  108.300000] [<c004371c>] (local_bh_enable+0x0/0xb0) from [<bf12e834>] 
(mkiss_receive_buf+0x3c0/0x41c [mkiss])
[  108.300000]  r4:c1e023a0
[  108.300000] [<bf12e474>] (mkiss_receive_buf+0x0/0x41c [mkiss]) from [<c01516a8>] 
(flush_to_ldisc+0xe0/0x178)
[  108.300000] [<c01515c8>] (flush_to_ldisc+0x0/0x178) from [<c0151788>] 
(tty_flip_buffer_push+0x48/0x58)
[  108.300000]  r8:c0f763a0 r7:c0dc5040 r6:00000001 r5:00000000 r4:00000010
[  108.300000] [<c0151740>] (tty_flip_buffer_push+0x0/0x58) from [<bf0ba764>] 
(ftdi_process_read+0x3f0/0x594 [ftdi_sio])
[  108.300000] [<bf0ba374>] (ftdi_process_read+0x0/0x594 [ftdi_sio]) from [<bf0bc10c>] 
(ftdi_read_bulk_callback+0x144/0x174 [ftdi_sio])
[  108.300000] [<bf0bbfc8>] (ftdi_read_bulk_callback+0x0/0x174 [ftdi_sio]) from [<bf021698>] 
(usb_hcd_giveback_urb+0xb0/0x100 [usbcore])
[  108.300000]  r8:c287e000 r7:00000000 r6:00000000 r5:c0f44400 r4:c0e07320
[  108.300000] [<bf0215e8>] (usb_hcd_giveback_urb+0x0/0x100 [usbcore]) from [<bf099b70>] 
(finish_urb+0x98/0xc4 [ohci_hcd])
[  108.300000]  r6:c0e07320 r5:c0f444e0 r4:c0f44400
[  108.300000] [<bf099ad8>] (finish_urb+0x0/0xc4 [ohci_hcd]) from [<bf099bf4>] 
(takeback_td+0x58/0xe4 [ohci_hcd])
[  108.300000]  r7:c0f444e0 r6:c0e07320 r5:ffc09040 r4:c1e104c0
[  108.300000] [<bf099b9c>] (takeback_td+0x0/0xe4 [ohci_hcd]) from [<bf09bc98>] 
(ohci_irq+0x258/0x384 [ohci_hcd])
[  108.300000]  r7:c0f44400 r6:00000000 r5:c0f444e0 r4:00000000
[  108.300000] [<bf09ba40>] (ohci_irq+0x0/0x384 [ohci_hcd]) from [<bf021a2c>] (usb_hcd_irq+0x44/0xa0 
[usbcore])
[  108.300000] [<bf0219e8>] (usb_hcd_irq+0x0/0xa0 [usbcore]) from [<c006d880>] 
(handle_IRQ_event+0x44/0x84)
[  108.300000]  r5:00000000 r4:c1c8fc60
[  108.300000] [<c006d83c>] (handle_IRQ_event+0x0/0x84) from [<c006f168>] (handle_level_irq+0x94/0xec)
[  108.300000]  r7:c02bbe48 r6:00000000 r5:0000001b r4:c02c1cd0
[  108.300000] [<c006f0d4>] (handle_level_irq+0x0/0xec) from [<c0025048>] 
(__exception_text_start+0x48/0x64)
[  108.300000]  r5:c02c1cd0 r4:0000001b
[  108.300000] [<c0025000>] (__exception_text_start+0x0/0x64) from [<c0025810>] (__irq_svc+0x30/0xa0)
[  108.300000] Exception stack(0xc02b9f58 to 0xc02b9fa0)
[  108.300000] 9f40:                                                       c02dbbb8 d80dc99f
[  108.300000] 9f60: 13a8939f 60000013 c00272e4 c02b8000 c0022f18 c02bbe48 000211ec 690541f1
[  108.300000] 9f80: 00020fe4 c02b9fb4 c02b9fa0 c02b9fa0 c002719c c002719c 60000013 ffffffff
[  108.300000]  r6:08000000 r5:0000001f r4:ffffffff
[  108.300000] [<c0027158>] (cpu_idle+0x0/0x64) from [<c021907c>] (rest_init+0x54/0x68)
[  108.300000]  r5:c02d4f08 r4:c02ecca0
[  108.300000] [<c0219028>] (rest_init+0x0/0x68) from [<c0008a6c>] (start_kernel+0x2a4/0x314)
[  108.300000] [<c00087c8>] (start_kernel+0x0/0x314) from [<00008034>] (0x8034)
[  108.300000] ---[ end trace a392a1cb839725d5 ]---
[  108.620000] mkiss: ax0: Trying crc-flexnet

