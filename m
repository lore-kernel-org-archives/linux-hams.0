From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: newbie question - hamlib and gMFSKX
Date: Wed, 5 May 2004 09:14:23 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.SUN.4.58.0405050906030.23780@eskimo.com>
References: <1083420366.4194.8.camel@dhcppc3> <4093B61F.6090305@aa6e.net>
 <Pine.SUN.4.58.0405030911380.5458@eskimo.com> <40990E79.5000701@aa6e.net>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40990E79.5000701@aa6e.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Ewing <martin@aa6e.net>
Cc: linux-hams@vger.kernel.org

On Wed, 5 May 2004, Martin Ewing wrote:

> Sorry to give any offense, slight or

;-)  I was just kidding.  Just making sure you knew of other quality
stuff that's out there.


> I confess to near total ignorance of APRS, but I'm glad to hear of good
> work being done there.

You should try Xastir hooked up to an internet port just to see
what's out there.  I'm involved in firenet also, where we have an
alternate network that we use to plot both APRS trackers and
weather/fire/river gauges, quakes, etc.  firenet.us port 2023.
Your map will really light up if you connect there.


> In a way you prove my point, however. I wouldn't count Cygwin support as
> "Windows compatibility". [Although I have claimed that Python support
> is. Go figure.] IMO, we need to use wxWidgets (wxwindows.org) or similar
> cross-platform GUI framework to get apps that work nicely across
> Windows, Mac, and Linux platforms. (Java is an alternative, too.) We can
> handle the GUI part, but does anyone have a cross-platform soundcard
> strategy?

We have a Java application at work that our group wrote.  Runs on
Solaris, WinNT, Linux, and now WinXP.  Wonderful language for our
automated testing.

I agree with you that Cygwin isn't Windows compatibility.  It's a
hack.  A useful hack, but a slow one.  Most Windows people won't go
through the hassle, but for Unix people who are stuck on Windows at
work, or have other restrictions here and there, it's a useful tool.

I'm not sure that Xastir could try for a native Windows port without
a heck of a lot of work.  We use so many of the Unix system calls
that aren't supported well (or at all) on Windows.  We're
multi-threaded too.  Currently we use the Motif widget set, and it
would be a big hassle to even change to a new widget set.  I'm the
main GUI guy (and threads guy, and mutex locks guy, and topo map
guy).

Soundcard... Depends on what you're after.  We support some limited
uses of AGWPE.  We can also use the soundcard interface to do
packet.  Windows people can also use AGWPE.

If you're talking someone universal uses other than packet, can't
help you there.  Sorry.

--
Curt, WE7U			    archer at eskimo dot com
Arlington, WA, USA		http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
