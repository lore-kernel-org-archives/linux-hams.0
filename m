From: Jean-Christian de Rivaz <jc@eclis.ch>
Subject: Re: AX25 mkiss interface not deleted when the serial port is removed
Date: Mon, 28 Sep 2015 22:06:28 +0200
Message-ID: <56099DC4.1000305@eclis.ch>
References: <5605828E.5010104@eclis.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5605828E.5010104@eclis.ch>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams@vger.kernel.org

Le 25. 09. 15 19:21, Jean-Christian de Rivaz a =C3=A9crit :
> Hello,
>
> On a embedded system we use AX25 over an USB serial port with the=20
> kissattach command. For some hardware reason the microcontroller that=
=20
> act as a TNC and USB CDC device can be rested while the system is=20
> running, causing a USB disconnect of the USN CDC device and the=20
> removal of the corresponding serial port in the kernel. But the ax0=20
> interface is not removed in this case and after a few seconds the=20
> kernel panic with the crash below:
>
> [<c0595468>] (skb_panic) from [<c0401f70>] (skb_push+0x4c/0x50)
> [<c0401f70>] (skb_push) from [<bf0bdad4>] (ax25_hard_header+0x34/0xf4=
=20
> [ax25])
> [<bf0bdad4>] (ax25_hard_header [ax25]) from [<bf0d05d4>]=20
> (ax_header+0x38/0x40 [mkiss])
> [<bf0d05d4>] (ax_header [mkiss]) from [<c041b584>]=20
> (neigh_compat_output+0x8c/0xd8)
> [<c041b584>] (neigh_compat_output) from [<c043e7a8>]=20
> (ip_finish_output+0x2a0/0x914)
> [<c043e7a8>] (ip_finish_output) from [<c043f948>] (ip_output+0xd8/0xf=
0)
> [<c043f948>] (ip_output) from [<c043f04c>] (ip_local_out_sk+0x44/0x48=
)
> [<c043f04c>] (ip_local_out_sk) from [<c04721f4>]=20
> (igmpv3_sendpack+0x54/0x58)
> [<c04721f4>] (igmpv3_sendpack) from [<c04734bc>]=20
> (igmp_ifc_timer_expire+0x1c0/0x2ac)
> [<c04734bc>] (igmp_ifc_timer_expire) from [<c00696cc>]=20
> (call_timer_fn+0x4c/0x1ac)
> [<c00696cc>] (call_timer_fn) from [<c0069d20>]=20
> (run_timer_softirq+0x21c/0x340)
> [<c0069d20>] (run_timer_softirq) from [<c0024ea8>]=20
> (__do_softirq+0xa4/0x370)
> [<c0024ea8>] (__do_softirq) from [<c002540c>] (irq_exit+0x88/0xc4)
> [<c002540c>] (irq_exit) from [<c005b550>] (__handle_domain_irq+0x74/0=
xdc)
> [<c005b550>] (__handle_domain_irq) from [<c000872c>]=20
> (aic5_handle+0xe8/0xf4)
> [<c000872c>] (aic5_handle) from [<c059aca8>] (__irq_usr+0x48/0x60)
>
> I suspect that some code is missing somewhere in the serial port=20
> release part to remove the AX25 interface that is attached to it. But=
=20
> I am not certain about this, and I don't know where to look into the=20
> kernel to fix this. The kernel version is 3.19.0 running on a ARMv7=20
> processor in case that matter.
>

I can reproduce this situation when I reset the USB CDC device:

# lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub

# ls -al /proc/$(pgrep kissattach)/fd
total 0
dr-x------ 2 root root  0 Sep 28 19:00 .
dr-xr-xr-x 7 root root  0 Sep 28 19:00 ..
lr-x------ 1 root root 64 Sep 28 19:00 3 -> /dev/ttyACM1 (deleted)

# ifconfig ax0
ax0       Link encap:AMPR AX.25  HWaddr
           BROADCAST MULTICAST  MTU:236  Metric:1
           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:10
           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

At this time there is no more USB device attached to the system and=20
kissattach still have a open file descriptor on the deleted serial=20
device since it use an infinite loop wrapping a long sleep. Maybe=20
kissattach should use select/poll/epoll to be notified to read a EOF an=
d=20
terminate, but this is not the problem of the kernel. What look strange=
=20
to me is the fact that the kernel keep the ax0 interface until the=20
kissattach file descriptor is closed, usually by the termination of=20
kissattach.

It that the expected behavior ? I suspect that the response is "no". I=20
have narrowed down the crash cause to this two conditions:

1) ax0 still exists because of kissattach file descriptor after the=20
serial device is deleted.

2) NetworkManager is running. I don't know yet what NM do, but the cras=
h=20
do not take place if it is not running.

Any help would be welcome.

Jean-Christian

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
