From: "Albert Duane Lawson" <wb7awl@comcast.net>
Subject: Node Crashes
Date: Fri, 19 Sep 2003 18:48:54 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <001901c37f19$59ff2830$0200a8c0@albertla>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi Gang,

Experiencing problems with my ax25 node crashes after connecting to it.
The log shows node received a SIGTERM every time this happens.

Here's the breakdown on the setup:

New Install of Red Hat 7.3 using the 2.4.18-3 kernel
Intel 233 MHz CPU on an Intel Board  256 MB SDRam

ax25-apps-0.0.6
ax25-tools-0.0.8
libax25-0.0.11
node-0.3.2 (also have tried awznode with same results)

These were not RPM packages, they were compiled by myself on
the machine after Red Hat was installed.

When I make a netrom connect to the node via ax25d, the first
command issued will sometimes cause a disconnect.  The resulting
message in the log is SIGTERM.  I do not notice this when using
an ax25 connect or when using telnet into the node.

Can anyone suggest where to look to see what's causing this...???
Better yet, does anyone know what kind of problem this is and
how to fix it...???

73's

Albert/WB7AWL

