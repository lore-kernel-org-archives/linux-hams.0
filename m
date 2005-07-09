From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: mkiss driver patch applied ?
Date: Sat, 09 Jul 2005 18:51:59 +0200
Message-ID: <42D000AF.90703@ccr.jussieu.fr>
References: <20050704173042.GA3090@linux-mips.org> <620c905705070503452dce267a@mail.gmail.com> <20050705155301.GM5171@linux-mips.org> <620c905705070509063b3f65fb@mail.gmail.com> <20050705181222.GB18772@linux-mips.org> <42CEDEFF.30304@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42CEDEFF.30304@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi,

I tried to apply Ralf's patch to mkiss.c without success.

Did someone succeed ?

I would like very much to test this version with 2.6.11mdksmp kernel.

Could someone send me privately the full modified mkiss.c ?

73 de Bernard, f6bvp

-----------------
From: Ralf Baechle <eymz.emoob@killerinstinct.net>
Date: Thu Jul 07 2005 - 22:27:01 EEST

This is an almost complete rewrite of the mkiss driver trying to fix all
the issues this driver was having such as SMP, preemption etc. Basically
this makes this driver more of a descendant of PPP than of the old slip
code, as it used to be.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
  mkiss.c | 1052 
++++++++++++++++++++++++++++++----------------------------------
  1 files changed, 507 insertions(+), 545 deletions(-)
Index: linux-cvs/drivers/net/hamradio/mkiss.c
===================================================================
--- linux-cvs.orig/drivers/net/hamradio/mkiss.c	2005-07-06 
22:09:27.000000000 +0100
+++ linux-cvs/drivers/net/hamradio/mkiss.c	2005-07-06 22:48:52.000000000 
+0100
