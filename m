From: Kelly Black <kelly.black@penguinpackets.com>
Subject: Re: Regarding Linux (RedHat v7.2/2.4.7-10 Kernel) and Echolink!
Date: 01 Jan 2003 16:44:22 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1041461063.10495.10.camel@edith>
References: <3E1368E9.7000505@kj6eo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3E1368E9.7000505@kj6eo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Walton <kj6eo@kj6eo.com>
Cc: Linux Hams mailing list <linux-hams@vger.kernel.org>

On Wed, 2003-01-01 at 16:17, Bill Walton wrote:
> Hello Everyone - Happy New Year!
SNIP---
> base.  The "iptables" commands necessary to make Echolink work are:
> 
> Iptables -t nat -A PREROUTING -d (exit IP) -p udp --dport 5198 -i eth0 
> -j DNAT
> --to-destination (IP of machine where echolink resides)
> 
> The above command is repeated of course for udp port 5199.  IPtables has 
> been
> compiled into my kernel but when I try to enter the above "iptables" 
> command I
> get the following:
> 
> /lib/modules/2.4.7-10/kernel/net/ipv4/netfilter/ip_tables.o: 
> init_module: device or
> resource busy.
> 

Bill, I did a google search for the error and found this suggestion that
the user that had the problem said worked for him.

------------------

service ipchains stop
chkconfig --level 345 ipchains off
rmmod ipchains

insmod ip_tables
chkconfig --level 345 iptables on

------------------

Looks like ipchains is fighting with iptables and can't be loaded at the
same time?  You probably have to remove the old to add ipchains service
to add the iptables service.

As to the PREROUTING rules.  The rules look ok for boxes connecting to
the echolink box from the outside, but you have to add a rule for the
internal boxes trying to get to the echolink box so your source and
desitination IP addresses are not the same after they are Masqueraded. 
You can make sure the internal boxes know about the echolink box by
adding a resolvable name to your hosts file on your 98 boxes that tells
the internal interface to talk to the echolink box with (so you don't do
a resolve to the external routeable IP and end up with the situation
that the source IP = destination IP after Masq operation).

Hope this makes sense, and or helps you.

Kelly
KB0GBJ


