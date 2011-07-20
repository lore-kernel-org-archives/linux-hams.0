From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH 0/7] ROSE: Misc fixes
Date: Wed, 20 Jul 2011 10:00:37 +0100
Message-ID: <cover.1311152437.git.ralf@linux-mips.org>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: Bernard F6BVP <f6bvp@free.fr>

DaveM's recent email regarding a crash triggered by the attempt to send
IP over rose prompted me to review the ROSE code again.  I found four
race conditions and from what Bernard writes in a recent email about
wrong rose_neighbour->use counters one of these fixes may actually be a
practical problem.

 - Patch [1/7] fixes a race that is unlikely to hit in a typical system and
   even if so the result would be a very small number of packets attempted
   to be sent to the wrong destination.
 - Patch [2/7] is a cleanup preparing for [3/7]
 - Patch [3/7] fixes the kernel side of the rose_callsign access race by
   protecting it with a spinlock.
 - Patch [4/7] makes struct rose_neigh member use an atomic_t.  This was
   noticed by code review but hopefully fixes the mismatching use counter
   recently reported by Bernard Pidoux.
 - Patch [5/7] converts rose_neigh_no into an atomic_t.  Previously there
   was a race condition which may have resulted in multiple rose_route
   structures using the same rose_neigh_no value and rose_neigh_no being
   incremented by fewer than the number of racing accesses.
 - Patch [6/7] and [7/7] fix some coding style issues.

Test reports would be apreciated.

Thanks,

  Ralf

Ralf Baechle (7):
  NET: ROSE: Fix race in SIOCRSSL2CALL ioctl accessing userspace.
  NET: ROSE: Factor our common code from functions.
  NET: ROSE: Protect rose_callsign with a spinlock
  NET: ROSE: Make neighbour->use atomic
  NET: ROSE: Make rose_neigh_no atomic.
  NET: ROSE: Move return statements hidden behind an if to their own line
  NET: ROSE: Fix formatting.

 include/net/rose.h    |    7 +++++--
 net/rose/af_rose.c    |   30 +++++++++++++++++++++---------
 net/rose/rose_in.c    |   13 +++++++------
 net/rose/rose_link.c  |   38 ++++++++++++++++++++++++--------------
 net/rose/rose_route.c |   32 +++++++++++++++++---------------
 net/rose/rose_subr.c  |    3 ++-
 net/rose/rose_timer.c |    3 ++-
 7 files changed, 78 insertions(+), 48 deletions(-)

-- 
1.7.4.4

