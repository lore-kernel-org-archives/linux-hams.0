From: 9a4gl@9a0tcp.ampr.org (Tihomir Heidelberg)
Subject: Re: kernel 2.4.21 and AX25 & netrom
Date: Mon, 01 Sep 03 21:08:38 CEST
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <12777@9A0TCP>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi,

> or there is a fix to be done in the 2.4.21 kernel release?

I made a lot of fixes, some of them are implemented in 2.6.0-testX, too.
Some of fixes in my patch are stolen from boys working on 2.6 kernel.
When I posted here the info about my patch before more then month ago, there
were still big problems in kernel... Now I am running patched 2.4.21 more then
15 days without crash, think it is ready to be merged in some of next
2.4 kernel releases...
so, those having crashes (even protocol problems), try this patch:
ftp://ham2.cc.fer.hr/pub/users/9a4gl/9a4gl-ax25-2421-20030831.patch
the patch is against clean 2.4.21, so do not apply this patch if you
have patched kernel with any of my previous patches

73 de Tihomir, 9a4gl@9a0tcp.ampr.org
