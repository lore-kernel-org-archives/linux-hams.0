From: Edson Pereira <edson@fe.xdsl.ne.jp>
Subject: Re: Regarding RedHat v7.2 and Echolink!
Date: Mon, 30 Dec 2002 13:53:59 +0900 (JST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212301350270.1325-100000@sys09.localnet>
References: <3E0FCED3.2000506@kj6eo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3E0FCED3.2000506@kj6eo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Walton <kj6eo@kj6eo.com>
Cc: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>


Bill,

I believe you need IP port forwarding rules in addition to the rules you
already have.

The information on the pages

http://www.praveen-linux.8m.com/art/portforward.htm

and

http://www.thelinuxreview.com/howto/IP-MASQ/x1525.htm

Will guide you on how to make the configuration.

73,

-- Edson, 7n4ncl

On Sun, 29 Dec 2002, Bill Walton wrote:

> Gentlemen -
> 
> I have a question that I feel might pertain to this list.  I am running 
> my own domain
> (kj6eo.com) and my RedHat v7.2 server also serves up an internet 
> connection to
> all the machines on my LAN.  "ETH0" is connected directly to my ADSL router
> and "ETH1" is connected to my HUB.  "ETH1" carries the IP address of 192.168
> .1.1 and  "IP-forwarding" is enabled:
> 
> echo "1" > /proc/sys/net/ipv4/ip_forward
> 
> and ip masquerading is set for "ETH1":
> 
> ipchains -A forward -s 192.168.1.0/24 -d 0/0 -j MASQ
> 
> I am also running the RedHat v7.2 firewall which consists of a dozen or so
> ipchains commands located at /etc/sysconfig/ipchains.
> 
> MY QUESTION:
> 
> I have installed "Echolink" software on my Windoze 98 box on the LAN.  My
> DHCP server serves up a static IP of 192.168.1.10 to the Windoze box.
>  Echolink uses udp ports 5198 and 5199 and tcp port 5200.  So, I opened up
> tcp port 5200 via the "ipchains file"
> 
> ipchains -A input -s 0/0 -d 0/0 5200 -p tcp -y -j ACCEPT
> 
> The firewall is not configured to do anything to udp ports 5198 or 5199. 
>  Via the
> tcpdump command watching everything on eth0 I can see that the return 
> packets
> from the echolink server are getting a "udp port 5198 unreachable error".
> 
> Besides accepting tcp 5200 do I have to also masquerade it and or 
> forward it over
> to eth1?  Also do the udp ports 5198 and 5199 have to be forwarded or
> masqueraded?
> 
> Any suggestions that you could offer would be greatly appreciated.  I 
> can make
> my firewall "ipchains" file available to you if necessary!
> 
> Regards,
> 
> Bill KJ6EO
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

