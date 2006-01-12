From: Douglas Cole <doug.n7bfs@gmail.com>
Subject: Re: AX25 patches and how it affects the end user
Date: Wed, 11 Jan 2006 16:55:47 -0800
Message-ID: <9923fd660601111655m2d4b9138gf0e09aa78228c2af@mail.gmail.com>
References: <9923fd660601110945p4c4ce12aw3311ae7e55111df1@mail.gmail.com>
	 <000d01c616fc$5624f4b0$3849a8c0@lan.w1nr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <000d01c616fc$5624f4b0$3849a8c0@lan.w1nr.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Mike McCarthy, W1NR" <lists@w1nr.net>
Cc: linux-hams@vger.kernel.org

On 1/11/06, Mike McCarthy, W1NR <lists@w1nr.net> wrote:
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
>
> Mike, W1NR
Thanks Mike for the input, that helps :)
Unfortunately one of the machines will have an SMP setup, and so that
may be an issue for me, but I don't really want to run "stable" since
it seems to be soo far behind, either that or I am confused as to how
it all goes together, since what I saw on the Debian site was that
"stable" is still using kernel 2.4.xx, and of course I will not go
back to that, so the thought of using "unstable" and also as folks off
this list have told me that "unstable" was still "useable" which may
not mean useable for me, but maybe so...

I really don't want to try and compile a kernel, and its not so much
that I can't figure it out, as that I just don't have the time to
learn, which was why I went to SuSE so long ago, as I could get away
with never recompiling the kernel and make all things I wanted to
work...
So it goes I guess, if I want to continue on my adventure with Linux
and Amateur Radio I may have to spend more time computing and less
time talking (sigh)...

Thanks again for the input, and I will try and sort out the actual
kernel version that Deb' is using and try and make it work...

73
Doug
N7BFS

>
> -----Original Message-----
> From: linux-hams-owner@vger.kernel.org
> [mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Douglas Cole
> Sent: Wednesday, January 11, 2006 12:46 PM
> To: linux-hams@vger.kernel.org
> Subject: AX25 patches and how it affects the end user
>
> If all could bear with my ignorance, but with all these patches flying
> around in the last few weeks, if I were to install the latest Debian
> unstable downloaded ISO would that include all this work, so that when I do
> the install I will have a working AX25 setup using kissattach? Or do I still
> have to learn how to patch again (haven't done any patching in 6 years)?
>
>
> And thanks to all for the input on my previous thread, I have decided to
> plunge into the world of Debian for my Amateur radio station setup, I just
> hope I can keep my head above the water...
