From: Jean-Christian de Rivaz <jc@eclis.ch>
Subject: Re: AX25 mkiss interface not deleted when the serial port is removed
Date: Tue, 29 Sep 2015 17:46:58 +0200
Message-ID: <560AB272.1060400@eclis.ch>
References: <5605828E.5010104@eclis.ch> <20150929153129.GA31429@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20150929153129.GA31429@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Le 29. 09. 15 17:31, Ralf Baechle DL5RB a =E9crit :
> On Fri, Sep 25, 2015 at 07:21:18PM +0200, Jean-Christian de Rivaz wro=
te:
>
>> On a embedded system we use AX25 over an USB serial port with the ki=
ssattach
>> command. For some hardware reason the microcontroller that act as a =
TNC and
>> USB CDC device can be rested while the system is running, causing a =
USB
>> disconnect of the USN CDC device and the removal of the correspondin=
g serial
>> port in the kernel. But the ax0 interface is not removed in this cas=
e and
>> after a few seconds the kernel panic with the crash below:
>>
>> [<c0595468>] (skb_panic) from [<c0401f70>] (skb_push+0x4c/0x50)
>> [<c0401f70>] (skb_push) from [<bf0bdad4>] (ax25_hard_header+0x34/0xf=
4
>> [ax25])
>> [<bf0bdad4>] (ax25_hard_header [ax25]) from [<bf0d05d4>]
>> (ax_header+0x38/0x40 [mkiss])
>> [<bf0d05d4>] (ax_header [mkiss]) from [<c041b584>]
>> (neigh_compat_output+0x8c/0xd8)
>> [<c041b584>] (neigh_compat_output) from [<c043e7a8>]
>> (ip_finish_output+0x2a0/0x914)
>> [<c043e7a8>] (ip_finish_output) from [<c043f948>] (ip_output+0xd8/0x=
f0)
>> [<c043f948>] (ip_output) from [<c043f04c>] (ip_local_out_sk+0x44/0x4=
8)
> skb_push is invoked via a code path that was conceptually completly b=
roken
> and has been rewritten recently.  So it would be great if you could r=
etest
> with a recent release version preferably 4.2.

Hi Ralf,

I try since this morning to make the git linux master running on the=20
system, but I hit many problems due to some changes on what is allowed=20
in a device tree. I have solved some of them but now I have a spinlock=20
kernel crash that I am completely unable to understand. I will report i=
t=20
to linux-arm-kernel in a moment.

>   I suspect this is not the
> cause but I'd like to exclude the possibility.
>

I have read the patches between my kernel and git linux master affectin=
g=20
ax15 and mkiss, and I was unable to identify something related. Please=20
read the previous message from me in the linux-hams mailing list, I=20
suspect it contain a better code path where the problem could be. I cop=
y=20
it below:

[  251.460000] drivers/net/hamradio/mkiss.c:738 mkiss_open()
[  251.460000] CPU: 0 PID: 247 Comm: kworker/0:1 Tainted: G W=20
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
bring back the ax0 interface on a new deleted serial device.

Regards,
Jean-Christian

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
