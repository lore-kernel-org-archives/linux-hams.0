From: f6bvp <f6bvp@free.fr>
Subject: Re: [PATCH 0/7] ROSE: Misc fixes
Date: Sat, 30 Jul 2011 00:32:58 +0200
Message-ID: <4E33351A.2040907@free.fr>
References: <cover.1311152437.git.ralf@linux-mips.org> <4E270D35.9070306@free.fr> <20110720175950.GA13753@linux-mips.org> <4E293E96.3030708@free.fr> <20110722105641.GA24477@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20110722105641.GA24477@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Le 22/07/2011 12:56, Ralf Baechle DL5RB a =E9crit :
> Most excellent! Take your time for testing - unfortunately we missed
> the v3.0 train already but it would be great if we could backport the=
se
> fixes to -stable after some more positive testing.
>
> Is the system that was having these issues btw. running a preemptable=
 kernel
> or does it have multiple cores or hyperthreading?
>
> Thanks,
>
>    Ralf
My two ROSE-FPAC nodes have been running for 8 days and 12 hours withou=
t
disruption.

Tonight I noticed that "use" parameter was negative (-1) while remote n=
ode
station F8COJ-11 was not connected (restart =3D "no" and tf counting).

Later, F8COJ-11 node got connected again (restart =3D "yes") and "use" =
=3D 1.
Then "use"  returned to 0 after a few minutes.

This system is the one with SMP kernel and Voluntary Kernel Preemption=20
(Desktop).

/proc/net/rose_neigh

addr  callsign  dev  count use mode restart  t0  tf digipeaters

00005 F6BVP-5   ax2      1   0  DTE      no   0  99

00004 F8COJ-11  ax2      2  -1  DTE      no   0  87

00003 F6BVP-11  ax1     11   0  DTE      no   0   0

00002 K4GBB-12  ax2      9   0  DCE     yes   0   0

00001 RSLOOP-0  ???      1   2  DCE     yes   0   0

/proc/net/rose_neigh

addr  callsign  dev  count use mode restart  t0  tf digipeaters

00005 F6BVP-5   ax2      1   0  DTE      no   0   0

00004 F8COJ-11  ax2      2   1  DCE     yes   0   0

00003 F6BVP-11  ax1     11   0  DTE      no   0   0

00002 K4GBB-12  ax2      9   0  DCE     yes   0   0

00001 RSLOOP-0  ???      1   2  DCE     yes   0   0



/proc/net/rose_neigh

addr  callsign  dev  count use mode restart  t0  tf digipeaters

00005 F6BVP-5   ax2      1   0  DTE      no   0   0

00004 F8COJ-11  ax2      2   0  DCE     yes   0   0

00003 F6BVP-11  ax1     11   0  DTE      no   0   0

00002 K4GBB-12  ax2      9   0  DCE     yes   0   0

00001 RSLOOP-0  ???      1   2  DCE     yes   0   0


At the same times, on my second Linux system (with maxcpus=3D1 boot ker=
nel=20
parameter),
use was 0 when not connected and it keeps displaying use=3D1 since ROSE=
=20
neighbour F8COJ has been connected again.

However, both nodes are performing well and are able to route ROSE=20
frames to F8COJ-11.

Bernard


--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
