From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: Timers in 2.6.x kernels
Date: Sat, 13 Mar 2004 15:19:14 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040313141914.GB26738@linux-mips.org>
References: <200403121310.02980.oh1mrr@nic.fi>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200403121310.02980.oh1mrr@nic.fi>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jarmo <oh1mrr@nic.fi>
Cc: linux-hams@vger.kernel.org

On Fri, Mar 12, 2004 at 01:10:02PM +0200, Jarmo wrote:

> Have found that timerparameters have loud a much differences
> between kernels 2.2-->2.4-->2.6.Now looked up,that there is
> big change happened in kernels param.h file.

The change was long overdue but we didn't have the necessary infrastructure
in the kernel.org tree to increase HZ without affecting binary compatibility
with applications.

All properly written kernel code should now be used USER_HZ for any kind of
kernel interfaces that are user or application visible.  Unfortunately quite
a bit of the ham code in the kernel still hasn't done that transitition
so now we've got a wild mix of time units.

I guess for consistence we should bit the bullet and standardize on one
unit, seconds or miliseconds as appropriate.  HZ or USER_HZ require the
user to know what kind of system or even what kernel version he's running.

> A little bit more success to keep system up longer,but it crash still...

You're just putting less pressure on the buggy part of the system.  Doesn't
mean your change is improving correctness, unfortunately.

> And what we get into syslog
> 
>  Mar  5 16:46:58 oh1rbf kernel: 6pack: bad checksum f7                           
> Mar  5 16:46:58 oh1rbf last message repeated 4 times                            
> Mar  5 16:46:58 oh1rbf kernel: bad: scheduling while atomic!                    
> Mar  5 16:46:58 oh1rbf kernel: Call Trace:                                      
> Mar  5 16:46:58 oh1rbf kernel:  [schedule+1339/1408] schedule+0x53b/0x580       
> Mar  5 16:46:58 oh1rbf kernel:  [<c011869b>] schedule+0x53b/0x580               
> Mar  5 16:46:58 oh1rbf kernel:  [_stext+0/32] rest_init+0x0/0x20                
> Mar  5 16:46:58 oh1rbf kernel:  [<c0105000>] rest_init+0x0/0x20                 
> Mar  5 16:46:58 oh1rbf kernel:  [apm_do_busy+22/48] apm_do_busy+0x16/0x30       
> Mar  5 16:46:58 oh1rbf kernel:  [<c01148b6>] apm_do_busy+0x16/0x30

Do you happen to be running a CONFIG_SMP / CONFIG_PREEMPT kernel?  The
locking stuff in the 6pack driver looks pretty broken and I wouldn't
expect it to survive for long with any of these two kernel options
enabled.

APM implementations tend to tamper with interrupts so disabling APM while
running data over the serial port may help.

  Ralf
