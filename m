From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: New FBB 7.04r2 release
Date: Tue, 11 Aug 2009 15:08:38 +0200
Message-ID: <4A816D56.1030009@upmc.fr>
References: <200907101616.26422.pinozollo@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200907101616.26422.pinozollo@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ham-linux@mailman.qth.net, Linux Hams <linux-hams@vger.kernel.org>, List for the LINUX version of FBB <xfbb@f6fbb.org>

Hi FBB sysops and users,

I published a modified version of FBB BBS 7.04r2 with
small changes to reduce both debug verbose output 
/var/log/fbb.log (optional) and more importantly,
CPU load.
Observed xfbbd CPU load was 7-14%, sometime peeking
even higher.
It is now less than 1%.
This patch has been backported to versions 7.04o2 and 7.04p2

Here are two important recommandations : boot kernel in
single processor mode (online grub command : nosmp) 
On 64 bit systems, add N 1 parameter in forward script
to preclude forward compression.

Read more here : http://rose.fpac.free.fr/MINI-HOWTO/

FBB source package may be downloaded from :

http://f6bvp.free.fr/logiciels/BBS-f6fbb/xd704r2-src.bz2

Version 7.04 is still under debugging phase, with latest
intermediary versions 7.04s.nn

73 de Bernard, f6bvp
