From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: [RFC] Future of INP3 patch
Date: Mon, 29 Mar 2004 20:26:49 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040329202649.C231@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: Ralf Baechle DO1GRB <ralf@linux-mips.org>

Hi,

I haven't seen any replies after posting about the inp3 patches for 2.6 so
either the spontanious combustion problems are fixed or nobody cares.....
At the moment the patch seems to be pretty stable and running without
problems so I was wondering what to do next:

- Keep making new patches for the 2.6 kernels and try to get it in in 2.7
  (Should be very safe, although less testing)

- Try to get it in 2.6.
  (The patch only affects netrom and is for 99% configurable with
CONFIG_NETROM_INP with the exeption of the netrom node sorting but this
shouldn't be a problem)


Any comments?
Jeroen

