From: Cees Tool <c.tool@quicknet.nl>
Subject: Re: FBB...
Date: Wed, 25 Dec 2002 22:31:45 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <003401c2ac5d$06545000$0300a8c0@HUISKAMER>
References: <Pine.LNX.4.44.0212251459330.21106-100000@jeeves.mvw.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams <linux-hams@vger.kernel.org>

----- Original Message -----
From: <mvw@mvw.net>

> This is definitely not GPL:
>
....
> are old and do not fit the software... took me an hour to see I had to run
> that script. How about a simple readme that mentions this? These are the
> very basics of software!
....
>Alas, there is no standard "./configure, make, make
>install", and the bbs when it does come up is mysterious, needs obscure
>text files edited, and displays Toulouse stuff by default...

Wow !
The source-tree of the latest version I have here (7.04h) has all these
things in it.

There is a file "COPYING" with the GPL license in it, there are several
readme-files how you should compile the code,  there is no "configure"
needed, you should only check if the path of the ax25-utils/libraries
differs from the standard path and change it if needed. Then you can type
"make"  and after that "make install" and the installation script will
install everything in the right directory's and asks your station details.
If you answer all questions, you will end up with a working installation.
(and there is absolutely no need to remove include files from the source)

Looking in the sourcecode tree for a file called README or INFO only costs 1
minute of your time. (and is probably less then the time it took to write
about "bad sofware")

If all of this is too difficult for you, please do not even try to install
it. Probably the normal daily sysop work would also be too difficult ....

73
Cees



