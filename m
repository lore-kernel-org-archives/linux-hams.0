From: 9a4gl@9a0tcp.ampr.org (Tihomir Heidelberg)
Subject: [PATCH] ax25 patches for 2.4.21
Date: Sat, 19 Jul 03 22:45:18 CEST
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <7870@9A0TCP>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


Hi,

I made some work on 2.4.21 kernel and put my patch
available for testing....

patch is at:
ftp://ham2.cc.fer.hr/pub/users/9a4gl
file: 9a4gl-ax25-2421-20030719.patch

on monday I am going on vacation, will be 3 weeks mostly
without Internet... those who have time and want to try it,
use it and please report me how it works on your machine....
especialy those who have oopses in ax25, please try it
because patch fixes several problems that caused oops...

patch should fix ax25 and netrom (rose not, because I never
used that)... dama is not tested at all because I also never
run dama... all fixes I applied to standard AX.25 protocols are
also applied to dama stuff, so it should work but is not tested
yet... if anyone have possibolity to test dama, I will
appreciate reports how it works...

also it add some extensions to support my linsv node, also
MTU of 1580 can be selected when configuring kernel to support
sending and receiving larger packets... if you do not need
that (probably not), then do not select those options

DMASCC driver modified so it can use software CRC, on
S5/DMASCC there is a problem with hardware CRC.... if you
use DMASCC driver and you see corrupted packets in monitor,
receive corrupted text in terminal or have CRC errors in
file transfers, you should enable software CRC for DMASCC
driver in kernel

73 de Tihomir, 9a4gl@9a0tcp.ampr.org
