From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [PATCH 0/7] ROSE: Misc fixes
Date: Sat, 23 Jul 2011 14:28:49 +0100
Message-ID: <20110723132848.GA31765@linux-mips.org>
References: <cover.1311152437.git.ralf@linux-mips.org>
 <4E270D35.9070306@free.fr>
 <20110720175950.GA13753@linux-mips.org>
 <4E293E96.3030708@free.fr>
 <20110722105641.GA24477@linux-mips.org>
 <4E29A182.4020102@free.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E29A182.4020102@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: f6bvp <f6bvp@free.fr>
Cc: linux-hams@vger.kernel.org

On Fri, Jul 22, 2011 at 06:12:50PM +0200, f6bvp wrote:

> On one Linux box system I have a dual core CPU and kernel was
> compiled with Symmetric multi-processing support.
> [*] Symmetric multi-processing support
> However I am booting kernel with maxcpus=1 in order to keep this
> test system as "simple" as possible.

SMP has become the norm - I think in the x86 world something like an
Atom netbook is one of the few remaining options to buy a single core
system.

> As I am not sure if that may influence hyperthreading or not I
> attach here info.log file displaying my last boot log.
> I did not enabled Hyperthreading
> [ ] SMT (Hyperthreading) scheduler support and

This is only an optimization to make the scheduler more effective on
systems that have hyperthreaded hardware.  Aside enabling or not enabling
this option should not have any impact on system behaviour.

> (X) No Forced Preemption (Server)
> This one shows the new 0 value for use parameter except for RSLOOP-0
> as shown previously.
> 
> 
> On my other Linux box there is an Intel Core 2 CPU and kernel was
> also compiled with SMP support, no SMT hyperthreading,
> Multi-core scheduler support enabled and Voluntary Kernel Preemption
> (Desktop) enabled.
> This one has no special boot instructions, and thus runs with two
> CPUs enabled
> and /proc/net/rose_neigh table also shows use parameter = 0 except
> for RSLOOP-0.

The reason I'm asking is that hyperthreading and multi-core fall into the
SMP cathegorie for the OS, that is the present the same sort of challenges
to the networking stack.  Of course all the issues are only going to strike
if multiple processors are active.  In other words, it's SMP if
/proc/cpuinfo shows the presence of multiple processors.

And preemptable kernels pose like 95% of the same issues as SMP does.

  Ralf
