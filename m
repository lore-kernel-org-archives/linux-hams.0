From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: NO such version - ax25-apps 0.0.7 published..
Date: Tue, 1 Apr 2008 10:04:10 +0200
Message-ID: <20080401080410.GA4491@x-berg.in-berlin.de>
References: <20080331091318.GD3700@mea-ext.zmailer.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080331091318.GD3700@mea-ext.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello,

>   libax25-0.0.13
[...]

Unfortunately, the numbering scheme Matti has choosen is confusing.
This is, because there is no official version like libax25-0.0.13,
libax25-0.0.12. The same is also right for ax25-apps or -tools.

This raised some questions, because other people already use the cvs
version (see below), and if they'd look at the here claimed "new version
x.y.", they'd look on an old code base.

libax25-0.0.11 (still downloadable from sf.net) is the latest offical
relaseed version. ax25-tools is 0.0.8 and libax25 is 0.0.11.


Actually i even do not know exactly what was promised to be changed in
Matti's packages.


After that last official released version, we develloped in the cvs.
Not at sf.net any more (for various reasons - one was, that it had months
of trouble), but on linux-ax25.org.

Personaly, i'm a bit disappointed. Nearly nobody sent any patch for fixes
or features or did a feature request. Nobody asked when the release is
expected, what is missing and how he could help (i.e. in building packages
in their wide variety of formats, and for multible architectures. Or by
managing a preview-release). Neither by developers, nor by the linux
distributors, nor by users. Silence.


On the other hand, i'll get the hope that the ax25 stuff gets a vivid
revival (people still seem to be interested in).

The CVS access is documented at linux-ax25.org:
  http://www.linux-ax25.org/wiki/CVS

  cvs -d :pserver:cvs@cvs.linux-ax25.org:/home/ax25-cvs login
  password is "cvs"
  cvs -d :pserver:cvs@cvs.linux-ax25.org:/home/ax25-cvs co ax25-apps
  cvs -d :pserver:cvs@cvs.linux-ax25.org:/home/ax25-cvs co ax25-tools
  cvs -d :pserver:cvs@cvs.linux-ax25.org:/home/ax25-cvs co libax25

After checkout, first do "sh bootstrap" in each directory; this generates
the make files.

And please do not forget to talk about, when you get into problems,
a fix is missing, etc..

Give Feedback ;)

73,
	- Thomas  dl9sau

