From: Stewart Wilkinson <g0lgs@gb7lgs.co.uk>
Subject: RedHat 7.3 and AX25
Date: Sat, 7 Sep 2002 01:03:43 +0000 (GMT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0209070059470.137-100000@gb7lgs.ampr.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi,

I seem to have a problem using kissattach with the 2.4.18-3 kernel. I have
rebuilt a kernel with MKISS support on (ie: CONFIG_MKISS=y in .config),
yet when I try to run kissattach I get:

kissattach: Error setting line discipline: TIOCSETD: Invalid argument
Are you sure you have enabled MKISS support in the kernel
or, if you made it a module, that the module is loaded?

Any Idea's ??

-- 
Stewart (G0LGS)
g0lgs@gb7lgs.co.uk

