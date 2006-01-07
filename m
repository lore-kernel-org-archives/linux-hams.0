From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Most "HAM" friendly distro ?
Date: Sat, 7 Jan 2006 20:19:51 +0100
Message-ID: <20060107191951.GB756@linux-mips.org>
References: <9923fd660601041255o4e45fd5dw572a79848c1781ff@mail.gmail.com> <000b01c6118e$e1b128f0$3849a8c0@lan.w1nr.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000b01c6118e$e1b128f0$3849a8c0@lan.w1nr.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Mike McCarthy, W1NR" <lists@w1nr.net>
Cc: 'Douglas Cole' <doug.n7bfs@gmail.com>, linux-hams@vger.kernel.org

On Wed, Jan 04, 2006 at 07:27:59PM -0500, Mike McCarthy, W1NR wrote:

> I still see SuSE as very ham friendly.  The problem with the AX25 drivers is
> the 2.6.13 kernel across ALL distros.  SuSE 10.0 just happens to have the
> broken one and unless the maintainer gets the fixes into the global 2.6.13
> update, all distros using it will remain broken.  10.1 should "hopefully"
> fix the problem with the 2.6.15 kernel.
> 
> Since 9.3, SuSE has started removing some software from the CD's.  The ham
> software was one of the packages they decided to take out.  That does not
> mean they are not available.  Just point an installation source at any of
> the mirrors that have the "projects/ham" directory and you get all of the
> ham radio packages.  If you want java, extra perl libraries and much of what
> used to fit on a single DVD but doesn't any more, the ftp mirrors have the
> packages available and can be installed and maintained through YaST by
> adding installation sources.  AX25 is still compiled into the kernel as a
> module, so kernel recompilation is not needed.

But for how much longer?  Part of the proboem is that AX.25 is relativly
intrusive protocol.  Just enabling it as a module that is never load will
increase - the amount of memory for every packet.  It's also not bullet-
proof but the code is slowly getting there.  I can only encourage
everybody to contribute again.  There are man drivers waiting to be
written, many bug waiting to be fixed, many features waiting to be
implemented.

  Ralf
