From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: ax25/baycom/kernel(?) problem.
Date: Tue, 25 Mar 2003 14:12:54 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030325141254.A3089@pull.privacy.nb.ca>
References: <1F55F6582266314A85A55F6241509B670395F455@Esealnt863.al.sw.ericsson.se>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1F55F6582266314A85A55F6241509B670395F455@Esealnt863.al.sw.ericsson.se>; from Gunnar.Widell@ese.ericsson.se on Tue, Mar 25, 2003 at 08:34:59AM +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Gunnar Widell (ESE)" <Gunnar.Widell@ese.ericsson.se>
Cc: linux-hams@vger.kernel.org

On Tue, Mar 25, 2003 at 08:34:59AM +0100, Gunnar Widell (ESE) wrote:
> > Something like this-
> > <0>Kernel panic: Aiee, killing interupt handler!
> > In interrupt handler - not syncing
> 
> Yes, this is what I get.
> At the last stop last nigth it happened when I did:
> 
> ifconfig bcsf0 down
> 
> So, why are some 2.4.19 or 2.4.20 kernels working fine?
> Maybe I have too much junk compiled into it...

Unfortunately only your computer knows, and unless you can help
us by giving us more details, all we can do is guess.

Excerpt from the linux kernel mailing list FAQ
<http://www.tux.org/lkml/#s4-3> read
"# How do I post an Oops?"
"I think I found a bug, how do I report it?"
and "What information should go in a bug report?"
and in your linux kernel source:
Documentation/oops-tracing.txt
REPORTING-BUGS

You should also test your system, by running that linux kernel
withOUT AX.25 loaded for a period of time under normal use
conditions, so that you are confident that the problem is AX.25 related
and not a) bad hardware, b) other kernel/userland software problems.

I hope this helps
ve1mct
