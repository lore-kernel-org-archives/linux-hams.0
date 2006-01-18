From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: AX25 patches and how it affects the end user
Date: Wed, 18 Jan 2006 01:08:43 +0000
Message-ID: <20060118010843.GA3312@linux-mips.org>
References: <9923fd660601110945p4c4ce12aw3311ae7e55111df1@mail.gmail.com> <000d01c616fc$5624f4b0$3849a8c0@lan.w1nr.net> <20060113210925.GB3516@linux-mips.org> <43CD2275.8050602@ccr.jussieu.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <43CD2275.8050602@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: "Mike McCarthy, W1NR" <lists@w1nr.net>, 'Douglas Cole' <doug.n7bfs@gmail.com>, linux-hams@vger.kernel.org

On Tue, Jan 17, 2006 at 05:59:33PM +0100, Bernard Pidoux wrote:

> After applying mkiss patch to kernel 2.6.15.1 I compiled it for a 3 GHz 
> Xeon P4 configuring it for SMP and multithread plus lock options.
> 
> The SMP kernel seems very sensitive to AX25 configuration errors and it 
> locks up quite soon in that case when loading applications.
> 
> However when ax25 is carefully initialized, mkiss, kissattach, ax25ipd 
> and ROSE/FPAC switch software suite) are running without problem.
> 
> But there is still a spinlock lockup when shutting down the system.
> 
> Here is a copy of the sequence I made by hand (subject to errors) :

Thanks.  Btw, in some cases digital cameras have served well to catch
messages from screens without types - just make sure the images aren't
larger than necessary to be readable.

> Spinlock lockup on CPU#0, kissattach / 5048, f8d68714
> EIP <c01e3ba5>
> rose_remove_neigh + 0x30/0xb0 [rose]
> rose_rt_device_down + 0xeb / 0x120 [rose]
> rose_device_event + 0x42/0x50 [rose]
> notifier_call_chain + 0x2/0x50 [rose]
> dev_close + 0x7b/0xb0
> unregister_netdevice + 0x19e/0x250
> unregister_netdev+0x16/0x1d
> mkiss_close + 0x4a /0xa0 [mkiss]
> release_dev....
> tty_release ...
> 
> Hope this can help.
> Please suggest any more test to be done.

I think the ROSE routing code is beyond recovery.  The current data
structures requires extensive locking code that is easily prone to
deadlocks like this.  It also is slow - fortunately nobody is using ROSE
on highspeed links ...

Anyway, the problem is pretty obvious in your traceback and I'll cook a
patch for you to test.

73,

  Ralf
