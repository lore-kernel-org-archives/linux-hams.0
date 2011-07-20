From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [PATCH 0/7] ROSE: Misc fixes
Date: Wed, 20 Jul 2011 18:59:50 +0100
Message-ID: <20110720175950.GA13753@linux-mips.org>
References: <cover.1311152437.git.ralf@linux-mips.org>
 <4E270D35.9070306@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E270D35.9070306@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Bernard, f6bvp" <f6bvp@free.fr>
Cc: linux-hams@vger.kernel.org

On Wed, Jul 20, 2011 at 07:15:33PM +0200, Bernard, f6bvp wrote:

> All seven patch applied.
> However there are compile errors in rose_route.c
>=20
> f6bvp-8 linux]# make modules
> CHK include/linux/version.h
> CHK include/generated/utsrelease.h
> CALL scripts/checksyscalls.sh
> CC [M] net/rose/af_rose.o
> CC [M] net/rose/rose_dev.o
> CC [M] net/rose/rose_in.o
> CC [M] net/rose/rose_link.o
> CC [M] net/rose/rose_loopback.o
> CC [M] net/rose/rose_out.o
> CC [M] net/rose/rose_route.o
> net/rose/rose_route.c: In function =E2=80=98rose_add_node=E2=80=99:
> net/rose/rose_route.c:104: erreur: incompatible type for argument 2
> of =E2=80=98atomic_add_return=E2=80=99
> /usr/src/linux-2.6.39/arch/x86/include/asm/atomic.h:173: note:
> expected =E2=80=98struct atomic_t *=E2=80=99 but argument is of type =
=E2=80=98atomic_t=E2=80=99
> net/rose/rose_route.c: In function =E2=80=98rose_add_loopback_neigh=E2=
=80=99:
> net/rose/rose_route.c:391: erreur: incompatible type for argument 2
> of =E2=80=98atomic_add_return=E2=80=99
> /usr/src/linux-2.6.39/arch/x86/include/asm/atomic.h:173: note:
> expected =E2=80=98struct atomic_t *=E2=80=99 but argument is of type =
=E2=80=98atomic_t=E2=80=99
> make[2]: *** [net/rose/rose_route.o] Erreur 1
> make[1]: *** [net/rose] Erreur 2
> make: *** [net] Erreur 2

Odd, the timestamps of my build tree must have been scrambled.  I
get the same error messages but only after a full make clean and the
error is quite obvious.

I'm going to send a replacement match for the defective patch in
a minute.

  Ralf
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
