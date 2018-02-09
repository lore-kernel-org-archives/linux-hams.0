From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Fw: ax25d
Date: Thu, 8 Feb 2018 18:48:20 -0800
Message-ID: <0002b0cf-33e1-7915-3e41-d5bc111b711d@trinnet.net>
References: <20180208101109.enjbdoee5wfqdudu@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20180208101109.enjbdoee5wfqdudu@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Hello Folkert,

> Debian stretch, 4.9.0-4-amd64
>
> ii  ax25-apps                     0.0.8-rc4-2                    amd64
> ii  ax25-tools                    0.0.10-rc4-3                   amd64
> ii  libax25                       0.0.12-rc4-1                   amd64

Do not use the stock Debian packages.  They are very very old and have 
TONS of known bugs.  Compile either the top of tree "Official AX.25" 
sources from their Git repo or the VE7FET repo.  There is no clear cut 
recommendation on which to use as it depends on your uses.  You can read 
more about this here:

http://www.trinityos.com/HAM/CentosDigitalModes/hampacketizing-centos.html#3.ax25tools


> /etc/ax25/ax25ipd.conf
> ----------------------
> mycall FH8GOU-1
> socket udp 93
> route FH9GOU-1 192.168.64.112 udp 10093 b d

I have an ax25ipd example here:

http://www.trinityos.com/HAM/CentosDigitalModes/hampacketizing-centos.html#10d.ax25-ax25ipd

It's worth mentioning that there are known fixes to ax25ipd in the above 
two source trees.  Just updating your code and things might start working.


Btw.. there are also known Linux kernel issues with the AX.25 stack.  I 
don't think it you'll see them with ax25ipd but it's worth mentioning.  
This is a well worn issue and the best I can tell you is to revert to an 
early 3.19.x kernel as a test if you suspect a kernel issue.


> ii  ax25-apps                        0.0.8-rc4-2
> ii  ax25-node                        0.3.2-7.4
> ii  ax25-tools                       0.0.10-rc4-1
> ii  ax25-xtools                      0.0.10-rc4-1
> ii  libax25                          0.0.12-rc4-1

Like above.. please upgrade to the newer TIP code.  Btw, please also do 
NOT use the ax25-node code.  It's known to have functional and security 
issues.  I can whole heartedly recommend URONode:

    http://uronode.sf.net/


> /etc/ax25/axports
> -----------------
> axportu	FH9GOU-1        38400   236     7       AXUDP gateway

It's recommended to have the MTU the same on the same side.  If you plan 
on running Netrom over this like, using a smaller MTU like this is required.


> oot@nieteentplink:/etc/ax25# axlisten -8 -a -t axportu
> axportu: fm FH8GOU-1 to FH9GOU-1 ctl SABM+ 21:20:25
> axportu: fm FH8GOU-1 to FH9GOU-1 ctl SABM+ 21:20:35
> axportu: fm FH8GOU-1 to FH9GOU-1 ctl SABM+ 21:20:56
> axportu: fm FH8GOU-1 to FH9GOU-1 ctl SABM+ 21:21:26
>
> So traffic comes in but it is unhandled.
> I did an strace on ax25d and it just sits there in a select() doing
> nothing.

There are also known issues with ax25d too.  Upgrade.  ;-)


--David
KI6ZHD
