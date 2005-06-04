From: oz6bl@amsat.dk
Subject: kissattach and kernel 2.6
Date: Sat, 4 Jun 2005 18:40:43 -0000 (UTC)
Message-ID: <32946.83.73.68.20.1117910443.squirrel@www.amsat.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

I'm the developper/maintainer of PB/PG for Linux but I havn't been active
for a while, in fact not since the kernel was 2.4.24 or something. Now I
try to get PB/PG up and running again under a 2.6 kernel but it appears
that quite a few things have chaned since then. Before even embarking on
PB/PG I try to bring the 'standard' AX.25 things up and running: listen,
call, etc, but I must admit with very little success.

What I have is this: My distribution is SUSE 9.2 with a 2.6.8 kernel. The
AX.25 tools are version 0.0.8 and the AX.25-apps are 0.0.6. My modem is a
DSP-12 in kiss mode attached to /dev/ttyS0. My PC has a Pentium 4 and I
normally run a SMP version, but since I learned that e.g. mkiss doesn't
work with SMP, I use a mono-CPU version ('default' in SUSE terms). I can
configue an ax0 interface with kissattach ('kissattach -l /dev/ttyS0 asy
44.145.40.3'), but I can't get listen to display any packets, in fact
'ifconfig' doesn't show any packets received. I have seen some patches
mentioned, but they appear to apply to mkiss in userland so I am really at
a loss as to what to do.

Could someone please help me with pointers and/or help?

Best 73 de Bent/OZ6BL

