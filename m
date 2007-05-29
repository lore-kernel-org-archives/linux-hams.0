From: Nate Bargmann <n0nb@networksplus.net>
Subject: Re: Manual printing
Date: Tue, 29 May 2007 18:21:45 -0500
Message-ID: <20070529232145.GC31727@mail.networksplus.net>
References: <7.0.1.0.2.20070529145327.0566f9b8@sasktel.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7.0.1.0.2.20070529145327.0566f9b8@sasktel.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

* Doug <appld@sasktel.net> [2007 May 29 16:24 -0500]:
> I would like to print out the complete manual for a topic. ie Node.conf
> I can view the manual page by page using the man command, but I do not
> seem to be able to print the entire manual. You can print the screen,
> but I can't figure out how to print the total document. The one I am
> presently looking at is node.conf (5).
> 
> Can anyone explain how I can get the whole document printed??
> I am using Mepis 6.0 on a PIV.

I like the a2ps utility as it allows printing in various formats.  The
easiest I use is:

man 8 fubar | a2ps -P printer

(the -P option is only needed for a non default printer)

BTW, I use CUPS and its lpr emulation.

By default, a2ps will print two pages to a sheet and can do even more
or only one plus many more ways to enhance the print.

- Nate >>

-- 
 Wireless | Amateur Radio Station N0NB          |  Successfully Microsoft
  Amateur radio exams; ham radio; Linux info @  | free since January 1998.
             http://www.qsl.net/n0nb/           |  "Debian, the choice of
             My Kawasaki KZ-650 SR @            |     a GNU generation!"
        http://www.networksplus.net/n0nb/       |   http://www.debian.org
