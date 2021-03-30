From: Wang Qing <wangqing@vivo.com>
Subject: [PATCH 0/6] Clean up obsolete TODO files
Date: Tue, 30 Mar 2021 15:02:43 +0800
Message-ID: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Adaptec OEM Raid Solutions <aacraid@microsemi.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Wang Qing <wangqing@vivo.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net
Cc: gregkh@linuxfoundation.org

It is mentioned in the official documents of the Linux Foundation and WIKI 
that you can participate in its development according to the TODO files of 
each module.

But the TODO files here has not been updated for 15 years, and the function 
development described in the file have been implemented or abandoned.

Its existence will mislead developers seeking to view outdated information.

Wang Qing (6):
  mips/sgi-ip27: Delete obsolete TODO file
  scsi/aacraid: Delete obsolete TODO file
  fs/befs: Delete obsolete TODO file
  fs/jffs2: Delete obsolete TODO file
  net/ax25: Delete obsolete TODO file
  net/decnet: Delete obsolete TODO file

 arch/mips/sgi-ip27/TODO   | 19 -------------------
 drivers/scsi/aacraid/TODO |  3 ---
 fs/befs/TODO              | 14 --------------
 fs/jffs2/TODO             | 37 -------------------------------------
 net/ax25/TODO             | 20 --------------------
 net/decnet/TODO           | 40 ----------------------------------------
 6 files changed, 133 deletions(-)
 delete mode 100644 arch/mips/sgi-ip27/TODO
 delete mode 100644 drivers/scsi/aacraid/TODO
 delete mode 100644 fs/befs/TODO
 delete mode 100644 fs/jffs2/TODO
 delete mode 100644 net/ax25/TODO
 delete mode 100644 net/decnet/TODO

-- 
2.7.4

