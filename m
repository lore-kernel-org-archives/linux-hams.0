From: Robert L Cochran <cochranb@speakeasy.net>
Subject: Re: Is there an "IPTABLES" expert on the list?
Date: 31 Mar 2003 00:14:01 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1049087641.18688.123.camel@bobcp4.lingpgmr.com>
References: <3E87A396.6030105@kj6eo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3E87A396.6030105@kj6eo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Walton <kj6eo@kj6eo.com>
Cc: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

We are missing some specific information but see the next paragraphs. It
is unclear which machine the firewall is running on. It is also unclear
which machine you were running tcpdump from, but that machine must also
be a router, since you instructed tcpdump to listen on eth1. And you
don't tell us what version of Windows putty is running on. And I think
there is too little output from tcpdump shown in the examples below.

If putty is a client program there must be a server somewhere. Does
putty have a corresponding server program? If so, is the appropriate
server actually running on 44.16.2.100? Is it turned on at startup? My
guess is that this may be the issue here.

If the simple stuff doesn't work, look at your firewall. 

Helpful task #1: print down a log of unrestricted putty traffic in both
directions so you can have that log with you when you study your
firewall rules. Keep in mind that 192.168.1.12 is trying to contact a
machine which is on another network, meaning the packets needs to be
routed. Analysis of unrestricted packets often makes the lightbulb go
on. 

Knowing the ip address and port numbers for incoming and outgoing putty
traffic, is that traffic being blocked by the firewall? Most firewalls
drop (deny) all traffic by default. Then they define rules which
explicitly allows traffic to and from specific ip addresses and ports.
Look carefully at your rules for the ports putty is using. Is putty also
doing UDP traffic? Traffic on these ports should be allowed through from
that source ip address to that destination ip address. Sometimes you
have to look at the firewall script and printed datagrams of actual
traffic a few times before you realize that not all the possible traffic
for that specific service is being allowed through. For example FTP
traffic is really complex and you need several rules to allow an FTP
session to happen. I made that mistake before. The same thing might be
happening here. 

By the way did you turn off the ipchains service when you turned on
iptables? I've made that mistake before. The 2 services don't coexist.
 
Now back to my reference to routing. Are you doing routing on the
firewall? Are you sure your NATing is working in general? No issues with
that? 

My last bit of advice might be my best bit, even if it makes you groan:
get Robert L. Ziegler's book, "Linux Firewalls Second Edition". It
explains iptables firewalls better than I do. If you are doing any
routing you may want a good reference book on that, too.

73,

Bob Cochran
KB3JCM
  
On Sun, 2003-03-30 at 21:10, Bill Walton wrote:
> Hello List -
> 
> Is there an "IPTABLES" expert on the list?  I telnet to my TNOS box from 
> a Windoze
> box on my LAN.  After I replaced my "ipchains" firewall with a new 
> "iptables" firewall
> I can no longer telnet to my TNOS box using my terminal program "putty". 
>  What is
> interesting is that if I shell out to DOS on the Windoze box I can 
> "ping" the TNOS
> box and "telnet" to it using the DOS "telnet 44.16.2.100" command.  I 
> have attached
> two files "dos.output" and "putty.output".  Both of these files capture 
> what is going on
> when I try to telnet to my TNOS box via "dos" or "putty".  The files 
> were captured
> using the "tcpdump" command ie "tcpdump -tqn -i eth1 > <output filename>.
> 
> I can also make my firewall file available to you by request 
> "rc.firewall".  Any help
> you could offer would be appreciated.  For whatever reason I just can't 
> telnet to
> the TNOS box using "putty".  Maybe I can't see the forest for the trees?
> 
> FYI, I can use "putty" telnet to connect to any other 44 IP number.  I 
> can also use
> "putty" ssh to connect to any of my servers on the LAN.
> 
> Any suggestions?
> 
> Regards,
> 
> Bill Walton KJ6EO (kj6eo.ampr.org)(44.16.2.100)
> ----
> 

> 192.168.1.12.1055 > 44.16.2.100.telnet: tcp 0 (DF)
> 44.16.2.100.telnet > 192.168.1.12.1055: tcp 115
> 192.168.1.12.1055 > 44.16.2.100.telnet: tcp 0 (DF)
> 192.168.1.12.1055 > 44.16.2.100.telnet: tcp 0 (DF)
> 44.16.2.100.telnet > 192.168.1.12.1055: tcp 7
> 192.168.1.12.1055 > 44.16.2.100.telnet: tcp 0 (DF)
> arp who-has 192.168.1.12 tell 192.168.1.1
> arp reply 192.168.1.12 is-at 0:40:5:8f:73:aa
> ----
> 

> 192.168.1.12.1057 > 44.16.2.100.telnet: tcp 0 (DF)
> 44.16.2.100.telnet > 192.168.1.12.1057: tcp 115
> 192.168.1.12.1057 > 44.16.2.100.telnet: tcp 0 (DF)
> 192.168.1.12.1057 > 44.16.2.100.telnet: tcp 21 (DF)
> 44.16.2.100.telnet > 192.168.1.12.1057: tcp 7
> 192.168.1.12.1057 > 44.16.2.100.telnet: tcp 0 (DF)


