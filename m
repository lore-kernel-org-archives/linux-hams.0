From: Bill Walton <kj6eo@kj6eo.com>
Subject: RedHat v7.2 (2.4 Kernel) and Echolink!
Date: Sun, 05 Jan 2003 11:26:56 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E188700.5090702@kj6eo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020502070901020301000405"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

This is a multi-part message in MIME format.
--------------020502070901020301000405
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello Everyone -

I finally got Echolink working on my LAN system (Windoze98).  I had to 
convert from
"ipchains" to "iptables".  After reviewing numerous "firewall scripts" 
and some help info
from Echolink I was able to piece it all together.  So using what I 
found along with some
additions of my own I have been successful.  Just in case there are 
others who might
contact the list regarding Echolink configuration issues, I am attaching 
my firewall
script to this message.  I am sure that allot of you could have 
accomplished the task
easier and better than I did.  However, mine works and that is good 
enough for me!

I have received some valuable help here on the list and this is just my 
way of trying
to contribute something in return.

73 de Bill KJ6EO

--------------020502070901020301000405
Content-Type: text/plain;
 name="rc.firewall"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="rc.firewall"

#!/bin/sh
modprobe ip_tables
#
echo -e "\n\nIPMASQ *TEST* rc.firewall ruleset for kj6eo.com (JAN 2003)\n"
#The location of the iptables program
IPTABLES="/sbin/iptables"
IFCONFIG="/sbin/ifconfig"
GREP="/bin/grep"
AWK="/bin/awk"
SED="/bin/sed"

echo " - Verifying that all kernel modules are ok"
/sbin/depmod -a
/sbin/insmod ip_tables
/sbin/insmod ip_conntrack
/sbin/insmod ip_conntrack_ftp
/sbin/insmod iptable_nat
/sbin/insmod ip_nat_ftp

echo "- Enabling packet forwarding in the kernel"
echo "1" > /proc/sys/net/ipv4/ip_forward

echo "-Resetting the firewall and setting the default FORWARD policy to DROP"
$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD

echo "- FWD: Allow all conections OUT and only existing and related ones IN"
$IPTABLES -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i eth1 -o eth0 -j ACCEPT
$IPTABLES -A FORWARD -j LOG

echo "- FWD: Allow Echolink tcp 5200 and udp 5198,5199 packets IN"
iptables -A FORWARD -i eth0 -p tcp --dport 5200 -j ACCEPT
iptables -A FORWARD -i eth0 -p udp --dport 5198 -j ACCEPT
iptables -A FORWARD -i eth0 -p udp --dport 5199 -j ACCEPT

echo "- Enabling udp packet forwarding for Echolink"
EXITIF="eth0"		# External (Internet Side)
INTIF="eth1"    	# Internal (LAN Side)

# Determine the external IP automatically
EXITIP="`$IFCONFIG $EXITIF | $GREP 'inet addr' | $AWK '{print $2}' | $SED -e 's/.*://'`"

# Address of LAN Computer Running Echolink
ECHOIP="192.168.1.10"

$IPTABLES -t nat -A PREROUTING -d $EXITIP -p udp --dport 5198 -i $EXITIF -j DNAT --to-destination $ECHOIP
$IPTABLES -t nat -A PREROUTING -d $EXITIP -p udp --dport 5199 -i $EXITIF -j DNAT --to-destination $ECHOIP

echo "- Enabling SNAT (MASQUERADE) funtionality on eth0"
$IPTABLES -t nat -A POSTROUTING -o $EXITIF -j SNAT --to $EXITIP 
echo -e "\nDone.\n"

--------------020502070901020301000405--


