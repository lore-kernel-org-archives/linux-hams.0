From: "Tom Vavra" <wb8zrl@avalon.net>
Subject: netrom
Date: Fri, 20 Feb 2004 18:32:25 -0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <000501c3f7df$ff0fd060$794689d8@oem7paq6co5hph>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams <linux-hams@vger.kernel.org>

I am trying to get AX25/NETROM going and cannot get NETROM working.  My
system is:
RedHat 7.3
kernel 2.4.18

I have installed the following:
ax25-apps-0.0.6
ax25-tools-0.0.8
libax25-0.0.11
node-0.3.1

When trying to start ax25 and netrom I get the following:

[root@localhost root]# /usr/sbin/kissattach /dev/ttyS1 port1 44.0.0.1
AX.25 port port1 bound to device ax0
[root@localhost root]# /usr/sbin/nrattach thenet
NET/ROM port thenet bound to device nr0
[root@localhost root]# /usr/sbin/netromd -i
nrconfig: port thenet not active
netromd: no NET/ROM ports defined
[root@localhost root]#

ax25d wont start either.  When I remove all references to thenet from the
configuration files, kissattach and ax25d start and run just fine.

Can anyone tell me what I am overlooking or need to upgrade to get netrom
going?

One other point that may or may not have a bearing:  When I recompiled the
kernel to include kiss support, support for something called DEVPTS fell
off.  The boot sequences complains that it is not in the kernel (because
there is a line in /etc/fstab calling for it.)  I've tried a number of ways
of forcing it to compile but something in the make process always keeps
turning it off.

Thanks in advance for you help.     73   Tom  WB8ZRL

