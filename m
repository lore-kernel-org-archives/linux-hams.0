From: IZ4EFN Alessio <iz4efn@libero.it>
Subject: SCC driver
Date: Mon, 27 Dec 2004 14:40:40 +0100
Message-ID: <41D010D8.5070103@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams List <linux-hams@vger.kernel.org>

Thanks om, I had several answers.

I'm now using Slack tgz package.

Scc driver is loaded in the kernel as a module.

Once installed I make and insmod and a modprobe, all is fine.

But when creating the network interface with:

ifconfig scc0 44.128.1.1 hw ax25 iq4ax-2

i get the message:

SIOCSIFFLAGS: Invalid argument

I checked the sintax and it seems to be correct!!

Alessio iz4efn



