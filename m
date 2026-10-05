Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E624908C4
	for <linux-hams@vger.kernel.org>; Mon,  5 Oct 2026 17:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222015; cv=pass; b=crYoesiqr+ZHLtbbg4X8IzPB5WUI7WSBgAI4UBx0MScello5m87Coy8YHJ4zwloUCDlJB0c5Is4FTLmlNIV86WzWQzp0dlFq7yNfbMMPk6y5fnpNO+vDcQfWr8st92a/ItIhargvCTMC1g8D5I7wjeYhFB5LrWAZKEEi4dmo4qI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222015; c=relaxed/simple;
	bh=S+WAxx/5Vw/WCDbdBC/AUG2xMCwadvcxXa2ueLF/C0Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ce3ps69yisbSTxBFjRyerKWzKdaMd+XZtu3PyRLCwwxevIF97Z6qoJvrDp+d/tTN08B2RQnFEnSuHJhpfWsfGoAUQZUe9tjuu25D36mJCrxs7ALsFJzCGhOSwIE03cn/Lr5xLaLzxJQv71dwKQmGk0m+tbTaK/4iIu6zx0s7dus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mop7HkGg; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mop7HkGg"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-677bf06de21so1879930d50.3
        for <linux-hams@vger.kernel.org>; Mon, 05 Oct 2026 10:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791222011; cv=none;
        d=google.com; s=arc-20260327;
        b=CeSoXwpwMF61V6SiCEI2+dHmSAveir2IrhQDVWktlIIekrDN4cenuVxUK2JXoynRvA
         L2AVDULLLzTZklFSJP8qUAio97rSSjN/VplT4Oh1ANkexABGmVN5YWwdOXxYrTEmdOwC
         fSdQhCTkTat1Sd4WqpKF6ycHm5ns/J+q/LR3eo99C1tbwqnojIXSt5k2HHQsHG8HlrSI
         owFQYSuM8JXsUZ0p2UN6z7uTWIZg3RT8euD0BG3Zf1ej36wysxpZoWPjtAPqhbBU0bzd
         ZHLDKMsgE57L/N+UhbZthAvDum0+1/MPMbwAxZSrUKsx1D/4LW5V3VYR+kdbeE5RXc7r
         Ud7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=4IyKGyNnh3pQK9eao3iZBjLGYvVgbLQRtau1QdpQKXE=;
        fh=/5cu/q82zoIJBVUIQJBeUgDcZ3wscItBEMV850ZQz6E=;
        b=KofPOzs/XHZtZTNEYOPp9WjMlkjGljaP2tV0GJnXFhmos3qbG9K5G2fhNlgNWBRcy6
         DZg0sCjWZQ/Y2N7rQUMPcXB5xneNZgeE82lgi45t1Z3qWrkbS07ojAQkehJmi2z1iwHS
         1+M619HGGltTZVhnSNpA6EY1zCpVEpqncmetPwSeA54i5pKLbICKERR1FM2j9Egm+KtJ
         AEKL0ua2TYuawJpBJTAsyUYG1xCbRoIV51dj5qbBGedlDSGciRXug05b5IJFLJ5bu8a6
         Pvu6abbDQjZUSZ9mosdZAh9ij4D3juwH2oBYOjJNj9ANxIm5VoGHjzzjjDe2Agwn5nXC
         HPdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791222011; x=1791826811; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IyKGyNnh3pQK9eao3iZBjLGYvVgbLQRtau1QdpQKXE=;
        b=mop7HkGgUQp5ihgGHR+ErS4RhL79inW9DqvOn0Bth4xzvifCBALz0jihHSZz15UHU0
         OPENUHop54WVyMb1RYVXv94tyLOUQjlcAp5FsEaBSbK9XSodLtufwU+1d9LwL//B6qSq
         bV9V2V4QfiG3oMiCNRhdzd6w6ihNesnIsKoLJMP6nNgNNcdD9JEEP6mzpWsawppEAr+h
         oTPH08Efxoe1WBFX7ZXPHg5NuvFh/fdu3lU36056/t1TDQfIeBVie6kZrfR2nGohj3MU
         yclWFZm3/cw08JeB20CyiOD7RDjFyPlyuazJVfzkdJQ+x52EVxbfocwff3k755Fm71jZ
         gqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791222011; x=1791826811;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4IyKGyNnh3pQK9eao3iZBjLGYvVgbLQRtau1QdpQKXE=;
        b=uWK49WHJECRFuVWDTEmSiMwhrTIrxu8dbAhIqzedzE7DZoqI9Ioqu1pyBkBWJoD+Gl
         44aGNXbPWfovRDfgYgFW/+/i+twJbZZLPd0WBRa63pNyyTOIGIBXOEd3pjLjCw764R/N
         vB/nrQo4w7GhFWR5nO+fj1fRoPzw8gyzWMAxUfnIJ/L4SI6IuMwT1t7RQqWoc2T/ZFz+
         LW3sZbrCkMpH0lEbU2T6e8szWvBKkLbLVmnOE0Fnfk3lmSHkPxZCqkgQJFkx67+8YAPc
         ZN8PVdDWLlngiFvmvOMJuZGIJyEMnYT7mvW9zeI/K0aaOkaLYmBgMfVGYFeuwE6vSp4Y
         hkBQ==
X-Gm-Message-State: AFuF++mY3Zrv4BjghOdu8AaIQsOS2zQwtQ+e0l+eC6ZVO9XmmZP22PfC
	q26LzF/V78TMHXXnQOMvaytuoP8oaxr4/KCBjabTMl1KHJDoeUBbR0KOjF78jlNMZhfQfv+gk7p
	wROflSUQjQAfgpR2K4/W+QH1q7Kuws2grJrN+TzE=
X-Gm-Gg: AYBFou2gjhEkXVEFabnIBOp8u3eoUO6LSibQdDQgGd20nUw5DpEVtvxeoiWKfJNBeIp
	xRPX++sE38U+9XQ+u3ZBVLX+4GrTrSV+obEX/BrKpDcT4aHX4ciCdW0+eNJNa0ZiZkdf4rir15L
	3CKULSy0qmwhofgHu3YNbIxAf2DRLLKHqyzhPbn+9/qP2KlCq0pbwDvLLqaUpBkrxdRDHU86d0t
	vOALKJwalrz9m1d9eMO52//C8s4leFdMLDtHH9JkawNVERaR5E+KT7B7ptbWyjP0cTPEYauUbSB
	FWgNmtQFMfYShntPKcZVZpRrxVrI67K4EKJcZKpjDwlc5qjMCiYrfQw=
X-Received: by 2002:a05:690e:b87:b0:676:88ca:27a9 with SMTP id
 956f58d0204a3-677bd41b171mr2441019d50.97.1791222011156; Mon, 05 Oct 2026
 10:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Mon, 5 Oct 2026 19:39:57 +0200
X-Gm-Features: AclHuK_BFVnnzxR_k9T8zynKdgLHyUXFe4IdrWekplwIA0Lf0OAtaOoAqjcmJnU
Message-ID: <CAFAa3YBSW2kS4a2rW9p8q3oE8S=7fXC6WKhqoyG8g-ZBa8sYog@mail.gmail.com>
Subject: mkiss: two fixes looking for testers (transmit buffer overflow with a
 large MTU)
To: linux-hams@vger.kernel.org
Cc: Thomas Osterried <thomas@osterried.de>
Content-Type: multipart/mixed; boundary="000000000000b0a012065d1b5f7a"

--000000000000b0a012065d1b5f7a
Content-Type: text/plain; charset="UTF-8"

Hello,

While reading through drivers/net/hamradio/mkiss.c I found two defects
in the transmit path. I have fixes for both and would be grateful if
people using mkiss could review and try them. Thomas, you are in copy
as one of the authors of the driver: your opinion would be very
welcome.

Both defects were found by code review, not in the field. My own nodes
run mkiss on a pty connected to ax25ipd (AX.25 over UDP) with an MTU of
253, a setup in which neither of them can occur, and their logs and
interface counters show no mkiss error.

1. Transmit buffer overflow when the MTU is above 502

ax_encaps() accepts a frame of up to dev->mtu + 73 bytes, and KISS
escaping can double every byte (0xC0 and 0xDB are each sent as two
bytes). The transmit buffer is only max(2 * mtu, 1152) + 4 bytes
long, so the doubled 73 bytes of header allowance are not covered.

With the default MTU of 236 nothing can happen, the 1152 byte floor
hides it. With an MTU above 502, a maximum length frame made of
0xC0 or 0xDB bytes writes up to 148 bytes past the end of the
buffer. The frame content need not come from the local machine, a
routed IP datagram would do.

Reproduced under KASAN on 6.12.94, MTU 1024, one 1097 byte UI frame
with an all 0xC0 payload:

BUG: KASAN: slab-out-of-bounds in kiss_esc+0x316/0x390 [mkiss]
Write of size 1 at addr ffff888001c9c804 by task init/1
The buggy address is located 0 bytes to the right of
allocated 2052-byte region [ffff888001c9c000, ffff888001c9c804)

The driver also sets no upper bound on the MTU: a value of 2^30 or
more makes the size computation negative.

Fix: compute the buffer length from the largest frame ax_encaps()
accepts, add room for the delimiters and the escaped CRC bytes, and
set max_mtu to 65535.

2. A tty write error is used as a byte count

ax_encaps() and mkiss_write_wakeup() take the return value of
tty->ops->write() as a number of bytes. Some tty drivers (USB serial
adapters for instance) return a negative errno. The transmit pointer
then moves to before the start of the buffer and the next write
wakeup sends memory that is not part of the frame.

Fix: treat a negative return as a transmit error, drop the rest of
the frame and restart the queue.

How it was tested

A QEMU guest running 6.12.94 with KASAN and lockdep, ax0 attached to a
serial port whose output is captured and decoded on the host:

- 40 ordinary frames at the default MTU, then 6 maximum length frames
of 0xC0 at MTU 1024, without CRC and with SMACK CRC;
- original module: the KASAN report above;
- patched module: no report, 46 frames out of 46 found unchanged on
the line (SMACK and FlexNet CRC included), MTU above 65535 refused.

The second fix could NOT be exercised: neither the emulated 8250 port
nor a pty ever returns an error from write(). It is compile tested and
regression tested only. If someone runs a TNC on a USB serial adapter
and can unplug it under traffic, that is exactly the test I am missing.

Both patches also build against 7.0.

Where to get them

The two patches are attached. They apply to the out-of-tree hamradio
modules (linux-netdev/mod-orphan on GitHub), and mkiss.c is identical
in the 6.12 stable tree, so they apply there as well. They are also on
the mkiss-xmit-buffer branch of my fork:

https://github.com/f6bvp/mod-orphan/tree/mkiss-xmit-buffer

Not addressed by these patches: the transmit state (xleft, xhead) is
updated without a lock between ax_encaps() and mkiss_write_wakeup(),
and the buffers can be resized from both the transmit and the receive
path when the MTU changes under traffic. I have not seen either cause
trouble in practice; comments from anyone who knows this code are
welcome.

Thank you for any review or test report.

73 de Bernard, F6BVP

--000000000000b0a012065d1b5f7a
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-mkiss-don-t-use-a-tty-write-error-as-a-byte-count.patch"
Content-Disposition: attachment; 
	filename="0002-mkiss-don-t-use-a-tty-write-error-as-a-byte-count.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_muvj8yie1>
X-Attachment-Id: f_muvj8yie1

RnJvbSAzOGE0ODA0YmY2MDI2NDEyNjZiMjcxOWM3NGJlMGE2OTc4YzQ5NzZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZXJuYXJkIFBpZG91eCA8YmVybmFyZC5mNmJ2cEBnbWFpbC5j
b20+CkRhdGU6IE1vbiwgNSBPY3QgMjAyNiAxOToyNjowMSArMDIwMApTdWJqZWN0OiBbUEFUQ0gg
Mi8yXSBta2lzczogZG9uJ3QgdXNlIGEgdHR5IHdyaXRlIGVycm9yIGFzIGEgYnl0ZSBjb3VudAoK
YXhfZW5jYXBzKCkgYW5kIG1raXNzX3dyaXRlX3dha2V1cCgpIHRha2Ugd2hhdGV2ZXIgdHR5LT5v
cHMtPndyaXRlKCkKcmV0dXJucyBhcyB0aGUgbnVtYmVyIG9mIGJ5dGVzIGFjY2VwdGVkIGJ5IHRo
ZSB0dHkuIFNvbWUgdHR5IGRyaXZlcnMKcmV0dXJuIGEgbmVnYXRpdmUgZXJybm8gaW5zdGVhZCwg
VVNCIHNlcmlhbCBhZGFwdGVycyBmb3IgaW5zdGFuY2Ugd2hlbgp0aGUgZGV2aWNlIGlzIGdvbmUg
b3IgdGhlIFVSQiBjYW5ub3QgYmUgc3VibWl0dGVkLgoKQSBuZWdhdGl2ZSB2YWx1ZSBtb3ZlcyBh
eC0+eGhlYWQgdG8gYmVmb3JlIHRoZSBzdGFydCBvZiB4YnVmZiBhbmQKbWFrZXMgYXgtPnhsZWZ0
IGxhcmdlciB0aGFuIHRoZSBmcmFtZSwgc28gdGhlIG5leHQgd3JpdGUgd2FrZXVwIHNlbmRzCm1l
bW9yeSB0aGF0IGRvZXMgbm90IGJlbG9uZyB0byB0aGUgdHJhbnNtaXQgYnVmZmVyIGRvd24gdGhl
IGxpbmUuIEl0IGlzCmFsc28gYWRkZWQgdG8gdGhlIHR4X2J5dGVzIGNvdW50ZXIuCgpUcmVhdCBh
IG5lZ2F0aXZlIHJldHVybiBhcyBhIHRyYW5zbWl0IGVycm9yOiBjb3VudCBpdCBpbiB0eF9lcnJv
cnMsCmRyb3Agd2hhdCBpcyBsZWZ0IG9mIHRoZSBmcmFtZSBhbmQgcmVzdGFydCB0aGUgcXVldWUs
IGFzIGlzIGFscmVhZHkKZG9uZSBmb3IgYW4gb3ZlcnNpemVkIGZyYW1lLgoKVGhpcyBwYXRoIGNv
dWxkIG5vdCBiZSBleGVyY2lzZWQgb24gdGhlIHRlc3QgYmVuY2gsIHdoZXJlIG5laXRoZXIgdGhl
CjgyNTAgZHJpdmVyIG5vciBhIHB0eSBldmVyIHJldHVybnMgYW4gZXJyb3IgZnJvbSB3cml0ZSgp
LiBUaGUgY2hhbmdlCndhcyBjb21waWxlIHRlc3RlZCBhbmQgY2hlY2tlZCBmb3IgcmVncmVzc2lv
bnMgb25seTogNDYgZnJhbWVzIG91dCBvZgo0NiBhcmUgc3RpbGwgc2VudCB1bmNoYW5nZWQuCgpG
aXhlczogMWRhMTc3ZTRjM2Y0ICgiTGludXgtMi42LjEyLXJjMiIpClNpZ25lZC1vZmYtYnk6IEJl
cm5hcmQgUGlkb3V4IDxiZXJuYXJkLmY2YnZwQGdtYWlsLmNvbT4KQ28tQXV0aG9yZWQtQnk6IENs
YXVkZSBPcHVzIDUuNSA8bm9yZXBseUBhbnRocm9waWMuY29tPgotLS0KIGRyaXZlcnMvbmV0L2hh
bXJhZGlvL21raXNzLmMgfCAxNiArKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2hhbXJhZGlvL21raXNzLmMg
Yi9kcml2ZXJzL25ldC9oYW1yYWRpby9ta2lzcy5jCmluZGV4IDA1YzdhMjMuLmYxMTAxOWQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2hhbXJhZGlvL21raXNzLmMKKysrIGIvZHJpdmVycy9uZXQv
aGFtcmFkaW8vbWtpc3MuYwpAQCAtNTI2LDYgKzUyNiwxNCBAQCBzdGF0aWMgdm9pZCBheF9lbmNh
cHMoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwgdW5zaWduZWQgY2hhciAqaWNwLCBpbnQgbGVuKQog
CiAJc2V0X2JpdChUVFlfRE9fV1JJVEVfV0FLRVVQLCAmYXgtPnR0eS0+ZmxhZ3MpOwogCWFjdHVh
bCA9IGF4LT50dHktPm9wcy0+d3JpdGUoYXgtPnR0eSwgYXgtPnhidWZmLCBjb3VudCk7CisJaWYg
KGFjdHVhbCA8IDApIHsKKwkJLyogVGhlIHR0eSByZWZ1c2VkIHRoZSBmcmFtZTogZHJvcCBpdC4g
Ki8KKwkJY2xlYXJfYml0KFRUWV9ET19XUklURV9XQUtFVVAsICZheC0+dHR5LT5mbGFncyk7CisJ
CWRldi0+c3RhdHMudHhfZXJyb3JzKys7CisJCWF4LT54bGVmdCA9IDA7CisJCW5ldGlmX3N0YXJ0
X3F1ZXVlKGRldik7CisJCXJldHVybjsKKwl9CiAJZGV2LT5zdGF0cy50eF9wYWNrZXRzKys7CiAJ
ZGV2LT5zdGF0cy50eF9ieXRlcyArPSBhY3R1YWw7CiAKQEAgLTkzOSw2ICs5NDcsMTQgQEAgc3Rh
dGljIHZvaWQgbWtpc3Nfd3JpdGVfd2FrZXVwKHN0cnVjdCB0dHlfc3RydWN0ICp0dHkpCiAJfQog
CiAJYWN0dWFsID0gdHR5LT5vcHMtPndyaXRlKHR0eSwgYXgtPnhoZWFkLCBheC0+eGxlZnQpOwor
CWlmIChhY3R1YWwgPCAwKSB7CisJCS8qIEdpdmUgdXAgb24gdGhlIHJlc3Qgb2YgdGhpcyBmcmFt
ZS4gKi8KKwkJY2xlYXJfYml0KFRUWV9ET19XUklURV9XQUtFVVAsICZ0dHktPmZsYWdzKTsKKwkJ
YXgtPmRldi0+c3RhdHMudHhfZXJyb3JzKys7CisJCWF4LT54bGVmdCA9IDA7CisJCW5ldGlmX3dh
a2VfcXVldWUoYXgtPmRldik7CisJCWdvdG8gb3V0OworCX0KIAlheC0+eGxlZnQgLT0gYWN0dWFs
OwogCWF4LT54aGVhZCArPSBhY3R1YWw7CiAKLS0gCjIuNTMuMAoK
--000000000000b0a012065d1b5f7a
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-mkiss-size-the-frame-buffers-for-worst-case-KISS-esc.patch"
Content-Disposition: attachment; 
	filename="0001-mkiss-size-the-frame-buffers-for-worst-case-KISS-esc.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_muvj8yh80>
X-Attachment-Id: f_muvj8yh80

RnJvbSA2ZjQ0ZDZmNGViY2UyNzljNzM1ZGE2MTdkZjBjNzE4NzE1MGJiZjFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCZXJuYXJkIFBpZG91eCA8YmVybmFyZC5mNmJ2cEBnbWFpbC5j
b20+CkRhdGU6IE1vbiwgNSBPY3QgMjAyNiAxOToyNjowMSArMDIwMApTdWJqZWN0OiBbUEFUQ0gg
MS8yXSBta2lzczogc2l6ZSB0aGUgZnJhbWUgYnVmZmVycyBmb3Igd29yc3QtY2FzZSBLSVNTCiBl
c2NhcGluZwoKYXhfZW5jYXBzKCkgYWNjZXB0cyBhIGZyYW1lIGZvciB0cmFuc21pc3Npb24gYXMg
bG9uZyBhcyBpdCBpcyBub3QKbG9uZ2VyIHRoYW4gZGV2LT5tdHUgKyA3MyBieXRlcywgYW5kIEtJ
U1MgZXNjYXBpbmcgY2FuIGRvdWJsZSBldmVyeQpieXRlIG9mIGl0IChFTkQgYW5kIEVTQyBhcmUg
ZWFjaCBzZW50IGFzIHR3byBieXRlcykuIFRoZSB0cmFuc21pdApidWZmZXIsIGhvd2V2ZXIsIGlz
IG9ubHkgbWF4KDIgKiBkZXYtPm10dSwgMTE1MikgKyA0IGJ5dGVzIGxvbmcsIHNvIHRoZQo3MyBi
eXRlcyBvZiBoZWFkZXIgYWxsb3dhbmNlIGFyZSBub3QgY292ZXJlZCBvbmNlIHRoZXkgYXJlIGRv
dWJsZWQuCgpXaXRoIHRoZSBkZWZhdWx0IE1UVSBvZiAyMzYgdGhlIDExNTIgYnl0ZSBmbG9vciBo
aWRlcyB0aGUgcHJvYmxlbS4gQXMKc29vbiBhcyB0aGUgTVRVIGlzIHJhaXNlZCBhYm92ZSA1MDIs
IGEgbWF4aW11bSBsZW5ndGggZnJhbWUgbWFkZSBvZiBFTkQKb3IgRVNDIGJ5dGVzIG1ha2VzIGtp
c3NfZXNjKCkgb3Iga2lzc19lc2NfY3JjKCkgd3JpdGUgdXAgdG8gMTQ4IGJ5dGVzCnBhc3QgdGhl
IGVuZCBvZiB4YnVmZi4gVGhlIGNvbnRlbnQgb2YgdGhlIGZyYW1lIGRvZXMgbm90IGhhdmUgdG8g
Y29tZQpmcm9tIHRoZSBsb2NhbCBtYWNoaW5lOiBpdCBjYW4gYmUgdHJhZmZpYyBmb3J3YXJkZWQg
Zm9yIGFub3RoZXIKc3RhdGlvbiwgYSByb3V0ZWQgSVAgZGF0YWdyYW0gZm9yIGluc3RhbmNlLgoK
UmVwcm9kdWNlZCB1bmRlciBLQVNBTiBvbiA2LjEyLjk0IHdpdGggdGhlIE1UVSBzZXQgdG8gMTAy
NCBhbmQgYQoxMDk3IGJ5dGUgVUkgZnJhbWUgd2hvc2UgcGF5bG9hZCBpcyBhbGwgMHhDMDoKCiAg
QlVHOiBLQVNBTjogc2xhYi1vdXQtb2YtYm91bmRzIGluIGtpc3NfZXNjKzB4MzE2LzB4MzkwIFtt
a2lzc10KICBXcml0ZSBvZiBzaXplIDEgYXQgYWRkciBmZmZmODg4MDAxYzljODA0IGJ5IHRhc2sg
aW5pdC8xCiAgIGtpc3NfZXNjKzB4MzE2LzB4MzkwIFtta2lzc10KICAgYXhfeG1pdCsweDM0Ni8w
eGNkNSBbbWtpc3NdCiAgIGRldl9oYXJkX3N0YXJ0X3htaXQrMHhmOC8weDU4MAogICBzY2hfZGly
ZWN0X3htaXQrMHgxMzEvMHhhMTAKICAgX19kZXZfcXVldWVfeG1pdCsweDI3ZjYvMHgzNGIwCiAg
IHBhY2tldF9zZW5kbXNnKzB4MzBjNS8weDRhMTAKICBUaGUgYnVnZ3kgYWRkcmVzcyBpcyBsb2Nh
dGVkIDAgYnl0ZXMgdG8gdGhlIHJpZ2h0IG9mCiAgIGFsbG9jYXRlZCAyMDUyLWJ5dGUgcmVnaW9u
IFtmZmZmODg4MDAxYzljMDAwLCBmZmZmODg4MDAxYzljODA0KQoKSW4gYWRkaXRpb24gdGhlIGRy
aXZlciBzZXRzIG5vIHVwcGVyIGJvdW5kIG9uIHRoZSBNVFUuIEFuIE1UVSBvZiAyXjMwCm9yIG1v
cmUgbWFrZXMgImRldi0+bXR1ICogMiIgbmVnYXRpdmUsIHdoaWNoIGxlYXZlcyB0aGUgYnVmZmVy
cyBhdAp0aGVpciBtaW5pbXVtIHNpemUgd2hpbGUgdGhlIGxlbmd0aCBjaGVjayBpbiBheF9lbmNh
cHMoKSBubyBsb25nZXIKcmVqZWN0cyBhbnl0aGluZy4KCkNvbXB1dGUgdGhlIGJ1ZmZlciBsZW5n
dGggaW4gb25lIHBsYWNlLCBmcm9tIHRoZSBsYXJnZXN0IGZyYW1lIHRoYXQKYXhfZW5jYXBzKCkg
YWNjZXB0cywgYW5kIGFsbG9jYXRlIHNpeCBtb3JlIGJ5dGVzIGZvciB0aGUgdHdvIEVORApkZWxp
bWl0ZXJzIGFuZCB0aGUgdHdvIENSQyBieXRlcywgd2hpY2ggbWF5IG5lZWQgZXNjYXBpbmcgdG9v
LiBTZXQKbWF4X210dSBzbyB0aGF0IHRoZSBjb21wdXRhdGlvbiBjYW5ub3Qgb3ZlcmZsb3cuCgpX
aXRoIHRoZSBjaGFuZ2UgdGhlIHNhbWUgdGVzdCBwcm9kdWNlcyBubyBLQVNBTiByZXBvcnQsIHRo
ZSBmcmFtZXMKZm91bmQgb24gdGhlIHNlcmlhbCBsaW5lIGFyZSBpZGVudGljYWwgdG8gdGhvc2Ug
c2VudCwgd2l0aCBhbmQgd2l0aG91dApDUkMgKFNNQUNLIGFuZCBGbGV4TmV0KSwgYW5kIGFuIE1U
VSBhYm92ZSA2NTUzNSBpcyByZWZ1c2VkLgoKRml4ZXM6IDFkYTE3N2U0YzNmNCAoIkxpbnV4LTIu
Ni4xMi1yYzIiKQpTaWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFBpZG91eCA8YmVybmFyZC5mNmJ2cEBn
bWFpbC5jb20+CkNvLUF1dGhvcmVkLUJ5OiBDbGF1ZGUgT3B1cyA1LjUgPG5vcmVwbHlAYW50aHJv
cGljLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9oYW1yYWRpby9ta2lzcy5jIHwgNDkgKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9u
cygrKSwgMTkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvaGFtcmFkaW8v
bWtpc3MuYyBiL2RyaXZlcnMvbmV0L2hhbXJhZGlvL21raXNzLmMKaW5kZXggNWYzOGEwMC4uMDVj
N2EyMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvaGFtcmFkaW8vbWtpc3MuYworKysgYi9kcml2
ZXJzL25ldC9oYW1yYWRpby9ta2lzcy5jCkBAIC0zMCw2ICszMCw3IEBACiAjaW5jbHVkZSA8bmV0
L2F4MjUuaD4KIAogI2RlZmluZSBBWF9NVFUJCTIzNgorI2RlZmluZSBBWF9NQVhfTVRVCTY1NTM1
CiAKIC8qIHNvbWUgYXJjaCBkZWZpbmUgRU5EIGFzIGFzc2VtYmx5IGZ1bmN0aW9uIGVuZGluZywg
anVzdCB1bmRlZiBpdCAqLwogI3VuZGVmCUVORApAQCAtMzU1LDEzICszNTYsMTkgQEAgc3RhdGlj
IGludCBheF9zZXRfbWFjX2FkZHJlc3Moc3RydWN0IG5ldF9kZXZpY2UgKmRldiwgdm9pZCAqYWRk
cikKIAogLyotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0qLwogCi1zdGF0aWMgdm9pZCBheF9jaGFuZ2VkbXR1
KHN0cnVjdCBta2lzcyAqYXgpCi17Ci0Jc3RydWN0IG5ldF9kZXZpY2UgKmRldiA9IGF4LT5kZXY7
Ci0JdW5zaWduZWQgY2hhciAqeGJ1ZmYsICpyYnVmZiwgKm94YnVmZiwgKm9yYnVmZjsKLQlpbnQg
bGVuOworLyoKKyAqIExlbmd0aCBvZiB0aGUgZnJhbWUgYnVmZmVycyBmb3IgdGhlIGN1cnJlbnQg
TVRVLgorICoKKyAqIGF4X2VuY2FwcygpIGFjY2VwdHMgZnJhbWVzIG9mIHVwIHRvIGRldi0+bXR1
ICsgNzMgYnl0ZXMgYW5kIEtJU1MgZXNjYXBpbmcKKyAqIGNhbiBkb3VibGUgZXZlcnkgb25lIG9m
IHRoZW0uICBUaGUgYnVmZmVycyBhcmUgYWxsb2NhdGVkIEFYX0JVRl9TTEFDSyBieXRlcworICog
bGFyZ2VyIHRoYW4gdGhpcywgZm9yIHRoZSB0d28gRU5EIGRlbGltaXRlcnMgYW5kIHRoZSB0d28g
Q1JDIGJ5dGVzLCB3aGljaAorICogY2FuIG5lZWQgZXNjYXBpbmcgYXMgd2VsbC4KKyAqLworI2Rl
ZmluZSBBWF9CVUZfU0xBQ0sJNgogCi0JbGVuID0gZGV2LT5tdHUgKiAyOworc3RhdGljIGludCBh
eF9idWZsZW4oY29uc3Qgc3RydWN0IG5ldF9kZXZpY2UgKmRldikKK3sKKwlpbnQgbGVuID0gKGRl
di0+bXR1ICsgNzMpICogMjsKIAogCS8qCiAJICogYWxsb3cgZm9yIGFycml2YWwgb2YgbGFyZ2Vy
IFVEUCBwYWNrZXRzLCBldmVuIGlmIHdlIHNheSBub3QgdG8KQEAgLTM3MSw4ICszNzgsMTkgQEAg
c3RhdGljIHZvaWQgYXhfY2hhbmdlZG10dShzdHJ1Y3QgbWtpc3MgKmF4KQogCWlmIChsZW4gPCA1
NzYgKiAyKQogCQlsZW4gPSA1NzYgKiAyOwogCi0JeGJ1ZmYgPSBrbWFsbG9jKGxlbiArIDQsIEdG
UF9BVE9NSUMpOwotCXJidWZmID0ga21hbGxvYyhsZW4gKyA0LCBHRlBfQVRPTUlDKTsKKwlyZXR1
cm4gbGVuOworfQorCitzdGF0aWMgdm9pZCBheF9jaGFuZ2VkbXR1KHN0cnVjdCBta2lzcyAqYXgp
Cit7CisJc3RydWN0IG5ldF9kZXZpY2UgKmRldiA9IGF4LT5kZXY7CisJdW5zaWduZWQgY2hhciAq
eGJ1ZmYsICpyYnVmZiwgKm94YnVmZiwgKm9yYnVmZjsKKwlpbnQgbGVuOworCisJbGVuID0gYXhf
YnVmbGVuKGRldik7CisKKwl4YnVmZiA9IGttYWxsb2MobGVuICsgQVhfQlVGX1NMQUNLLCBHRlBf
QVRPTUlDKTsKKwlyYnVmZiA9IGttYWxsb2MobGVuICsgQVhfQlVGX1NMQUNLLCBHRlBfQVRPTUlD
KTsKIAogCWlmICh4YnVmZiA9PSBOVUxMIHx8IHJidWZmID09IE5VTEwpICB7CiAJCXByaW50ayhL
RVJOX0VSUiAibWtpc3M6ICVzOiB1bmFibGUgdG8gZ3JvdyBheDI1IGJ1ZmZlcnMsICIKQEAgLTU4
MSwyMCArNTk5LDEyIEBAIHN0YXRpYyBpbnQgYXhfb3BlbihzdHJ1Y3QgbmV0X2RldmljZSAqZGV2
KQogCSAqIHJidWZmCVJlY2VpdmUgYnVmZmVyLgogCSAqIHhidWZmCVRyYW5zbWl0IGJ1ZmZlci4K
IAkgKi8KLQlsZW4gPSBkZXYtPm10dSAqIDI7Ci0KLQkvKgotCSAqIGFsbG93IGZvciBhcnJpdmFs
IG9mIGxhcmdlciBVRFAgcGFja2V0cywgZXZlbiBpZiB3ZSBzYXkgbm90IHRvCi0JICogYWxzbyBm
aXhlcyBhIGJ1ZyBpbiB3aGljaCBTdW5PUyBzZW5kcyA1MTItYnl0ZSBwYWNrZXRzIGV2ZW4gd2l0
aAotCSAqIGFuIE1TUyBvZiAxMjgKLQkgKi8KLQlpZiAobGVuIDwgNTc2ICogMikKLQkJbGVuID0g
NTc2ICogMjsKKwlsZW4gPSBheF9idWZsZW4oZGV2KTsKIAotCWlmICgoYXgtPnJidWZmID0ga21h
bGxvYyhsZW4gKyA0LCBHRlBfS0VSTkVMKSkgPT0gTlVMTCkKKwlpZiAoKGF4LT5yYnVmZiA9IGtt
YWxsb2MobGVuICsgQVhfQlVGX1NMQUNLLCBHRlBfS0VSTkVMKSkgPT0gTlVMTCkKIAkJZ290byBu
b3JidWZmOwogCi0JaWYgKChheC0+eGJ1ZmYgPSBrbWFsbG9jKGxlbiArIDQsIEdGUF9LRVJORUwp
KSA9PSBOVUxMKQorCWlmICgoYXgtPnhidWZmID0ga21hbGxvYyhsZW4gKyBBWF9CVUZfU0xBQ0ss
IEdGUF9LRVJORUwpKSA9PSBOVUxMKQogCQlnb3RvIG5veGJ1ZmY7CiAKIAlheC0+bXR1CSAgICAg
PSBkZXYtPm10dSArIDczOwpAQCAtNjQwLDYgKzY1MCw3IEBAIHN0YXRpYyB2b2lkIGF4X3NldHVw
KHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCiB7CiAJLyogRmluaXNoIHNldHRpbmcgdXAgdGhlIERF
VklDRSBpbmZvLiAqLwogCWRldi0+bXR1ICAgICAgICAgICAgID0gQVhfTVRVOworCWRldi0+bWF4
X210dSAgICAgICAgID0gQVhfTUFYX01UVTsKIAlkZXYtPmhhcmRfaGVhZGVyX2xlbiA9IEFYMjVf
TUFYX0hFQURFUl9MRU47CiAJZGV2LT5hZGRyX2xlbiAgICAgICAgPSBBWDI1X0FERFJfTEVOOwog
CWRldi0+dHlwZSAgICAgICAgICAgID0gQVJQSFJEX0FYMjU7Ci0tIAoyLjUzLjAKCg==
--000000000000b0a012065d1b5f7a--
