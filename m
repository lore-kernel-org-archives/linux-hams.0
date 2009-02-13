From: Dave Platt <dplatt@radagast.org>
Subject: Re: Ubuntu 8.04 / 8.10
Date: Fri, 13 Feb 2009 13:39:33 -0800
Message-ID: <4995E895.10701@radagast.org>
References: <4995564A.3050308@xnet.co.nz> <4995DEA5.7000203@exemail.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4995DEA5.7000203@exemail.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Ray Wells wrote:
> Peter,
> 
> This problem arose with fbb around kernel 2.6.20 (can't remember just 
> which one now)
> 
> The fix I apply is to compile fbb with  -fno-stack-protection added to 
> its Makefile. I don't have a fix if you install fbb from a deb package.
> 
> It seems that stack protection was included in kernels as a security 
> plug for stack overflow.
> 
> I sent quite a bit about this to the xfbb list around 18 months ago.

The real question (to me at least) is whether the stack-smash abort
is a false alarm, or whether it indicates a real problem in the
FBB software.

If there really is a way in which the FBB software is managing to
smash its own stack (via e.g. a buffer that's too small, indexing
out of bounds, etc.), then simply disabling the stack protection
feature via recompilation is a bit like replacing a blown fuse
with a larger one.  You may get away with it, or it may burn your
house down :-(

It'd probably be necessary to compile xfbb with -g and run it
under GDB or a similar debugger, and investigate the state of the
stack at the time of the abort, to figure out what's being
over-written.
