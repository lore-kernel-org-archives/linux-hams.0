From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Re: nodes and package help?
Date: Sat, 5 Oct 2002 16:40:55 +1200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200210050440.g954etT54824@storm.niwa.co.nz>
References: <4.3.2.7.2.20021004164401.00ac9860@pop3.norton.antivirus>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4.3.2.7.2.20021004164401.00ac9860@pop3.norton.antivirus>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: "John J. Bauerly" <jbauerly@grapevine.net>


> I am continuing the set-up of my Redhat 6.2 AX25 system. After compiling
> the ax25-apps and ax25-tools I seem to be missing some apps. Needed is node
> and node.conf. Several questions are will it run on RH6.2 or would it be
> best to chuck the current and go RH7.3? 

Node, like all other apps, should run on *any* distro. 

A distro is just a bunch of packages, tools and GUIs bundled together, to 
give you a working system out of the box, painlessly and quickly.

If you are installing your ax25 system from source code, it doesn't matter 
what distribution is used, what graphic desktop, what gizmos, etc etc.

What's probably more important is what kernel version is used. You can find 
out by logging in as the super-user and typing 'uname -a'. The current one, 
2.4.19, is recommended, but I found the later kernels in the 2.2.xx series 
OK, too. Generally, a high 'xx' is better than a low one :-)

You can do minor kernel upgrades without having to go to a later distro (e.g. 
2.418 -> 2.4.19) However, installing a later distro is a convenient way of 
getting a more modern kernel.

Upgrading to a later distro often requires a lot of spare disk space...if 
your disk is more than 65% full, it may not let you upgrade, and you'll end 
up doing a clean install, after all.

In such a case, downloading the later kernel, and compiling that, is the way 
to go. You can optionally boot the new kernel, whilst still having the old 
one handy.


>I can find the RPM but who hosts the sources?

You are probably talking about Linuxnode, which I haven't used. I can 
recommend AWZnode v0.4 pre2 by IZ5AWZ, which works extremely well.
For outside users, It is fired up by ax25d. As a sysop, I can log onto it 
from the LinPac terminal via the AXIP interface, too.

There is a link on:
http://radio.linux.org.au/

> together. The goal is to make the upgrade transparent. The present fbb
> should run ok on RH6.2 but would it on RH7.3?
No reason why it shouldn't. I can't give you a straight answer as I am not a 
RH or FBB user. 

If you end up installing a new distro, make a backup of your /etc/ax25 
directory, where most of the ax25 config files live. That way, you won't have 
to re-invent the wheel.

Hope this helps..


Wilbert, ZL2BSJ

