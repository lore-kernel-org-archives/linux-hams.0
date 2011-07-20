From: "Bernard, f6bvp" <f6bvp@free.fr>
Subject: Re: [PATCH 0/7] ROSE: Misc fixes
Date: Wed, 20 Jul 2011 19:15:33 +0200
Message-ID: <4E270D35.9070306@free.fr>
References: <cover.1311152437.git.ralf@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <cover.1311152437.git.ralf@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Hello Ralf,

All seven patch applied.
However there are compile errors in rose_route.c

f6bvp-8 linux]# make modules
CHK include/linux/version.h
CHK include/generated/utsrelease.h
CALL scripts/checksyscalls.sh
CC [M] net/rose/af_rose.o
CC [M] net/rose/rose_dev.o
CC [M] net/rose/rose_in.o
CC [M] net/rose/rose_link.o
CC [M] net/rose/rose_loopback.o
CC [M] net/rose/rose_out.o
CC [M] net/rose/rose_route.o
net/rose/rose_route.c: In function =91rose_add_node=92:
net/rose/rose_route.c:104: erreur: incompatible type for argument 2 of=20
=91atomic_add_return=92
/usr/src/linux-2.6.39/arch/x86/include/asm/atomic.h:173: note: expected=
=20
=91struct atomic_t *=92 but argument is of type =91atomic_t=92
net/rose/rose_route.c: In function =91rose_add_loopback_neigh=92:
net/rose/rose_route.c:391: erreur: incompatible type for argument 2 of=20
=91atomic_add_return=92
/usr/src/linux-2.6.39/arch/x86/include/asm/atomic.h:173: note: expected=
=20
=91struct atomic_t *=92 but argument is of type =91atomic_t=92
make[2]: *** [net/rose/rose_route.o] Erreur 1
make[1]: *** [net/rose] Erreur 2
make: *** [net] Erreur 2

73 de Bernard, f6bvp



Le 20/07/2011 11:00, Ralf Baechle a =E9crit :
> DaveM's recent email regarding a crash triggered by the attempt to se=
nd
> IP over rose prompted me to review the ROSE code again.  I found four
> race conditions and from what Bernard writes in a recent email about
> wrong rose_neighbour->use counters one of these fixes may actually be=
 a
> practical problem.
>
>   - Patch [1/7] fixes a race that is unlikely to hit in a typical sys=
tem and
>     even if so the result would be a very small number of packets att=
empted
>     to be sent to the wrong destination.
>   - Patch [2/7] is a cleanup preparing for [3/7]
>   - Patch [3/7] fixes the kernel side of the rose_callsign access rac=
e by
>     protecting it with a spinlock.
>   - Patch [4/7] makes struct rose_neigh member use an atomic_t.  This=
 was
>     noticed by code review but hopefully fixes the mismatching use co=
unter
>     recently reported by Bernard Pidoux.
>   - Patch [5/7] converts rose_neigh_no into an atomic_t.  Previously =
there
>     was a race condition which may have resulted in multiple rose_rou=
te
>     structures using the same rose_neigh_no value and rose_neigh_no b=
eing
>     incremented by fewer than the number of racing accesses.
>   - Patch [6/7] and [7/7] fix some coding style issues.
>
> Test reports would be apreciated.
>
> Thanks,
>
>    Ralf
>
> Ralf Baechle (7):
>    NET: ROSE: Fix race in SIOCRSSL2CALL ioctl accessing userspace.
>    NET: ROSE: Factor our common code from functions.
>    NET: ROSE: Protect rose_callsign with a spinlock
>    NET: ROSE: Make neighbour->use atomic
>    NET: ROSE: Make rose_neigh_no atomic.
>    NET: ROSE: Move return statements hidden behind an if to their own=
 line
>    NET: ROSE: Fix formatting.
>
>   include/net/rose.h    |    7 +++++--
>   net/rose/af_rose.c    |   30 +++++++++++++++++++++---------
>   net/rose/rose_in.c    |   13 +++++++------
>   net/rose/rose_link.c  |   38 ++++++++++++++++++++++++--------------
>   net/rose/rose_route.c |   32 +++++++++++++++++---------------
>   net/rose/rose_subr.c  |    3 ++-
>   net/rose/rose_timer.c |    3 ++-
>   7 files changed, 78 insertions(+), 48 deletions(-)
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
