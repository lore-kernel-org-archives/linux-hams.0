From: Hugo Oliveira <holiveira@eid.pt>
Subject: ax25 stability problem
Date: Mon, 6 Jun 2005 14:16:46 +0100
Message-ID: <74B47901BB3CD611B16E00508B6B9C7E02E709C3@EIDNTMAIL>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'Linux-Hams@vger.kernel.org'" <Linux-Hams@vger.kernel.org>

I'm trying to use the AX.25 protocol under Linux. For this I compile the
latest Linux kernel (2.6.11.11) with all the flag's (because I'm not sure
the kind of terminal that will be used) referent to AX.25 protocol. I use
the fedora core 3 distribution. 

Them I connect the 2 PC's with a simple serial cable, only 3 wires (Rx, Tx,
GND).
With the application ax-config-1.3.0 I configure a simple TNC terminal with
a TCP/IP connection, and appear to work. I have the latest packages from the
SourceForge site ax25-app, ax25-tools and libax25.
The problem is after a short wile system is configured and working the Linux
freeze and I have to do a manual reset.

And if I try to kill the kissattach application with the command:
"kill -s SIGTERM PidFromKissattach"
The System freeze and I have to do a manual reset.

I like to know if I'm missing something to put the protocol to work
correctly and if anyone test the protocol with the latest versions of the
kernel, because the documentation I see is only for old versions of the
kernel.

Thanks in advance.
Hugo Oliveira

