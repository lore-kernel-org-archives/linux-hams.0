From: Nate Bargmann <n0nb@networksplus.net>
Subject: Re: Linux AX25 Digipeating Software
Date: Wed, 22 Dec 2004 16:58:31 -0600
Message-ID: <20041222225831.GB4086@merlin>
References: <41C9A12A.2000401@utoronto.ca> <NCBBKBAJDJIPKFIAFBKLIEGOFFAC.wilson.hein@verizon.net> <20041222204955.GC8131@office.n7xy.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20041222204955.GC8131@office.n7xy.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams List <linux-hams@vger.kernel.org>

* Bob Nielsen <nielsen@oz.net> [2004 Dec 22 16:29 -0600]:
> 
> Sorry about the broken URL, thanks Willie.  
> 
> The binary appears to have been built with libc4 (this thing really is
> old!).  I suspect that it is written for an older version of gcc, as
> well.  The oldest one I have is 2.95 and that bombs, as do 3.2 and 3.3. 
> I'm not a C programmer, so can't reallly help there.
> 
> The only reason it still exists in the TAPR repository is that I haven't
> taken the time to clean out the obsolete stuff.  I probably will, once 
> we get the new tapr.org server fully online.
> 
> I don't know if Craig VK2XLZ (the author) still frequents this list, but
> if so maybe he could comment.

Perhaps until Craig declares it obsolete this should be hosted
*somewhere* just to preserve access to the code.  Digipeating is
sometimes not recommended by some, but it would be nice if this code
could be updated if for no other reason than to have the Linux AX.25
capability meet the spec.

I've been playing with AX.25 on another box again and didn't realize
digipeating was lacking until this thread.  This prompted me to grab
the file and save Tomi's patch.

73, de Nate >>

-- 
 Wireless | Amateur Radio Station N0NB          |  Successfully Microsoft
  Amateur radio exams; ham radio; Linux info @  | free since January 1998.
             http://www.qsl.net/n0nb/           |  "Debian, the choice of
             My Kawasaki KZ-650 SR @            |     a GNU generation!"
        http://www.networksplus.net/n0nb/       |   http://www.debian.org
