From: 9a4gl@9a0tcp.ampr.org (Tihomir Heidelberg)
Subject: ax25/netrom/rose patch for kernel 2.4.22 - need testers
Date: Wed, 29 Oct 03 20:52:51 CET
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20461@9A0TCP>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi,

I uploaded new patch for linux 2.4.22 kernel which fixs some bugs
in ax25, netrom and rose stack and adapt those stacks to 2.4
kernel...

It applies on clean linux kernel 2.4.22, news in this patch are:

1) now it works with SMP enabled
2) rose stack is also adapted for 2.4 kernel

patch is available at:
ftp://ham2.cc.fer.hr/pub/users/9a4gl/9a4gl-ax25-2422-20031029.patch

this patch will probably go into 2.4.24-preX kernel

currently, it works fine without crashes on 9A0TCP gateway where
vanilla 2.4.22 crashs few times per week... but, I use just ax25
and netrom on 1 CPU machine, so I need testers able to test
different configurations...

I need those who ...
1) use DAMA
2) have more then one CPU
3) use ROSE protocol

to test my patch and report me problems...

also, all others are welcome in testing and reporting problems...

73 de Tihomir, 9a4gl@9a0tcp.ampr.org
