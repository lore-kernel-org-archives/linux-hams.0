From: pd <pdickson@att.net>
Subject: Port not active?
Date: Sun, 25 Aug 2002 08:45:59 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200208250845.59571.pdickson@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I am having the following problem getting AX.25 going on my 2.4.18 RedHat 
system.  The TNC is connected and in KISS mode.  The kernel modules "ax25" 
and "mkiss" are loaded.  /etc/ax25/axports has appropriate stuff in it.  I 
give the kissattach command and it completes ok.  ifconfig shows the port UP 
and RUNNING in AX25 mode, with the correct HWaddr.

But when I try to use it, for example with a "call" command, I get the 
messages:
  axconfig: port vhf not active
  call: no AX.25 port data configured

Am I missing a step somewhere?

Versions are:
   Kernel 2.4.18, with AX.25 stuff included
   libax25 0.0.10
   kissattach 0.0.8
   call 0.0.6

