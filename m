From: "John A. Magliacane" <kd2bd@yahoo.com>
Subject: Re: gcc-3.2.2 / libc-2.3.1 / gnome 2
Date: Thu, 10 Apr 2003 16:48:16 -0700 (PDT)
Sender: linux-hams-owner@localhost
Message-ID: <20030410234816.48098.qmail@web12201.mail.yahoo.com>
References: <200304110027.32425.ailic@gmx.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200304110027.32425.ailic@gmx.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aleksandar Ilic <ailic@gmx.net>, linux-hams@vger.kernel.org

Hello Alek.

> Hello, list !
> Recently I upgraded my Slackware 8.1 (gcc-2.95.3 / libc-2.2.5) to Slackware 9
> 
> with gcc and libc as in subject.
> 
> I've found several programs refusing to compile, including gMFSK-0.4.1, 
> Qsstv-5.2d and LinKT-0.8rc2.
> 
> There was a variety of reasons. gMFSK needs gnome-config, which no more 
> exists. Qsstv and LinKT reporting some violations with C++ class rules

I usually run into ./configure problems with QSSTV relating to the
qt libraries I have available on my machine (Slackware).  ./configure
complains that the versions I have are too old. (They're not!)  If I
manage to get past the configure issues (by manually bypassing the
"problem" steps in the configure script), compilation then fails
during the linking stage.

I found a compilation issue with qsstv-5.1a using gcc 3.2.2 and notified
the author, not realizing a later version was available.  I haven't yet
successfully compiled 5.2d.  Now I need to recompile qt from source to
generate the needed threaded (or qt-mt) libraries that weren't generated
the first time I compiled it.  :-(

*Sigh*

It was easier for me to write my own "quick and dirty" SSTV generation
program than to get QSSTV to compile.  So far, I can only generate 120
line 8 second black and white video (plus 8 lines of grey scale), but
that's all I need it to do at this point.


73, de John, KD2BD


=====
-=-=-=-=-=-=-=-=- John A. Magliacane, KD2BD -=-=-=-=-=-=-=-=-=-=-=-=-=-
   Internet  : kd2bd@amsat.org  |  Video : 426.250 MHz/439.250 MHz
   Satellite : UoSAT-OSCAR-22   |  Morse : -.-  -..  ..---  -...  -..
   Voice     : +1.732.224.2948  |  WWW   : http://www.qsl.net/kd2bd/
-=-=-=-=-=-=-=-= Linux Doesn't Cost.  It Pays. =-=-=-=-=-=-=-=-=-=-=-=-

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://tax.yahoo.com
