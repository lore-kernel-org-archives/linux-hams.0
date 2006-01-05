From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: RE: Most "HAM" friendly distro ?
Date: Wed, 4 Jan 2006 19:27:59 -0500
Message-ID: <000b01c6118e$e1b128f0$3849a8c0@lan.w1nr.net>
References: <9923fd660601041255o4e45fd5dw572a79848c1781ff@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <9923fd660601041255o4e45fd5dw572a79848c1781ff@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Douglas Cole' <doug.n7bfs@gmail.com>, linux-hams@vger.kernel.org

I still see SuSE as very ham friendly.  The problem with the AX25 drivers is
the 2.6.13 kernel across ALL distros.  SuSE 10.0 just happens to have the
broken one and unless the maintainer gets the fixes into the global 2.6.13
update, all distros using it will remain broken.  10.1 should "hopefully"
fix the problem with the 2.6.15 kernel.

Since 9.3, SuSE has started removing some software from the CD's.  The ham
software was one of the packages they decided to take out.  That does not
mean they are not available.  Just point an installation source at any of
the mirrors that have the "projects/ham" directory and you get all of the
ham radio packages.  If you want java, extra perl libraries and much of what
used to fit on a single DVD but doesn't any more, the ftp mirrors have the
packages available and can be installed and maintained through YaST by
adding installation sources.  AX25 is still compiled into the kernel as a
module, so kernel recompilation is not needed.

Mike, W1NR

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Douglas Cole
Sent: Wednesday, January 04, 2006 3:56 PM
To: linux-hams@vger.kernel.org
Subject: Most "HAM" friendly distro ?

Well as most recent postings seem to indicate some distro's are less
friendly than others for updating and changing kernels and other things.
I too am using SuSE (version 10) for my desktop OS, but still have a
separate pc running SuSE 8.2 for packet, since it is the one that works for
me, and as has been posted on here many times, 2.6 kernel packet issues have
been many.

So my question is, which distro' would one reccomend to someone who is used
to using a distro' that does not require recompiling the kernel every time I
turn around?

I was thinking maybe Kubuntu, or one of the Debian based distro's just for
the sake of the ease with which APT makes updating/upgrading, but since I
have not spent enough time with Debian based distro's I am not sure that is
going to fit my needs.
Also I noticed that Fedora has a similar package manager that is supposed to
work well called YUM...

But what 2.6 kernel-based distro' really shines for use Amateur radio opp's
at the moment ?

Thanks in advance for any input you can give.


Doug
N7BFS
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html

