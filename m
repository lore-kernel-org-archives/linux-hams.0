From: =?iso-8859-1?Q?Arnau_S=E1nchez?= <arnau@gbt.tfo.upm.es>
Subject: mkiss problem in kernel 2.5
Date: Fri, 27 Sep 2002 18:36:10 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <004301c26643$fda07ab0$4ca5a6d4@tokland>
References: <20020726134216.A4126@dea.linux-mips.net> <Pine.HPX.4.10.10207261512490.22573-100000@saturn.trs.ntc.nokia.com> <20020726145025.A24762@dea.linux-mips.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello,

    I wanted to test ax25 of the latest kernel version so I downloaded it
from bitkeeper. I compiled it without problems but after that I got an error
when trying to do a "modprobe mkiss" (I need it because I use soundmodem).
It has unresolved functions (cli, save_flags and restore_flags), I imagine
that in kernel 2.5 this system-calls are being removed...

    Is anybody working (or will be working) on mkiss and the rest of
hamradio drivers to adopt this changes? is it difficult to do?

thanks,

arnau

