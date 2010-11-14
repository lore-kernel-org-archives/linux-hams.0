From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: [PATCH] xfbbd:  Fix issue with xfbbd and AX25 radio connections
Date: Sun, 14 Nov 2010 19:58:04 +0100
Message-ID: <4CE0313C.3080804@upmc.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Cathryn Mataga <cathryn@junglevision.com>, linux-hams <linux-hams@vger.kernel.org>

Hi Cathryn,

Many thanks for the patches.
I had noticed the SIGPIPE bug when in GDB session.
However xfbbd did not fail usually when not under GDB.
Anyway, its nice you cured the problem.
Other bugs were also very annoying and I am gratefull that
your perspicacy found the reasons I did not discovered.

I applied your patch into new FBB pre release xd704r12.

http://f6bvp.free.fr/logiciels/BBS-f6fbb/xd704r12-src.tar.bz2

See CHANGES file for important notices about the use of xfbbd
on 64 bits and SMP systems.

73s de Bernard, f6bvp



>Patch versus version xfbbd version r11
>
>Same patch file, Except I changed the email subject.
>
>
>
>1. SOCK_MAXCHAN (drv_sock.c) now set to (MAXVOIES)  This was set to 50, which was less than MAXVOIES, and the code was
>accessing data off the end of this table.  This was causing strange problems.  After I made this change the gateway
>function started working again.  If anyone was having trouble with xfbbd and RF radio connections, this change may
>possibly fix their problem.
>2.  Several minor changes designed to eliminate "Bad file descriptor" error messages.  These occurred at the time
>of housekeeping due to a minor bug.  The messages actually turned out to be harmless, as far as I can tell.
>3.  Only use the signal handler for signals that have functionality in the code.  This is a simplification
>to prevent bugs.  Other signals are set to SIG_IGN.



