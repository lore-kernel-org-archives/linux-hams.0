From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: NO such version - ax25-apps 0.0.7 published..
Date: Tue, 1 Apr 2008 12:15:47 +0300
Message-ID: <20080401091547.GP3700@mea-ext.zmailer.org>
References: <20080331091318.GD3700@mea-ext.zmailer.org> <20080401080410.GA4491@x-berg.in-berlin.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080401080410.GA4491@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: linux-hams@vger.kernel.org

On Tue, Apr 01, 2008 at 10:04:10AM +0200, Thomas Osterried wrote:
> Hello,
> 
> >   libax25-0.0.13
> [...]
> 
> Unfortunately, the numbering scheme Matti has choosen is confusing.
> This is, because there is no official version like libax25-0.0.13,
> libax25-0.0.12. The same is also right for ax25-apps or -tools.

As there is no mention at sf.net about development having been
moved elsewere, realizing that ax25 libs/tools/apps have not been
abandoned is not easy thing.

If you could be bothered to update the sf.net web about this move,
it would cut down a lot of the confusion.


> This raised some questions, because other people already use the cvs
> version (see below), and if they'd look at the here claimed "new version
> x.y.", they'd look on an old code base.
> 
> libax25-0.0.11 (still downloadable from sf.net) is the latest offical
> relaseed version. ax25-tools is 0.0.8 and libax25 is 0.0.11.
> 
> Actually i even do not know exactly what was promised to be changed in
> Matti's packages.


Probably because this is first time you notice them ?

Well, similarly on weekend I was considering taking over the
ax25.sourceforge.net and posted against any hope(*) an email
to you about it -- and for the first time heard of  linux-ax25.org.

It really is not that well known.

*) "against any hope" = "that project appears to be abandoned, and
    their emails probably will not work and/or they won't answer..."


It looks like you made similar changes to  axconfig.c  that I did
a few months ago -- except that I didn't make it conditional to some
future kernel fix, and I made similar (practically the same - as my
axconfig.c change) changes on  nrconfig.c  and on  rsconfig.c

Also the new autoconfig machinery is basically same as what I did
independently.  I had used a bit newer config.guess, but that is
probably just fine.  I picked also newer  depcomp  and  ltmain.sh,
the latter does matter a bit on development package library building.


> After that last official released version, we develloped in the cvs.
> Not at sf.net any more (for various reasons - one was, that it had months
> of trouble), but on linux-ax25.org.
> 
> Personaly, i'm a bit disappointed. Nearly nobody sent any patch for fixes
> or features or did a feature request. Nobody asked when the release is
> expected, what is missing and how he could help (i.e. in building packages
> in their wide variety of formats, and for multible architectures. Or by
> managing a preview-release). Neither by developers, nor by the linux
> distributors, nor by users. Silence.

Like I said above, silently moving elsewere without marking it at
previous webs is an excellent way to appear to abandon the project.
(However crappy the sf.net was for a while.)


> On the other hand, i'll get the hope that the ax25 stuff gets a vivid
> revival (people still seem to be interested in).
> 
> The CVS access is documented at linux-ax25.org:
>   http://www.linux-ax25.org/wiki/CVS
> 
>   cvs -d :pserver:cvs@cvs.linux-ax25.org:/home/ax25-cvs login
>   password is "cvs"
>   cvs -d :pserver:cvs@cvs.linux-ax25.org:/home/ax25-cvs co ax25-apps
>   cvs -d :pserver:cvs@cvs.linux-ax25.org:/home/ax25-cvs co ax25-tools
>   cvs -d :pserver:cvs@cvs.linux-ax25.org:/home/ax25-cvs co libax25

Not that your servers are all that excellent (at least yet)

  [mea@mea libax25]$ cvs log axconfig.h 
  cvs [log aborted]: connect to [cvs.linux-ax25.org]:2401 failed: No route to host

It worked 15 minutes ago...
.. and 30 minutes latter it works again.


> After checkout, first do "sh bootstrap" in each directory; this generates
> the make files.
> 
> And please do not forget to talk about, when you get into problems,
> a fix is missing, etc..
> 
> Give Feedback ;)

Where ?  At this list ?


> 73,
> 	- Thomas  dl9sau


73 de Matti, OH2MQK
