From: Tim Neu <tim@tneu.visi.com>
Subject: Re: Packet Problem
Date: Tue, 16 Sep 2003 07:46:03 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030916124603.GA10749@leo.tneu.visi.com>
References: <20030916012317.GA9420@leo.tneu.visi.com> <200309160933.10609.pa3gcu@zeelandnet.nl>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200309160933.10609.pa3gcu@zeelandnet.nl>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pa3gcu <pa3gcu@zeelandnet.nl>
Cc: linux-hams@vger.kernel.org

On Tue, Sep 16, 2003 at 09:33:10AM +0200, pa3gcu wrote:
> On Tuesday 16 September 2003 03:23, Tim Neu wrote:
> > Hello!
> >
> > I have a VERY bizzare problem on Linux with AX.25.  I can usually
> > handle linux problems on my own, but this one I'm going to need to
> > see if anyone else can help...
> 
> To do that one would need to know a lot more than you have supplied.
> No mention of kernel version, let alone distro name and version.

Right now, Debian linux, from the woody netinst CD.  

Linux aresdb 2.2.20 #1 Sat Apr 20 11:45:28 EST 2002 i686 unknown

I've also tried 2.4.18 and a few newer kernels

> No mention of libax25 ax25-apps ax25-tools versions.

libax25:
  Installed: 0.0.10-1
  Candidate: 0.0.10-1
  Version Table:
 *** 0.0.10-1 0
        500 http://mirror.cs.wisc.edu stable/main Packages
        100 /var/lib/dpkg/status

ax25-apps:
  Installed: 0.0.6-1
  Candidate: 0.0.6-1
  Version Table:
 *** 0.0.6-1 0
        500 http://mirror.cs.wisc.edu stable/main Packages
        100 /var/lib/dpkg/status

ax25-tools:
  Installed: 0.0.8-2
  Candidate: 0.0.8-2
  Version Table:
 *** 0.0.8-2 0
        500 http://mirror.cs.wisc.edu stable/main Packages
        100 /var/lib/dpkg/status


> No mention of how you configure your ax25 system.

(for now, I tried getting only one port working again)

# /etc/ax25/axports
#
# The format of this file is:
#
# name callsign speed paclen window description
#
p1       KB0UPW-1        1200    255     2       145.670 MHz
(1200
bps)

The following (somewhat lazy) script is being used to start
kissattach:

#! /bin/sh

case "$1" in
  start)

echo  Starting Custom Ham Radio processes...
echo
echo  Attaching port p1  at 9600 KISS / 10.10.48.1
echo $(grep ^p1 /etc/ax25/axports)
kissattach -l /dev/ttyS0 p1 10.10.48.1 &
echo  Attaching port p2  at 9600 KISS / 10.10.49.1
echo $(grep ^p2 /etc/ax25/axports)
kissattach -l /dev/ttyS1 p2 10.10.49.1 &

echo Launching ax25d to listen for connections
ax25d
echo Starting trivnetdbd
/usr/sbin/trivnetdbd &
echo Starting beacon...
beacon -c KB0UPW -l "MN & Ramsey Co ARES / ARESDATA system"&
echo Starting mheardd to keep track of heard callsigns
mheardd
;;
  stop)
        killall kissattach
        killall ax25d
        killall trivnetdbd
        killall beacon
        killall mheardd
;;
  *)
        echo "usage: customham start/stop"
;;
esac

exit 0



> It would be a lot easier if one knew some if not all of the above.

Another poster mentioned the ABAUD setting matching the PC, and
now I'm beginning to wonder if I just have a port speed mismatch
here.  I'll have to check that out tonight when I get a chance. 

I was so concentrated on the TNC side of the speed equation, and
"knowing" the port was right because Minicom worked, I think I
missed the obvious ax25 port speed setting...  I guess that is
what you get for continuing to work on something when you're
frusterated. 

Thanks for all of the help.  If that isn't it, I'll try and dig
up some more debugging info.  

73s.  KC0LQL

-- 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
______         _ __                          Military Intelligence
  /           ' )  )        -KC0LQL-         Honest Politician
 / o ______    /  / _  . .                   Intellectual Property  
/ <_/ / / <   /  (_</_(_/_  -- tneu@visi.com / http://www.visi.com/~tneu --
