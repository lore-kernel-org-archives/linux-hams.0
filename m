Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979452D876B
	for <linux-hams@vger.kernel.org>; Mon,  5 Oct 2026 17:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791223046; cv=pass; b=nM1NXWbgCfMW2DiSrWpP5Tqqlq50L6II8AJe19ayrJVCXy61/axi8ijnGbP1bVvWuYk5QTnvNMITz3knXDSFytM8HRzqOHHgHG3orMXR+ZxGIIAmkkVvQSA4c24TKdNMG/uc1Q/McKdd8/mdOAADOgtEeQ5IZh1YnhPdYC8f67k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791223046; c=relaxed/simple;
	bh=aiSNzsiggoHLSuDMNa0qjF8TYhVkcPD8qhwrYyKULvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGErxTQcrOp2Tdfg1cVvMYfG7UkEscxHkEbMvT5xnNpjtdHzMpiNgT628zHKipxvZU9mZCN4X99rMF1i2tLixbdeg139IQz1ck0A9qo8pUKmxDdmQVYO0e4evzybYafWiIfTF6g2omtWlKpIftyadg2dm3ggHjg74JTrgopRvZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJIwWDxQ; arc=pass smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJIwWDxQ"
Received: by mail-yx2-f38.google.com with SMTP id 956f58d0204a3-6768033d654so1831491d50.0
        for <linux-hams@vger.kernel.org>; Mon, 05 Oct 2026 10:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791223043; cv=none;
        d=google.com; s=arc-20260327;
        b=A2sXy/bm715Mt3lfip2QnCIJ4fhMjtz1pxyXIo0OiBk7z+dnbmZb/Bd/m8eZAkmt/k
         7RDsWsD2CdLyDGYQFANcVa9zPM6/kbIcTRSSM6xJFA0PNDiNIrFAkAxl3IEF1YlqH7w1
         SsyLXRZ4RrWk+8Gj4OT+9ixz5YswcwT8309P9X1F7R6RISqPIki0a3oX73NRp2NFUNIL
         1Scdp+zrU7vKoLlBUrrhdiHaAWq9J4K/Qnl+ntyh4WFdM35WtRoSVaZpdniKan1q7xM8
         862FrNwO13oefsjuUXMoLRWClBmBP98W9kpbYE5yf2x36uj+l6zVM4GWccqQftLbkpc4
         BNzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KXHMy8N91N0l/a7demKJDP/S3aWXkNq1f5znGw7h08Y=;
        fh=i+/a9EEeca38JzKwk9X22Ngci9Bv/0PhHHM2P0y5saI=;
        b=sf80V5DoCfqu6W+nW4mFeApCGv4YM8hxZnClrSHC+LrfWT5hLfw3Tcn4D0pe9sglM5
         uOLMNBBfzRzeUk+w1g6WDUYPxikLHf4nHVzxy1UHjGc7rIJSVp/VOKxzyNt9WkOZfW56
         KOSqjSd56/UgcHEKFnn1fA5P9tffSvsYts8yD9yj6vplvKLAY8bEy6YQnQlI1pJWt9VP
         7YQUojLEJJdxnOgSYvBP30IUozC7eCbBIBDt3++25O4nc0PIJjZVAh4toGg9I8qTZeJD
         tYOWNikgLiW1T/PE74myusSIxEVJngk/4BsGeLcR/sMPkarTjT6Erk2TwyhZMxMKULuC
         y6pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791223043; x=1791827843; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXHMy8N91N0l/a7demKJDP/S3aWXkNq1f5znGw7h08Y=;
        b=dJIwWDxQXtfAuB/UsXf6OpbCk6/mfiFRyMTrqli0g1awGow+HVlK9729F1kPPzAHgK
         96dh3Kh6iHkx7vBxWoMmC62U0j3ZhusCUUQD/U4vx7EzKvjlAJ1rPLLqgoa+cak0A1HK
         lzOlHBzc199oVJFBKvIIqtPiIiyLloO4tSKOz6DqE0OpfS/xhcufDyJ/9C6HEsxozHEu
         MmnXHUZMgmRUaa4YXqxvwiw1u5l87TrfWtqNGlCVFUgYeMvhpRfdR3ILI9pKbcKYx0s0
         j64KDTh+Lv2ECNKRNlPTsfxaRYsa6XR0hZ1a3Wj+nymxKyR5PmXDLH6hglvOefnIVpL8
         q9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791223043; x=1791827843;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KXHMy8N91N0l/a7demKJDP/S3aWXkNq1f5znGw7h08Y=;
        b=MK3aCLk/3FJ3dqV+0ggHPizhHkA2afZhvgoAM3YbtO8Wjx3vrJZludlkpsgZdeXlfB
         VDMkxKX29EQxeFFMlbFowQyXi+lvrQNDjEfqM06DFyoVM5b+H8vV3PiQ5CE9TCgmPyhD
         wq6dIBj/eqH+9bDMC4TtIwjQ+u3/KW5XZpcDOGEMlhXjB1VOrTaGVkki57Usa1kngJsi
         +2DECgvtCM+dOjWmc4BKOYUjR6L63q/X5J8cxvx1XQ/KkHhd7eMO//zOJwmnfrU1cA+D
         8JjO2XrVPI0JFEcYq5BFpj6eGhYa5EUXu7wnkm5sw124NXLpWuwO9KjmgvSIatto/Epj
         xb4w==
X-Gm-Message-State: AFq9FYKKDkVLY1xwjtIHVZVZEOMi2hJ/6xAJCmnGHLmlsu0dh1dHY7n8
	1xMWw6EY+9RM1jSEr2+pvmUmD1h9GUTFXldNH0Fa5kJwraLWkq7SN0DQo+ByZ1osa0cdmRSi6JS
	yHTEOy3sP6dE5X6rsKe/ln18TrRfo6ZjUgUA+
X-Gm-Gg: AYBFou3AzTHnmwsBwPugWPxbOJF30ol4Gvka/1ujvG0XuB5jAjCG8brTMjXawEWXygB
	15TMl+QxSe4K+dPWcQcsjaCFgVFhyr9Vr+CKMl8fiytXCPV7YPOcaBf1JWGvqgLEtXBVLbU4fzd
	VcsTOyycw+yJuyJyP3pIVaMPj5r1egbTQMxPCUNUeBtNf+ilFbVJVcNM4ZzahkLqEgUonLGlLOd
	JAeZq6DRpdpdXijrpqZYyd6ZkpuBmrJ5ZIGJGAgLu3PR/wB+DZEeKh2/7oDNunsegZakKF1dZJg
	15p6nAUFOsEseeAqtshtm9DLKMaaj4eJFRQY1ncF1vg9jovhZp1QYg4=
X-Received: by 2002:a05:690e:e8a:b0:677:a816:4bbd with SMTP id
 956f58d0204a3-677af52917cmr4059322d50.51.1791223043417; Mon, 05 Oct 2026
 10:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFAa3YBSW2kS4a2rW9p8q3oE8S=7fXC6WKhqoyG8g-ZBa8sYog@mail.gmail.com>
In-Reply-To: <CAFAa3YBSW2kS4a2rW9p8q3oE8S=7fXC6WKhqoyG8g-ZBa8sYog@mail.gmail.com>
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Mon, 5 Oct 2026 19:57:11 +0200
X-Gm-Features: AclHuK9t3fUGyg4qGP5WTKJnHCm_yYZW2iTugPUl5pkUi-GwokUZfYT69StNsoI
Message-ID: <CAFAa3YD7Z1jTH9h+VWz8BM3fWGJU7nC3AaruuP9wDg6naJU_TA@mail.gmail.com>
Subject: bpqether: two more fixes looking for testers (Re: mkiss: two fixes
 looking for testers)
To: linux-hams@vger.kernel.org
Cc: thomas@osterried.de
Content-Type: multipart/mixed; boundary="00000000000037b957065d1b9de3"

--00000000000037b957065d1b9de3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Following the mkiss patches, I went through bpqether.c and 6pack.c the
same way. Here are two fixes for bpqether, again found by code review
and not in the field (my own nodes do not use bpqether).

1. bpq_xmit() acts on the Ethernet device instead of the bpq device

bpq_xmit() replaces its "dev" argument with the underlying Ethernet
device before building the Ethernet header. The statements that
follow were meant for the bpq device but act on the Ethernet one:

- tx_packets and tx_bytes go to the Ethernet device's statistics,
so the bpq device never counts a transmitted frame;
- netif_wake_queue() restarts the Ethernet device's transmit queue,
even if its driver had stopped it because its ring is full.

Fix: count the frame on the bpq device and drop the
netif_wake_queue() call.

2. /proc/net/bpqether is truncated on partial reads

bpq_seq_start() never increments its counter, so it only finds the
first device. The listing stops after one device as soon as it is
not produced in a single pass: small read buffer, or more than a
page of output.

Fix: increment the counter.

How it was tested

A QEMU guest running 6.12.94 with KASAN and lockdep, five e1000 ports,
eth0 and eth1 on the same hub with bpq0 and bpq1 on top, and a packet
capture of eth0 on the host:

before after
/proc/net/bpqether, 64 byte reads 2 lines 6 lines (of 6)
bpq0 tx_packets after 40 UI frames 0 40
eth0 queue stopped, one frame on bpq0 restarted left stopped
frames received unchanged on bpq1 40/40 40/40

The stopped queue is simulated with a small helper module, not with a
real full transmit ring. No kernel report in either run. The bench
builds the 6.12 version of bpqether.c with the same two changes; the
patches themselves are against the out-of-tree modules and build on
7.0.

The two patches are attached, and they are on the bpqether-fixes
branch of my fork:

https://github.com/f6bvp/mod-orphan/tree/bpqether-fixes

A question about 6pack

In 6pack.c the encoded length of a frame is stored in sp->status2,
which is an unsigned char, although it can be as large as 443. For an
AX.25 frame longer than about 188 bytes the first write to the TNC is
therefore only "length modulo 256" bytes long, the LED command byte
0x60 follows, and the rest of the frame is sent later from the write
wakeup. Does anyone running a 6pack TNC know whether the firmware
accepts a command byte in the middle of a data frame? I have no 6pack
hardware to check, and I would rather not touch this without knowing.

Thank you for any review or test report.

73 de Bernard, F6BVP


Le lun. 5 oct. 2026 =C3=A0 19:39, Bernard Pidoux <bernard.f6bvp@gmail.com> =
a =C3=A9crit :
>
> Hello,
>
> While reading through drivers/net/hamradio/mkiss.c I found two defects
> in the transmit path. I have fixes for both and would be grateful if
> people using mkiss could review and try them. Thomas, you are in copy
> as one of the authors of the driver: your opinion would be very
> welcome.
>
> Both defects were found by code review, not in the field. My own nodes
> run mkiss on a pty connected to ax25ipd (AX.25 over UDP) with an MTU of
> 253, a setup in which neither of them can occur, and their logs and
> interface counters show no mkiss error.
>
> 1. Transmit buffer overflow when the MTU is above 502
>
> ax_encaps() accepts a frame of up to dev->mtu + 73 bytes, and KISS
> escaping can double every byte (0xC0 and 0xDB are each sent as two
> bytes). The transmit buffer is only max(2 * mtu, 1152) + 4 bytes
> long, so the doubled 73 bytes of header allowance are not covered.
>
> With the default MTU of 236 nothing can happen, the 1152 byte floor
> hides it. With an MTU above 502, a maximum length frame made of
> 0xC0 or 0xDB bytes writes up to 148 bytes past the end of the
> buffer. The frame content need not come from the local machine, a
> routed IP datagram would do.
>
> Reproduced under KASAN on 6.12.94, MTU 1024, one 1097 byte UI frame
> with an all 0xC0 payload:
>
> BUG: KASAN: slab-out-of-bounds in kiss_esc+0x316/0x390 [mkiss]
> Write of size 1 at addr ffff888001c9c804 by task init/1
> The buggy address is located 0 bytes to the right of
> allocated 2052-byte region [ffff888001c9c000, ffff888001c9c804)
>
> The driver also sets no upper bound on the MTU: a value of 2^30 or
> more makes the size computation negative.
>
> Fix: compute the buffer length from the largest frame ax_encaps()
> accepts, add room for the delimiters and the escaped CRC bytes, and
> set max_mtu to 65535.
>
> 2. A tty write error is used as a byte count
>
> ax_encaps() and mkiss_write_wakeup() take the return value of
> tty->ops->write() as a number of bytes. Some tty drivers (USB serial
> adapters for instance) return a negative errno. The transmit pointer
> then moves to before the start of the buffer and the next write
> wakeup sends memory that is not part of the frame.
>
> Fix: treat a negative return as a transmit error, drop the rest of
> the frame and restart the queue.
>
> How it was tested
>
> A QEMU guest running 6.12.94 with KASAN and lockdep, ax0 attached to a
> serial port whose output is captured and decoded on the host:
>
> - 40 ordinary frames at the default MTU, then 6 maximum length frames
> of 0xC0 at MTU 1024, without CRC and with SMACK CRC;
> - original module: the KASAN report above;
> - patched module: no report, 46 frames out of 46 found unchanged on
> the line (SMACK and FlexNet CRC included), MTU above 65535 refused.
>
> The second fix could NOT be exercised: neither the emulated 8250 port
> nor a pty ever returns an error from write(). It is compile tested and
> regression tested only. If someone runs a TNC on a USB serial adapter
> and can unplug it under traffic, that is exactly the test I am missing.
>
> Both patches also build against 7.0.
>
> Where to get them
>
> The two patches are attached. They apply to the out-of-tree hamradio
> modules (linux-netdev/mod-orphan on GitHub), and mkiss.c is identical
> in the 6.12 stable tree, so they apply there as well. They are also on
> the mkiss-xmit-buffer branch of my fork:
>
> https://github.com/f6bvp/mod-orphan/tree/mkiss-xmit-buffer
>
> Not addressed by these patches: the transmit state (xleft, xhead) is
> updated without a lock between ax_encaps() and mkiss_write_wakeup(),
> and the buffers can be resized from both the transmit and the receive
> path when the MTU changes under traffic. I have not seen either cause
> trouble in practice; comments from anyone who knows this code are
> welcome.
>
> Thank you for any review or test report.
>
> 73 de Bernard, F6BVP

--00000000000037b957065d1b9de3
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-bpqether-leave-the-Ethernet-device-s-queue-and-count.patch"
Content-Disposition: attachment; 
	filename="0001-bpqether-leave-the-Ethernet-device-s-queue-and-count.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_muvjx53i0>
X-Attachment-Id: f_muvjx53i0

RnJvbSA5OWZlZjY0OWYyMmMyNDMyZDhhZWJkZmJlNzg2MTgyMWQ5N2M5OWQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZXJuYXJkIFBpZG91eCA8YmVybmFyZC5mNmJ2cEBnbWFpbC5j
b20+CkRhdGU6IE1vbiwgNSBPY3QgMjAyNiAxOTo1MTo1NiArMDIwMApTdWJqZWN0OiBbUEFUQ0gg
MS8yXSBicHFldGhlcjogbGVhdmUgdGhlIEV0aGVybmV0IGRldmljZSdzIHF1ZXVlIGFuZCBjb3Vu
dGVycwogYWxvbmUKCmJwcV94bWl0KCkgcmVwbGFjZXMgaXRzICJkZXYiIGFyZ3VtZW50IHdpdGgg
dGhlIHVuZGVybHlpbmcgRXRoZXJuZXQKZGV2aWNlIGJlZm9yZSBpdCBidWlsZHMgdGhlIEV0aGVy
bmV0IGhlYWRlci4gVGhlIHRocmVlIHN0YXRlbWVudHMgdGhhdApmb2xsb3cgd2VyZSB3cml0dGVu
IGZvciB0aGUgYnBxIGRldmljZSBidXQgbm93IGFjdCBvbiB0aGUgRXRoZXJuZXQgb25lOgoKIC0g
dHhfcGFja2V0cyBhbmQgdHhfYnl0ZXMgYXJlIGFkZGVkIHRvIHRoZSBFdGhlcm5ldCBkZXZpY2Un
cwogICBzdGF0aXN0aWNzLCBzbyB0aGUgYnBxIGRldmljZSBuZXZlciBjb3VudHMgYSB0cmFuc21p
dHRlZCBmcmFtZTsKCiAtIG5ldGlmX3dha2VfcXVldWUoKSByZXN0YXJ0cyB0aGUgdHJhbnNtaXQg
cXVldWUgb2YgdGhlIEV0aGVybmV0CiAgIGRldmljZS4gSWYgaXRzIGRyaXZlciBoYWQgc3RvcHBl
ZCB0aGF0IHF1ZXVlIGJlY2F1c2UgaXRzIHRyYW5zbWl0CiAgIHJpbmcgaXMgZnVsbCwgYnBxZXRo
ZXIgb3ZlcnJpZGVzIHRoZSBkcml2ZXIncyBmbG93IGNvbnRyb2wuCgpDb3VudCB0aGUgZnJhbWUg
b24gdGhlIGJwcSBkZXZpY2UsIHdoaWNoIGlzIHN0aWxsIGF0IGhhbmQgaW4gb3JpZ19kZXYsCmFu
ZCBkcm9wIHRoZSBuZXRpZl93YWtlX3F1ZXVlKCkgY2FsbC4gVGhlIGJwcSBkZXZpY2UgZG9lcyBu
b3Qgc3RvcCBpdHMKb3duIHF1ZXVlIG91dHNpZGUgb2YgbmRvX3N0b3AsIHNvIHRoZXJlIGlzIG5v
dGhpbmcgdG8gd2FrZS4KClRlc3RlZCBpbiBhIFFFTVUgZ3Vlc3QgKDYuMTIuOTQsIEtBU0FOIGFu
ZCBsb2NrZGVwKSB3aXRoIHR3byBlMTAwMApwb3J0cyBvbiB0aGUgc2FtZSBodWIsIGJwcTAgb24g
dGhlIGZpcnN0IGFuZCBicHExIG9uIHRoZSBzZWNvbmQuIEFmdGVyCjQwIFVJIGZyYW1lcyBicHEw
IHJlcG9ydGVkIHR4X3BhY2tldHM9MCBiZWZvcmUgdGhlIGNoYW5nZSBhbmQgNDAgYWZ0ZXIuCldp
dGggdGhlIHRyYW5zbWl0IHF1ZXVlIG9mIGV0aDAgc3RvcHBlZCBieSBhIHNtYWxsIGhlbHBlciBt
b2R1bGUsIGEKZnJhbWUgc2VudCBvbiBicHEwIHJlc3RhcnRlZCB0aGF0IHF1ZXVlIGJlZm9yZSB0
aGUgY2hhbmdlIGFuZCBsZWF2ZXMgaXQKc3RvcHBlZCBhZnRlcjsgdGhlIGZyYW1lIGdvZXMgb3V0
IG9uY2UgdGhlIHF1ZXVlIGlzIHdva2VuLiBJbiBib3RoCmNhc2VzIHRoZSA0MCBmcmFtZXMgYXJl
IHJlY2VpdmVkIHVuY2hhbmdlZCBvbiBicHExLgoKU2lnbmVkLW9mZi1ieTogQmVybmFyZCBQaWRv
dXggPGJlcm5hcmQuZjZidnBAZ21haWwuY29tPgpDby1BdXRob3JlZC1CeTogQ2xhdWRlIE9wdXMg
NS41IDxub3JlcGx5QGFudGhyb3BpYy5jb20+Ci0tLQogZHJpdmVycy9uZXQvaGFtcmFkaW8vYnBx
ZXRoZXIuYyB8IDcgKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9oYW1yYWRpby9icHFldGhlci5j
IGIvZHJpdmVycy9uZXQvaGFtcmFkaW8vYnBxZXRoZXIuYwppbmRleCAyMTRmZDFmLi5lYWVmNjc3
IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9oYW1yYWRpby9icHFldGhlci5jCisrKyBiL2RyaXZl
cnMvbmV0L2hhbXJhZGlvL2JwcWV0aGVyLmMKQEAgLTI3MCwxMSArMjcwLDEwIEBAIHN0YXRpYyBu
ZXRkZXZfdHhfdCBicHFfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2Rldmlj
ZSAqZGV2KQogCXNrYi0+cHJvdG9jb2wgPSBheDI1X3R5cGVfdHJhbnMoc2tiLCBkZXYpOwogCXNr
Yl9yZXNldF9uZXR3b3JrX2hlYWRlcihza2IpOwogCWRldl9oYXJkX2hlYWRlcihza2IsIGRldiwg
RVRIX1BfQlBRLCBicHEtPmRlc3RfYWRkciwgTlVMTCwgMCk7Ci0JZGV2LT5zdGF0cy50eF9wYWNr
ZXRzKys7Ci0JZGV2LT5zdGF0cy50eF9ieXRlcys9c2tiLT5sZW47Ci0gIAorCW9yaWdfZGV2LT5z
dGF0cy50eF9wYWNrZXRzKys7CisJb3JpZ19kZXYtPnN0YXRzLnR4X2J5dGVzICs9IHNrYi0+bGVu
OworCiAJZGV2X3F1ZXVlX3htaXQoc2tiKTsKLQluZXRpZl93YWtlX3F1ZXVlKGRldik7CiAJcmV0
dXJuIE5FVERFVl9UWF9PSzsKIH0KIAotLSAKMi41My4wCgo=
--00000000000037b957065d1b9de3
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-bpqether-fix-truncated-proc-net-bpqether-on-partial-.patch"
Content-Disposition: attachment; 
	filename="0002-bpqether-fix-truncated-proc-net-bpqether-on-partial-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_muvjx5471>
X-Attachment-Id: f_muvjx5471

RnJvbSBiZjAxMjM4MDIyOTA3N2RmNDUzNWVlZjc0YmNlOGEzNjNjN2Q4NTljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZXJuYXJkIFBpZG91eCA8YmVybmFyZC5mNmJ2cEBnbWFpbC5j
b20+CkRhdGU6IE1vbiwgNSBPY3QgMjAyNiAxOTo1MTo1NiArMDIwMApTdWJqZWN0OiBbUEFUQ0gg
Mi8yXSBicHFldGhlcjogZml4IHRydW5jYXRlZCAvcHJvYy9uZXQvYnBxZXRoZXIgb24gcGFydGlh
bAogcmVhZHMKCmJwcV9zZXFfc3RhcnQoKSB3YWxrcyB0aGUgZGV2aWNlIGxpc3QgdG8gZmluZCB0
aGUgZW50cnkgYXQgKnBvcywgYnV0Cm5ldmVyIGluY3JlbWVudHMgaXRzIGNvdW50ZXIuIEl0IHJl
dHVybnMgdGhlIGZpcnN0IGRldmljZSB3aGVuICpwb3MgaXMKMSBhbmQgTlVMTCBmb3IgYW55IGxh
cmdlciB2YWx1ZS4KClRoZSBzZXFfZmlsZSBjb3JlIGNhbGxzIC0+c3RhcnQoKSB3aXRoIHRoZSBz
YXZlZCBwb3NpdGlvbiBlYWNoIHRpbWUgYQpyZWFkKCkgbmVlZHMgbW9yZSBkYXRhLCBzbyB0aGUg
bGlzdGluZyBzdG9wcyBhZnRlciB0aGUgZmlyc3QgZGV2aWNlIGFzCnNvb24gYXMgaXQgaXMgbm90
IHByb2R1Y2VkIGluIGEgc2luZ2xlIHBhc3M6IHdoZW4gaXQgaXMgcmVhZCB3aXRoIGEKc21hbGwg
YnVmZmVyLCBvciB3aGVuIGl0IGlzIGxvbmdlciB0aGFuIGEgcGFnZS4KCldpdGggZml2ZSBicHEg
ZGV2aWNlcywgcmVhZGluZyB0aGUgZmlsZSA2NCBieXRlcyBhdCBhIHRpbWUgcmV0dXJuZWQKdGhl
IGhlYWRlciBhbmQgb25lIGRldmljZSBiZWZvcmUgdGhlIGNoYW5nZSwgYW5kIGFsbCBmaXZlIGRl
dmljZXMKYWZ0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFBpZG91eCA8YmVybmFyZC5mNmJ2
cEBnbWFpbC5jb20+CkNvLUF1dGhvcmVkLUJ5OiBDbGF1ZGUgT3B1cyA1LjUgPG5vcmVwbHlAYW50
aHJvcGljLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9oYW1yYWRpby9icHFldGhlci5jIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9o
YW1yYWRpby9icHFldGhlci5jIGIvZHJpdmVycy9uZXQvaGFtcmFkaW8vYnBxZXRoZXIuYwppbmRl
eCBlYWVmNjc3Li40YWE0NDM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9oYW1yYWRpby9icHFl
dGhlci5jCisrKyBiL2RyaXZlcnMvbmV0L2hhbXJhZGlvL2JwcWV0aGVyLmMKQEAgLTM2OSw2ICsz
NjksNyBAQCBzdGF0aWMgdm9pZCAqYnBxX3NlcV9zdGFydChzdHJ1Y3Qgc2VxX2ZpbGUgKnNlcSwg
bG9mZl90ICpwb3MpCiAJbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UoYnBxZGV2LCAmYnBxX2Rldmlj
ZXMsIGJwcV9saXN0KSB7CiAJCWlmIChpID09ICpwb3MpCiAJCQlyZXR1cm4gYnBxZGV2OworCQlp
Kys7CiAJfQogCXJldHVybiBOVUxMOwogfQotLSAKMi41My4wCgo=
--00000000000037b957065d1b9de3--
