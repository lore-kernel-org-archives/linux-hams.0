From: "Douglas Cole" <n7bfs@qwest.net>
Subject: Re: AX-25 software that works on Fedora Core 4?
Date: Sun, 21 Aug 2005 08:44:39 -0700
Message-ID: <200508210844.39309.n7bfs@qwest.net>
References: <001701c5a4ef$996db510$a4011fac@kb2ear1> <20050820172614.GB2828@linux-mips.org> <33093.83.73.68.20.1124569837.squirrel@www.amsat.dk>
Reply-To: doug.n7bfs@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <33093.83.73.68.20.1124569837.squirrel@www.amsat.dk>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: oz6bl@amsat.dk
Cc: linux-hams@vger.kernel.org

On Saturday 20 August 2005 13:30, oz6bl@amsat.dk wrote:
> Hi Ralf
>
> I would really like to get mkiss working on a SMP machine, so I tried you
> mkis patch on two different kernel versions (2.6.8 and 2.6.11.4), both
> with the same result:
>
> host# patch --dry-run -p1 <mkiss.patch
> patching file drivers/net/hamradio/mkiss.c
> Hunk #6 FAILED at 397.
> Hunk #7 succeeded at 416 (offset 2 lines).
> Hunk #8 FAILED at 438.
> Hunk #9 FAILED at 450.
> Hunk #10 succeeded at 475 (offset 2 lines).
> Hunk #11 FAILED at 527.
> Hunk #12 succeeded at 564 with fuzz 2 (offset 2 lines).
> Hunk #13 FAILED at 577.
> Hunk #14 FAILED at 679.
> Hunk #15 FAILED at 887.
> 7 out of 15 hunks FAILED -- saving rejects to file
> drivers/net/hamradio/mkiss.c.rej
> patching file drivers/net/hamradio/Kconfig
>
> (I am a suspicious type so I always start with --dry-run)
>
> What version is it actually intended for? The above are the latest Suse
> 9.2 and 9.3 respactively. I hope the above tells you something.

Hi Bent, I noticed you are using SuSE 9.3, and am wondering if you installed 
the AX25 stuff from packages not included with SuSE, since at least in the 
disc's that I have (downloaded from OpenSuSE.org) there are no Amateur radio 
packages to speak of. This I found rather discouraging since up to that point 
SuSE has been a very amateur radio friendly distro'. 

And I am wondering if the 'for pay' version has the packages still (since 
version 7 and up to version 9.2 I have paid for SuSE pro and up to that point 
has had great selection of 'Ham' software) and its just that the downloaded 
version has them missing...

I also noticed that version 10 seems to be ignoring amateur radio as well, and 
was wondering if anyone on the list knows why SuSE dropped the "Ham Radio" 
package group?

With that, I know that I could just download most the stuff from their 
respective websites, but its nice to have it on the distro' that i am using, 
that was one of the reasons that I liked SuSE so much...

tia for any input you can give :)


Douglas Cole   N7BFS
AMSAT#26182 , K2 # 544
http://www.users.qwest.net/~cdoug3
Registered Linux user # 188922
