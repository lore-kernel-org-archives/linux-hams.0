From: mvw@mvw.net
Subject: Success! TWO questions remain
Date: Wed, 11 Dec 2002 16:57:13 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212111645150.1297-100000@jeeves.mvw.net>
References: <Pine.LNX.4.33.0212110953370.1291-100000@wapiti.tc.fluke.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0212110953370.1291-100000@wapiti.tc.fluke.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I got it working, new 2.4.20 kernel, different PC, all OK. But a couple 
of questions remain.

(And a side note: On this machine too, /dev/ttyS0 appeared dead. But at
least it has two, and /dev/ttyS1 is just fine, so that is what I use. Not
an ax25 problem btw, but odd.)

Anyway. I did this:

1. Installed RedHat 8 
   Custom install.

2. updated Redhat using up2date

3. Recompiled 2.4.20 kernel
   Config ax25 on
   Serial port kiss on
   (SCSI support off (or it would not makedeps))

4. Installed from tarballs:
   libax25
   ax25tools
   ax25apps
   ...according to AX25-HOWTO

5. edited two /etc/ax25 files:
   ax25ports
   rc.ax25

   The first has:

   # /etc/ax25/axports
   r1  VA3MVW  9600  255  2  145.59MHz TCP/IP port


   The second one has this, and I call it at the end of rc.local:

   #rc.ax25
   /usr/sbin/kissattach /dev/ttyS1 r1 44.135.90.48

   # direct to myself via loopback:
   /sbin/route add 44.135.90.48 lo

   # Direct to area gateway port.ve3mch:
   /sbin/route add 44.135.85.30 ax0

   # Let all other 44 (ampr) routes go via there:
   /sbin/route add -net 44.0.0.0 gw 44.135.85.30 netmask 255.0.0.0

   # Direct to me at home:
   /sbin/route add 44.135.90.46 ax0

   /usr/sbin/mheardd


So now I have the following two questions.

1. I have set up TCP/IP OK, and I can ping/send mail/etc; but 
   what about native ax25? Do I need to do anything? How can I check?

2. My ROUTE table shows TWO routes to 44./class A subnet! My previous ax25 
box did not do this and the route commands ar ethe same. The route 
commands in the rc.ax25 script above give me this:

[root@jeeves ax25]# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use 
Iface
port.ve3mch.amp *               255.255.255.255 UH    0      0        0 
ax0
va3mvw.ampr.org *               255.255.255.255 UH    0      0        0 lo
va3oak.ampr.org *               255.255.255.255 UH    0      0        0 
ax0
216.138.207.128 *               255.255.255.224 U     0      0        0 
eth0
127.0.0.0       *               255.0.0.0       U     0      0        0 lo
44.0.0.0        port.ve3mch.amp 255.0.0.0       UG    0      0        0 
ax0
44.0.0.0        *               255.0.0.0       U     0      0        0 
ax0
default         216.138.207.129 0.0.0.0         UG    0      0        0 
eth0



What is that second 44.0.0.0 doing there?? ANy ideas?


Cheers
Michael VA3MVW


