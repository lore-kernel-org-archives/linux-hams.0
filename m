From: Iain Young - G7III <g7iii@g7iii.demon.co.uk>
Subject: KJD 2.3.9 patch on 2.5.29
Date: Thu, 1 Aug 2002 20:46:18 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020801194618.GA722@columbia.g7iii.bogus>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi All,

With the AX25 status on 2.5/2.6 thread, and Tomi mentioning the
KJD patch, I decided to see how much work would be involved in
porting it to 2.5

(since the AX25 stack hasn't been touched much for a while, I
thought it would be easier than other subsystems, that have had
constant change).

The 2.3[4] version of the patch always lagged behind the 2.2, and
the latest version i could find was 2.3.9. This is known to be
roughly equivalent to the 2.2.17 patch.

It would seem there are around 74 files modified, or created in the
patch. Having applied it 'raw' to the pure 2.5.29 tree, I had 35
reject files created.

Two of those were the Makefile, and Config.in, so were expected to
break, but should be easy to fix. Another  eight were detected as
"Reverse or Previously Applied Patches", so I declined to apply them.

(I suspect that these are induvidual patches, that found their
way into later 2.3, or 2.4 - seaches of linux-kernel do find some
AX25 patches around 2.4.17 at least)

That should leave around 25 .rej's to work through, to bring it up
to the level of 2.3.9. Then of course the changes bewtween 2.2.17
and 2.2.20 need to be mixed in as well.

On a Hunk basis, 83 FAILED, while 73 succeeded, which is about right
when you look at the number of .rej's created (The 83 include the 8
reverse or previously applied patches).

Hopefully I'll get some time this weekend, and see what I can do
cut those rej's down. Then I get to see if it compiles.

Then I have a problem. IDE is dangerously broken in 2.5.x at the
moment. While I could grab the 2.4 IDE "forward port", that means
keeping track of two patches, and remembering to remove it before
running diff :)

Of course if anyone has a spare SCSI machine (all my SPARCs are dead
atm), then they are more than welcome to test anything I come up
with :)

[Note that you will need the modified libax25, ax25-apps, and
ax25-utils for anything I produce to even have half a chance of
working]

Anyway, I'll post later in the weekend, or early next week if I
have any meaningfull success.


All the Best

Iain



