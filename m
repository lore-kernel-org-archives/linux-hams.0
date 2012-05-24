From: "Marius Petrescu" <marius@yo2loj.ro>
Subject: RE: Using ax25ipd
Date: Fri, 25 May 2012 02:25:13 +0300
Message-ID: <000c01cd3a04$78ad35b0$6a07a110$@ro>
References: <4FBEB9ED.3050805@boling.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4FBEB9ED.3050805@boling.us>
Content-Language: en-us
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I'm using socat to create a pty pair.
On one end I set up kissattach to get the ax25 interface, on the other comes
ax25ipd:

/usr/bin/socat pty,link=/var/ax25/axip,raw,echo=0
pty,link=/var/ax25/kip,raw,echo=0 &
/usr/sbin/kissattach /var/ax25/kip axip 44.xxx.xxx.xxx

Of course, this port called axip has to appear in the axports file

axip	YO2LOJ-8	38400	255	7	AXIP encapsulation port

Now you coud set up ax25ipd. In the config file you need to set the device
to /var/ax25/axip (the pty delivered by socat) so that it will talk to
kissattach.
Other parameters:
socket ip or udp - depends on what you need, ip means proto 93, udp means...
udp
Your routes. e.g.:
route yo2tst 44.xxx.xxx.xxx bd (in case of proto 93)
route yo2tst 44.xxx.xxx.xxx bd udp 93 (udp on port 93)

Note that protocol is either ax25 encap or udp. If you need both, you need 2
pty pairs, 2 interfaces and 2 instances of ax25ipd with different config
files.

Now start ax25ipd:
/usr/sbin/ax25ipd -c <path to your config file>

in my case:
/usr/sbin/ax25ipd -c /etc/ax25/ax25ipd_ip.conf
/usr/sbin/ax25ipd -c /etc/ax25/ax25ipd_udp.conf

Have fun,
Marius, YO2LOJ


-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Charles Boling
(AD7UF)
Sent: Friday, May 25, 2012 01:45
To: linux-hams@vger.kernel.org
Subject: Using ax25ipd

...

What now?  Do I need to use kissattach to attach to the other end of the
pseudo-TTY?  Which one?

...

