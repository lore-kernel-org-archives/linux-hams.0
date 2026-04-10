Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352A817A586
	for <linux-hams@vger.kernel.org>; Fri, 10 Apr 2026 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828409; cv=pass; b=YWgVwcQX7J/8jjCXOo1eYumnVaSi31BWExs1PhiVbUnpmWWNqOYBf/Fs2PqPuLN/MCXJvL09z1PxRxfW8zrZn6ACUOryT0oON6UOAhCb5bZuhlLthdJIfN4Ktv9F4sGY3OHWzOkoB94/YetDjMN6iNhjc3nV7EJHLP1H+qSOwmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828409; c=relaxed/simple;
	bh=LSR04DrYd2CNPoGkLuzcgQfT1tMVn5ZfdEM6iihG19s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eIMaxW8jLtbWR3hVjZbpmw3t3q6EFnzQIl75U4063oGC2Npyu5WWRqgkCa323/nH46BXYPOEvL+bXgpl860GxmzFEUxSxrV9wR6/kKcLzKIUmmblcnlWo2uMVSk/+loI0hm0EnG/jOb1IJ7VEb2FYBAjUwropQOqmGGR+aqNEzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WXkk7MjG; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WXkk7MjG"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-128e4d0cc48so9423214c88.1
        for <linux-hams@vger.kernel.org>; Fri, 10 Apr 2026 06:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775828407; cv=none;
        d=google.com; s=arc-20240605;
        b=cx49zugTfENvAc51/T14WOlzPxdQmO5ZU3ec5TQTIBhxZZr5GiBNjqkYhFWP5GFa/A
         htLyc9ebBuqD/QfHxNzhv/sQd6TUMy+iDhAWEjWpD4WXE687mBXepmLW90pW4lwVbRZT
         +q1tit2ZjARPHnh4CMW5xqno+FMeyYvARCuFAnclqr7gcLutIiSGUeGkP5EsrzWoRIKl
         d/wsOIO+/Rr+hRVgRNL27vxjAm6UjNwro9B4mCOYd2es0YZG6/MdVPKTULZkao1P+Xi6
         20Pj2I9AHtkzLbPklbHFcmmXDLMgnwdeMdfDdcMcPHzHMyqjRFllBU2DjTdvDwqbnFFr
         kcpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=;
        fh=pODiQz30pHzTgSWHdIucWnfbEd9IR7b7Av5lnvWhrZ0=;
        b=JDzBtlFm/0Grblo37POQp0omr65ZbeA+d/HPHHIOJl4oU7QD0qHjX2Ph4Y/PU9J1HL
         /vQu/zeOIBaA70YqaDd7dSM5a9/GCGKYHE3kkw/2O6uYbHPGsR/kIo2OhSrNossYEUvv
         k5f+QVLSwkt6zAS4pbkvZRRmqn8A5vIypd28iqo3iQYqbzgh1BnoUQvOw2hJfXb3+sZ2
         dDAI1Vm8lBeW6ZMvkdPeHs4HfjCSbivhUBTsTOZ0mJNbw6ll6758McycgkqnmGAKowWA
         0DP0MPXm34E12fPtFXCZGcbEPBSX61sjolcDkIQT/gpXdqcSi8Usyg02vgqohdbkQluM
         FS/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775828407; x=1776433207; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=;
        b=WXkk7MjGsWCUHEg1iU7liVQxxmn76Z2Blc65Af4B1zix0M2rF8QfzApVNMifY6ss0I
         o28bXJ2WoZKKs4P+RMYVL7Cyz5rTozkqN1LFEZKxQrY0UWy/+P4MTVZ7JlV/GmTfYw7g
         BHdpmSI3dFIhezek0dIMEojwsl7VI9CpBDtWrVKxWRCyxE8FKu9tCx05MK1Z19mpDbLY
         UAmVUcxpvcLdZE3bWKkeviuFv+z6weHemrn+Q1dbNj19BdhmlV3lYWFxMcZ5yjPYSXjG
         1ICMvCFl+bVV4g0F5SiLzhG+oRaoJBenKb2hyA5tkvyV436rK7zq2Le6HAfSbviCkDzM
         W8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775828407; x=1776433207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=;
        b=dQ8rAJIx94FKnQw1nbjwswjkR8FtFW94VYnacKUlLfQMrxJOtwul6Z3f03yH5dz+6b
         3ImbpfBZto1D1EYFzjgcjsp4MZwx2n7ewfdaVIR0y3DKGtLBaoV0UO+7IEB8j+BVMGjo
         oZfZtX8cMN6m9nSlcL7o4g/kfWXMQBJF9EP0/VTzlmv8BqsnUCs/Fm+20DtSFzCPz45e
         1dyBaEueekhr2yoR4XQNohAOHd3IVyxH0Wx3QC1ov967tuQehku+62D82l0Vhss4fgvA
         QFBAyUflgxHfM/bWAq7VdfNtY6QJpKir5QGrdXL9RoSsSa30OH0nrqOzV9+RxA5ztId+
         y0Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXufEsiWR+Dvh45UzeO2F6vX1ojdmevT6vtisbJf0vShNuKemsAxzcUOBV99RhfWgvuK0MNbH1wO5Fm@vger.kernel.org
X-Gm-Message-State: AOJu0YyCZGCMxCGLA3ToqZ8WXsSx2aot7up4aEH7t8PTuE+oWB5re9yR
	H2YJlI3rEl04HxZCTWN7F/bWpIPp5NXA5Z/cF4qKzUn/l3fQuIZ2csZRqHVMYD8eFH95ezr5Uqg
	3bi1Azhe+PKqoXhcTpF0Ght+AKWMN3g8+A5faqbQb
X-Gm-Gg: AeBDietiLQV/+Rqjiw3Dtg97t6617xauU3mr6t2ffSctbQG5SEMcYf9tYhXrwyf7K8g
	MszlABNnoY+u+VqqfkFl0eJoWXmQT5LKUGg9IMW96pXUg7wXj6uj2+y45DCxEzLMn8qJtLkljYj
	o6VtNswJF4voBbvjnJiVaAl5sOy0m1AiJo7PF3IboIC99bTSvQV2WCySHIiuJ78Jw1D/8dYBA0W
	QiXcDGiJOi5so7aI61bLsp+E+mCJ2MQPBcquJ5aZ0NhCf7oNI4Bh3q4BaSCynCJbz3caf9hYOE+
	ftvyaKtY2rzOiSegzp3/HgJk+pKOcLBP43CrHtZKAwB3uSup
X-Received: by 2002:a05:7022:fa04:b0:12c:2ed4:62fa with SMTP id
 a92af1059eb24-12c34ef907emr1882312c88.32.1775828406651; Fri, 10 Apr 2026
 06:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.862164111@kernel.org>
In-Reply-To: <20260410120318.862164111@kernel.org>
From: Marco Elver <elver@google.com>
Date: Fri, 10 Apr 2026 15:39:30 +0200
X-Gm-Features: AQROBzBE-9UxDQG5mMJLgipEeL_Y5pwE-Y_PUrJGxDBLilqBu51b8lLzxdip708
Message-ID: <CANpmjNO1vsO1LT6xijhz3nsjQa+_A=9omfgOSz=aGn293-LqTg@mail.gmail.com>
Subject: Re: [patch 19/38] kcsan: Replace get_cycles() usage
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	kasan-dev@googlegroups.com, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
>
> KCSAN uses get_cycles() for two purposes:
>
>   1) Seeding the random state with get_cycles() is a historical leftover.
>
>   2) The microbenchmark uses get_cycles(), which provides an unit less
>      counter value and is not guaranteed to be functional on all
>      systems/platforms.
>
> Use random_get_entropy() for seeding the random state and ktime_get() which
> is universaly functional and provides at least a comprehensible unit.
>
> This is part of a larger effort to remove get_cycles() usage from
> non-architecture code.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: kasan-dev@googlegroups.com

Reviewed-by: Marco Elver <elver@google.com>

> ---
>  kernel/kcsan/core.c    |    2 +-
>  kernel/kcsan/debugfs.c |    8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> --- a/kernel/kcsan/core.c
> +++ b/kernel/kcsan/core.c
> @@ -798,7 +798,7 @@ void __init kcsan_init(void)
>         BUG_ON(!in_task());
>
>         for_each_possible_cpu(cpu)
> -               per_cpu(kcsan_rand_state, cpu) = (u32)get_cycles();
> +               per_cpu(kcsan_rand_state, cpu) = (u32)random_get_entropy();
>
>         /*
>          * We are in the init task, and no other tasks should be running;
> --- a/kernel/kcsan/debugfs.c
> +++ b/kernel/kcsan/debugfs.c
> @@ -58,7 +58,7 @@ static noinline void microbenchmark(unsi
>  {
>         const struct kcsan_ctx ctx_save = current->kcsan_ctx;
>         const bool was_enabled = READ_ONCE(kcsan_enabled);
> -       u64 cycles;
> +       ktime_t nsecs;
>
>         /* We may have been called from an atomic region; reset context. */
>         memset(&current->kcsan_ctx, 0, sizeof(current->kcsan_ctx));
> @@ -70,16 +70,16 @@ static noinline void microbenchmark(unsi
>
>         pr_info("%s begin | iters: %lu\n", __func__, iters);
>
> -       cycles = get_cycles();
> +       nsecs = ktime_get();
>         while (iters--) {
>                 unsigned long addr = iters & ((PAGE_SIZE << 8) - 1);
>                 int type = !(iters & 0x7f) ? KCSAN_ACCESS_ATOMIC :
>                                 (!(iters & 0xf) ? KCSAN_ACCESS_WRITE : 0);
>                 __kcsan_check_access((void *)addr, sizeof(long), type);
>         }
> -       cycles = get_cycles() - cycles;
> +       nsecs = ktime_get() - nsecs;
>
> -       pr_info("%s end   | cycles: %llu\n", __func__, cycles);
> +       pr_info("%s end   | nsecs: %llu\n", __func__, nsecs);
>
>         WRITE_ONCE(kcsan_enabled, was_enabled);
>         /* restore context */
>
