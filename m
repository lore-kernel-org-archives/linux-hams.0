From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [PATCH 0/9] Testers needed for ham radio patches
Date: Sun, 30 Jan 2005 21:20:07 +0000
Message-ID: <20050130212007.GA6073@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: Jeff Garzik <jgarzik@pobox.com>, netdev@vger.kernel.org

I've cooked a series of patches that convert most of the ham radio drivers
and core code to convert them to use the netdev_priv() macro which was
introduced a while ago.  Lacking all the hardware for testing in the hope
for testers.  I left out the SCC and DMASCC drivers; they're looking too
scarry to touch without having hardware.

The patches are compile tested and I consider them low risk, so probably
safe to merged right away if you'd like.

73 de DL5RB op Ralf
