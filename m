Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795688638;
	b=oKF69kNxSjYexEgdInm5sBtafKvj6Zz03UvWLJO9pFtSEi+OwTEPDyYaB5xSbgjwca5g
	 u8EyNUs0FwVYADMXqL9z9o+huJbIiB4iBJmmdCtNvHKe0VQPTF5LX+v8EWsMfYRoG12UX
	 1BrAcu+WGH9SDJQjBVinX/XTCusSNNOJoE88e2+GLfqHyRxwAUGbdfBAAsbP4KC8Q2G1v
	 DE9Kk4R4Uuk5EJW/ehY7ufT3TX5vepuU3BPqQD+vIvZfoDC2C3kzn3ZwxnzkKfr4wO/QU
	 5kfCQD4VvLLJtB6A9NZ6OE/pMnxzhzbHHuYP55Tt2EF2/ZzMk6dkYi4Az/PytX77P1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=ONvm3P9ZUQyEg/Ny6KMCz1briRTTpxZ6kljF4iG7gg0=;
	b=D+7LZQbJf12qqYdew8ZiSrEZ2cpLMgDOr/XQzFZACzdzYvuBii/s0vEfkEV+68bSQU3D
	 N5kQ9iE23G8TQ0NyjMjSiH0dxULapaKnNw0XtQq31qN4vZWPVifdX7bNwrRAunjpXkAKE
	 YCeFr2tp1yFVYfkvLdJ8i+KO9a98fI+6xMehtvx++g4APAJFV0JFDW/R0Y8BrrPIKS1eR
	 bGeTed5rYiYNbQfzykSyzDnZ/PTn9d67P7I/jDZsOhJ9KW6nGW+3PCvmR7gOGd0fZ5uda
	 5M59Qnik9l4bbPq2ICi67msPXhcV7CSWbwOxfgt/647f6OYjC6gV9BxerkUiruL5Nyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COqNIGRK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B480A606A323
	for <linux-hams@vger.kernel.org>; Thu, 26 Nov 2026 10:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B480A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COqNIGRK
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67c24619b19so5713192d50.2
        for <linux-hams@vger.kernel.org>; Thu, 26 Nov 2026 02:23:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795688637; cv=none;
        d=google.com; s=arc-20260327;
        b=AjMYPc7GnziYm/SvvodkMslbTCf/IoTHD1zWiVS7v6NMr9qQ/qjIvRcIR9WKyvz89d
         a90jV1W2QYWFYRn2QEoqFTu9jANKGR0GyF0DqYTmhjDWmqo2NvmfxmpcRp32XET213K/
         dBD/ctJg9JXIepYu7ygDB8Jb6/5WVMEUKcbgk7IXTaLMPg7xUQmCrHRZrfFTtwbJ0Yzb
         A/AHLDcfK2onhozZQH4QoCJtoFyNJWI3/G+P9sco2NQL05aQoLHI3NlCwMzKun5i8X4I
         bw+FCS1+3yvaeUxAacuigZbHKQa+h9zizpEdWXeRUa0coGUu+PNwjZP5J/SQNGV/K7dr
         1yFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ONvm3P9ZUQyEg/Ny6KMCz1briRTTpxZ6kljF4iG7gg0=;
        fh=yvyQ0fNR7evt9jL2wClrmYYCzRjxmggS8kmKCqDY7Yw=;
        b=q4/N+xfP0TZzrc3Y2DnL8TMdDwFTvqbmd4zXpK2FyMpwOobPiqZGg5+3uUGjXTRgc9
         Amr6XohSksLq6oyHfHJr3UUtfAjvYlZh3waof92VP2CqZN6z82/3Q3YXC1n/4UeiB6kc
         hPv/Ya885MaqWNuUfhzMhOX8S0E+IbTH6QiwqlTElnfBJDv8ssFhKxysYsVixkVxzIuH
         MjXmJR+u0Vn+6hNX9bAgm8FMOJo7houxriaDwgohHI+ra7MioAJQX3QjIGyK9DMSKej1
         /43fGz9xm9zt7LJGGAh2VlDNyGJHdgn1yfuhuM0LFub0rVApQZ4e0yd5J9GdEixAWNXm
         yOMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795688637; x=1796293437; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ONvm3P9ZUQyEg/Ny6KMCz1briRTTpxZ6kljF4iG7gg0=;
        b=COqNIGRK3i4sXtwqk/MKrOeQ0gA9IUj8fzUBkWLFPtoZYrqHGXRn7z2/mLdEIcxRid
         NggeNSifcMUm9MhxD6tkTRF/CyTEz4lyA7MZSJ7cnRg2T83S1GNvREbCLyYDDrQHnrnT
         HlE2xzXFySdF8qPuU0ZXXIgMzZwaBnHSoAaTrgvliS5MVZHLDgo/5YJoYFyyZxmCihNa
         2nltoJaaj/JGxh78JrYXK9qKaoIomMGs0ZDllS5I4oNVW8iwQb+V9qfB1ca7e4gvVPAL
         WE0ZREbs9p1NaLNWUvsEvrdxkyhiX+jsfsx/tZ6Y1oDm0i3NBBxnXgfF8iGt2951Nd42
         n6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688637; x=1796293437;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONvm3P9ZUQyEg/Ny6KMCz1briRTTpxZ6kljF4iG7gg0=;
        b=ZGuNWL/EqBAWUjQce/D6KPBqfX0bK9XImtHTAuYO7TfxqP64vnUwssvVOiAdZbBaaN
         oDtWdhAlZPLm8pncFcaKM3bs8u/HF+B9tlIkdB3F0Bl9Y3aMGxgI6xxZcHfvgwv8j/RO
         n1dCUiBoWqIFz5TndDEE4f0+O6+tvnnIRp7O4PvGsHJEeRZqncgX6rt0VrsfwBHMUqd9
         7HPcyErtkD2GLfXgHOBaX62JaKlvSie6CJ4suk8okB8RAyC4wRVQCU8h1V7v5Yx+EZJo
         J0xQkwA7tMW6W+z1eynbeJhP/+1Jp3LG44y/CcZYb3L+mWxPdRwNInsauJ+mi0b195A2
         vuFQ==
X-Gm-Message-State: APuU4Z83hGyhIAVmg6a34rZe2D3gfGrFke1VfX3mJwtXAc+IiL/EsVy7
	Kx5vIZHhNXnxaHZIjStcsVPwM745SNvCcsoPibZX8IcgComF4t8SCfbqS/eRI9acurRJ2TwIoPg
	oFiVoK05/LTsvWYPKV8GB+7EzI+ke9tx3dA==
X-Gm-Gg: AZFdTZcKylaRujT9apZejmgAo78xIKhHIxyZ5c6Auu3f+p7OVaztfGNeL3zGF9Nu7Le
	4mLtM79g6w75c5LV8a0BvlmxcKq2w8FUkl24fZ0BsO/JEiZPr9NwCqglZO4xDuQJZDoQBYIf1Ib
	tPXSP7OlrHVybDDwBW4Y+lSwfWZeruDDYxzFawxQE0R5YnauUbszni2MoWV/YqwLgFW9RCG93Iu
	YV6HbeYFplUQeX/j+r5g7xWqYAP+IRRp6latlfVNNy7Fn4wMSsbgVLi3XC59iTZ9BLMfeeoAF8+
	UCV2PYNXWTppcP/PVGtq3k4vJ1beNuhvyEFPQ6JJE9CE9d2vRdnOUYWIj7x24XepKnGur5/gWuH
	fZlUizf7H/90J6m9ito3YLkmgIaGd23yabQ4B
X-Received: by 2002:a53:ac97:0:b0:67d:ac2d:d821 with SMTP id
 956f58d0204a3-67df444a866mr8732389d50.44.1795688636709; Thu, 26 Nov 2026
 02:23:56 -0800 (PST)
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
Date: Thu, 26 Nov 2026 11:23:45 +0100
X-Gm-Features: Aa3M54rN6w5OdAHj2rRwbUIHxo9AdA4HOW7rIsRBspW3Uw7D2XEXZMDIcLgu4ls
Message-ID: <CAFAa3YCCQ7ksv2DD3fV9DGgBaHJKrFUGfTLA_ThipPOTDjM1wA@mail.gmail.com>
Subject: mod-orphan: ten AX.25, NET/ROM, ROSE and mkiss fixes for testing (end
 of connection, busy receiver, KISS)
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello all,

I have opened ten new pull requests on the mod-orphan repository
(linux-netdev/mod-orphan on GitHub), numbers 97 to 106.
They fix the behaviour of AX.25, NET/ROM, ROSE and mkiss in everyday
situations: the end of a connection, a busy receiver, and packets on a
call that no longer exists.

End of a connection (#104 AX.25, #105 NET/ROM, #106 ROSE)
-----------------------------------------------------------

This is the usual way a node program or a user session ends, and the
last lines ("73", a prompt, the end of a file) are often lost today.
close() threw away the data written just before it and not yet acknowledged.
It now waits until that data is sent, with a time limit; SO_LINGER 0
still gives an abortive close.
recvmsg() returned -ENOTCONN as soon as the link went down, even with
data still waiting to be read.
The application now reads that data first.
In QEMU, with 12 messages written and the socket closed at once, the
peer received 0 of 12 on AX.25, 4 of 12 on NET/ROM and 7 of 12 on
ROSE.
With the patches it receives 12 of 12 in all three cases.
Behaviour change: close() on a connected socket can now block while
the data drains.

Busy receiver (#102 AX.25, #99 NET/ROM, #103 ROSE, #97 NET/ROM)
-----------------------------------------------------------------

When an application reads slowly, only the heartbeat left the busy
state, up to 5 seconds after the read, so the flow stopped and started
in 5 second steps.
The busy state is now left as soon as the application has read half of
its buffer.
ROSE could deliver the same data twice after resetting a call on a
full buffer (15 messages read instead of 12 in the test).
NET/ROM could grow its resequencing queue without limit while busy,
and could leave one frame undelivered until the peer's T1.
NET/ROM also kept the choke flag on frames sent again (#97), so the
peer stopped sending for up to 180 seconds.

ROSE packets on an unknown logical channel (#98)
-------------------------------------------------

A packet arriving on a channel with no call was dropped silently, so
the neighbour kept a call we no longer had.
The node now answers as X.25 does: it confirms a Clear Request and
clears the channel for anything else.

KISS (#100 mkiss, #101 AX.25)
-----------------------------

mkiss could store a wrong byte after an invalid escape sequence (FESC
followed by a byte other than TFEND or TFESC).
AX.25 now drops data frames from a KISS port other than 0, with one
message in the log.
Behaviour change: a setup that received ports 1, 4 or 5 of a
multi-port TNC through one device stops receiving them.

Testing
-------

Each change was reproduced and checked between two QEMU guests (6.12,
KASAN, lockdep) linked by KISS, with no KASAN, lockdep or WARN report.
The ten pull requests merge without conflict with each other and with
mod-orphan main.
They have been running together on two nodes of the French packet
network, F6BVP-12 (x86_64) since 2026-11-23 and F6BVP-8 (arm64
Raspberry Pi) since 2026-11-24, with real AX.25, NET/ROM and ROSE
traffic and no kernel message.

Each pull request is a branch of the same name in my fork,
f6bvp/mod-orphan on GitHub, and the descriptions give the details and
the test results.
Reports, good or bad, are welcome on this list or on the pull requests.
Please mention the kernel version, the architecture and which protocols you use.

73,
Bernard Pidoux, F6BVP
