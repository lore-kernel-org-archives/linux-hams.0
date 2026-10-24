Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792835612;
	b=b2qDT+mxs4c9hX+WCzyQJ5rmCE0ve3uH6+X3GvIczp096RJHvFhllTbHoDqKCpWS4MaK
	 kkHEbCuVtzz+r5B9umGTuBltJXV1JJ2wVMpxjUAEBmXOolyky5KAKVSsu74lyaMg9nryg
	 wkOxucVp3zHWZYLpfX95ttf7HloLPGlB5gwd5lH2lU9vipvZJSvmK0/Ts9wzE9TfFdhKR
	 74y4NTkG7Hk+dKDsODQH0wMF2ybID7haLtCtC0RI/MpGGvqvPqKnsghzr8U4eRn5OgfMa
	 w8N4FEP0HpMthzpGDiWx7NaKRO4JbInNYvR3B7KgA7Vzi20MpydgmSGp+vUlREaJtmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792835612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=l0OGvwa7IfsJZh4FaKrc2zLuLIkkC59KwO13QWrYABo=;
	b=LDW0SavtHoz5BiKkQT37lFgDvU/uYnzxfzT6+pijdCt3epvhkQ/xaPLMLuZ2XFDyC+iL
	 wZRLUrNhv7/ZKIuYFr7I0VIOsPg6I4amvDCqZ3Z5+NnKVVCALXIVeHCaBQBmHbRRacs40
	 e4mC3SgoifLb0uLAn9LtqCetCNrDVa6dQJRL/zhOwCxkxECMJLPQ9YGjTo97/K5NkhqOI
	 dO4ZgzXVRDO6WNQKmXbRoGQPXo9LalPyhRKZY0I5yHtjvX6wB6oeO61fXOf75WTlpjTIS
	 Iknz9Zsyw5thnyU3pQZw4/kBctEmPugUFiaPJqkTwjfj+p7pcZeIVK4i0SaAHCSwNBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fduvgqgi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17573606A31B
	for <linux-hams@vger.kernel.org>; Sat, 24 Oct 2026 09:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17573606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fduvgqgi
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67921b515a7so1582326d50.2
        for <linux-hams@vger.kernel.org>; Sat, 24 Oct 2026 02:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792835611; cv=none;
        d=google.com; s=arc-20260327;
        b=bFodPkMuU9tpHM5Zp8tznaHjGcn9hIHjqZUX0KbJxl9nI6CL2sqqJDES5Ykrui0loH
         uuoXohu5YEC6e6viKvbotfCoGpMiOb1WuYsNBxX5Tx6nV0rJH5dfO6jmv15+gSd34wIP
         bX/r5354MAnh3xkHoTi7c6pLs+iZaNCnW7P7Ldd6UiUnseokESEzeqZGXOveSEM9bAyZ
         qCcPmddgGQBOkg6b47xTcyKPHlmls6QCRZYF+n2j/t+GAdN/pzjmNlA9rlzec4xnVA4L
         QwWCz00OXphU5DHK83N6rYxxwvh+wBcp2eHy68Df1U8u+bWRZfu7CsKNkOLwgSsA4fT5
         RWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l0OGvwa7IfsJZh4FaKrc2zLuLIkkC59KwO13QWrYABo=;
        fh=4smM8YT4tj2JOCCrEJIPfRRKyrF5Eh5tqkKcxokqYJ0=;
        b=qPMjH9sQrpk9IT8Mev534lEm4/5cZ4J8pbazGKOoKUUC8leR/YSr1NwX21a103i86P
         3d4GEyrHdRzdgxgvAEFbGbaiS5OI5oa9hIwZ7pbQQMVofAWwUvDNDqQ77tmdoMXjZqlW
         xmCY6u03+fpJLdFKjqD4St8ZtfagEYSjCrb0UuSf8UUfVixv5jf6H6smla4cSjExj1He
         5NT+q+JQ+wNnQhxVAE38iloIxBHm5cBw2AoVK1aUgWnXKn0fWC+DZWxaiNLBeQMq2ay5
         mTOWh3ud7Mhv3XFj74TkNENh1lIbgoQMNPgYkInV4mlY9tjoQRjmNJ4YwwRWvypvSVhn
         +CtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792835611; x=1793440411; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0OGvwa7IfsJZh4FaKrc2zLuLIkkC59KwO13QWrYABo=;
        b=FduvgqgiBQJFrGQYLEdmJ7jW8w8LEG4pvU9WkxpNp8vLzl7Xc/ofxRrp33ZbzI/mxq
         d3b9HT/BBUaCviKVP/GCLtOGcVRPBUeJFAjZrE8KFDkrsxCBL8w7IR1xg9elZywMr797
         N4wrpqkE4FSOrSQJ4WZ94+tDLsmXgChvIica90JgxtzQL6U1SZIooBAyNAzcHGsAgtE5
         5YQsY7E2SRb0MxrVHvt7dpJ2KyahwiwrXjy97cRlE4TM9D8kBG3PDT5pYISUSMLxdDRy
         3G/ym6GZlMc0nd3Z63BuIasOpMfyafNn3CqXUDSAfyVeqccGgpaN574U+N2cK3VxRBXI
         2t9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792835611; x=1793440411;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l0OGvwa7IfsJZh4FaKrc2zLuLIkkC59KwO13QWrYABo=;
        b=LFAQf9SdNeJGUEYlB1kWj6pkFYi1+5VP49CxNTsSZZ8tmSVSahW70gJKCmttoeSjpw
         EfJ7+CnX3GLz0Tk6j2hKt0vNIjk4nLWJYg/4envW0i8OckTkaFeIiit1rEU01S8GMiWv
         Ht3pL7Z7woftmVm9Tobwt7C2MhEe1nkIzSOKy8WesL113uNjxVyhgOREshrfHFpnadfh
         enMIja7/nJ/E54m1ZHUCXlDdLTnprnrEicmEKhaSF9qeOSFh2WV+InoD/hM17SVCdTZ4
         JonmLzCP3Ms4bkztqBi/VV8+lVN/rxV84xLP1eI2QfVS4Cbb9uNLzjnggcqotYq2Bjvj
         x1Fg==
X-Forwarded-Encrypted: i=1; AKwUvBy9m6u90GSUtjF8/xtcGS0MWrwXxfq3lmsm2uwq/RYJxIYSU+UziggO9YAWfqis+TlJsmyPMaIG9o8K@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3sN2YPt9OG/t9YUWVwkA0V2CFnHCCJQNajGrKAKoEUEK4vM+c
	XJUHwv2LVBpnympmkS/nkBBfdemNB0ScFPcQ/MbLssw/LCuKKCy8ojVhyeTovIpXOZAkIe+SCwH
	tpiDa/pegorHZpAWOSn8aNrk8GyzJI1k=
X-Gm-Gg: AYBFou0ljIOZQBSG/6eJeIIDBVEdnQlVBXP6fBXwaaKXOIJw7KK1dN45dtdPaLYF9eX
	pNKA0hS6RrZNocYAYHHwCrCRpw/tDbUQBlY+DWGLo6RQwHtMXWZc5KYeMxehrvgwYRQg8i6JhOD
	+1lniJvRrMRap5aNdu9roE4PF0ooW1Nb9br7ornvLP0HOoeWkaXc+7+qHlSfaFvCr4AQg41GBse
	TZ+Nm8X5tTKf2r408owdcrKtDakYpLxBAdUfzBmiHF4ta5EVaDzncd0GqmNnsfIro2eGse8jB6l
	s8bPdFDCcM411Ss3CNR2ZM2XgvXzgZFjZDmQCEntsWtQt0CK9zKgiK6NPv/LIfI4GOiN5rSxF2q
	iDFJXs71neDp+u5PBGLJ/e+NEMc9Sr8u/2PQH
X-Received: by 2002:a05:690e:d85:b0:679:c6ba:9208 with SMTP id
 956f58d0204a3-67a454b30f0mr1179288d50.102.1792835610936; Sat, 24 Oct 2026
 02:53:30 -0700 (PDT)
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:linux-hams@vger.kernel.org>
List-Help: <mailto:linux-hams+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hams+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFAa3YDU2LnSiBH+2Rk455hky58fW=6_NeO3bWC_=GYmb9M0vg@mail.gmail.com>
 <2026-10-23-1-daily-reply-0008-rose-ax25-netrom-suite-bounce@kernel.org>
In-Reply-To: <2026-10-23-1-daily-reply-0008-rose-ax25-netrom-suite-bounce@kernel.org>
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Sat, 24 Oct 2026 11:53:19 +0200
X-Gm-Features: AclHuK_zWhESd-j9hHDAXf4KXZBPpJ3m4ligZXqAt-AzJ6vNqYxY6rwrEjdt9_U
Message-ID: <CAFAa3YBCwY2iEh-5NFmckvAS+RzDstJO7dY8Q=fzVCrgK04kZA@mail.gmail.com>
Subject: Re: [stable request] ROSE memory-safety fixes for 7.0.y and earlier
 (merged out-of-tree in linux-netdev/mod-orphan)
To: sashal@kernel.org
Cc: gregkh@linuxfoundation.org, stable@vger.kernel.org, kuba@kernel.org, 
	linux-hams@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000bb751b065e931147"

--000000000000bb751b065e931147
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sasha,

You are right, thanks for catching it.
nr_rx_frame() masks the flag nibble off the frame type, so the length
check also hits CONNACK|CHOKE, and __nr_transmit_reply() sends those
as 20-byte frames.
Only the plain CONNACK case of nr_state1_machine() reads byte 20.

I reproduced it on a two-VM QEMU bench (6.12.y with this series,
KASAN, mkiss link), node A calling node B where nobody listens:
- with v1 of 02/26, the refusal is dropped and connect() is still
blocked after 15 seconds;
- with v2, connect() fails with ECONNREFUSED in 40 ms.
A plain CONNACK is still accepted: once B listens, the same call
connects and data flows.
No KASAN report in either run.

v2 of 02/26 is attached for 6.12.y and 6.18.y.
It applies the length check to a plain CONNACK only:

  if (frametype =3D=3D NR_CONNACK && !flags &&
      skb->len < NR_NETWORK_LEN + NR_TRANSPORT_LEN + 1) {

Patches 03 to 26 apply unchanged on top of it, and net/netrom builds
with W=3D1 and KASAN on both branches, with no warning.
The same fix goes to mod-orphan as a follow-up to db51201afd46.

Thanks,
Bernard


Le ven. 23 oct. 2026 =C3=A0 22:03, Sasha Levin <sashal@kernel.org> a =C3=A9=
crit :
>
> > [PATCH 6.12.y 02/26] netrom: linearize and validate lengths in nr_rx_fr=
ame()
> >
> > +             /* nr_state1_machine() reads the window size at byte 20 *=
/
> > +             if (frametype =3D=3D NR_CONNACK &&
> > +                 skb->len < NR_NETWORK_LEN + NR_TRANSPORT_LEN + 1) {
> > +                     sock_put(sk);
> > +                     return 0;
> > +             }
>
> This check ignores the flag nibble, so it also drops CONNACK|CHOKE (0x82)
> refusals. __nr_transmit_reply() builds those as 20-byte frames
> (skb_put(NR_NETWORK_LEN + NR_TRANSPORT_LEN)), so a refused connect() no
> longer gets ECONNREFUSED and times out after the T1/N2 retries, and CHOKE
> resets of state 2 and 3 circuits are lost. nr_state1_machine() only reads
> the window byte for a plain CONNACK.
>
> --
> Thanks,
> Sasha

--000000000000bb751b065e931147
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="6.18.y-v2-02-26-netrom-nr_rx_frame.patch"
Content-Disposition: attachment; 
	filename="6.18.y-v2-02-26-netrom-nr_rx_frame.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvm7scxc1>
X-Attachment-Id: f_mvm7scxc1

RnJvbSA5ZmM4ZWM3NTEyMjc0ZTQ3ZDQwNDUxZWU0MmJmMzg4ZTI0NGQ1ZTgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGFuaXNsYXYgRm9ydCA8ZGlzY2xvc3VyZUBhaXNsZS5jb20+
CkRhdGU6IEZyaSwgMjUgU2VwIDIwMjYgMTI6MjM6NTAgKzAyMDAKU3ViamVjdDogW1BBVENIIDYu
MTgueSB2MiAwMi8yNl0gbmV0cm9tOiBsaW5lYXJpemUgYW5kIHZhbGlkYXRlIGxlbmd0aHMgaW4K
IG5yX3J4X2ZyYW1lKCkKCkxpbmVhcml6ZSBza2IgYW5kIGFkZCB0YXJnZXRlZCBsZW5ndGggY2hl
Y2tzIGluIG5yX3J4X2ZyYW1lKCkgdG8KcHJldmVudCBvdXQtb2YtYm91bmRzIHJlYWRzIHdoZW4g
cHJvY2Vzc2luZyBtYWxmb3JtZWQgTkVUL1JPTSBmcmFtZXMuCgotIFJlcXVpcmUgc2tiIHRvIGJl
IGxpbmVhciBhbmQgYXQgbGVhc3QgTlJfTkVUV09SS19MRU4gKwogIE5SX1RSQU5TUE9SVF9MRU4g
KDIwIGJ5dGVzKSBiZWZvcmUgcmVhZGluZyBuZXR3b3JrL3RyYW5zcG9ydCBmaWVsZHMuCi0gRm9y
IHRoZSBleGlzdGluZyBzb2NrZXRzIHBhdGgsIGVuc3VyZSBOUl9DT05OQUNLIGluY2x1ZGVzIHRo
ZSB3aW5kb3cKICBieXRlICg+PSAyMSBieXRlcyksIHdoaWNoIG5yX3N0YXRlMV9tYWNoaW5lKCkg
cmVhZHMuCi0gRm9yIENPTk5SRVEgaGFuZGxpbmcsIGVuc3VyZSB3aW5kb3cgKGJ5dGUgMjApIGFu
ZCB1c2VyIGFkZHJlc3MKICAoYnl0ZXMgMjEtMjcpIGFyZSBwcmVzZW50ICg+PSAyOCBieXRlcyks
IGFuZCBkbyBzbyBiZWZvcmUKICBucl9maW5kX2xpc3RlbmVyKCkgc28gbm8gbGlzdGVuZXIgcmVm
ZXJlbmNlIGNhbiBsZWFrLgotIFByZXNlcnZlIGV4aXN0aW5nIEJQUSBleHRlbnNpb24gaGFuZGxp
bmc6CiAgLSBOUl9DT05OQUNLIGxlbiA9PSAyMiAtPiAxIGV4dHJhIGJ5dGUgKFRUTCkKICAtIE5S
X0NPTk5SRVEgbGVuID09IDM3IC0+IDIgZXh0cmEgYnl0ZXMgKHRpbWVvdXQpCgpucl9yb3V0ZV9m
cmFtZSgpIG9ubHkgZ3VhcmFudGVlcyAxNSBieXRlcyBiZWZvcmUgaGFuZGluZyBhIGZyYW1lCmFk
ZHJlc3NlZCB0byBhIGxvY2FsIG5vZGUgdG8gbnJfcnhfZnJhbWUoKSwgc28gYSBzaG9ydCBmcmFt
ZSByZWNlaXZlZApmcm9tIGFueSBBWC4yNSBuZWlnaGJvdXIgaXMgZW5vdWdoIHRvIHRyaWdnZXIg
dGhlIG92ZXItcmVhZC4KCkZpeGVzOiAxZGExNzdlNGMzZjQgKCJMaW51eC0yLjYuMTItcmMyIikK
U3VnZ2VzdGVkLWJ5OiBFcmljIER1bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+ClJldmlld2Vk
LWJ5OiBFcmljIER1bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IFN0
YW5pc2xhdiBGb3J0IDxkaXNjbG9zdXJlQGFpc2xlLmNvbT4KW0Y2QlZQOiB2NCBuZXZlciByZWFj
aGVkIG1haW5saW5lICh3aGl0ZXNwYWNlLWRhbWFnZWQgcG9zdGluZywgc3Vic3lzdGVtCiByZW1v
dmVkIGluIDcuMSk7IHJlYmFzZWQgb250byBtb2Qtb3JwaGFuLCBhZGRlZCBjb21tZW50cy4gVGVz
dGVkIG9uIGEKIHR3by1WTSBRRU1VIGJlbmNoICg2LjEyLjk0LCBta2lzcyBsaW5rKTogYW4gQVgu
MjUgcGVlciBzZW5kcyBDT05OUkVRCiBmcmFtZXMgdHJ1bmNhdGVkIHRvIDIwIGFuZCAyNyBieXRl
czsgd2l0aG91dCB0aGlzIHBhdGNoIGJvdGggYXJlCiBhY2NlcHRlZCBhcyBjb25uZWN0aW9ucywg
dGhlIHVzZXIgY2FsbHNpZ24gYmVpbmcgcmVhZCBwYXN0IHRoZSBlbmQgb2YKIHRoZSBmcmFtZTsg
d2l0aCBpdCBvbmx5IHRoZSBjb21wbGV0ZSAzNS1ieXRlIENPTk5SRVEgaXMgYWNjZXB0ZWQuCiB2
MjogYXBwbHkgdGhlIENPTk5BQ0sgbGVuZ3RoIGNoZWNrIHRvIGEgcGxhaW4gQ09OTkFDSyBvbmx5
LCBzbyB0aGF0CiAyMC1ieXRlIENPTk5BQ0t8Q0hPS0UgcmVmdXNhbHMgYW5kIHJlc2V0cyBhcmUg
bm8gbG9uZ2VyIGRyb3BwZWQKIChyZXBvcnRlZCBieSBTYXNoYSBMZXZpbikuIFNhbWUgZml4IHN1
Ym1pdHRlZCB0byBtb2Qtb3JwaGFuLl0KU2lnbmVkLW9mZi1ieTogQmVybmFyZCBQaWRvdXggPGJl
cm5hcmQuZjZidnBAZ21haWwuY29tPgooY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCBkYjUxMjAx
YWZkNDY5OTJjOTIwNmZhNzk4NzhiYWRiMjIzNmJiN2QzKQotLS0KIG5ldC9uZXRyb20vYWZfbmV0
cm9tLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL25ldC9uZXRyb20vYWZfbmV0
cm9tLmMgYi9uZXQvbmV0cm9tL2FmX25ldHJvbS5jCmluZGV4IDMzNDY4MTI0ZDUuLjBlNzBkMTQ5
YWIgMTAwNjQ0Ci0tLSBhL25ldC9uZXRyb20vYWZfbmV0cm9tLmMKKysrIGIvbmV0L25ldHJvbS9h
Zl9uZXRyb20uYwpAQCAtODg1LDYgKzg4NSwxMSBAQCBpbnQgbnJfcnhfZnJhbWUoc3RydWN0IHNr
X2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldikKIAkgKglza2ItPmRhdGEgcG9pbnRz
IHRvIHRoZSBuZXRyb20gZnJhbWUgc3RhcnQKIAkgKi8KIAorCWlmIChza2JfbGluZWFyaXplKHNr
YikpCisJCXJldHVybiAwOworCWlmIChza2ItPmxlbiA8IE5SX05FVFdPUktfTEVOICsgTlJfVFJB
TlNQT1JUX0xFTikKKwkJcmV0dXJuIDA7CisKIAlzcmMgID0gKGF4MjVfYWRkcmVzcyAqKShza2It
PmRhdGEgKyAwKTsKIAlkZXN0ID0gKGF4MjVfYWRkcmVzcyAqKShza2ItPmRhdGEgKyA3KTsKIApA
QCAtOTI3LDYgKzkzMiwxNyBAQCBpbnQgbnJfcnhfZnJhbWUoc3RydWN0IHNrX2J1ZmYgKnNrYiwg
c3RydWN0IG5ldF9kZXZpY2UgKmRldikKIAl9CiAKIAlpZiAoc2sgIT0gTlVMTCkgeworCQkvKgor
CQkgKiBucl9zdGF0ZTFfbWFjaGluZSgpIHJlYWRzIHRoZSB3aW5kb3cgc2l6ZSBhdCBieXRlIDIw
LCBidXQKKwkJICogb25seSBmb3IgYSBwbGFpbiBDT05OQUNLLiBBIENPTk5BQ0sgd2l0aCB0aGUg
Y2hva2UgZmxhZyBzZXQKKwkJICogaXMgYSByZWZ1c2FsIG9yIGEgcmVzZXQsIHNlbnQgYXMgYSAy
MC1ieXRlIGZyYW1lIGJ5CisJCSAqIF9fbnJfdHJhbnNtaXRfcmVwbHkoKSwgYW5kIG11c3Qgbm90
IGJlIGRyb3BwZWQgaGVyZS4KKwkJICovCisJCWlmIChmcmFtZXR5cGUgPT0gTlJfQ09OTkFDSyAm
JiAhZmxhZ3MgJiYKKwkJICAgIHNrYi0+bGVuIDwgTlJfTkVUV09SS19MRU4gKyBOUl9UUkFOU1BP
UlRfTEVOICsgMSkgeworCQkJc29ja19wdXQoc2spOworCQkJcmV0dXJuIDA7CisJCX0KIAkJYmhf
bG9ja19zb2NrKHNrKTsKIAkJc2tiX3Jlc2V0X3RyYW5zcG9ydF9oZWFkZXIoc2tiKTsKIApAQCAt
OTYxLDEwICs5NzcsMTQgQEAgaW50IG5yX3J4X2ZyYW1lKHN0cnVjdCBza19idWZmICpza2IsIHN0
cnVjdCBuZXRfZGV2aWNlICpkZXYpCiAJCXJldHVybiAwOwogCX0KIAotCXNrID0gbnJfZmluZF9s
aXN0ZW5lcihkZXN0KTsKKwkvKiBOZWVkIHdpbmRvdyAoYnl0ZSAyMCkgYW5kIHVzZXIgYWRkcmVz
cyAoYnl0ZXMgMjEtMjcpICovCisJaWYgKHNrYi0+bGVuIDwgTlJfTkVUV09SS19MRU4gKyBOUl9U
UkFOU1BPUlRfTEVOICsgMSArIEFYMjVfQUREUl9MRU4pCisJCXJldHVybiAwOwogCiAJdXNlciA9
IChheDI1X2FkZHJlc3MgKikoc2tiLT5kYXRhICsgMjEpOwogCisJc2sgPSBucl9maW5kX2xpc3Rl
bmVyKGRlc3QpOworCiAJaWYgKHNrID09IE5VTEwgfHwgc2tfYWNjZXB0cV9pc19mdWxsKHNrKSB8
fAogCSAgICAobWFrZSA9IG5yX21ha2VfbmV3KHNrKSkgPT0gTlVMTCkgewogCQlucl90cmFuc21p
dF9yZWZ1c2FsKHNrYiwgMCk7Ci0tIAoyLjUzLjAKCg==
--000000000000bb751b065e931147
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="6.12.y-v2-02-26-netrom-nr_rx_frame.patch"
Content-Disposition: attachment; 
	filename="6.12.y-v2-02-26-netrom-nr_rx_frame.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvm7scwo0>
X-Attachment-Id: f_mvm7scwo0

RnJvbSA4NjI0YjA1NDQ3NjMxNTkyZDM4MjU4YTQ2ZjA4MmFmYzI5ZTEyNGYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGFuaXNsYXYgRm9ydCA8ZGlzY2xvc3VyZUBhaXNsZS5jb20+
CkRhdGU6IEZyaSwgMjUgU2VwIDIwMjYgMTI6MjM6NTAgKzAyMDAKU3ViamVjdDogW1BBVENIIDYu
MTIueSB2MiAwMi8yNl0gbmV0cm9tOiBsaW5lYXJpemUgYW5kIHZhbGlkYXRlIGxlbmd0aHMgaW4K
IG5yX3J4X2ZyYW1lKCkKCkxpbmVhcml6ZSBza2IgYW5kIGFkZCB0YXJnZXRlZCBsZW5ndGggY2hl
Y2tzIGluIG5yX3J4X2ZyYW1lKCkgdG8KcHJldmVudCBvdXQtb2YtYm91bmRzIHJlYWRzIHdoZW4g
cHJvY2Vzc2luZyBtYWxmb3JtZWQgTkVUL1JPTSBmcmFtZXMuCgotIFJlcXVpcmUgc2tiIHRvIGJl
IGxpbmVhciBhbmQgYXQgbGVhc3QgTlJfTkVUV09SS19MRU4gKwogIE5SX1RSQU5TUE9SVF9MRU4g
KDIwIGJ5dGVzKSBiZWZvcmUgcmVhZGluZyBuZXR3b3JrL3RyYW5zcG9ydCBmaWVsZHMuCi0gRm9y
IHRoZSBleGlzdGluZyBzb2NrZXRzIHBhdGgsIGVuc3VyZSBOUl9DT05OQUNLIGluY2x1ZGVzIHRo
ZSB3aW5kb3cKICBieXRlICg+PSAyMSBieXRlcyksIHdoaWNoIG5yX3N0YXRlMV9tYWNoaW5lKCkg
cmVhZHMuCi0gRm9yIENPTk5SRVEgaGFuZGxpbmcsIGVuc3VyZSB3aW5kb3cgKGJ5dGUgMjApIGFu
ZCB1c2VyIGFkZHJlc3MKICAoYnl0ZXMgMjEtMjcpIGFyZSBwcmVzZW50ICg+PSAyOCBieXRlcyks
IGFuZCBkbyBzbyBiZWZvcmUKICBucl9maW5kX2xpc3RlbmVyKCkgc28gbm8gbGlzdGVuZXIgcmVm
ZXJlbmNlIGNhbiBsZWFrLgotIFByZXNlcnZlIGV4aXN0aW5nIEJQUSBleHRlbnNpb24gaGFuZGxp
bmc6CiAgLSBOUl9DT05OQUNLIGxlbiA9PSAyMiAtPiAxIGV4dHJhIGJ5dGUgKFRUTCkKICAtIE5S
X0NPTk5SRVEgbGVuID09IDM3IC0+IDIgZXh0cmEgYnl0ZXMgKHRpbWVvdXQpCgpucl9yb3V0ZV9m
cmFtZSgpIG9ubHkgZ3VhcmFudGVlcyAxNSBieXRlcyBiZWZvcmUgaGFuZGluZyBhIGZyYW1lCmFk
ZHJlc3NlZCB0byBhIGxvY2FsIG5vZGUgdG8gbnJfcnhfZnJhbWUoKSwgc28gYSBzaG9ydCBmcmFt
ZSByZWNlaXZlZApmcm9tIGFueSBBWC4yNSBuZWlnaGJvdXIgaXMgZW5vdWdoIHRvIHRyaWdnZXIg
dGhlIG92ZXItcmVhZC4KCkZpeGVzOiAxZGExNzdlNGMzZjQgKCJMaW51eC0yLjYuMTItcmMyIikK
U3VnZ2VzdGVkLWJ5OiBFcmljIER1bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+ClJldmlld2Vk
LWJ5OiBFcmljIER1bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IFN0
YW5pc2xhdiBGb3J0IDxkaXNjbG9zdXJlQGFpc2xlLmNvbT4KW0Y2QlZQOiB2NCBuZXZlciByZWFj
aGVkIG1haW5saW5lICh3aGl0ZXNwYWNlLWRhbWFnZWQgcG9zdGluZywgc3Vic3lzdGVtCiByZW1v
dmVkIGluIDcuMSk7IHJlYmFzZWQgb250byBtb2Qtb3JwaGFuLCBhZGRlZCBjb21tZW50cy4gVGVz
dGVkIG9uIGEKIHR3by1WTSBRRU1VIGJlbmNoICg2LjEyLjk0LCBta2lzcyBsaW5rKTogYW4gQVgu
MjUgcGVlciBzZW5kcyBDT05OUkVRCiBmcmFtZXMgdHJ1bmNhdGVkIHRvIDIwIGFuZCAyNyBieXRl
czsgd2l0aG91dCB0aGlzIHBhdGNoIGJvdGggYXJlCiBhY2NlcHRlZCBhcyBjb25uZWN0aW9ucywg
dGhlIHVzZXIgY2FsbHNpZ24gYmVpbmcgcmVhZCBwYXN0IHRoZSBlbmQgb2YKIHRoZSBmcmFtZTsg
d2l0aCBpdCBvbmx5IHRoZSBjb21wbGV0ZSAzNS1ieXRlIENPTk5SRVEgaXMgYWNjZXB0ZWQuCiB2
MjogYXBwbHkgdGhlIENPTk5BQ0sgbGVuZ3RoIGNoZWNrIHRvIGEgcGxhaW4gQ09OTkFDSyBvbmx5
LCBzbyB0aGF0CiAyMC1ieXRlIENPTk5BQ0t8Q0hPS0UgcmVmdXNhbHMgYW5kIHJlc2V0cyBhcmUg
bm8gbG9uZ2VyIGRyb3BwZWQKIChyZXBvcnRlZCBieSBTYXNoYSBMZXZpbikuIFNhbWUgZml4IHN1
Ym1pdHRlZCB0byBtb2Qtb3JwaGFuLl0KU2lnbmVkLW9mZi1ieTogQmVybmFyZCBQaWRvdXggPGJl
cm5hcmQuZjZidnBAZ21haWwuY29tPgooY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCBkYjUxMjAx
YWZkNDY5OTJjOTIwNmZhNzk4NzhiYWRiMjIzNmJiN2QzKQotLS0KIG5ldC9uZXRyb20vYWZfbmV0
cm9tLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL25ldC9uZXRyb20vYWZfbmV0
cm9tLmMgYi9uZXQvbmV0cm9tL2FmX25ldHJvbS5jCmluZGV4IDZlZTE0OGYwZTYuLjRkYWM1ZWU1
OGEgMTAwNjQ0Ci0tLSBhL25ldC9uZXRyb20vYWZfbmV0cm9tLmMKKysrIGIvbmV0L25ldHJvbS9h
Zl9uZXRyb20uYwpAQCAtODg1LDYgKzg4NSwxMSBAQCBpbnQgbnJfcnhfZnJhbWUoc3RydWN0IHNr
X2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldikKIAkgKglza2ItPmRhdGEgcG9pbnRz
IHRvIHRoZSBuZXRyb20gZnJhbWUgc3RhcnQKIAkgKi8KIAorCWlmIChza2JfbGluZWFyaXplKHNr
YikpCisJCXJldHVybiAwOworCWlmIChza2ItPmxlbiA8IE5SX05FVFdPUktfTEVOICsgTlJfVFJB
TlNQT1JUX0xFTikKKwkJcmV0dXJuIDA7CisKIAlzcmMgID0gKGF4MjVfYWRkcmVzcyAqKShza2It
PmRhdGEgKyAwKTsKIAlkZXN0ID0gKGF4MjVfYWRkcmVzcyAqKShza2ItPmRhdGEgKyA3KTsKIApA
QCAtOTI3LDYgKzkzMiwxNyBAQCBpbnQgbnJfcnhfZnJhbWUoc3RydWN0IHNrX2J1ZmYgKnNrYiwg
c3RydWN0IG5ldF9kZXZpY2UgKmRldikKIAl9CiAKIAlpZiAoc2sgIT0gTlVMTCkgeworCQkvKgor
CQkgKiBucl9zdGF0ZTFfbWFjaGluZSgpIHJlYWRzIHRoZSB3aW5kb3cgc2l6ZSBhdCBieXRlIDIw
LCBidXQKKwkJICogb25seSBmb3IgYSBwbGFpbiBDT05OQUNLLiBBIENPTk5BQ0sgd2l0aCB0aGUg
Y2hva2UgZmxhZyBzZXQKKwkJICogaXMgYSByZWZ1c2FsIG9yIGEgcmVzZXQsIHNlbnQgYXMgYSAy
MC1ieXRlIGZyYW1lIGJ5CisJCSAqIF9fbnJfdHJhbnNtaXRfcmVwbHkoKSwgYW5kIG11c3Qgbm90
IGJlIGRyb3BwZWQgaGVyZS4KKwkJICovCisJCWlmIChmcmFtZXR5cGUgPT0gTlJfQ09OTkFDSyAm
JiAhZmxhZ3MgJiYKKwkJICAgIHNrYi0+bGVuIDwgTlJfTkVUV09SS19MRU4gKyBOUl9UUkFOU1BP
UlRfTEVOICsgMSkgeworCQkJc29ja19wdXQoc2spOworCQkJcmV0dXJuIDA7CisJCX0KIAkJYmhf
bG9ja19zb2NrKHNrKTsKIAkJc2tiX3Jlc2V0X3RyYW5zcG9ydF9oZWFkZXIoc2tiKTsKIApAQCAt
OTYxLDEwICs5NzcsMTQgQEAgaW50IG5yX3J4X2ZyYW1lKHN0cnVjdCBza19idWZmICpza2IsIHN0
cnVjdCBuZXRfZGV2aWNlICpkZXYpCiAJCXJldHVybiAwOwogCX0KIAotCXNrID0gbnJfZmluZF9s
aXN0ZW5lcihkZXN0KTsKKwkvKiBOZWVkIHdpbmRvdyAoYnl0ZSAyMCkgYW5kIHVzZXIgYWRkcmVz
cyAoYnl0ZXMgMjEtMjcpICovCisJaWYgKHNrYi0+bGVuIDwgTlJfTkVUV09SS19MRU4gKyBOUl9U
UkFOU1BPUlRfTEVOICsgMSArIEFYMjVfQUREUl9MRU4pCisJCXJldHVybiAwOwogCiAJdXNlciA9
IChheDI1X2FkZHJlc3MgKikoc2tiLT5kYXRhICsgMjEpOwogCisJc2sgPSBucl9maW5kX2xpc3Rl
bmVyKGRlc3QpOworCiAJaWYgKHNrID09IE5VTEwgfHwgc2tfYWNjZXB0cV9pc19mdWxsKHNrKSB8
fAogCSAgICAobWFrZSA9IG5yX21ha2VfbmV3KHNrKSkgPT0gTlVMTCkgewogCQlucl90cmFuc21p
dF9yZWZ1c2FsKHNrYiwgMCk7Ci0tIAoyLjUzLjAKCg==
--000000000000bb751b065e931147--
