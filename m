From: sp2ong@geofizyka.pl
Subject: Re: Linux kernel 2.6rc1 and USCC>4/ISA
Date: Sat, 03 Jan 2004 21:33:33 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3FF7271D.2070103@geofizyka.pl>
References: <3FF6A1CA.9060003@geofizyka.pl> <20040103174125.A211@jeroen.pe1rxq.ampr.org> <3FF6F7C8.9000006@geofizyka.pl> <20040103202602.C211@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040103202602.C211@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: linux-hams@vger.kernel.org

Hi,

Thank you for patches and I have recompiled kernel 2.6.1-rc1 with this 
patches and now USCC card working ! But in log I saw some worning after 
init USCC:

AX.25: Z8530 SCC driver version 3.0.dl1bke
mkiss: AX.25 Multikiss, Hans Albas PE1AYX
scc0: data port = 0x300  control port = 0x304 -- found
scc1: data port = 0x301  control port = 0x305 -- found
scc2: data port = 0x302  control port = 0x306 -- found
scc3: data port = 0x303  control port = 0x307 -- found
Init Z8530 driver: 4 channels, IRQ 7
Uninitialised timer!
This is just a warning.  Your computer is OK
function=0x00000000, data=0x0
Call Trace:
  [<c0120b91>] check_timer_failed+0x51/0x60
  [<c0120ef7>] del_timer+0x17/0x90
  [<c8828ef8>] init_channel+0x18/0x7e0 [scc]
  [<c01091a8>] common_interrupt+0x18/0x20
  [<c882b516>] scc_net_open+0x36/0x50 [scc]
  [<c02626a3>] dev_open+0xb3/0xe0
  [<c0263b87>] dev_change_flags+0x57/0x130
  [<c029ac86>] devinet_ioctl+0x296/0x610
  [<c029cec4>] inet_ioctl+0xa4/0xe0
  [<c025b821>] sock_ioctl+0xf1/0x2b0
  [<c015b7cc>] sys_ioctl+0xec/0x260
  [<c0108f87>] syscall_call+0x7/0xb

Uninitialised timer!
This is just a warning.  Your computer is OK
function=0x00000000, data=0x0
Call Trace:
  [<c0120b91>] check_timer_failed+0x51/0x60
  [<c0120ef7>] del_timer+0x17/0x90
  [<c8828f04>] init_channel+0x24/0x7e0 [scc]
  [<c01091a8>] common_interrupt+0x18/0x20
  [<c882b516>] scc_net_open+0x36/0x50 [scc]
  [<c02626a3>] dev_open+0xb3/0xe0
  [<c0263b87>] dev_change_flags+0x57/0x130
  [<c029ac86>] devinet_ioctl+0x296/0x610
  [<c029cec4>] inet_ioctl+0xa4/0xe0
  [<c025b821>] sock_ioctl+0xf1/0x2b0
  [<c015b7cc>] sys_ioctl+0xec/0x260
  [<c0108f87>] syscall_call+0x7/0xb

Uninitialised timer!
This is just a warning.  Your computer is OK
function=0x00000000, data=0x0
Call Trace:
  [<c0120b91>] check_timer_failed+0x51/0x60
  [<c0120ef7>] del_timer+0x17/0x90
  [<c8828ef8>] init_channel+0x18/0x7e0 [scc]
  [<c02b567e>] masq_inet_event+0x1e/0x30
  [<c02b5690>] device_cmp+0x0/0x100
  [<c882b516>] scc_net_open+0x36/0x50 [scc]
  [<c02626a3>] dev_open+0xb3/0xe0
  [<c0263b87>] dev_change_flags+0x57/0x130
  [<c029ac86>] devinet_ioctl+0x296/0x610
  [<c029cec4>] inet_ioctl+0xa4/0xe0
  [<c025b821>] sock_ioctl+0xf1/0x2b0
  [<c015b7cc>] sys_ioctl+0xec/0x260
  [<c0108f87>] syscall_call+0x7/0xb

Uninitialised timer!
This is just a warning.  Your computer is OK
function=0x00000000, data=0x0
Call Trace:
  [<c0120b91>] check_timer_failed+0x51/0x60
  [<c0120ef7>] del_timer+0x17/0x90
  [<c8828f04>] init_channel+0x24/0x7e0 [scc]
  [<c02b567e>] masq_inet_event+0x1e/0x30
  [<c02b5690>] device_cmp+0x0/0x100
  [<c882b516>] scc_net_open+0x36/0x50 [scc]
  [<c02626a3>] dev_open+0xb3/0xe0
  [<c0263b87>] dev_change_flags+0x57/0x130
  [<c029ac86>] devinet_ioctl+0x296/0x610
  [<c029cec4>] inet_ioctl+0xa4/0xe0
  [<c025b821>] sock_ioctl+0xf1/0x2b0
  [<c015b7cc>] sys_ioctl+0xec/0x260
  [<c0108f87>] syscall_call+0x7/0xb

