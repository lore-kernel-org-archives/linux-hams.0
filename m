From: "Jose A. Amador" <co2ja01@fastmail.fm>
Subject: Re: Is there an "IPTABLES" expert on the list?
Date: Mon, 31 Mar 2003 06:10:37 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030331141037.BB7D42E7E5@www.fastmail.fm>
References: <3E87A396.6030105@kj6eo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3E87A396.6030105@kj6eo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Walton <kj6eo@kj6eo.com>, Linux Hams <linux-hams@vger.kernel.org>


Even when I am no expert on the theme, you might use shorewall (or
seawall)
to configure iptables.

73 de Jose, CO2JA

------

On Sun, 30 Mar 2003 18:10:30 -0800, "Bill Walton" <kj6eo@kj6eo.com> said:

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
-- 
  Jose A. Amador
  co2ja01@fastmail.fm

-- 
http://www.fastmail.fm - I mean, what is it about a decent email service?
