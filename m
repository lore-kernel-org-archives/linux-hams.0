From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: Is there an "IPTABLES" expert on the list?
Date: Tue, 1 Apr 2003 02:22:50 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030401022250.A13143@pull.privacy.nb.ca>
References: <3E87A396.6030105@kj6eo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3E87A396.6030105@kj6eo.com>; from kj6eo@kj6eo.com on Sun, Mar 30, 2003 at 06:10:30PM -0800
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Walton <kj6eo@kj6eo.com>
Cc: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

On Sun, Mar 30, 2003 at 06:10:30PM -0800, Bill Walton wrote:
> Hello List -
> 
> Is there an "IPTABLES" expert on the list?  I telnet to my TNOS box from 
> a Windoze
> box on my LAN.  After I replaced my "ipchains" firewall with a new 
> "iptables" firewall
> I can no longer telnet to my TNOS box using my terminal program "putty". 
d>  What is
> interesting is that if I shell out to DOS on the Windoze box I can 
> "ping" the TNOS
> box and "telnet" to it using the DOS "telnet 44.16.2.100" command.  I 

To clarify a few points,

PuTTY [1] is a free telnet/ssh client for Windows (32bit).
[1] <http://www.chiark.greenend.org.uk/~sgtatham/putty/>

You tcpdumps were too terse to give me a clue to figure out the
problem. Without even the SYN, ACK, FIN, RST it is hard to tell 
what is happening, and it would nice to see the data payload.

'tcpdump -Xn -i eth1' would easiler to see what is going on.

What is the network layout? Are all the machines we are interested in
on a LAN (private IP address 192.168.x.x and 44.16.2.x), off either 
a hub or switch? No routers, firewalls, cable/DSL modems?

Internet<--->modem<--->firewall/router/gateway
                           |
                          hub
                         |   |
                   Windows   TNOS

My first guess is that you have something configured wrong with
your PuTTY configuration for the TNOS machine. Check every option
for your TNOS settings.

