From: folkert <folkert@vanheusden.com>
Subject: Re: Linpac on Raspberry Pi
Date: Mon, 17 Feb 2014 10:57:56 +0100
Message-ID: <20140217095756.GJ30054@belle.intranet.vanheusden.com>
References: <52FDC2F9.2050804@exemail.com.au>
 <52FE54AA.5070102@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52FE54AA.5070102@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: Ray Wells <vk2tv@exemail.com.au>, Linux Hams <linux-hams@vger.kernel.org>

> # 1 - I highly advise you do NOT compile things on your Rpi's SD
> card - it will wear it out.  Do all your compiling
> # via an NFS mount or an attached USB hard drive , etc.

This can be fixed by using the f2fs on the SD card instead of ext3 (or
ext4).
f2fs is a logging filesystem which always uses a new block, never
rewrites the same block.
Small disadvantage is the garbage collector.
I've been running an RPI for almost a year with the same SD card while
using f2fs.


Folkert van Heusden

-- 
www.vanheusden.com/multitail - multitail is tail on steroids. multiple
               windows, filtering, coloring, anything you can think of
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
