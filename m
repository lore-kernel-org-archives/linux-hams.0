From: f6bvp <f6bvp@free.fr>
Subject: [PATCH 3/6]NET:AX25:ROSE Traps calls to rose_route_frame with a NULL
 ax25 callback
Date: Sun, 14 Aug 2016 15:41:08 +0200
Message-ID: <57B074F4.9050307@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netdev@vger.kernel.org, linux-hams@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Richard Stearn <richard@rns-stearn.demon.co.uk>, Bernard Pidoux <bernard.pidoux@free.fr>

Hi Richard,

Thanks for this patch and all others for ROSE code you sent recently.
I already committed a similar one in february 2016.

Subject: [Patch] rose_route_frame() NULL pointer dereference kernel panic
From: f6bvp <f6bvp@xxxxxxx>
Date: Wed, 24 Feb 2016 17:53:11 +0100
Cc: Ralf Baechle <ralf@xxxxxxxxxxxxxx>, "'f6bvp'" <f6bvp@xxxxxxx>, 
davem@xxxxxxxxxxxxx

You may browse linux servers for author f6bvp and see my last findings 
about null ax25.

However, despite all my efforts, I did no convince referees of the 
patch's legitimity and it had not been accepted.
I hope your work for improving rose code will be successful to the 
benefit of all radioamateur packet community!

73 de Bernard, f6bvp

