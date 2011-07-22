From: "Bernard, f6bvp" <f6bvp@free.fr>
Subject: Re: [PATCH 0/7] ROSE: Misc fixes
Date: Fri, 22 Jul 2011 11:10:46 +0200
Message-ID: <4E293E96.3030708@free.fr>
References: <cover.1311152437.git.ralf@linux-mips.org> <4E270D35.9070306@free.fr> <20110720175950.GA13753@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20110720175950.GA13753@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Hello Ralf,

Replacement patch applied and install went fine.
Nearly 24 hours after running the new "atomic" rose code
on two systems, I observe that 'use' parameter is 0, something I never=20
observed before. It used to be positive on some link and rarely
displaying a high number meaning underflow negative values.

> /proc/net/rose_neigh
> addr  callsign  dev  count use mode restart  t0  tf digipeaters
> 00020 F6BVP-5   ax0      1   0  DTE      no   0   0
> 00019 F6BVP-7   ax0      2   0  DTE      no   0   0
> 00018 F6BVP-9   ax2      2   0  DTE      no   0   0
> 00017 F3KT-11   ax0      3   0  DTE     yes   0   0
> 00016 F8COJ-11  ax0      2   0  DCE     yes   0   0
> 00015 F6GGY-9   ax0      3   0  DTE      no   0   0
> 00014 F4BWT-11  ax0      4   0  DTE      no   0   0
> 00013 F1MVP-5   ax0      2   0  DTE      no   0   0
> 00012 F5KBW-9   ax0      6   0  DTE      no   0   0
> 00011 IR5AG-13  ax0      2   0  DTE      no   0   0
> 00010 K4GBB-9   ax0      4   0  DCE     yes   0   0
> 00009 KD4YAL-9  ax0      2   0  DTE      no   0   0
> 00008 KP4DJT-9  ax0      3   0  DTE     yes   0   0
> 00007 P43L-4    ax0      5   0  DCE     yes   0   0
> 00006 VK2XB-2   ax0      2   0  DTE      no   0   0
> 00005 VK2TV-2   ax0      2   0  DTE      no   0   0
> 00004 VK7HDM-5  ax0      2   0  DTE      no   0   0
> 00003 YN1BBS-9  ax0      5   0  DTE      no   0   0
> 00002 TI2HAS-9  ax0      5   0  DTE      no   0   0
> 00001 RSLOOP-0  ???      1   2  DCE     yes   0   0

I guess this is a pretty good thing.

I will try removing rose module and report if any progress
on that point too.

Bernard


Le 20/07/2011 19:59, Ralf Baechle DL5RB a =C3=A9crit :
> On Wed, Jul 20, 2011 at 07:15:33PM +0200, Bernard, f6bvp wrote:
>
>> All seven patch applied.
>> However there are compile errors in rose_route.c
>>
>> f6bvp-8 linux]# make modules
>> CHK include/linux/version.h
>> CHK include/generated/utsrelease.h
>> CALL scripts/checksyscalls.sh
>> CC [M] net/rose/af_rose.o
>> CC [M] net/rose/rose_dev.o
>> CC [M] net/rose/rose_in.o
>> CC [M] net/rose/rose_link.o
>> CC [M] net/rose/rose_loopback.o
>> CC [M] net/rose/rose_out.o
>> CC [M] net/rose/rose_route.o
>> net/rose/rose_route.c: In function =E2=80=98rose_add_node=E2=80=99:
>> net/rose/rose_route.c:104: erreur: incompatible type for argument 2
>> of =E2=80=98atomic_add_return=E2=80=99
>> /usr/src/linux-2.6.39/arch/x86/include/asm/atomic.h:173: note:
>> expected =E2=80=98struct atomic_t *=E2=80=99 but argument is of type=
 =E2=80=98atomic_t=E2=80=99
>> net/rose/rose_route.c: In function =E2=80=98rose_add_loopback_neigh=E2=
=80=99:
>> net/rose/rose_route.c:391: erreur: incompatible type for argument 2
>> of =E2=80=98atomic_add_return=E2=80=99
>> /usr/src/linux-2.6.39/arch/x86/include/asm/atomic.h:173: note:
>> expected =E2=80=98struct atomic_t *=E2=80=99 but argument is of type=
 =E2=80=98atomic_t=E2=80=99
>> make[2]: *** [net/rose/rose_route.o] Erreur 1
>> make[1]: *** [net/rose] Erreur 2
>> make: *** [net] Erreur 2
>
> Odd, the timestamps of my build tree must have been scrambled.  I
> get the same error messages but only after a full make clean and the
> error is quite obvious.
>
> I'm going to send a replacement match for the defective patch in
> a minute.
>
>    Ralf
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
