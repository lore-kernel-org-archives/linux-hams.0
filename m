From: Bill Walton <kj6eo@kj6eo.com>
Subject: Is there an "IPTABLES" expert on the list?
Date: Sun, 30 Mar 2003 18:10:30 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E87A396.6030105@kj6eo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000006090408080403060808"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

This is a multi-part message in MIME format.
--------------000006090408080403060808
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello List -

Is there an "IPTABLES" expert on the list?  I telnet to my TNOS box from 
a Windoze
box on my LAN.  After I replaced my "ipchains" firewall with a new 
"iptables" firewall
I can no longer telnet to my TNOS box using my terminal program "putty". 
 What is
interesting is that if I shell out to DOS on the Windoze box I can 
"ping" the TNOS
box and "telnet" to it using the DOS "telnet 44.16.2.100" command.  I 
have attached
two files "dos.output" and "putty.output".  Both of these files capture 
what is going on
when I try to telnet to my TNOS box via "dos" or "putty".  The files 
were captured
using the "tcpdump" command ie "tcpdump -tqn -i eth1 > <output filename>.

I can also make my firewall file available to you by request 
"rc.firewall".  Any help
you could offer would be appreciated.  For whatever reason I just can't 
telnet to
the TNOS box using "putty".  Maybe I can't see the forest for the trees?

FYI, I can use "putty" telnet to connect to any other 44 IP number.  I 
can also use
"putty" ssh to connect to any of my servers on the LAN.

Any suggestions?

Regards,

Bill Walton KJ6EO (kj6eo.ampr.org)(44.16.2.100)

--------------000006090408080403060808
Content-Type: text/plain;
 name="dos.output"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dos.output"

192.168.1.12.1055 > 44.16.2.100.telnet: tcp 0 (DF)
44.16.2.100.telnet > 192.168.1.12.1055: tcp 115
192.168.1.12.1055 > 44.16.2.100.telnet: tcp 0 (DF)
192.168.1.12.1055 > 44.16.2.100.telnet: tcp 0 (DF)
44.16.2.100.telnet > 192.168.1.12.1055: tcp 7
192.168.1.12.1055 > 44.16.2.100.telnet: tcp 0 (DF)
arp who-has 192.168.1.12 tell 192.168.1.1
arp reply 192.168.1.12 is-at 0:40:5:8f:73:aa

--------------000006090408080403060808
Content-Type: text/plain;
 name="putty.output"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="putty.output"

192.168.1.12.1057 > 44.16.2.100.telnet: tcp 0 (DF)
44.16.2.100.telnet > 192.168.1.12.1057: tcp 115
192.168.1.12.1057 > 44.16.2.100.telnet: tcp 0 (DF)
192.168.1.12.1057 > 44.16.2.100.telnet: tcp 21 (DF)
44.16.2.100.telnet > 192.168.1.12.1057: tcp 7
192.168.1.12.1057 > 44.16.2.100.telnet: tcp 0 (DF)

--------------000006090408080403060808--


