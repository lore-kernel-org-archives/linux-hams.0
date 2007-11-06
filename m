From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: aprsdigi
Date: Tue, 6 Nov 2007 21:49:25 +0200
Message-ID: <20071106194925.GL6372@mea-ext.zmailer.org>
References: <c17fc8440710291724g264808e1xabbedab2fea9b41a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c17fc8440710291724g264808e1xabbedab2fea9b41a@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michel Beaudry <ve2bcw@gmail.com>
Cc: linux-hams@vger.kernel.org

On Mon, Oct 29, 2007 at 08:24:45PM -0400, Michel Beaudry wrote:
> Hi,
> 
> I have been asked to setup a aprs digi and igate in our area; xastir
> seems to function well for Igate purposes.
> 
> Does aprsdigi support the new paradgim widen-N path and the SSn-N PATH and how
> to configure it?


If all you really need is receive-only, then a very early test version might
interest you:

       http://ham.zmailer.org/oh2mqk/aprsazel/aprsg-ng-v0.02.tar.gz

It is very small ANSI-C program (or perhaps C90 standard), which on Linux
system can also receive packets from local AX.25 network (apparently).
Will relay everything (sans couple simple rules) to configured APRS-IS
server.

It does not use _any_ external libraries aside of glibc on Linux.
It runs at _any_ POSIX system with serial port(s)[*] and IP network stack.
At Linux it will listen on internal AX.25 network if such is available.

*) I use USB serial port cable to my KISS TNC.

It is so early a beast that I got it running for the most part a week ago,
and now it has been doing my local  Rx -> KISSTNC -> Rx-i-gate -> APRS-IS
processing.   At the moment the TNC must be talking plain basic KISS.
The TODO -file has many important things, like usage manual...


You may rightly wonder, why no threads, widget-libraries, C++ ?
I wanted to show that even "old" methodologies can be used for successfull
and especially lightweight end result.   One which can be placed on very
small and low-power gadget computer drinking up from 48V batteries at a ham
site.  Rack-PC:s with spinning disks don't survive Finnish winters..
Fanless small machines may survive.

Like this one:
   http://ham.zmailer.org/gallery2/v/oh2mqk/2007/06/16-a/img_0320.jpg.html

That one is actually a bit on the hefty side of things, but has read-only
mounted flash disk, and 128 MB RAM.  It runs OH2RDY APRS GW.

The radio of OH2RAY + TNC are on the low edge of this photo:
   http://ham.zmailer.org/gallery2/v/oh2mqk/2007/06/16-a/img_0312.jpg.html

rest is OH2RAY repeater (70 cm band), and common 24V/14V DC supplies.



> thanks,
> Michel
> ve2bcw

73 de Matti, OH2MQK

    http://aprs.fi/info/OH2MQK-1
