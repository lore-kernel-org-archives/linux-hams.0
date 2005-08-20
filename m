From: oz6bl@amsat.dk
Subject: Re: AX-25 software that works on Fedora Core 4?
Date: Sat, 20 Aug 2005 20:30:37 -0000 (UTC)
Message-ID: <33093.83.73.68.20.1124569837.squirrel@www.amsat.dk>
References: <001701c5a4ef$996db510$a4011fac@kb2ear1>
    <20050820172204.GA2828@linux-mips.org>
    <20050820172614.GB2828@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050820172614.GB2828@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Hi Ralf

I would really like to get mkiss working on a SMP machine, so I tried you
mkis patch on two different kernel versions (2.6.8 and 2.6.11.4), both
with the same result:

host# patch --dry-run -p1 <mkiss.patch
patching file drivers/net/hamradio/mkiss.c
Hunk #6 FAILED at 397.
Hunk #7 succeeded at 416 (offset 2 lines).
Hunk #8 FAILED at 438.
Hunk #9 FAILED at 450.
Hunk #10 succeeded at 475 (offset 2 lines).
Hunk #11 FAILED at 527.
Hunk #12 succeeded at 564 with fuzz 2 (offset 2 lines).
Hunk #13 FAILED at 577.
Hunk #14 FAILED at 679.
Hunk #15 FAILED at 887.
7 out of 15 hunks FAILED -- saving rejects to file
drivers/net/hamradio/mkiss.c.rej
patching file drivers/net/hamradio/Kconfig

(I am a suspicious type so I always start with --dry-run)

What version is it actually intended for? The above are the latest Suse
9.2 and 9.3 respactively. I hope the above tells you something.

Best 73 de Bent/OZ6BL

