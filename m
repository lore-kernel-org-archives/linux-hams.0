From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: Timers in 2.6.x kernels
Date: Sat, 13 Mar 2004 23:06:22 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040313220622.GA18544@linux-mips.org>
References: <200403121310.02980.oh1mrr@nic.fi> <20040313141914.GB26738@linux-mips.org> <200403131659.49496.oh1mrr@nic.fi>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200403131659.49496.oh1mrr@nic.fi>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jarmo <oh1mrr@nic.fi>
Cc: linux-hams@vger.kernel.org

On Sat, Mar 13, 2004 at 04:59:49PM +0200, Jarmo wrote:

> In 6pack driver here in linux,there's still 0.3.0 version,and if I remember
> the end of 90' ,there was something 0.4.2 version for dos/windows.
> It never came into kernel tree...

MS drivers and Linux drivers are technically very different.  So quite
likely the version numbers are refering to different drivers.  And anyway,
the Linux driver has been changed fairly often, just not the version
number of the driver.  So in short, the content of information in the
version number is probably approximating that of cosmic noise ;-)

> > APM implementations tend to tamper with interrupts so disabling APM while
> > running data over the serial port may help.
> 
> This morning I compiled kernel without APM and it has been running
> from since.
> Hope,that get it running more stable..9 hours max uptime was quite
> annoying.
> 
> Ofcourse possibilities to start use mkiss......Hope someone should
> find intress to look code and make improvements..My knowledge
> is below zero...;-)
> 
> Still have to remember,that this is a hobby..isn't it?

Maybe - but software that works less than reliable sucks.

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
