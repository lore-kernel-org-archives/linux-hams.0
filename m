From: Stewart Wilkinson <g0lgs@gb7lgs.co.uk>
Subject: Strange AXIP / AX25 Frames
Date: Mon, 6 Jan 2003 22:45:11 +0000 (GMT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301062235020.14800-100000@gb7lgs.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi,

I have been looking into a problem on a remote (from me) Linux system
which is running a couple of AXIP links (configured as port '9'). 

The system is running Kernel 2.4.19 with libax25-0.0.10, ax25-apps-0.0.6,
and ax25-tools-0.0.8 .

'listen -ap 9' shows quite a number of corrupted frames, such as:

9: fm [invalid] to [invalid] via 90gGB7-2* M0GB7-3* [invalid] [invalid]* 
[invalid] gGB7BM 0GB7CR [invalid] ctl [invalid]0^ [DAMA]

which are repeated quite often.

as well as some like:

9: code 14 arg 132

Anyone got any idea what is going on here, or what might cause this ?

-- 
Stewart (G0LGS)
g0lgs@gb7lgs.co.uk

