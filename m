From: Nate Bargmann <n0nb@networksplus.net>
Subject: Re: installing Predict on a RedHat 7.3 box , no go :^(
Date: Sun, 15 Dec 2002 20:02:07 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021216020207.GJ448@localhost>
References: <200212151628.02870.n7bfs@qwest.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200212151628.02870.n7bfs@qwest.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

* Douglas Cole <n7bfs@qwest.net> [2002 Dec 15 18:35 -0600]:
> [root@n7bfs predict-2.2.1]# ./configure
> One moment please... installer.c:16:20: curses.h: No such file or directory
> Compilation failed.  Are you sure you have a C compiler (gcc) installed?
> [root@n7bfs predict-2.2.1]#
> 
> 
> Now , what I get from that is that my node box does not have curses installed.
> 
> Hmm , so I check and sure enough it has "ncurses" installed , but not curses, 
> so I check all 3 install cd's and none have a curses package on them , so I 
> check the SuSE install dvd and sure enough -it- has it!

Most likely your system is lacking the ncurses development package.  To
keep installation size smaller the binary library and files needed for
compiling packages that use the binary library are in seperate packages.
So, just install ncurses-dev or something similar and you should be
fine.

73, de Nate >>

-- 
 Wireless | Amateur Radio Station N0NB          | "We have awakened a
 Internet | n0nb@networksplus.net               | sleeping giant and
 Location | Bremen, Kansas USA EM19ov           | have instilled in him
  Amateur radio exams; ham radio; Linux info @  | a terrible resolve".
             http://www.qsl.net/n0nb/           | - Admiral Yamamoto
