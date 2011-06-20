From: Gordon JC Pearce <gordonjcp@gjcp.net>
Subject: Re: Packet Radio Crawlers for Linux?
Date: Mon, 20 Jun 2011 17:50:37 +0100
Message-ID: <1308588638.15520.22.camel@localhost.localdomain>
References: <4DFE9DC2.60809@trinnet.net>
	 <1308552302.15520.18.camel@localhost.localdomain>
	 <4DFEF94B.3010802@exemail.com.au>
	 <alpine.LNX.2.00.1106200902180.10051@DadsBox.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1106200902180.10051@DadsBox.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Mon, 2011-06-20 at 09:05 -0700, Curt, WE7U wrote:
> On Mon, 20 Jun 2011, Ray Wells wrote:
> 
> > Xastir is probably "newer" than almost any other aprs application, being that 
> > it is constantly being developed and supported by a very active mailing list. 
> > It works perfectly.
> 
> Many people see the Xastir versions that come out in official Linux distributions and assume they are the newest available.  Some distributions are a bit slow at including newer packages for apps.  Sometimes two years or more before they get around to it.  From that viewpoint, everything looks pretty old.
> 
> Curt...  One of those Xastir guys.
> 

I actually package Xastir for Arch Linux.  I've filed a couple of bugs
and submitted a couple of patches, but never heard anything back.

One of the bugs is particularly nasty and relates to "make install"
refusing to honour an install prefix - which prevents Xastir 2.0.0 from
being packaged without a sneaky wee patch to repair it.  I *did* get a
response to that, namely "it's fixed in SVN".  Great, so roll a 2.0.1
bugfix release, maybe?

I could go into a point-by-point deconstruction of Xastir and explain
all the various things that put me off it.  Many of them are probably
things left over from the very early days of Xastir, when a lot of the
libraries we take for granted weren't available.

It's still the only "current" app I've ever seen that uses Motif,
though ;-)

Gordon MM0YEQ

