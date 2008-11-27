From: Chris Kantarjiev <cak@dimebank.com>
Subject: funny kiss trace
Date: Wed, 26 Nov 2008 21:01:33 -0800 (PST)
Message-ID: <200811270501.mAR51Xax025859@moose.dimebank.com>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I'm trying to bring up AX25 on an NSLU2 running Debian, so I can
run the LinuxRMS gateway on it. It's not going very well, but
I'm making progress. 

I'm using one of the Elcom uTNT USB TNCs. It doesn't do many
of the things that it's supposed to, but it appears to be a
reasonable TNC2 clone. :-)

I'm to the point where I have the tools running, the TNC talks to 
minicom, I can run kissattach, etc. But whenever I try to tickle
the AX25 pieces of the kernel, I get things like

[42949472.320000] NET: Registered protocol family 3
[42949472.370000] mkiss: AX.25 Multikiss, Hans Albas PE1AYX
[42949472.390000] mkiss: ax0: crc mode is auto.
[42949472.400000] ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
[42949518.460000] mkiss: ax0: Trying crc-smack
[42949528.470000] mkiss: ax0: Trying crc-flexnet
[42949528.520000] ------------[ cut here ]------------
[42949528.520000] WARNING: at kernel/softirq.c:141 local_bh_enable+0x38/0x9c()
[42949528.520000] Modules linked in: mkiss ax25 crc16 ipv6 ext2 ftdi_sio usbserial evdev ixp4xx_eth ixp4xx_npe firmware_class ixp4xx_qmgr ixp4xx_beeper ohci_hcd ext3 jbd mbcache sd_mod ehci_hcd usb_storage usbcore scsi_mod
[42949528.520000] [<c0029f74>] (dump_stack+0x0/0x14) from [<c003e7e8>] (warn_on_slowpath+0x4c/0x84)
[42949528.520000] [<c003e79c>] (warn_on_slowpath+0x0/0x84) from [<c0043d04>] (local_bh_enable+0x38/0x9c)
[42949528.520000]  r6:00000001 r5:000000e3 r4:c02d4ab0
[42949528.520000] [<c0043ccc>] (local_bh_enable+0x0/0x9c) from [<bf12f82c>] (mkiss_receive_buf+0x3c0/0x41c [mkiss])
[42949528.520000]  r4:c1e6b3a0
[42949528.520000] [<bf12f46c>] (mkiss_receive_buf+0x0/0x41c [mkiss]) from [<c014ea54>] (flush_to_ldisc+0xdc/0x174)
[42949528.520000] [<c014e978>] (flush_to_ldisc+0x0/0x174) from [<c014eb34>] (tty_flip_buffer_push+0x48/0x58)
[42949528.520000]  r8:c0cf6b40 r7:c0eade40 r6:00000001 r5:00000000 r4:00000002
[42949528.520000] [<c014eaec>] (tty_flip_buffer_push+0x0/0x58) from [<bf0bb760>] (ftdi_process_read+0x3f0/0x594 [ftdi_sio])
[42949528.520000] [<bf0bb370>] (ftdi_process_read+0x0/0x594 [ftdi_sio]) from [<bf0bd0c8>] (ftdi_read_bulk_callback+0x144/0x174 [ftdi_sio])
[42949528.520000] [<bf0bcf84>] (ftdi_read_bulk_callback+0x0/0x174 [ftdi_sio]) from [<bf0214a8>] (usb_hcd_giveback_urb+0xb0/0x100 [usbcore])
[42949528.520000]  r8:c2874000 r7:00000000 r6:00000000 r5:c0d14400 r4:c0e609e0
[42949528.520000] [<bf0213f8>] (usb_hcd_giveback_urb+0x0/0x100 [usbcore]) from [<bf095994>] (finish_urb+0x7c/0xa8 [ohci_hcd])
[42949528.520000]  r6:c0e609e0 r5:c0d144e0 r4:c0d14400
[42949528.520000] [<bf095918>] (finish_urb+0x0/0xa8 [ohci_hcd]) from [<bf095a18>] (takeback_td+0x58/0xe4 [ohci_hcd])
[42949528.520000]  r7:c0d144e0 r6:c0e609e0 r5:ffc09040 r4:c0d04480
[42949528.520000] [<bf0959c0>] (takeback_td+0x0/0xe4 [ohci_hcd]) from [<bf0979a4>] (ohci_irq+0x258/0x384 [ohci_hcd])
[42949528.520000]  r7:c0d14400 r6:00000000 r5:c0d144e0 r4:00000000
[42949528.520000] [<bf09774c>] (ohci_irq+0x0/0x384 [ohci_hcd]) from [<bf021834>] (usb_hcd_irq+0x44/0xa0 [usbcore])
[42949528.520000] [<bf0217f0>] (usb_hcd_irq+0x0/0xa0 [usbcore]) from [<c006e09c>] (handle_IRQ_event+0x44/0x84)
[42949528.520000]  r5:00000000 r4:c0d04620
[42949528.520000] [<c006e058>] (handle_IRQ_event+0x0/0x84) from [<c006f9f8>] (handle_level_irq+0x94/0xec)
[42949528.520000]  r7:c02b5e48 r6:00000000 r5:0000001b r4:c02bbb48
[42949528.520000] [<c006f964>] (handle_level_irq+0x0/0xec) from [<c0025048>] (__exception_text_start+0x48/0x64)
[42949528.520000]  r5:c02bbb48 r4:0000001b
[42949528.520000] [<c0025000>] (__exception_text_start+0x0/0x64) from [<c00256b0>] (__irq_svc+0x30/0xa0)
[42949528.520000] Exception stack(0xc02b3f58 to 0xc02b3fa0)
[42949528.520000] 3f40:                                                       c02d61f8 13075789 
[42949528.520000] 3f60: 13075789 00000000 c0027144 c02b2000 c0022f28 c02b5e48 00020c00 690541f1 
[42949528.520000] 3f80: 000209f8 c02b3fb4 c02b3fa0 c02b3fa0 c0026ff8 c0027000 60000013 ffffffff 
[42949528.520000]  r6:08000000 r5:0000001f r4:ffffffff
[42949528.520000] [<c0026fb8>] (cpu_idle+0x0/0x60) from [<c0212398>] (rest_init+0x54/0x68)
[42949528.520000]  r5:c02cf4e8 r4:c02e72f0
[42949528.520000] [<c0212344>] (rest_init+0x0/0x68) from [<c0008bf0>] (start_kernel+0x2a0/0x310)
[42949528.520000] [<c0008950>] (start_kernel+0x0/0x310) from [<00008034>] (0x8034)
[42949528.520000] ---[ end trace 506c96676f61314e ]---

Help? I really don't know where to start.

Thanks!

73 de chris K6DBG
