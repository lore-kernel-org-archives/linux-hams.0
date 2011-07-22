From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [PATCH 0/7] ROSE: Misc fixes
Date: Fri, 22 Jul 2011 11:56:41 +0100
Message-ID: <20110722105641.GA24477@linux-mips.org>
References: <cover.1311152437.git.ralf@linux-mips.org>
 <4E270D35.9070306@free.fr>
 <20110720175950.GA13753@linux-mips.org>
 <4E293E96.3030708@free.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E293E96.3030708@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Bernard, f6bvp" <f6bvp@free.fr>
Cc: linux-hams@vger.kernel.org

On Fri, Jul 22, 2011 at 11:10:46AM +0200, Bernard, f6bvp wrote:

> Replacement patch applied and install went fine.
> Nearly 24 hours after running the new "atomic" rose code
> on two systems, I observe that 'use' parameter is 0, something I
> never observed before. It used to be positive on some link and
> rarely
> displaying a high number meaning underflow negative values.
> 
> >/proc/net/rose_neigh
> >addr  callsign  dev  count use mode restart  t0  tf digipeaters
> >00020 F6BVP-5   ax0      1   0  DTE      no   0   0
> >00019 F6BVP-7   ax0      2   0  DTE      no   0   0
> >00018 F6BVP-9   ax2      2   0  DTE      no   0   0
> >00017 F3KT-11   ax0      3   0  DTE     yes   0   0
> >00016 F8COJ-11  ax0      2   0  DCE     yes   0   0
> >00015 F6GGY-9   ax0      3   0  DTE      no   0   0
> >00014 F4BWT-11  ax0      4   0  DTE      no   0   0
> >00013 F1MVP-5   ax0      2   0  DTE      no   0   0
> >00012 F5KBW-9   ax0      6   0  DTE      no   0   0
> >00011 IR5AG-13  ax0      2   0  DTE      no   0   0
> >00010 K4GBB-9   ax0      4   0  DCE     yes   0   0
> >00009 KD4YAL-9  ax0      2   0  DTE      no   0   0
> >00008 KP4DJT-9  ax0      3   0  DTE     yes   0   0
> >00007 P43L-4    ax0      5   0  DCE     yes   0   0
> >00006 VK2XB-2   ax0      2   0  DTE      no   0   0
> >00005 VK2TV-2   ax0      2   0  DTE      no   0   0
> >00004 VK7HDM-5  ax0      2   0  DTE      no   0   0
> >00003 YN1BBS-9  ax0      5   0  DTE      no   0   0
> >00002 TI2HAS-9  ax0      5   0  DTE      no   0   0
> >00001 RSLOOP-0  ???      1   2  DCE     yes   0   0
> 
> I guess this is a pretty good thing.
> 
> I will try removing rose module and report if any progress
> on that point too.

Most excellent!  Take  your time for testing - unfortunately we missed
the v3.0 train already but it would be great if we could backport these
fixes to -stable after some more positive testing.

Is the system that was having these issues btw. running a preemptable kernel
or does it have multiple cores or hyperthreading?

Thanks,

  Ralf
