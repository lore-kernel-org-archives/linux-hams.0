From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH 0/7] ROSE: Misc fixes
Date: Mon, 8 Aug 2011 15:06:14 +0100
Message-ID: <20110808140614.GB2120@linux-mips.org>
References: <cover.1311152437.git.ralf@linux-mips.org>
 <4E270D35.9070306@free.fr>
 <20110720175950.GA13753@linux-mips.org>
 <4E293E96.3030708@free.fr>
 <20110722105641.GA24477@linux-mips.org>
 <4E33351A.2040907@free.fr>
 <4E3FE760.1050909@free.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E3FE760.1050909@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: f6bvp <f6bvp@free.fr>
Cc: linux-hams@vger.kernel.org

On Mon, Aug 08, 2011 at 03:40:48PM +0200, f6bvp wrote:

> Hello Ralf,
> 
> Since my last post my two ROSE/FPAC nodes have been running
> flawlessly with last ROSE patches for nearly 17 days.
> Situation remains the same, i.e. from time to time use can still be
> negative.
> 
> Here is a /proc/net/rose/neigh dump from the machine running dual
> core CPU with SMP kernel :
> 
> /proc/net/rose_neigh
> addr  callsign  dev  count use mode restart  t0  tf digipeaters
> 00005 F6BVP-5   ax2      1   0  DTE      no   0   0
> 00004 F8COJ-11  ax2      2  -1  DTE      yes   0   0
> 00003 F6BVP-11  ax1     11   0  DTE      no   0   0
> 00002 K4GBB-12  ax2      9   0  DCE     yes   0   0
> 00001 RSLOOP-0  ???      1   2  DCE     yes   0   0
> 
> For the present time "use" parameter has returned to 0 for F8COJ-11
> node neighbor on the other system without
> manual change.
> Thus I guess some situations can reinitialize "use" counter.
> I will then investigate if use can also become negative on this
> second system if I do not switch to UMP
> mode at boot (removing maxcpus=1 boot option).
> 
> /proc/net/rose_neigh
> addr  callsign  dev  count use mode restart  t0  tf digipeaters
> 00020 F6BVP-5   ax0      1   0  DTE      no   0   0
> 00019 F6BVP-7   ax0      2   0  DTE      no   0   0
> 00018 F6BVP-9   ax2      2   0  DTE      no   0   0
> 00017 F3KT-11   ax0      3   0  DCE     yes   0   0
> 00016 F8COJ-11  ax0      2   0  DCE     yes   0   0
> 00015 F6GGY-9   ax0      3   0  DTE      no   0   0
> ....
> 00002 TI2HAS-9  ax0      5   0  DTE      no   0   0
> 00001 RSLOOP-0  ???      1   0  DCE     yes   0   0

This at least means there should be no regressions by my patch series and
it's getting time to send it upstream in a few days when I sorted out my
b0rked DSL line and new workstation.  With these holes plugged finding
what's actually causing the use counters to go negative should also have
gotten a little easier.

Thanks,

  Ralf
