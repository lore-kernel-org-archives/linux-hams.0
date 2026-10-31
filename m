Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793456273;
	b=0uFIvOJI+Xc9xc9sh4Pu22LkyB1TN177ZNxxFa8r4oAor7j18UiU+daqh8CROvXPIdnw
	 qhD42+wM9khhrw9aeiNIdAfrEesh+lVtSoA63XBwqqv/FZ+lPr1LNe53A6c/HdyLOYSsL
	 laNPpn2+V0/Y0xek3K40+0lmVFDIEyFQ4shvgdhec4j6j6S1PE2+hJwr1cbQN0ZySvsS5
	 dYu5FNwpZsTwlO5y5JbYYTzfQjwqRir2/cZpH+y1X09j2XF3eSwy8CafwkWUi8j+zxItG
	 RsCbqnSRTC68WAs6FEB8+Jw6Ak521E2Whc3dN1Kufc+uuLa/5DAV0Y5Gt5xdMFsemcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=g93j0K95MKrklMibhMY+zm0Z8pcVRWk2EReTDSVnajQ=;
	b=yFg8AD79rZW4aHb0klbK3f1U+PPqXajHqpwbOYoVo0PqwP3IsrExBRNIhGNv4zmZ+TEw
	 lrpmYw7YNr8ImjU2mfpbgA7cr4i5SJLAPSACOoRBk5xtRcnUGnyCxdAUuq9AJayvQGCRT
	 LptBoIK3uRw44H7ZKDHnjPHDP2UgezA0qlbvRvY6no7wovRT/f80dN884WOV2ahWZP3sY
	 2glyk2oDNr/eC8npRwlfGyT5UZBWOcNM5kA/cshvQWE2m5OWgdB53WSFBgAlB7m3FJbIq
	 KtC4MrmB5CW5okRGoq77IVlF0OJEUEKk7W04/kN4wUfsrKSnSA5WOkz1jkOcsaDaaig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RoXn9W9j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61DC606A31E
	for <linux-hams@vger.kernel.org>; Sat, 31 Oct 2026 14:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D61DC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RoXn9W9j
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67a2efec15cso1549282d50.0
        for <linux-hams@vger.kernel.org>; Sat, 31 Oct 2026 07:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793456272; cv=none;
        d=google.com; s=arc-20260327;
        b=Kb/CSzIeqNmIbhCaX+ahNG4oxIBuQalTYK/N+Ow4VAnz32XlVdmcg2Y4G1hnqnEe7x
         2/A+a0NA/k5LjVo8Fz+8grQwFS06ZqrCFg5EF1YY2Oa/G1JReIq92fgzskusxn2O+7uS
         ao5O7QzvnlUJH/kiTeyeSB6jMDlHNIs261bPgqCNpVRfp3L5076aE2i9/6dMmCElhwI2
         9rG1DtBFFPOWvcp/VE5zfSHkO4AwJRSyoUR0EQa8R3JOvNd7xsbgvkmzkrgPDDVs3wxe
         FCOauZUM/HOP5HC4/F4162wt5EumUlATAiB4j06I8fLMHxV1JtfUIzOzNXMlyt3AeuXP
         gXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=g93j0K95MKrklMibhMY+zm0Z8pcVRWk2EReTDSVnajQ=;
        fh=yvyQ0fNR7evt9jL2wClrmYYCzRjxmggS8kmKCqDY7Yw=;
        b=CIfCU+Pnez7VxMjjtsPRwnR+BDTKsBuurdv1njHpqoyEpSkkPf6ci9SnJnF4ZoqLHP
         yAyPGBiUHSZ44xvrAY7V1qupnRz5TqDvWOwoKGx0r9Kr4wCRxrdyW9ZfmDbJxbz/x1fc
         +FVUVG8fMns+r65kN0y0yd9s436xavm2r2QOsUv3/QjGnCIRDVxAJBdCXI19cLZQNAK4
         RFiiXgLWVoxi+BKvFrNNLoIlVp2Dn/ndTmyHCXhBzK6RrG0hTBsKT94tfGgpDcf96Hug
         lRFKdyhRSO7uAfyJ7NZSCNsXLh2uaMJc5Qlkr1uECNVe/nfoWfuqDCp4TreXIZ+amgOf
         bdeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793456272; x=1794061072; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g93j0K95MKrklMibhMY+zm0Z8pcVRWk2EReTDSVnajQ=;
        b=RoXn9W9jO3fpLKq31WRGH0YIcLtYhDG7eLtb704bczA80VhsEiR/3YII6diqkWr7va
         JCO56pHfMPskr7Qc+PbvLyoVvYoHUxbCOZUOpsa1j2VWaylSyzxwgS42cpHtdMXPtZJv
         QlQwG2jz8ACxC3/XnPP07VYbnbyvhIbrQ6d0hR130Q/wH8P1hrv3dBPDZ7g0E8DMhwJA
         zn5Fu26BTzZp5riOAhCwj3Zl1fsQQGGdww+9KMkD/ORWNRMd3d29OTtBFiiyXiOt4ymD
         40RLIn2nZYANnhTEqxglzY1bzlVKy2ur/3my5x/BwreW/+FJhArfUjh3okSyg7O4KEsY
         MtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456272; x=1794061072;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g93j0K95MKrklMibhMY+zm0Z8pcVRWk2EReTDSVnajQ=;
        b=hq76Q1c6mTFbK0sOr0agiTT8SdPw8aj+goYk89d1Nkrn7TtZzhzyiNj2jiDx7y84yP
         P8O+qX1c7X78WMweDIMRTR89R0yBq4W2mtnOLa4Ifey/FXret9OHZ0/np5+vP5O0XVKC
         cU7VkKsKmn9+nrUwKRcpaTEqr7B7mgWMGEH7rlarLVyy6JCv+Mx7a/mRtRgdjYYqx6zq
         4ko1Z4Jf8S18+ZfeMWzzFUPAF/yoFuNy+1NXT6wsWvdThvqDtwnFqjNvZV5ciKhT9/Vx
         JypHVOP1halpn8VOW3991t3mAsXewjWh5qglIyhjxTb3Ys2rk8AEqaPlCrrs9Tx/y3S9
         O6Uw==
X-Gm-Message-State: AFq9FYL6GxO2iWs/7Q7tpyc4uITNIijOPVjRsdEIieMVxnrfv9QPNBLv
	IYK018gO8gdno5nzoaIxvJ+k10r8iY+pTe95m92szb1GRm8RMPrWhtD6qkRK5DAn6X4wQBR+of7
	Ps0b+fYfLntKvGucbqQIV9QanpmBMDQ+mv/xT
X-Gm-Gg: AYBFou1dlwVaBNKdPQ7MDFdQczfHq2Q4QnAWs0NwxtJCqd3LlTIs2kskliMjYiJf39h
	VxZF1Vscs30oAx8uEXz0DYksl/xTvICm3hgGskAVIsrwutE7epcw5rPy/KJA5BjVlgJ3YBhF2wf
	+wtiFptrCdGS52oHyjIfFFDkvh6peinAxjPW1uFSHHualaJ0u1UlR1owe2ckB5V5Xnnnf0+TWgH
	Z8vaIJvOM2KetFJ0TbUwC5cLzITb5AifRZYPxWGqbjfVoBYxuzE7Kyyxni2K9NFxN9TGNtOkjOi
	3z8Y4+I6r2S8MtdIzbywsJeBKyQqPOpM+CheR/XcLPybakmMpnhsawnJJpDhXbYA1ub414vnYBl
	lG/+yf6TLgEzyigfCNE1uc9Gk5MSaRxCy1urovUAUxkzddyN0q6ZPYvekOA==
X-Received: by 2002:a05:690e:191a:b0:679:ac65:487b with SMTP id
 956f58d0204a3-67a8d396d2dmr6072439d50.15.1793456271842; Sat, 31 Oct 2026
 07:17:51 -0700 (PDT)
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
Date: Sat, 31 Oct 2026 15:17:39 +0100
X-Gm-Features: AclHuK9WrV5HDVOYWM0ML2HvYLl4S1ySWKsLimDSJtqM2XW4NTi_W9luTOAHXOw
Message-ID: <CAFAa3YBcnxco2MZGr0_zsWpNZJV85K6FSWNQeMvKFV012pkp5g@mail.gmail.com>
Subject: mod-orphan: mkiss and 6pack stop transmitting after link down/up (PR #48)
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I have opened pull request #48 in the linux-netdev/mod-orphan
repository on GitHub.
It fixes an old problem in mkiss and 6pack.

The problem

After "ip link set ax0 down" followed by "ip link set ax0 up", a mkiss
interface is up but does not transmit a single frame any more.
Connections time out and the tx_packets counter stays where it was.
Only restarting kissattach (detaching and attaching the line
discipline again) brings it back.
6pack has the same pattern.

The cause

The ndo_stop handler (ax_close, sp_close) stops the transmit queue,
but the ndo_open handler (ax_open_dev, sp_open_dev) never starts it
again.
With the queue stopped, ax_xmit() is never called, so its 20 second
transmit timeout recovery is never reached.
The tty write wakeup cannot restart it either, since ax_close()
cleared that flag.

The fix

One netif_start_queue() call in ax_open_dev() and in sp_open_dev(), as
network drivers do in ndo_open.
One commit per driver.

Test

QEMU bench, kernel 6.12.94 with KASAN and lockdep, two guests over a
KISS serial link.
Without the fix, every connection after a down/up timed out.
With the fix, connections and echoes worked after one and after two
down/up cycles.
Four runs of each, no kernel report.

6pack was not tested: I have no 6pack TNC.
If you run a 6pack port, a test would be very welcome: set the
interface down and up, then check that it still transmits.

If you use mkiss and sometimes set a port down and up by hand or from
a script, this one is for you.

73,
Bernard F6BVP
