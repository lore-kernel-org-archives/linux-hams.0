From: bminish@minish.org
Subject: AXIP over UDP help
Date: Tue, 16 Mar 2004 18:27:37 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200403162327.i2GNRce05811@No6.NetMegs.com>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I hope this isn't the wrong place to ask this question but I need some help setting up a AXIP tunnel to another node 

I need to do this using UDP packets and I would like to do this on port 93 (incoming)

I am running Redhat 9 and am using xinetd to manage the port listeners and networking services. Kernel is already compiled with AX25 support and it's 2.4.20-28.9

I have managed after some fumbling to get my node and dxcluser cluster listening on RF and available for telnet connections.

Specifically I need help with configuring Xinetd correctly to route incoming traffic on port 93 to AX25IPD and to correctly route outgoing AXIP UDP packets to port 93 on the remote node 

As you can probably guess I am new to the AX25 side of Linux and an relatively new to Linux in general 

I have had a good look at the ax25howto but it doesn't seem to cover this very well 

73
Brendan EI6IZ 
