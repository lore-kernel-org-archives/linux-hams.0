From: "Andrew Bates" <abates@omeganetserv.com>
Subject: Re: redhat 6.2 dies 3/31/2003 + AX25 2.4 kernel issues
Date: Fri, 27 Dec 2002 09:52:02 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <01e701c2b52f$d76c8920$0201a8c0@wcomnet.com>
References: <3E099099.7070306@junglevision.com> <20021226162643.A31559@pull.privacy.nb.ca> <3E0BCC8F.6090403@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cathryn Mataga <cathrynm@junglevision.com>, linux-hams@vger.kernel.org

> Anyway, after investigating this a little more,
> I've decided to try to keep the Redhat 6.2 running for a bit longer.
> I suppose I'll just have to keep a closer eye on security focus to avoid
> being script kiddie fodder, but hopefully that'll be about it.
> I have most of my other machines at the newer kernels, but the one ax25
> box still at Redhat 6.2.

I guess I'm not following this trail very well... but what difference does
it make what version of a distribution anyone runs?  First of all, why go to
all the trouble of flattening a box and upgrading the entire system to a new
distro?  Only some of the packages need to be upgraded, and it sounds like
to me, you probably only need to upgrade your kernel (easy, download from
www.kernel.org) and maybe the ax25 tools (available from sourceforge).  All
other packages (if you are the type of person to use RPM) can be upgraded to
newer distro's versions.  The alternative is to -erase the package and start
over from .tar.gz and compile.....

As far as the 2.4 kernel goes, I'm running 2.4.19 with 2 rf ports and 1
ax25-ip port via 10baseT.  In the six months it has been online it has only
locked up once.  With the 2.4 kernel comes the introduction of iptables,
which is one of the best deterrents for malicious activity.  If someone runs
an nmap on your IP and gets no response back they are probably not going to
try to hack you.

Anyhow, that's my two cents worth
Andrew

