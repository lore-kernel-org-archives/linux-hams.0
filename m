Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D2747DFA8
	for <linux-hams@vger.kernel.org>; Mon,  5 Oct 2026 18:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791225315; cv=pass; b=dPQMFwY90ii7PUf5WQR5tTHnJe3fBT9YYCiWuNMAvsxnN/SWpF433ZvzhQHDyGxHyzXFjEwQn3PPbf3j1nXFhR4FvQkIM87v19Hz+EJagkpVa3EZQFh1xl487POq7YcrNa74lejwQxnPh3iP/+SWKc0jtsSeREp5QwK41CIrKv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791225315; c=relaxed/simple;
	bh=JfHMQf5wd/pxulW2sRnJYXXd8IRN0mieyCE9wuO+8RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKuXNyiQDFrnNoXvq2BzClKxLRu+Gs4BsDMqo6k6GDPE3L8pDa/FiFXLl2RtAW2s7LNzXXbLds+NBTpiNteo9iyOaLDRHU3nK31QlAhPyz9tZLGCaNYGXKrtF2P/Xo896aq/UY6qGfgxqhXOtU/cDqy8YqXR1rcOx3mmSR1XncQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sFPg4vkn; arc=pass smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFPg4vkn"
Received: by mail-yx2-f38.google.com with SMTP id 00721157ae682-8ac47074ae1so16254647b3.2
        for <linux-hams@vger.kernel.org>; Mon, 05 Oct 2026 11:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791225312; cv=none;
        d=google.com; s=arc-20260327;
        b=RZIfC2WWFx56qp/1PCsYVA4MoY6j1/vSTXuhVZuei4IQWSUwls0rpdphEXurHvo0Qn
         GgL0T9AANbkzDdN9UHiQ8jW/uRmDbRRUZ8QG1n4SMozG2Ij8SRqBdhj5HJjhIvbHK6sM
         Ziw/SLfSiM5yFTPm+O4RUbiSqQrsCwObb3WFTrOgvPy7iiywPc7JHDIIHfubsqzMZW8H
         NSW2UZyHG5X7d2BKW/9vRUuKmfnGWaRJSYArCGU0nuoMhB8iDaMGwPT300OPOdnputO/
         BiBtug/8auX9UryAYYMPqAwxXJzOOy5I1coBbCXni2V0hdj3vLm+HdMpUhb1y5cI90sU
         ZHgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z4DjonTEfYlwxn6qO1k7yJJNlgpw+nXQjPb7VbARqCs=;
        fh=i+/a9EEeca38JzKwk9X22Ngci9Bv/0PhHHM2P0y5saI=;
        b=arxzuoHYWKzhBrS1x4yTtNppm2AijiNNZyXb0q05ejYob1yGEiUmoeaLOciRzNeL0O
         Xj3/vb1as/ozgof57iD4DLcahI8T0laHHY56W/dxn1+H3bZ1yW70rUFK7cT0pXOWHM3o
         XAgGcydWqniXzGAZ0svYvRXAhVR4BJLqDMj1quvHYEkFcwzLCTYWbluowDVsMYJWpSiy
         0N2SBV302M5bNDEcLJ0CBwNmLk8RmcAaaqNZn8WwXqRGZpFhD72w9RQd3JFbKxokuI5Z
         BoRT4bN1Z6f+lLdPpBrA7C+zt5c4Gl84EPj6+kBGHTzSJs48YHlr2AERkkYOuNTt9z0v
         lLOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791225312; x=1791830112; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4DjonTEfYlwxn6qO1k7yJJNlgpw+nXQjPb7VbARqCs=;
        b=sFPg4vknbuYcOH2R6ttE3Yvah9uZddvLG54sXnatoIg+z9M4JSyzUqGHAAgOuO8Hua
         iJ0Da+YRa/cJ7jZqEQyPg5C83eFrwrQKIivyFgfYcJPQ12kU8t4AYLCTyj0YYWY+sEvR
         DrACjZ6lSAInvjBM7Vt/wm9cvqd4Y3OZ/38cNMrg5z9BEfUbYVbspTFnMp3Va1FiPt54
         TKe1tSJ3r0OqJpzq/yBYCwezAGvHB9CBZd1h7cpms9nldBMBoGbyd3F12OnzMi4g9AVh
         NsE440qE7sW9JbQaHex3M8Xnjjdcm6EnykJ1sKTJKg8DC8vXjobmHfPtY8wBHnjlStgK
         tylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791225312; x=1791830112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z4DjonTEfYlwxn6qO1k7yJJNlgpw+nXQjPb7VbARqCs=;
        b=IUjE3Nr8Z+aoKIddbuVo3UQAaQXUAHy9RAcwX67GkrMm6hzJZzjOb8j9MwEpGAmvKv
         fTuci39nPe5gNGxnJWqgXHJ61fmkGnBSZK0bWvOP57EdxpMF4aT5DhBA2VVVvK42es3S
         6St8wThxhTHhCMlk2dWq7+aHIWcRTD1GiyB38RUpadCjmmDWE+XPicFjG+WYe/imHFJ4
         IOBECtk5mZ4iqbhKTWbjP7KYswYZ8s0TTYZW7WpTUTJis0EooGWcUp3AABm8glwSr75Y
         ecaUUM/SLDPXF4NTFxtj7wYODyFu4HQ9L01tay7vE+YWC3A9Grm+c6ihkntrjCt7MMYk
         Xn4A==
X-Gm-Message-State: AFq9FYI/I/QNAHD/fuLZMAiL5L/j7BYvTvOm4BXzIwBEz1y7KVjhiNx8
	JZdCU94LWSoGPrqSDroaowEwE2VKrptqVPPul542eRetz+eJz8hUAFyszkZ9BW9rxMWwXuT7bBg
	Qa8ohtyibD9g/GpkzYa4dbP6yae0Iwrw2lEsqRDc=
X-Gm-Gg: AYBFou1wdqL2l5qzgpoYD5sW5f8GMbdj83PkCQecie7NuWgvR3drTvNqblwe3tu1Xex
	sctNOeQnh2s93elVy3C8f/BZPisN0LPMLFAuiwNgoiwpIf1uXBOqi6ICIPXftztXEMIiKmvYzk1
	qt8SXdAy2HSILxk6r1mGVgND99wdMmlsWMESDGdZiwBgXkHccg+02wlnFYkhEqSPqdL7lZLyMcG
	s/dauWpp58HUMK+7VgCQe+lx5HS51eZ1ytlhszEBwjI4nlfwT/tC54Z8YQPQsMnLBLTjpF3nXVJ
	zu7gHgDPi7RbotHkEjLpj1dA2OheETMm+ZNZTmUdUSKkz0keNw3iwiuT/nKa67aOZg==
X-Received: by 2002:a05:690c:6e84:b0:8ab:4989:bc9d with SMTP id
 00721157ae682-8ae3a5e7d5dmr50982797b3.65.1791225311617; Mon, 05 Oct 2026
 11:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFAa3YBSW2kS4a2rW9p8q3oE8S=7fXC6WKhqoyG8g-ZBa8sYog@mail.gmail.com>
 <CAFAa3YD7Z1jTH9h+VWz8BM3fWGJU7nC3AaruuP9wDg6naJU_TA@mail.gmail.com>
In-Reply-To: <CAFAa3YD7Z1jTH9h+VWz8BM3fWGJU7nC3AaruuP9wDg6naJU_TA@mail.gmail.com>
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Mon, 5 Oct 2026 20:34:59 +0200
X-Gm-Features: AclHuK8yJN12bx5I4xWpkv2JCesbKoNgICpzaOA0Py9370PnbYdbJK7E6_lPEW8
Message-ID: <CAFAa3YDqyTdB07-N0+Z+guZqerFhdU039Tptg+fyT0a76BdbjA@mail.gmail.com>
Subject: hdlcdrv: one fix, and defects without a fix in scc, yam and baycom
 (Re: mkiss: two fixes looking for testers)
To: linux-hams@vger.kernel.org
Cc: thomas@osterried.de
Content-Type: multipart/mixed; boundary="00000000000069be92065d1c2428"

--00000000000069be92065d1c2428
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

This is the last part of my read-through of drivers/net/hamradio:
hdlcdrv, the baycom drivers, yam and scc. One fix is ready. The other
defects need hardware I do not have, so I only describe them here in
the hope that someone who owns such a modem or card can confirm, or
tell me the driver is no longer worth the effort. None of this was
seen in the field: my own nodes use none of these drivers.

1. hdlcdrv: the hardware driver is closed twice, or without being
opened (patch attached)

hdlcdrv_unregister() calls the hardware driver's close() when
s->opened is set, then unregister_netdev(), which closes the
interface again through ndo_stop if it is still up. In addition
hdlcdrv_open() sets s->opened before calling the hardware driver's
open() and leaves it set when that fails.

The baycom close() methods are not written for this. The two serial
drivers call free_irq() and release_region() for resources they do
not hold. baycom_par dereferences bc->pdev, which is NULL when the
port was never opened: "ifconfig bcp0 up" failing on a PC without a
parallel port, followed by "rmmod baycom_par", should be enough.

Fix: set s->opened only after a successful open(), and let
unregister_netdev() do the closing.

Tested in a QEMU guest (6.12.94, KASAN and lockdep) with
baycom_ser_fdx and two ports, one whose open fails and one left up
when the module is unloaded:

before after
"Trying to free already-free IRQ" 2 0
"Trying to free nonexistent resource" 2 0
No traffic could be exercised (the emulated UART is no ser12
modem), and the baycom_par case was not reproduced, the test kernel
has no parport support.

The patch is attached and on the hdlcdrv-close-once branch of my
fork:

https://github.com/f6bvp/mod-orphan/tree/hdlcdrv-close-once

2. baycom_ser_fdx, baycom_ser_hdx, baycom_par: interrupts enabled in
the hard interrupt handler

The three interrupt handlers call local_irq_enable() before running
the HDLC transmitter and receiver, and local_irq_disable() before
returning. Current kernels expect a hard interrupt handler to run
with interrupts off. Not verified by a test.

3. scc: the driver takes scc->lock while it already holds it

scc_isr_dispatch() takes scc->lock and calls scc_txint(). When the
transmit queue is empty scc_txint() calls scc_tx_done(), which calls
scc_start_tx_timer(), which takes scc->lock again. As far as I can
see this happens at the end of every transmission and hangs the CPU
on any SMP kernel; on a uniprocessor kernel the locks compile away.
The same pattern exists in scc_exint() on a transmit underrun, in
t_maxkeyup() and scc_start_calibrate() through
scc_discard_buffers(), and in scc_net_tx() in full duplex, where
t_dwait() is called directly with the lock held.

Also in scc: the interrupt is requested with dev_id set to the IRQ
number and released with free_irq(k, NULL), so it is never actually
freed when the module is unloaded, and free_irq() is called with
interrupts disabled.

Is anyone still running a Z8530 card with a recent kernel?

4. yam

- yam_tx_byte() switches to TX_DATA before it has validated the
frame. A KISS parameter frame, or a frame of invalid length, makes
it transmit the previous content of tx_buf; with a frame of 1024
bytes or more (MTU raised) it reads past tx_buf.
- yam_send_packet() queues without limit and never stops the queue:
with a channel that stays busy the queue only grows.
- On module unload the net devices are freed but stay referenced in
yam_devs[], and /proc/net/yam is removed last: reading it at that
moment, or an interrupt of another port still up, uses freed
memory.
- SIOCYAMSCFG accepts a baudrate of 0, which yam_set_uart() then
divides by.

5. baycom_epp

After a single "EPP timeout" epp_bh() returns without rescheduling
itself, so the interface stays up but dead until it is brought down
and up again.

I can write fixes for the parts of 3 and 4 that do not depend on the
hardware (the scc free_irq and the yam unload order can be checked in
an emulator), if people think these drivers still have users.

Thank you for any feedback.

73 de Bernard, F6BVP


Le lun. 5 oct. 2026 =C3=A0 19:57, Bernard Pidoux <bernard.f6bvp@gmail.com> =
a =C3=A9crit :
>
> Hello,
>
> Following the mkiss patches, I went through bpqether.c and 6pack.c the
> same way. Here are two fixes for bpqether, again found by code review
> and not in the field (my own nodes do not use bpqether).
>
> 1. bpq_xmit() acts on the Ethernet device instead of the bpq device
>
> bpq_xmit() replaces its "dev" argument with the underlying Ethernet
> device before building the Ethernet header. The statements that
> follow were meant for the bpq device but act on the Ethernet one:
>
> - tx_packets and tx_bytes go to the Ethernet device's statistics,
> so the bpq device never counts a transmitted frame;
> - netif_wake_queue() restarts the Ethernet device's transmit queue,
> even if its driver had stopped it because its ring is full.
>
> Fix: count the frame on the bpq device and drop the
> netif_wake_queue() call.
>
> 2. /proc/net/bpqether is truncated on partial reads
>
> bpq_seq_start() never increments its counter, so it only finds the
> first device. The listing stops after one device as soon as it is
> not produced in a single pass: small read buffer, or more than a
> page of output.
>
> Fix: increment the counter.
>
> How it was tested
>
> A QEMU guest running 6.12.94 with KASAN and lockdep, five e1000 ports,
> eth0 and eth1 on the same hub with bpq0 and bpq1 on top, and a packet
> capture of eth0 on the host:
>
> before after
> /proc/net/bpqether, 64 byte reads 2 lines 6 lines (of 6)
> bpq0 tx_packets after 40 UI frames 0 40
> eth0 queue stopped, one frame on bpq0 restarted left stopped
> frames received unchanged on bpq1 40/40 40/40
>
> The stopped queue is simulated with a small helper module, not with a
> real full transmit ring. No kernel report in either run. The bench
> builds the 6.12 version of bpqether.c with the same two changes; the
> patches themselves are against the out-of-tree modules and build on
> 7.0.
>
> The two patches are attached, and they are on the bpqether-fixes
> branch of my fork:
>
> https://github.com/f6bvp/mod-orphan/tree/bpqether-fixes
>
> A question about 6pack
>
> In 6pack.c the encoded length of a frame is stored in sp->status2,
> which is an unsigned char, although it can be as large as 443. For an
> AX.25 frame longer than about 188 bytes the first write to the TNC is
> therefore only "length modulo 256" bytes long, the LED command byte
> 0x60 follows, and the rest of the frame is sent later from the write
> wakeup. Does anyone running a 6pack TNC know whether the firmware
> accepts a command byte in the middle of a data frame? I have no 6pack
> hardware to check, and I would rather not touch this without knowing.
>
> Thank you for any review or test report.
>
> 73 de Bernard, F6BVP
>
>
> Le lun. 5 oct. 2026 =C3=A0 19:39, Bernard Pidoux <bernard.f6bvp@gmail.com=
> a =C3=A9crit :
> >
> > Hello,
> >
> > While reading through drivers/net/hamradio/mkiss.c I found two defects
> > in the transmit path. I have fixes for both and would be grateful if
> > people using mkiss could review and try them. Thomas, you are in copy
> > as one of the authors of the driver: your opinion would be very
> > welcome.
> >
> > Both defects were found by code review, not in the field. My own nodes
> > run mkiss on a pty connected to ax25ipd (AX.25 over UDP) with an MTU of
> > 253, a setup in which neither of them can occur, and their logs and
> > interface counters show no mkiss error.
> >
> > 1. Transmit buffer overflow when the MTU is above 502
> >
> > ax_encaps() accepts a frame of up to dev->mtu + 73 bytes, and KISS
> > escaping can double every byte (0xC0 and 0xDB are each sent as two
> > bytes). The transmit buffer is only max(2 * mtu, 1152) + 4 bytes
> > long, so the doubled 73 bytes of header allowance are not covered.
> >
> > With the default MTU of 236 nothing can happen, the 1152 byte floor
> > hides it. With an MTU above 502, a maximum length frame made of
> > 0xC0 or 0xDB bytes writes up to 148 bytes past the end of the
> > buffer. The frame content need not come from the local machine, a
> > routed IP datagram would do.
> >
> > Reproduced under KASAN on 6.12.94, MTU 1024, one 1097 byte UI frame
> > with an all 0xC0 payload:
> >
> > BUG: KASAN: slab-out-of-bounds in kiss_esc+0x316/0x390 [mkiss]
> > Write of size 1 at addr ffff888001c9c804 by task init/1
> > The buggy address is located 0 bytes to the right of
> > allocated 2052-byte region [ffff888001c9c000, ffff888001c9c804)
> >
> > The driver also sets no upper bound on the MTU: a value of 2^30 or
> > more makes the size computation negative.
> >
> > Fix: compute the buffer length from the largest frame ax_encaps()
> > accepts, add room for the delimiters and the escaped CRC bytes, and
> > set max_mtu to 65535.
> >
> > 2. A tty write error is used as a byte count
> >
> > ax_encaps() and mkiss_write_wakeup() take the return value of
> > tty->ops->write() as a number of bytes. Some tty drivers (USB serial
> > adapters for instance) return a negative errno. The transmit pointer
> > then moves to before the start of the buffer and the next write
> > wakeup sends memory that is not part of the frame.
> >
> > Fix: treat a negative return as a transmit error, drop the rest of
> > the frame and restart the queue.
> >
> > How it was tested
> >
> > A QEMU guest running 6.12.94 with KASAN and lockdep, ax0 attached to a
> > serial port whose output is captured and decoded on the host:
> >
> > - 40 ordinary frames at the default MTU, then 6 maximum length frames
> > of 0xC0 at MTU 1024, without CRC and with SMACK CRC;
> > - original module: the KASAN report above;
> > - patched module: no report, 46 frames out of 46 found unchanged on
> > the line (SMACK and FlexNet CRC included), MTU above 65535 refused.
> >
> > The second fix could NOT be exercised: neither the emulated 8250 port
> > nor a pty ever returns an error from write(). It is compile tested and
> > regression tested only. If someone runs a TNC on a USB serial adapter
> > and can unplug it under traffic, that is exactly the test I am missing.
> >
> > Both patches also build against 7.0.
> >
> > Where to get them
> >
> > The two patches are attached. They apply to the out-of-tree hamradio
> > modules (linux-netdev/mod-orphan on GitHub), and mkiss.c is identical
> > in the 6.12 stable tree, so they apply there as well. They are also on
> > the mkiss-xmit-buffer branch of my fork:
> >
> > https://github.com/f6bvp/mod-orphan/tree/mkiss-xmit-buffer
> >
> > Not addressed by these patches: the transmit state (xleft, xhead) is
> > updated without a lock between ax_encaps() and mkiss_write_wakeup(),
> > and the buffers can be resized from both the transmit and the receive
> > path when the MTU changes under traffic. I have not seen either cause
> > trouble in practice; comments from anyone who knows this code are
> > welcome.
> >
> > Thank you for any review or test report.
> >
> > 73 de Bernard, F6BVP

--00000000000069be92065d1c2428
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-hdlcdrv-close-the-hardware-driver-once-and-only-if-i.patch"
Content-Disposition: attachment; 
	filename="0001-hdlcdrv-close-the-hardware-driver-once-and-only-if-i.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_muvl9twp0>
X-Attachment-Id: f_muvl9twp0

RnJvbSA5Yjc0ZDM0ZDIyMDhiMjU4NmZkZjYwNWRmOGE0M2NkNDdmYmRmNzU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZXJuYXJkIFBpZG91eCA8YmVybmFyZC5mNmJ2cEBnbWFpbC5j
b20+CkRhdGU6IE1vbiwgNSBPY3QgMjAyNiAyMDozMDo0NSArMDIwMApTdWJqZWN0OiBbUEFUQ0hd
IGhkbGNkcnY6IGNsb3NlIHRoZSBoYXJkd2FyZSBkcml2ZXIgb25jZSwgYW5kIG9ubHkgaWYgaXQg
d2FzCiBvcGVuZWQKCmhkbGNkcnZfdW5yZWdpc3RlcigpIGNhbGxzIHRoZSBoYXJkd2FyZSBkcml2
ZXIncyBjbG9zZSgpIHdoZW4gcy0+b3BlbmVkCmlzIHNldCBhbmQgdGhlbiBjYWxscyB1bnJlZ2lz
dGVyX25ldGRldigpLiBUd28gdGhpbmdzIGdvIHdyb25nOgoKIC0gaWYgdGhlIGludGVyZmFjZSBp
cyBzdGlsbCB1cCwgdW5yZWdpc3Rlcl9uZXRkZXYoKSBjbG9zZXMgaXQgdGhyb3VnaAogICBuZG9f
c3RvcCwgc28gaGRsY2Rydl9jbG9zZSgpIGNhbGxzIHRoZSBoYXJkd2FyZSBkcml2ZXIncyBjbG9z
ZSgpIGEKICAgc2Vjb25kIHRpbWU7CgogLSBoZGxjZHJ2X29wZW4oKSBzZXRzIHMtPm9wZW5lZCBi
ZWZvcmUgaXQgY2FsbHMgdGhlIGhhcmR3YXJlIGRyaXZlcidzCiAgIG9wZW4oKSBhbmQgbGVhdmVz
IGl0IHNldCB3aGVuIHRoYXQgZmFpbHMsIHNvIGNsb3NlKCkgaXMgYWxzbyBjYWxsZWQKICAgZm9y
IGEgcG9ydCB0aGF0IHdhcyBuZXZlciBvcGVuZWQuCgpUaGUgY2xvc2UoKSBtZXRob2RzIG9mIHRo
ZSBiYXljb20gZHJpdmVycyBhcmUgbm90IHdyaXR0ZW4gZm9yIGVpdGhlcgpjYXNlLiBiYXljb21f
c2VyX2ZkeCBhbmQgYmF5Y29tX3Nlcl9oZHggY2FsbCBmcmVlX2lycSgpIGFuZApyZWxlYXNlX3Jl
Z2lvbigpIGZvciByZXNvdXJjZXMgdGhleSBkbyBub3QgaG9sZC4gYmF5Y29tX3BhcgpkZXJlZmVy
ZW5jZXMgYmMtPnBkZXYsIHdoaWNoIGlzIE5VTEwgaWYgdGhlIHBvcnQgd2FzIG5ldmVyIG9wZW5l
ZCBhbmQKcG9pbnRzIHRvIGFuIHVucmVnaXN0ZXJlZCBwYXJwb3J0IGRldmljZSBhZnRlciBhIGZp
cnN0IGNsb3NlLgoKU2V0IHMtPm9wZW5lZCBvbmx5IG9uY2UgdGhlIGhhcmR3YXJlIGRyaXZlcidz
IG9wZW4oKSBoYXMgc3VjY2VlZGVkLAphbmQgbGV0IHVucmVnaXN0ZXJfbmV0ZGV2KCkgZG8gdGhl
IGNsb3NpbmcuCgpUZXN0ZWQgaW4gYSBRRU1VIGd1ZXN0ICg2LjEyLjk0LCBLQVNBTiBhbmQgbG9j
a2RlcCkgd2l0aApiYXljb21fc2VyX2ZkeCBhbmQgdHdvIHBvcnRzOiBiY3NmMCBhdCBhbiBhZGRy
ZXNzIHdpdGhvdXQgYSBVQVJULCB3aG9zZQpvcGVuIGZhaWxzLCBhbmQgYmNzZjEgb24gYSBVQVJU
LCBsZWZ0IHVwLiBVbmxvYWRpbmcgYmF5Y29tX3Nlcl9mZHggZ2F2ZQpiZWZvcmUgdGhlIGNoYW5n
ZToKCiAgVHJ5aW5nIHRvIGZyZWUgYWxyZWFkeS1mcmVlIElSUSA1CiAgIHNlcjEyX2Nsb3NlKzB4
YTEvMHgxOTAgW2JheWNvbV9zZXJfZmR4XQogICBjbGVhbnVwX2JheWNvbXNlcmZkeCsweDM4LzB4
NTAgW2JheWNvbV9zZXJfZmR4XQogIHJlc291cmNlOiBUcnlpbmcgdG8gZnJlZSBub25leGlzdGVu
dCByZXNvdXJjZSA8MHgzMDAtMHgzMDc+CiAgYmF5Y29tX3Nlcl9mZHg6IGNsb3NlIHNlcl9mZHgg
YXQgaW9iYXNlIDB4MjUwIGlycSA5CiAgVHJ5aW5nIHRvIGZyZWUgYWxyZWFkeS1mcmVlIElSUSA5
CiAgcmVzb3VyY2U6IFRyeWluZyB0byBmcmVlIG5vbmV4aXN0ZW50IHJlc291cmNlIDwweDI1MC0w
eDI1Nz4KCmFuZCBhZnRlciB0aGUgY2hhbmdlIGEgc2luZ2xlIGNsb3NlIG9mIGJjc2YxIGFuZCBu
byB3YXJuaW5nLiBUaGUKYmF5Y29tX3BhciBjYXNlIHdhcyBub3QgcmVwcm9kdWNlZCwgdGhlIHRl
c3Qga2VybmVsIGhhcyBubyBwYXJwb3J0CnN1cHBvcnQuCgpTaWduZWQtb2ZmLWJ5OiBCZXJuYXJk
IFBpZG91eCA8YmVybmFyZC5mNmJ2cEBnbWFpbC5jb20+CkNvLUF1dGhvcmVkLUJ5OiBDbGF1ZGUg
T3B1cyA1LjUgPG5vcmVwbHlAYW50aHJvcGljLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9oYW1yYWRp
by9oZGxjZHJ2LmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2hhbXJhZGlvL2hkbGNkcnYu
YyBiL2RyaXZlcnMvbmV0L2hhbXJhZGlvL2hkbGNkcnYuYwppbmRleCAzYjg4ZTQ2Li5hOTk0NTE4
IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9oYW1yYWRpby9oZGxjZHJ2LmMKKysrIGIvZHJpdmVy
cy9uZXQvaGFtcmFkaW8vaGRsY2Rydi5jCkBAIC00NDEsNyArNDQxLDYgQEAgc3RhdGljIGludCBo
ZGxjZHJ2X29wZW4oc3RydWN0IG5ldF9kZXZpY2UgKmRldikKIAkvKgogCSAqIGluaXRpYWxpc2Ug
c29tZSB2YXJpYWJsZXMKIAkgKi8KLQlzLT5vcGVuZWQgPSAxOwogCXMtPmhkbGNyeC5oYnVmLnJk
ID0gcy0+aGRsY3J4LmhidWYud3IgPSAwOwogCXMtPmhkbGNyeC5pbl9oZGxjX3J4ID0gMDsKIAlz
LT5oZGxjcngucnhfc3RhdGUgPSAwOwpAQCAtNDU4LDYgKzQ1Nyw3IEBAIHN0YXRpYyBpbnQgaGRs
Y2Rydl9vcGVuKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCiAJaSA9IHMtPm9wcy0+b3BlbihkZXYp
OwogCWlmIChpKQogCQlyZXR1cm4gaTsKKwlzLT5vcGVuZWQgPSAxOwogCW5ldGlmX3N0YXJ0X3F1
ZXVlKGRldik7CiAJcmV0dXJuIDA7CiB9CkBAIC03MjUsOCArNzI1LDcgQEAgdm9pZCBoZGxjZHJ2
X3VucmVnaXN0ZXIoc3RydWN0IG5ldF9kZXZpY2UgKmRldikKIAogCUJVR19PTihzLT5tYWdpYyAh
PSBIRExDRFJWX01BR0lDKTsKIAotCWlmIChzLT5vcGVuZWQgJiYgcy0+b3BzLT5jbG9zZSkKLQkJ
cy0+b3BzLT5jbG9zZShkZXYpOworCS8qIHVucmVnaXN0ZXJfbmV0ZGV2KCkgY2xvc2VzIHRoZSBk
ZXZpY2UgaWYgaXQgaXMgc3RpbGwgdXAgKi8KIAl1bnJlZ2lzdGVyX25ldGRldihkZXYpOwogCQog
CWZyZWVfbmV0ZGV2KGRldik7Ci0tIAoyLjUzLjAKCg==
--00000000000069be92065d1c2428--
