From: Shane Deering <vk3bvp@qsl.net>
Subject: Re: shutdown script
Date: Thu, 9 Jan 2003 11:57:35 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200301091157.35104.vk3bvp@qsl.net>
References: <NCBBKBAJDJIPKFIAFBKLOEFBEHAC.vze2b869@verizon.net>
Reply-To: vk3bvp@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <NCBBKBAJDJIPKFIAFBKLOEFBEHAC.vze2b869@verizon.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Thu, 9 Jan 2003 07:06, Wilson G. Hein wrote:
> I'm wondering if someone has a script to close ax25 and netrom, etc
> interfaces. I would presume it would have something to look at the pid's
> and then kill the process. I wnat to plug it into
> /etc/sysconfig/network-scripts to automate startup and close through the
> normal init scripts.
>
> TIA,
>
> Regards,
>
> Willie, WJ3G

This isn't elegant, but it is simple and it works.
dip is used to set up pipes between the kernel and JNOS.
The other ports are all hardware kiss ports.
One day (maybe) I'll write something better.
 
#!/bin/sh
# Shut down all our ax25 stuff
# save our netrom routes and nodes first
/usr/sbin/nodesave /etc/ax25/nodes
# Now start shutting down stuff.
fbb stop
pkill ax25d
ifconfig ax0 down
ifconfig ax1 down
ifconfig ax2 down
ifconfig ax3 down
ifconfig ax4 down
ifconfig ax5 down
ifconfig nr0 down
ifconfig nr1 down
ifconfig nr2 down
ifconfig nr3 down
ifconfig nr4 down
ifconfig sl0 down
pkill dip
pkill kissattach
pkill mheardd
pkill netromd
rm /var/lock/LCK.pty* 2>/dev/null
rm /var/lock/LCK.tty* 2>/dev/null
#It should be OK to shut down now.


-- 
Shane Deering   vk3bvp@qsl.net 	vk3bvp@vk3bvp.#sev.vic.aus.oc
http://www.qsl.net/vk3bvp/		Up 51 minutes 
Sent with KMail v1.4.1 on Thu Jan  9 11:33:44 EST 2003

