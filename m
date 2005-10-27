From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: 2.6.14-r4 crashing
Date: Thu, 27 Oct 2005 10:51:23 +0100
Message-ID: <20051027095123.GA17645@linux-mips.org>
References: <61062.192.168.1.2.1129943887.squirrel@192.168.1.12> <20051022124642.GA3951@linux-mips.org> <60264.192.168.1.2.1130068144.squirrel@192.168.1.12> <20051024111956.GD2605@linux-mips.org> <1204.166.216.119.217.1130256561.squirrel@aa6qn.sytes.net> <DED598BC-2481-467C-8410-7AD36375989D@tssg.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DED598BC-2481-467C-8410-7AD36375989D@tssg.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Ronan <jronan@tssg.org>
Cc: aa6qn@aa6qn.sytes.net, Linux-Hams <linux-hams@vger.kernel.org>

On Tue, Oct 25, 2005 at 09:46:25PM +0100, John Ronan wrote:

> I had unending difficulties when trying netrom and kernel 2.6... in  
> the end I gave up and am running 2.4 now for stability.
> 
> Linux version 2.4.29 (root@ei3rcw) (gcc version 3.3.5 (Debian  
> 1:3.3.5-8)) #5 Fri Apr 15 13:37:45 IST 2005
> 
> to be exact.

AX.25 in 2.4 isn't stable without extra patches either.  There's a
patchset known as 9a4gl floating around which most users are quite happy
with - without 2.4 for serious use such as a mailbox or digipeater is
a no go.

At this late stage in the software lifecycle of 2.4 I won't try to
polish these patches into a shape that would make them acceptable for
kernel.org anymore - but if anybody else is interested I'd certainly give
my maintainer's approval.

Oh, and I've declared NET/ROM my next victim for a code overhaul now
that pure AX.25 in 2.6 seems stable enough for month of uptime and all
the important driver work except support for the PR-430 in the 6pack
driver has been submitted and accepted upstream.

73,

  Ralf
