From: "Tom Vavra" <wb8zrl@avalon.net>
Subject: request for AX25 help
Date: Thu, 22 Jan 2004 20:23:22 -0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <001601c3e125$b93e4010$554689d8@oem7paq6co5hph>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams <linux-hams@vger.kernel.org>

I'm trying to get AX25 working on a RedHat 7.3 system.  The following
packages are on the system.

kernel   2.4.18-3
ax25-apps-0.0.6
ax25-tools-0.0.8
libax25-0.0.11

ax25 is not compiled into the kernel so I insmod   ax25.o and   netrom.o

I'm only trying to drive a kiss tnc, and provide ax25 and netrom.  When
trying to run kissattach i get

# /usr/sbin/kissattach /dev/ttyS1 port1 44.1.1.1
kissattach: Error setting line discipline: TIOCSETD: Invalid argument
Are you sure you have enabled MKISS support in the kernel
or, if you made it a module, that the module is loaded?

Any idea what I'm doing wrong?
Are the kernel and packages a good match?
Does the ip address in the kissattach command have to match something?


    tnx   Tom  WB8ZRL

