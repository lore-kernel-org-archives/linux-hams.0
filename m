From: Jarmo <oh1mrr@nic.fi>
Subject: libax25 0.0.11
Date: Mon, 17 Mar 2003 17:55:47 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200303171755.47880.oh1mrr@nic.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi

Hate to make this announce...But vers 0.0.11 brakes my wavelan system..
0.0.10 works fine...

Mar 17 17:28:06 oh1mrr kernel: NETDEV WATCHDOG: eth1: transmit timed out
Mar 17 17:28:06 oh1mrr kernel: eth1: Tx timeout! ALLOCFID=01f7, 
TXCOMPLFID=0000, EVSTAT=8000
Mar 17 17:28:06 oh1mrr kernel: eth1: orinoco_reset: Error -19 re-initializing 
firmware
Mar 17 17:28:07 oh1mrr kernel: NETDEV WATCHDOG: eth1: transmit timed out
Mar 17 17:28:07 oh1mrr kernel: eth1: Tx timeout! ALLOCFID=01f7, 
TXCOMPLFID=0000, EVSTAT=8000
Mar 17 17:28:07 oh1mrr kernel: eth1: orinoco_reset: Error -19 re-initializing 
firmware

Etc....

Desktop computer
Distro MDK 9.0
Kernel 2.4.20
AMD 1700+
512 ram

As said libax25-0.0.10 does not influens to my wlan system,but 0.0.11
does...?

Jarmo
oh1mrr@nic.fi
