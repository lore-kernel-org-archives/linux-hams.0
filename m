From: Bill Walton <kj6eo@kj6eo.com>
Subject: Regarding Linux (RedHat v7.2/2.4.7-10 Kernel) and Echolink!
Date: Wed, 01 Jan 2003 14:17:13 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E1368E9.7000505@kj6eo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

Hello Everyone - Happy New Year!

It is a beautiful day here in Southern California.  The sun is shining, 
not a cloud in the
sky, with a temp of 16 deg C.  I am still beating myself senseless 
trying to get my
RHv7.2 server set up so that Echolink will work on one of my LAN Windoze98
machines.  I have tried endless combinations of "ipchains" rules along 
with "ipmasqadm"
rules without any success at all.  If I do a "ipchains -L -v -n" the 
output says that
the "tcp" 5200 routing is correct, and that the udp 5198:5199 routing is 
correct, but it
does'nt work.  ACCEPT rules, FORWARDING rules, IPMASQADM rules,
IPCHAINS rules, none of them work.  Of course my demise is most likely 
due to the
fact that I don't know what I am doing.  I only have (3) years 
experience with Linux
and IPCHAINS, IPMASQADM and so on are not my strong points.

Using IPTABLES, I have the commands that will cure my ills, however I know
absolutely NOTHING about IPTABLES ... so I need to draw on your vast 
knowledge
base.  The "iptables" commands necessary to make Echolink work are:

Iptables -t nat -A PREROUTING -d (exit IP) -p udp --dport 5198 -i eth0 
-j DNAT
--to-destination (IP of machine where echolink resides)

The above command is repeated of course for udp port 5199.  IPtables has 
been
compiled into my kernel but when I try to enter the above "iptables" 
command I
get the following:

/lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o: 
init_module: device or
resource busy.

I reset all the ipchains rules "ipchains -F" and turned ip_forwarding 
off but still get
the same error.  Also the same error if I try to load the NAT module:

"modprobe iptable_nat"

Does anyone have and suggestions that would help me resolve the errors and
help me get everything set up properly?

Your help is always appreciated!

Regards,

Bill KJ6EO


