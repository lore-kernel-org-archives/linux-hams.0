From: "Douglas Cole" <n7bfs@qwest.net>
Subject: Re: installing Predict on a RedHat 7.3 box , no go :^(
Date: Sun, 15 Dec 2002 17:56:14 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200212151756.14606.n7bfs@qwest.net>
References: <200212151628.02870.n7bfs@qwest.net>
Reply-To: n7bfs@qwest.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200212151628.02870.n7bfs@qwest.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Sunday 15 December 2002 16:28, Douglas Cole wrote:
> Ok ,  I must admit to not being very good at installing something if its
> not in a RPM form , so when I tried to install Predict on a SuSE 8.0 box
> and it went flawlessly I got rather overconfident and tried to install it
> on my RedHat IRLP node box , so I could let it run as a server 24/7 since
> that machine is always on , and has alot of process time doing nothing...
>
> BUT , it will not even begin to install :^(
> here is what I get when I try to run ./configure on the RedHat box...
>
> [root@n7bfs predict-2.2.1]# ./configure
> One moment please... installer.c:16:20: curses.h: No such file or directory
> Compilation failed.  Are you sure you have a C compiler (gcc) installed?
> [root@n7bfs predict-2.2.1]#
>

Well , I figured it out , apparently I needed to install the development 
package for ncurses which I found on rpmfind.net , once I did that it took 
right off ...

Since the node box has a small drive I didn't install the "developement" 
packages, and I downloaded the Redhat ISO's from linuxiso.org , the sources 
were not complete since I only burnt the first three disk's , so anywho , all 
is well , and I am in the process of setting it up to work on my IRLP node 
box , then will make it automagically update the kep's , then I won't have to 
think about it again :)

Boy do I like Linux :^))


>
> Now , what I get from that is that my node box does not have curses
> installed.
>
> Hmm , so I check and sure enough it has "ncurses" installed , but not
> curses, so I check all 3 install cd's and none have a curses package on
> them , so I check the SuSE install dvd and sure enough -it- has it!
>
> So my general question is , has anyone who is using the latest version of
> predict running it on a RedHat box and if so what did you have to do to
> make it happen ?
>
> I have done a search on rpmfind.net and have not found any curses packages
> for Redhat , which seems kinda confusing , but not surprising .
>
> Or could someone point me in the direction of a how-to/info page that would
> help me figure out how to install curses from sources so I don't need a
> stinking RPM file to install curses on my node box ;^}
> Or maybe I just didn't install RedHat properly...
>
> tia for any input!

-- 
Douglas Cole   N7BFS
AMSAT#26182 , K2 # 544
http://www.users.qwest.net/~cdoug3
Registered Linux user # 188922


