From: Shane Deering <vk3bvp@qsl.net>
Subject: netrom
Date: Sun, 14 Apr 2002 15:58:02 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200204140557.g3E5vZX11801@msv02-kent-syd.comindico.com.au>
Reply-To: vk3bvp@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

G'day all.
Wonder if someone can help me out.
I've just set up my good computer (this one) for packet.
Using kernel 2.4.9-31 and the latest libs, tools and apps.
AX25 seems to work ok on the 2 test ports I've set up (call, mheard).
But i'm having problems setting up netrom. Doing what the ax25 how-to say to 
do (I think), but I get the following-

[root@vk3bvp-6 root]# nrattach netrom
NET/ROM port netrom bound to device nr0
[root@vk3bvp-6 root]# /usr/sbin/netromd -i
nrconfig: port netrom not active
netromd: no NET/ROM ports defined

My axports file-

# /etc/ax25/axports
#
# The format of this file is:
#
# name callsign speed paclen window description
#
vhf	VK3BVP-8	2400	255	2	144.825 MHz (1200  bps)
win	VK3BVP-9	57600	255	2	link to winfbb

My nrports file-

# /etc/ax25/nrports
#
# The format of this file is:
#
# name callsign alias paclen description
#
netrom	VK3BVP-10 LINODE	235	Switch Port

The kissatach commands and responses have scrolled off my xterm but from 
history I used these to create ax0 and ax1 -
[root@vk3bvp-6 root]# /usr/sbin/kissattach /dev/ttyS0 vhf 44.135.96.242
[root@vk3bvp-6 root]# /usr/sbin/kissattach /dev/ttyS1 win 44.135.96.241

Don't worry about the IP addresses , they are just for testing.

Any idea why NET/ROM isn't working?

-- 
Shane Deering
vk3bvp@vk3bvp.#sev.vic.aus.oc / vk3bvp@qsl.net
http://www.qsl.net/vk3bvp/
Sent with KMail v1.3.2 on Sun Apr 14 15:31:19 EST 2002

