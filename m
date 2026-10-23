Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792747785;
	b=wHkHexo+hFmVV5N0oBdnhtoQnJ5xvbWTztM2YwFWQxOhrTVG5Bqu7mN1S2VIrle934LS
	 YusJFGdvb7kFyL5k41xuipOtvYfmXdM5um3XScGqs6/X6FoV3B5auhuXbLJJ4OE1LdK7/
	 WOuZkJcxl3aXdW5VRh+qOPJAqaCQsWSHBWpLMmLikRKG1yT34YKSbUMxPadY6lmQmWdaM
	 2oyXnFRofDeBMwDKvdN9MoyRVPpsqPovPzXD5Zj272UqOKuWGXaVXEU1jFwCartaCxZXp
	 JxOx1f9i1vVVOANuqdzAqtjBVKMqWlgcEPHfXx8WceVyE6PWrM+XPZFLbBFyhg3sf4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=ufO1009tszHgOfsIyRvFYS4v18Y5kKdp0v3wCTcKWIQ=;
	b=cXzQEP5GSe9e82RMjVyReWiZrEDWCUhlLG80QsiRIZ+bNzeGOnfA9MBsZ196C479er9i
	 gRq3u0iuXgJd6SxsVzQN4UPEefBIiHf29UIiDtNdmGtZXEZHGQD9lPJZ4fhwLGt3LG58i
	 qPNPe7qziHxWQrht3mPg4jsveGfo57e6NVSy1PCa3wz4Phnf2JB9zp7KJhixoLoarYbVL
	 t3pK5DnlxMnh7wW9iStX8JKnCTGTWacc8pb8JhkqzMw4iuyYWY3B2dX+ug41l/C6tMSus
	 6NBy9FmnV3BFGCHh2XJ0VU9tqqKZOXnho3oQurRkya59ydnn34i7h5RjSMa90oJa8mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="oTCse/HI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC7B606A329
	for <linux-hams@vger.kernel.org>; Fri, 23 Oct 2026 09:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC7B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oTCse/HI
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6798d4ab549so718344d50.0
        for <linux-hams@vger.kernel.org>; Fri, 23 Oct 2026 02:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792747784; cv=none;
        d=google.com; s=arc-20260327;
        b=gXpFBQJt3MMjdUqiS3rKcqIB27ptzupZtfUyAiZTSACPPLJ33D1wUISzwUKPBrRZsI
         FC3CWqwQyyBzqzRd5PEMA3HqfIYLR7IHZb0aatbCiWp87duoFN8TelnF06NIRBNR5zon
         2U2bbM4+HDQUEGlkwBU6OVoKdYot4YqrvF0PXetl4TBWoOcrahiY2uLYiXfvURq1slvO
         Z7OwFs/aYFpdMgJ9U/1Ff9cq7PPU/8+FUwh8rZIU/851mQ/df9ByPivKeV40mpa72Qep
         4LWBOw1ocF2MdvGEnAKQmQTl15/oTEN3xsgqe86CKTNzt2+hSK//YvqH1ICposdYk5PN
         xuzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ufO1009tszHgOfsIyRvFYS4v18Y5kKdp0v3wCTcKWIQ=;
        fh=/5cu/q82zoIJBVUIQJBeUgDcZ3wscItBEMV850ZQz6E=;
        b=VqqXFH1n5D6n12mNvWyEiy0qDAnDEPWjT9/rdLTI7D58Q3xiJgi7QvuGf72CHi4oBb
         HvKNBftAUvtet2eEjcwqlB0VkqqcNW6BEOv/3MI5HheBKKROgXZJqMAvdsi23ZTzALoY
         w2yIpPAuJ6/dYbb3pOc+U1OLZ2/u0GdZrUCFCEQgzHi1fgRp2+fsUEhxF9aeOX6zBGs1
         mKk3FJVmZlQprTGBf4kpuL7H4vUWq3ogCVOpRaGFVAWvQO1ve77R3FjOeZU58iqHLADC
         sz5dBlKI3GtLpyi5hd4C1anbNTK1Q+rPeuGdD6yPmJF0sYQdmvS59HCZV+OiCPw+/pG6
         0qYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792747784; x=1793352584; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ufO1009tszHgOfsIyRvFYS4v18Y5kKdp0v3wCTcKWIQ=;
        b=oTCse/HIUrngQZpUdosGq7rQ5Q7gLrXwu01o4T/FV/HrxZ0Jv8xXRpJtZXLGl666n6
         sgzJYycswFKgz0BbMBAf7E3FJ3ocE+PoR6/dp+LuSxlBu5qU1YmvDTMe3Q2itmTf40TU
         pQv70gI43s/PpznK4h4k7hSmtmHKPX6Gkmlk+eKMMa+lvFdHRATYFk+EcjiFEqQcizPd
         9PUoEVyTGj/5ndQfvcsrKZ8Vg656CMYdonpmS+b9qw0knHNgIX259tsLwlV5V1xI6Wzv
         m3SGWEdYYJUfOwqNJoX5GkUbyRS2r3SwB4pTX7X5A4UKylV4+OfjYEWMVGxLsyIKOVPM
         3ADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747784; x=1793352584;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ufO1009tszHgOfsIyRvFYS4v18Y5kKdp0v3wCTcKWIQ=;
        b=MlmiFfom/+poacF6+Y6Y+g9kUTZWVOl9h2XdbOaBEJKyPPVgaAC7SvMgnmYloO1aIM
         GDKh1S0YA5uJHXU2J3iGRdE1j+xU5Vhp/BSV+1iQuDbubavsrivS2jDHlS7ReFoGVIAm
         l4MCinr9L/iXY5koTz8kffOowtZ/mECNfKgUGbZ8v0I7syuq98hOqekZULdSRmSd0lgg
         W31DetzTXwA+vz0WnlzdjDbRbURygh55HqxNsNNF8HVCbX6ButYw5YSuVRXWvEqSYgc1
         c1daO6aR8JfRZ6g3KJ8lLdh69m1xxYbNKLZHEis2rN9/leKK51wcGRnDlGIHYfI4nClT
         eY1A==
X-Gm-Message-State: AFq9FYKplSYtOz8goyz/hPSpdtL/BIDiksk3lo94ja0fI7zpAOorIgtp
	QRY1jVa8XlEnrCG0muXA4bZT5thfPI+0Yjoet1PttEg+Gf3ui5/k/zW6R4cqlVZ/ToicPYOm4gS
	FiFzXJM+eVYgK0jNH/zDpQvDdqfG9y6LrS6rG
X-Gm-Gg: AYBFou2KkoLfWj0tBHzhhBW1flB6aE0BPRGk29EjD47uUI/FlG8Kko8Fy58lO0TeSUC
	3NDjjm1nZhKOxfwowowo5KDPBhHiRlGQ/N4NQfBxGH77q/2hIwk3PcTDVUMIRus6zpsnb/2G7QR
	9Wv3IQMUKJ5CxvoOIxj5w6/qemky5rVcCj16GGVuKE9r9XSufx8Kh3xaIWspV+7fRGU6DWDl0sn
	9ShiaS/pPv1ZWSkNb4gq2hhyfqcLvAzUwpiJBwGdFxlqvhugZ+NccTLryezkpSus2qityIq1iTX
	gUpPBVtEtfvOF3zTD8vex5sfk6jLUQYKYhN5uULGH6+TuQw2b1b1KlBfUBfbZQHzfaHUtIxKtlw
	6ioYA4gNNooxKGQLOyadl+FXeefAyRLRRHe1HIKfpm3aJVXAG9c47H6EbqA==
X-Received: by 2002:a05:690e:450e:20b0:679:a898:7d97 with SMTP id
 956f58d0204a3-67a35b3b1f8mr918131d50.26.1792747783765; Fri, 23 Oct 2026
 02:29:43 -0700 (PDT)
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:linux-hams@vger.kernel.org>
List-Help: <mailto:linux-hams+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hams+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Fri, 23 Oct 2026 11:29:31 +0200
X-Gm-Features: AclHuK-cY-7HAnjOnvP4LOSwI7HiBTgHIaTe9JULlnH8QyLvdm31vHvghjeNMZw
Message-ID: <CAFAa3YAZ_pBe_fn0+cyszOAvbc6FExzSmRUWh+uTdQkEB05M_Q@mail.gmail.com>
Subject: mkiss, bpqether, hdlcdrv: three pull requests open in mod-orphan,
 testers wanted
To: linux-hams@vger.kernel.org
Cc: Thomas Osterried <thomas@osterried.de>
Content-Type: text/plain; charset="UTF-8"

Hello,

On 5 October I posted fixes for three hamradio drivers here, in the
thread "mkiss: two fixes looking for testers (transmit buffer overflow
with a large MTU)".
There was no comment, so I have opened them as pull requests in the
linux-netdev/mod-orphan repository on GitHub, where the AX.25, NET/ROM
and ROSE fixes are already collected.
They are waiting for review, and above all for testing by people who
use these drivers.

1. mkiss (pull request #40, opened today)

Two fixes in the transmit path:
- The transmit buffer is too small for worst-case KISS escaping. With
an MTU above 502, a maximum length frame made of END or ESC bytes
writes up to 148 bytes past the end of the buffer (shown under KASAN).
The MTU also had no upper bound.
- A negative return from the tty write() was used as a byte count,
after which the driver could send memory outside the buffer.

Unlike the two others, this one already runs in service.
Since 21-22 October it has been loaded on my six nodes (kernel 7.0 on
x86_64, 6.18 on Raspberry Pi in 32 and 64 bit), each with one mkiss
port to ax25ipd, MTU 253.
About 76,000 frames sent and 204,000 received so far, with no error.
What it still needs: real KISS TNCs on serial and USB serial ports,
with other MTUs, and with SMACK or FlexNet CRC.

2. bpqether (pull request #38, open since 18 October)

- bpq_xmit() counted transmitted frames on the Ethernet device instead
of the bpq device, and restarted the transmit queue of the Ethernet
device.
- /proc/net/bpqether was truncated on partial reads.

Tested in QEMU only: none of my nodes uses bpqether.
Anyone running BPQ over Ethernet (with BPQ32 or LinBPQ, for instance)
could check that traffic and counters are right.

3. hdlcdrv (pull request #39, open since 18 October)

- hdlcdrv_unregister() closed the hardware driver twice. The baycom
drivers then free an IRQ and an I/O region they do not hold, and
baycom_par can dereference a NULL pointer.

Tested in QEMU only, without traffic.
Testers with a Baycom ser12 modem (baycom_ser_fdx, baycom_ser_hdx) or
par96 modem (baycom_par) would be very welcome.

How to try them

The repository builds the AX.25 modules and the drivers out of tree,
against the running kernel (the README lists 6.12.y, 6.18.y and 7.0).
Clone linux-netdev/mod-orphan from GitHub, then for instance:

git fetch origin pull/40/head:pr40
git checkout pr40
make
sudo make install
sudo depmod -a

Replace 40 with 38 or 39 for the other two.
Note that "make install" also replaces the in-tree AX.25, NET/ROM and
ROSE modules with those of the repository, which carry all the fixes
merged so far.
Build on the machine that will load the modules.
To go back, remove the modules installed by "make install", run "sudo
depmod -a" and reboot.

Any report helps, even "it works here with this TNC on kernel x.y".
You can reply on the list or comment on the pull request.

73,
Bernard F6BVP
