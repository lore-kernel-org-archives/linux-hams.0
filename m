From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: AX25 patches and how it affects the end user
Date: Fri, 13 Jan 2006 21:09:25 +0000
Message-ID: <20060113210925.GB3516@linux-mips.org>
References: <9923fd660601110945p4c4ce12aw3311ae7e55111df1@mail.gmail.com> <000d01c616fc$5624f4b0$3849a8c0@lan.w1nr.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000d01c616fc$5624f4b0$3849a8c0@lan.w1nr.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Mike McCarthy, W1NR" <lists@w1nr.net>
Cc: 'Douglas Cole' <doug.n7bfs@gmail.com>, linux-hams@vger.kernel.org

On Wed, Jan 11, 2006 at 05:14:05PM -0500, Mike McCarthy, W1NR wrote:

> Hi Douglas,
>    Your best bet is to run the latest "stable" release.  Unstable's are for
> those with time and expertise to "hack".
>    It all depends on when Debian updates it's kernel.  The patches have gone
> into the latest "git" on Kernel.org.  When Debian fetches the kernel from
> there is anyone's guess.  In about another week, SuSE will release 10.1
> Beta1.  I don't even know if it will get into that.  You can always install
> Debian and get the kernel source from kernel.org and build it.  I would at
> least wait until 2.6.15.1 (in kernel.org's numbering) instead of trying to
> patch things.
>    If Debian is running the 2.6.14 kernel, then you are probably OK.  The
> changes that broke it are not in that version.  These "patches" that you see
> are due to recent changes for multiprocessor hardware, but other things got
> broken at the same time.

Not quite.  The locking bugs in mkiss were introduced when adding SMACK
support.  When a little later the locking code - really only relevant to
multiprocessor or preemptable kernels - was changed, the bugs started to
show up on uniprocessor kernels as well.

Shit happens - but better let's fix it.

  Ralf
