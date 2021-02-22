From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 0/5] Remove dead linux-mips.org references
Date: Mon, 22 Feb 2021 17:19:00 +0100
Message-ID: <20210222161905.1153-1-lukas.bulwahn@gmail.com>
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=jrKMxz76VrtujF1xTtdvcqWh/FiUwzdqgqPn8MABZcQ=;
        b=tbCF6H7dNXWERfQSXS6cEb8eXbKZ4q0uTOEsLLhVC/ayjIosiu3ZdXWK3X6QJJpfTO
         oP5eo1+Ja+BAy5CLSQIdpeEA69xPIckoipNbGE8SiK6P9ZpgTlESyb+DsYXapjzbzVi0
         Psi4XvMUK6Zm8WwdD8/jVbGflL/RD3XZh2jY8FlNoDsxsfN/54xgI0mUW9Jm3jS8QJ6O
         DoC//YlzI54ErTJ6HEHWpVCiIJ4k+pDXx4DAdNf2ZMUHfPcGdaDisB6IjQaE3CYT4c29
         9pcqs6IicpJQvVRkY+tI7SsPqNeoXgRHZdsw+ET/Fa2YebRI82TOmwWxTDrXmNNsQLhB
         c0hw==
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Cc: "Maciej W . Rozycki" <macro@orcam.me.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Dear all,

The domain lookup for linux-mips.org fails for quite some time now.
Hence, webpages, the patchwork instance and Ralf Baechle's email there is
not reachable anymore.

First, I updated all sections in MAINTAINERS for references with linux-mips.org.
Then, I also quickly scanned through the whole git tree for linux-mips.org
references, and step-wise filtered out obvious copyright holder lines and
references to old email addresses.

  git ls-files | xargs grep "linux-mips.org" | \
    grep -v -i "Copyright" | grep -v -i "MODULE_AUTHOR" | grep -v -i "written" | \
    grep -v "Ralf" | grep -v "Maciej" | grep -v "Yoichi" | grep -v "Ladislav"


I removed dead references or replaced them with their living counterparts if
available. However, these two cases remain and somebody might want to have a look:

  1. case in ./arch/mips/include/asm/page.h:

<snip>
/*
 * RELOC_HIDE was originally added by 6007b903dfe5f1d13e0c711ac2894bdd4a61b1ad
 * (lmo) rsp. 8431fd094d625b94d364fe393076ccef88e6ce18 (kernel.org).  The
 * discussion can be found in
 * https://lore.kernel.org/lkml/a2ebde260608230500o3407b108hc03debb9da6e62c@mail.gmail.com
 *
 * It is unclear if the misscompilations mentioned in
 * https://lore.kernel.org/lkml/1281303490-390-1-git-send-email-namhyung@gmail.com
 * also affect MIPS so we keep this one until GCC 3.x has been retired
 * before we can apply https://patchwork.linux-mips.org/patch/1541/
 */
</snip>

  Decision: Keep as is. Although GCC 3.x is long retired, it is unclear what
  https://patchwork.linux-mips.org/patch/1541/ is and if it has been already
  applied or not.
  Question: does anyone know how to identify this patch?


  2. case in ./drivers/parport/parport_ip32.c:

    linux-mips.org tree is referred to in an old To do item:

<snip>
 * To do:
 *
 *      Fully implement ECP mode.
 *      EPP and ECP mode need to be tested.  I currently do not own any
 *      peripheral supporting these extended mode, and cannot test them.
 *      If DMA mode works well, decide if support for PIO FIFO modes should be
 *      dropped.
 *      Use the io{read,write} family functions when they become available in
 *      the linux-mips.org tree.  Note: the MIPS specific functions readsb()
 *      and writesb() are to be translated by ioread8_rep() and iowrite8_rep()
 *      respectively.
</snip>

  Decision: Keep as is; anyone that wants to follow up on this will probably
  understand that the reference is outdated anyway.


Please comment on these clean-up patches on this administrative topic.

Patch set applies cleanly on next-20210222.

Thanks,

Lukas


Lukas Bulwahn (5):
  MAINTAINERS: mark sections from Ralf Baechle orphan
  MAINTAINERS: remove linux-mips.org references
  arch: mips: update references to current linux-mips list
  arch: mips: remove dead references
  MIPS: SGI-IP27: fix spelling in Copyright

 MAINTAINERS                     | 20 ++++++--------------
 arch/mips/Kconfig               |  8 +-------
 arch/mips/jazz/Kconfig          | 12 +++---------
 arch/mips/kernel/r4k-bugs64.c   |  2 +-
 arch/mips/lib/iomap-pci.c       |  2 +-
 arch/mips/sgi-ip27/ip27-timer.c |  4 ++--
 arch/mips/sgi-ip32/ip32-irq.c   |  2 +-
 tools/include/nolibc/nolibc.h   |  3 +--
 8 files changed, 16 insertions(+), 37 deletions(-)

-- 
2.17.1

