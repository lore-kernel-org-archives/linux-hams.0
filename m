From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: AX25 patches and how it affects the end user
Date: Tue, 17 Jan 2006 17:59:33 +0100
Message-ID: <43CD2275.8050602@ccr.jussieu.fr>
References: <9923fd660601110945p4c4ce12aw3311ae7e55111df1@mail.gmail.com> <000d01c616fc$5624f4b0$3849a8c0@lan.w1nr.net> <20060113210925.GB3516@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060113210925.GB3516@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: "Mike McCarthy, W1NR" <lists@w1nr.net>, 'Douglas Cole' <doug.n7bfs@gmail.com>, linux-hams@vger.kernel.org

Hi,

After applying mkiss patch to kernel 2.6.15.1 I compiled it for a 3 GHz 
Xeon P4 configuring it for SMP and multithread plus lock options.

The SMP kernel seems very sensitive to AX25 configuration errors and it 
locks up quite soon in that case when loading applications.

However when ax25 is carefully initialized, mkiss, kissattach, ax25ipd 
and ROSE/FPAC switch software suite) are running without problem.

But there is still a spinlock lockup when shutting down the system.

Here is a copy of the sequence I made by hand (subject to errors) :

Spinlock lockup on CPU#0, kissattach / 5048, f8d68714
EIP <c01e3ba5>
rose_remove_neigh + 0x30/0xb0 [rose]
rose_rt_device_down + 0xeb / 0x120 [rose]
rose_device_event + 0x42/0x50 [rose]
notifier_call_chain + 0x2/0x50 [rose]
dev_close + 0x7b/0xb0
unregister_netdevice + 0x19e/0x250
unregister_netdev+0x16/0x1d
mkiss_close + 0x4a /0xa0 [mkiss]
release_dev....
tty_release ...

Hope this can help.
Please suggest any more test to be done.

-----------------

Ralf Baechle DL5RB wrote :
> On Wed, Jan 11, 2006 at 05:14:05PM -0500, Mike McCarthy, W1NR wrote:
> 
> 
>>Hi Douglas,
>>   Your best bet is to run the latest "stable" release.  Unstable's are for
>>those with time and expertise to "hack".
>>   It all depends on when Debian updates it's kernel.  The patches have gone
>>into the latest "git" on Kernel.org.  When Debian fetches the kernel from
>>there is anyone's guess.  In about another week, SuSE will release 10.1
>>Beta1.  I don't even know if it will get into that.  You can always install
>>Debian and get the kernel source from kernel.org and build it.  I would at
>>least wait until 2.6.15.1 (in kernel.org's numbering) instead of trying to
>>patch things.
>>   If Debian is running the 2.6.14 kernel, then you are probably OK.  The
>>changes that broke it are not in that version.  These "patches" that you see
>>are due to recent changes for multiprocessor hardware, but other things got
>>broken at the same time.
> 
> 
> Not quite.  The locking bugs in mkiss were introduced when adding SMACK
> support.  When a little later the locking code - really only relevant to
> multiprocessor or preemptable kernels - was changed, the bugs started to
> show up on uniprocessor kernels as well.
> 
> Shit happens - but better let's fix it.
> 
>   Ralf

-- 

73 de Bernard, f6bvp

http://f6bvp.free.fr
http://f6bvp.org (mirror)
http://rose.fpac.free.fr/
