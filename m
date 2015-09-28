From: Jean-Christian de Rivaz <jc@eclis.ch>
Subject: Re: AX25 mkiss interface not deleted when the serial port is removed
Date: Tue, 29 Sep 2015 01:13:36 +0200
Message-ID: <5609C9A0.6020701@eclis.ch>
References: <5605828E.5010104@eclis.ch> <56099DC4.1000305@eclis.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <56099DC4.1000305@eclis.ch>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-hams@vger.kernel.org

Le 28. 09. 15 22:06, Jean-Christian de Rivaz a =C3=A9crit :
> Le 25. 09. 15 19:21, Jean-Christian de Rivaz a =C3=A9crit :
>> Hello,
>>
>> On a embedded system we use AX25 over an USB serial port with the=20
>> kissattach command. For some hardware reason the microcontroller tha=
t=20
>> act as a TNC and USB CDC device can be rested while the system is=20
>> running, causing a USB disconnect of the USN CDC device and the=20
>> removal of the corresponding serial port in the kernel. But the ax0=20
>> interface is not removed in this case and after a few seconds the=20
>> kernel panic with the crash below:
>>
>> [<c0595468>] (skb_panic) from [<c0401f70>] (skb_push+0x4c/0x50)
>> [<c0401f70>] (skb_push) from [<bf0bdad4>] (ax25_hard_header+0x34/0xf=
4=20
>> [ax25])
>> [<bf0bdad4>] (ax25_hard_header [ax25]) from [<bf0d05d4>]=20
>> (ax_header+0x38/0x40 [mkiss])
>> [<bf0d05d4>] (ax_header [mkiss]) from [<c041b584>]=20
>> (neigh_compat_output+0x8c/0xd8)
>> [<c041b584>] (neigh_compat_output) from [<c043e7a8>]=20
>> (ip_finish_output+0x2a0/0x914)
>> [<c043e7a8>] (ip_finish_output) from [<c043f948>] (ip_output+0xd8/0x=
f0)
>> [<c043f948>] (ip_output) from [<c043f04c>] (ip_local_out_sk+0x44/0x4=
8)
>> [<c043f04c>] (ip_local_out_sk) from [<c04721f4>]=20
>> (igmpv3_sendpack+0x54/0x58)
>> [<c04721f4>] (igmpv3_sendpack) from [<c04734bc>]=20
>> (igmp_ifc_timer_expire+0x1c0/0x2ac)
>> [<c04734bc>] (igmp_ifc_timer_expire) from [<c00696cc>]=20
>> (call_timer_fn+0x4c/0x1ac)
>> [<c00696cc>] (call_timer_fn) from [<c0069d20>]=20
>> (run_timer_softirq+0x21c/0x340)
>> [<c0069d20>] (run_timer_softirq) from [<c0024ea8>]=20
>> (__do_softirq+0xa4/0x370)
>> [<c0024ea8>] (__do_softirq) from [<c002540c>] (irq_exit+0x88/0xc4)
>> [<c002540c>] (irq_exit) from [<c005b550>]=20
>> (__handle_domain_irq+0x74/0xdc)
>> [<c005b550>] (__handle_domain_irq) from [<c000872c>]=20
>> (aic5_handle+0xe8/0xf4)
>> [<c000872c>] (aic5_handle) from [<c059aca8>] (__irq_usr+0x48/0x60)
>>
>> I suspect that some code is missing somewhere in the serial port=20
>> release part to remove the AX25 interface that is attached to it. Bu=
t=20
>> I am not certain about this, and I don't know where to look into the=
=20
>> kernel to fix this. The kernel version is 3.19.0 running on a ARMv7=20
>> processor in case that matter.
>>
>
> I can reproduce this situation when I reset the USB CDC device:
>
> # lsusb
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
>
> # ls -al /proc/$(pgrep kissattach)/fd
> total 0
> dr-x------ 2 root root  0 Sep 28 19:00 .
> dr-xr-xr-x 7 root root  0 Sep 28 19:00 ..
> lr-x------ 1 root root 64 Sep 28 19:00 3 -> /dev/ttyACM1 (deleted)
>
> # ifconfig ax0
> ax0       Link encap:AMPR AX.25  HWaddr
>           BROADCAST MULTICAST  MTU:236  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:10
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>
> At this time there is no more USB device attached to the system and=20
> kissattach still have a open file descriptor on the deleted serial=20
> device since it use an infinite loop wrapping a long sleep. Maybe=20
> kissattach should use select/poll/epoll to be notified to read a EOF=20
> and terminate, but this is not the problem of the kernel. What look=20
> strange to me is the fact that the kernel keep the ax0 interface unti=
l=20
> the kissattach file descriptor is closed, usually by the termination=20
> of kissattach.
>
> It that the expected behavior ? I suspect that the response is "no". =
I=20
> have narrowed down the crash cause to this two conditions:
>
> 1) ax0 still exists because of kissattach file descriptor after the=20
> serial device is deleted.
>

After adding some printk() and dump_stack() I found this path:

tty_ldisc_hangup()->tty_ldisc_reinit()->tty_ldisc_close()->mkiss_close(=
)->unregister_netdev()

And then:

[  251.460000] drivers/net/hamradio/mkiss.c:738 mkiss_open()
[  251.460000] CPU: 0 PID: 247 Comm: kworker/0:1 Tainted: G W     =20
3.19.0-rc1+ #41
[  251.500000] Hardware name: Atmel SAMA5 (Device Tree)
[  251.500000] Workqueue: usb_hub_wq hub_event
[  251.500000] [<c00149f4>] (unwind_backtrace) from [<c00124f8>]=20
(show_stack+0x20/0x24)
[  251.550000] [<c00124f8>] (show_stack) from [<c0594700>]=20
(dump_stack+0x20/0x28)
[  251.550000] [<c0594700>] (dump_stack) from [<bf093ed0>]=20
(mkiss_open+0x34/0x2e8 [mkiss])
[  251.570000] [<bf093ed0>] (mkiss_open [mkiss]) from [<c02d5b3c>]=20
(tty_ldisc_open+0x54/0x94)
[  251.570000] [<c02d5b3c>] (tty_ldisc_open) from [<c02d63a8>]=20
(tty_ldisc_hangup+0x190/0x1bc)
[  251.590000] [<c02d63a8>] (tty_ldisc_hangup) from [<c02cdc10>]=20
(__tty_hangup+0x2b4/0x3ec)
[  251.590000] [<c02cdc10>] (__tty_hangup) from [<c02cdd88>]=20
(tty_vhangup+0x1c/0x20)
[  251.610000] [<c02cdd88>] (tty_vhangup) from [<bf00f628>]=20
(acm_disconnect+0xcc/0x1a8 [cdc_acm])
[  251.610000] [<bf00f628>] (acm_disconnect [cdc_acm]) from [<c0377938>=
]=20
(usb_unbind_interface+0x7c/0x288)
[  251.630000] [<c0377938>] (usb_unbind_interface) from [<c02f8548>]=20
(__device_release_driver+0x80/0xd4)
[  251.630000] [<c02f8548>] (__device_release_driver) from [<c02f85c8>]=
=20
(device_release_driver+0x2c/0x38)
[  251.650000] [<c02f85c8>] (device_release_driver) from [<c02f8148>]=20
(bus_remove_device+0xe4/0x104)
[  251.650000] [<c02f8148>] (bus_remove_device) from [<c02f5830>]=20
(device_del+0x108/0x1f0)
[  251.670000] [<c02f5830>] (device_del) from [<c03753d8>]=20
(usb_disable_device+0xb0/0x1fc)
[  251.670000] [<c03753d8>] (usb_disable_device) from [<c036cb0c>]=20
(usb_disconnect+0x74/0x250)
[  251.680000] [<c036cb0c>] (usb_disconnect) from [<c036e4b4>]=20
(hub_event+0x4ec/0x1110)
[  251.710000] [<c036e4b4>] (hub_event) from [<c00369b0>]=20
(process_one_work+0x120/0x424)
[  251.710000] [<c00369b0>] (process_one_work) from [<c0036e5c>]=20
(worker_thread+0x164/0x4c0)
[  251.730000] [<c0036e5c>] (worker_thread) from [<c003b9f8>]=20
(kthread+0xdc/0xf8)
[  251.730000] [<c003b9f8>] (kthread) from [<c000f038>]=20
(ret_from_fork+0x14/0x3c)

So tty_ldisc_hangup() seem to open a new mkiss line discipline that wil=
l=20
bring back the ax0 interface on a new deleted serial device. I actually=
=20
don't understand why tty_ldisc_open() is called.

Is there anybody here ?

Jean-Christian



--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
