From: "Douglas Cole" <n7bfs@qwest.net>
Subject: Re: installing Predict on a RedHat 7.3 box , no go :^(
Date: Mon, 16 Dec 2002 18:54:26 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200212161854.26249.n7bfs@qwest.net>
References: <E18Nz1e-00050R-00@probity.mcc.ac.uk>
Reply-To: n7bfs@qwest.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <E18Nz1e-00050R-00@probity.mcc.ac.uk>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John@man.ac.uk, htodd@twofifty.com
Cc: linux-hams@vger.kernel.org

On Monday 16 December 2002 09:24, John@man.ac.uk wrote:
> On 15 Dec, Hisashi T Fujinaka wrote:
> > Predict isn't all that hard to get going. I even got it going on a NetBSD
> > box.
>
> I have it running on several SuSE systems, CygWIN on Windows and on IRIX
> 6.5 on an ancient SGI Challenge S...
>
> See my Predict 2.2.1 mods at:
>
> 	http://voyager.mcc.ac.uk/Predict/
> or
> 	http://cumin.mcc.ac.uk/Predict/
>
> John

Yeah , I'm kinda dumb that way , since I don't write software and I am 
notoriously lazy...

On the particular box that I was having troubles installing , it was a minimal 
installation to conserve disk space, hence no development packages, whereas 
my SuSE box has a very large drive so I just told it to install "everything" 
and so the fact that it "the SuSE distro' installer scripts" happily 
installed the dev-packages of course was transparent to a dummy like me, all 
I knew was it was a no brainer to install predict on my SuSE box and the 
RH-IRLP node box was a no go, and since the error code confusingly (not a 
word) said curses.h , and of course I looked for a curses package and 
couldn't find anything but ncurses, so after looking at the files on my SuSE 
box and seeing curses.h there , I looked at the installed packages and didn't 
find any curses package but did find a ncurses-dev package, so I made a leap 
of faith and downloaded and installed the RH7.3 package for ncurses-devel and 
sure enough the predict installer played :)

Now , all you sharp egg's out there are going , duh !?!

But for me that took some effort , so if by some chance this is archived so 
that someone else runs into this same scenario then I hope that this will 
help them ...
I'll try and have a better question next time ;^}

my 5cents worth ...

73

-- 
Douglas Cole   N7BFS
Spokane IRLP node owner
AMSAT#26182 , K2 # 544
http://www.users.qwest.net/~cdoug3
Registered Linux user # 188922


