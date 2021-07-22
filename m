From: Dave van der Locht <d.vanderlocht@gmail.com>
Subject: SECURITY: Some type of NETROM frames contain random fragments of data
 from memory
Date: Thu, 22 Jul 2021 13:40:23 +0200
Message-ID: <CAH4uzPNH6GVX_H0eCrBUxPdgynRc9a7xLGde1_37dTCz3fgJOA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=eQtJQ4P316qQMDpjVagXnI8D23ccDm1yazVuAnvOzVQ=;
        b=PCNCWOqT2RhDYXowKJfftMUOGseJk5H6uQMgdYqE9V3ohsl2yujFSVTq3NEfyviVqP
         xb5FKcZuui8nV/Y6wmHxEO7orDlDloLRHYnVtyG+UOfTFwQ+1nmZo693t4pjiY0H01Ek
         5+sQeIpS4CNEF+JXUmsJqMWtUm1vnO4iFFuc36hC/FCOpp6Z4WqvW5bgeUuM9UZp0wJ0
         GgRraHeLWDGIISEBI4h7kWQ1/5IdS0PPP73GnZvDkV0xHTCmHFJjJE63zOsYkdKXrsBx
         apgBO6+Gu5EU0RHArhmVmX0ai94WQ28OXPYVmIxtGkToIyyVFayPx2wlkEf/pSED6YR9
         yfZw==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi,

With Linux kernel 5.4 and up I've noticed some type of NETROM frames
(conn, disc, etc.) contain random fragments of data from memory.
I've seen all kinds of data fragments with security sensitive
information in them depending on the software running.

Those random data fragments seem to appear only in some NETROM frames,
haven't noticed them in any other frame type.

Most, if not all, remote node software seems to ignore those fragments
and it won't be noticed until you capture the AX.25 over UDP frames.
You'll see the frames are larger than expected and contain random
fragments of data from (shared?) memory.

I've tested this with several 5.4 and 5.10 kernel versions
distributions and they all seem to leak security sensitive information
the same way into NETROM frames. Mostly logging data, but I've also
seen MySQL data and other random fragments of data.
I've also tested with kernel 4.19, which doesn't seem te be affected.

Kind regards,
Dave van der Locht
