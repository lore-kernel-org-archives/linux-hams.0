From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: Linux Server and Echolink on Windoze98 client!
Date: Tue, 31 Dec 2002 02:02:05 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021231020205.B24525@pull.privacy.nb.ca>
References: <3E10C949.9010704@kj6eo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3E10C949.9010704@kj6eo.com>; from kj6eo@kj6eo.com on Mon, Dec 30, 2002 at 02:31:37PM -0800
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Walton <kj6eo@kj6eo.com>
Cc: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

On Mon, Dec 30, 2002 at 02:31:37PM -0800, Bill Walton wrote:
> 
> I am having with getting "Echolink" working on my Windoze98 client on my 
> LAN.  I read
> 
> FIREWALL FILE (/etc/sysconfig/ipchains):
> 
> 1)    ipchains -A input -s 0/0 -d 0/0 5200 -p tcp -y -j ACCEPT
> 
> 2)    ipchains -A input -p udp -s 0/0 -d 0/0 5198:5199 -j ACCEPT
> 
> Command #1 above should punch any port 5200 tcp packets through the 
> firewall.
> Command #2 above should punch any port 5198 and 5199 udp packets through the
> firewall.                   

I believe rule 1 as above should be
	ipchains -A input -d 0/0 5200 -p TCP -j ACCEPT
(you don't want to just accept the SYN flag'ed only packets, you want to
accept all inbound to tcp port 5200)

> Now the udp packets need to be redirected from my internet-ip to the 
> Windoze98
> box over on my local LAN:
> 
> 3)    ipmasqadm portfw -f
>        ipmasqadm portfw -a -P udp -L eth0 5198:5199 -R 192.168.1.10 
> 5198:5199 -p 100
> 
> Do the above commands work ?  No .... it appears that I have overlooked 

What about TCP port 5200? Don't you need to forward those as well, to
your Echolink software on your Windows98 machine?

> system and my 44 packets.  Since I can see the requests coming in at 
> ETH0 I can
> assume that they are "in fact" passing through the router.
 
I take you are using something like tcpdump,
 tcpdump -i eth0  udp dst port 5198 or 5199


I hope this is some help, good luck.

-ve1mct
