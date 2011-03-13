From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: Why screw with the AX.25 configs?
Date: Mon, 14 Mar 2011 07:40:11 +1100
Message-ID: <4D7D2BAB.9010909@exemail.com.au>
References: <alpine.LNX.2.00.1103131241240.7815@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1103131241240.7815@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Curt, WE7U" <curt.we7u@gmail.com>
Cc: linux-hams@vger.kernel.org

On 14/03/11 07:02, Curt, WE7U wrote:
>
> So why, after sweating over a working config, does it become non-working
> after some time with Linux?
>
> I've had a config that I've tweaked from time to time, but now it
> appears to work differently in OpenSuSE-11.3.
>
> Specifically:
>
> *) I used to be able to name an AX.25 port nearly anything I wanted. For
> instance I have one called "aprs" and used to use one called "opentrac"
> also. It appears now that the "aprs" port is forced to be called "ax0"
> in "ifconfig", plus something calls "ifup" which sends nasty-grams to
> /var/log/messages complaining about no config file. This used to work
> fine near as I can recall, but perhaps there was always some
> cross-connect between "ax0" and "aprs"? Where does the "ax0" come from?
> Is it hard-coded into the driver now? I'm not even using the stuff in
> /etc/sysconfig/ so "ifup" shouldn't be complaining about anything.
>
> *) I used to set my route specifically with something like:
>
> sbin/route add -net 44.0.0.0 netmask 255.0.0.0 dev ax0
>
> But now a route is automatically set for me when I bring up the port. If
> I want to have multiple AX.25 ports (and I do), I must remove the
> auto-created route then create the more specific routes I need. Seems
> like a waste of effort.
>
> I just tried to create a new port called "tcp220", which resulted in a
> new port listed in "ifconfig" called "ax1", and a new route auto-set to
> use it. I didn't have "ax1" anywhere in my configs at the time.
>
> Xastir's AX.25 HOWTO wiki page, which I wrote and tested a while back,
> has "aprs" in the axports file but uses "ax0" in the route. Confusing!
> My current script to bring up the port has the route command commented
> out 'cuz a default one was being created for me and the manual one just
> errored-out.
>
> What it looks like from my perspective: A cross between at least two
> methods of configuring ports. If we've migrated to a new method, that
> one should be documented and the old one should be disallowed. If either
> method should still work, then _all_ of either method should still work.
>
> I'd really like to know where the hard-coded ax0/ax1 stuff is getting
> brought in. That's a big step backwards. It's much nicer and easier to
> read to have names like "opentrac", "aprs", or "tcp220" while
> configuring or using the ports.
>

Curt,

Not trying to teach how to suck eggs.

As I recall, each new instance of creating an ax port increments its 
number by one, starting with ax0 then ax1, etc. The same applies for 
netrom - nr0, nr1 or Rose. This is reflected in ifconfig output.

The *convenient* port name is given in axports and applied in the 
kissattach line as per my examples below where the first line gives the 
selected name and the second references ax#

I've never known it to be any different to my current examples, as far 
back as kernel 2.0.29, when I started with Linux.

  echo -n " configure the ax0/5175 device"
         /usr/local/sbin/kissattach  /dev/ttyS0 5175 44.136.56.25 -m 255
         /sbin/ifconfig ax0 44.136.56.25 netmask 255.255.255.0 broadcast 
44.136.56.255 arp
         #
         echo -n " configure the ax1/30m device"
         /usr/local/sbin/kissattach  /dev/ttyS1 30m 44.136.56.25 -m 255
         /sbin/ifconfig ax1 44.136.56.25 netmask 255.255.255.0 broadcast 
44.136.56.255 arp
         #
         echo -n " configure the ax2/5825 device"
         /usr/local/sbin/kissattach  /dev/ttyUSB0 5825 44.136.56.25 -m 255
         /sbin/ifconfig ax2 44.136.56.25 netmask 255.255.255.0 broadcast 
44.136.56.255 arp

There are two things that I'm doing differently that *may* be relevant;
1. I'm using Ubuntu based Mint 9 KDE (have used the same configs in 
vanilla Debian)

2. I use libax25, ax25-apps and ax25-tools sources from F6BVP because 
they contain fixes that AFAIK haven't been adopted in the official 
maintainers versions.

I'm about to set up kernel ax25 using packages on a VirtualBox guest 
using Mint LDXE. Maybe I'm about to strike your problem.

Ray vk2tv


