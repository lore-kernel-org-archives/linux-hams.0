From: Bill Walton <kj6eo@kj6eo.com>
Subject: Need Help With AX25/NETROM/ROSE!
Date: Tue, 01 Oct 2002 10:42:22 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3D99DE7E.691A0B24@kj6eo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello -

Thank you for reading my message.  I am trying to get AX25/NETROM/ROSE
going on my prototype system (RedHat 7.2 with a 2.4.18 kernel).  I am using
Jeff Tranter's (VE3ICH) guide to help me get all this stuff working.  You can access
the guide at:

http://www.tldp.org/HOWTO/AX25-HOWTO/

The guide is version 2.0, 19 September 2001.

My goal is to replace my two DOSFBB/BPQ BBS's that have been on the air
for years with XFBB/AX25/NETROM/ROSE.  I needed a BBS program so I
choose XFBB, and I need a NODE so I choose the AX25/NETROM/ROSE
package.

WHERE I CURRENTLY STAND:

1)    My kernel (2.4.18) is compiled and working with the Amateur AX25 stuff
        enabled and installed. (Step #4 in guide).

2)    All the AX25 libs, tools, and applications have been installed (no errors).  I
        also installed all the configuration files ie "make installconf". (Step #4 in guide)

WHERE THE PROBLEM EXISTS:

Refer to Section 5.2 of the guide (Run time configurable parameters).  The guide
says "Take a look at the.....(gives paths and filenames) ie:

/proc/sys/net       /proc/sys/net/ax25/portname/      /proc/sys/net/netrom

This is a summary of the subdirectories that I have in /proc/sys/net:

802    appletalk    ax25    core    ethernet    ipv4    ipx    token-ring    unix

This is a summary of the subdirectories that I have in /proc/sys/net/ax25/portname/

A problem exists here ( I have no files in the ax25 subdirectory, furthermore I
have no portname subdirectory off of ax25.

Also there is no netrom subdirectory off of /proc/sys/net

WHERE TO GO FROM HERE?

I have located the AX25 and NETROM directories at the following paths:

/root/linux/net

However the files contained in the AX25 and NETROM subdirectories in no way
shape or form resemble the structure outlined in section 5.2 of the guide.

CLOSING COMMENTS:

So as you can see, right now I find myself up that famous creek without a paddle.
I need to unravel this mess and try to figure out what is going on between my
system and this guide.  It is clear to me, very clear, that without the help of others
such as yourself, my XFBB and AX25/NETROM/ROSE project is doomed.
Obviously there are many of you that are successfully running this stuff.  I need to
figure out how you did it, and where the information exists that can lead me to
a successful resolution regarding this AX25 hell that I find myself in.

I am running my own domain along with a TNOS system so that will give you an
idea of my background.  I have also been running a packet bbs since the
WA7MBL days so that should tell you how long I have been in the packet
business.

Would someone be kind enough to help me figure what is going wrong with
my AX25 stuff?  If the guide that I am using is outdated then please direct me
to the correct one.  If I have configured my system incorrectly then any help
that you could provide that would point me in the right direction would be
greatly appreciated.  I really don't need to run AXIP....I basically need the
XFBB software and something that will give me a software node like the
DOS BPQ that I am running with my radio ports.

Regards,

Bill Walton KJ6EO

ax25:    kj6eo@kj6eo.#sca.ca.usa.noam
AxIP:    kj6eo@kj6eo.ampr.org
Email:    kj6eo@kj6eo.com
Url:        http://www.kj6eo.com

