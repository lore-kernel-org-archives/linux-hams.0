From: Jarmo <oh1mrr@nic.fi>
Subject: Re: Timers in 2.6.x kernels
Date: Sat, 13 Mar 2004 16:59:49 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200403131659.49496.oh1mrr@nic.fi>
References: <200403121310.02980.oh1mrr@nic.fi> <20040313141914.GB26738@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040313141914.GB26738@linux-mips.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

On Saturday 13 March 2004 16:19, you wrote:

> All properly written kernel code should now be used USER_HZ for any kind of
> kernel interfaces that are user or application visible.  Unfortunately
> quite a bit of the ham code in the kernel still hasn't done that
> transitition so now we've got a wild mix of time units.
>
> I guess for consistence we should bit the bullet and standardize on one
> unit, seconds or miliseconds as appropriate.  HZ or USER_HZ require the
> user to know what kind of system or even what kernel version he's running.

In 6pack driver here in linux,there's still 0.3.0 version,and if I remember
the end of 90' ,there was something 0.4.2 version for dos/windows.
It never came into kernel tree...

> Do you happen to be running a CONFIG_SMP / CONFIG_PREEMPT kernel?  The
> locking stuff in the 6pack driver looks pretty broken and I wouldn't
> expect it to survive for long with any of these two kernel options
> enabled.

No

> APM implementations tend to tamper with interrupts so disabling APM while
> running data over the serial port may help.

This morning I compiled kernel without APM and it has been running
from since.
Hope,that get it running more stable..9 hours max uptime was quite
annoying.

Ofcourse possibilities to start use mkiss......Hope someone should
find intress to look code and make improvements..My knowledge
is below zero...;-)

Still have to remember,that this is a hobby..isn't it?

Jarmo
