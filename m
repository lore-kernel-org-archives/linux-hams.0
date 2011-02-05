From: Guido Trentalancia <iz6rdb@trentalancia.com>
Subject: Re: help needed with debugging tcp/ip over ax25
Date: Sat, 05 Feb 2011 17:34:51 +0100
Message-ID: <1296923691.2957.10.camel@tesla.lan>
References: <1296857793.3329.22.camel@tesla.lan>  <4D4D264E.2020707@bfs.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4D4D264E.2020707@bfs.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wharms@bfs.de
Cc: linux-hams@vger.kernel.org

Hello Walter !

Thanks for getting back.

On Sat, 05/02/2011 at 11.28 +0100, walter harms wrote:
> 
> Am 04.02.2011 23:16, schrieb Guido Trentalancia:
> > Hello everybody !
> > 
> > I am experiencing problems when trying to run TCP/IP over AX.25 on
> > Linux.
> > 
> > I have two hosts 44.134.241.1 and 44.134.241.21, both of them are using
> > Linux. The kiss interfaces are up and running and the ax25 interfaces
> > have been configured.
> > 
> > The first machine is running a few servers, for example conversd on port
> > 3600.
> > 
> > After a fresh reboot, the first machine is responding correctly to any
> > TCP/IP connection, for example telnet 44.134.241.1 3600 (from the second
> > machine) works correctly and leads to a connection and a successful
> > telnet session.
> > 
> > However, after a while (kissattach is killed, the ax25 interface is
> > brought down and then kissattach and the ax25 interface are restarted
> > again on the first machine), the TCP/IP connection does not work
> > anymore. In other words I can no longer telnet from the second machine
> > to the first one.
> > 
> > The packets are still there, as shown in the logs below.
> > 
> > Output from tcpdump -i ax0 on the first machine:
> > 
> > 19:51:46.932089 IP 44.134.241.21.43675 > iz6rdb.ampr.org.convers: Flags
> > [S], seq 2030721846, win 1024, options [mss 256,sackOK,TS val 149718 ecr
> > 0,nop,wscale 6], length 0
> > 19:51:46.932089 IP 44.134.241.21.43675 > iz6rdb.ampr.org.convers: Flags
> > [S], seq 2030721846, win 1024, options [mss 256,sackOK,TS val 149718 ecr
> > 0,nop,wscale 6], length 0
> > 
> > Output from tcpdump -i ax0 on the second machine:
> > 
> > 19:51:46.386898 IP 44.134.241.21.43675 > iz6rdb.ampr.org.trap-daemon:
> > Flags [S], seq 2030721846, win 1024, options [mss 256,sackOK,TS val
> > 149718 ecr 0,nop,wscale 6], length 0
> > 19:51:49.388715 IP 44.134.241.21.43675 > iz6rdb.ampr.org.trap-daemon:
> > Flags [S], seq 2030721846, win 1024, options [mss 256,sackOK,TS val
> > 152720 ecr 0,nop,wscale 6], length 0
> > 
> > The output from axlisten -a (on both machines) also shows that packets
> > are getting transmitted and received correctly.
> > 
> > But unfortunately, the first machine is not responding anymore !
> > 
> > Similar things can be said about ping or other TCP/IP connections (such
> > as ssh).
> > 
> > It shouldn't be an iptables issue (as bringing iptables down does not
> > improve things and in any case, everything is working fine just after a
> > reboot).
> > 
> > However, it could be an arp issue because when the connection is
> > working, on the first machine (the one which runs the servers that do
> > not respond) I have the following line in arp:
> > 
> > 44.134.241.21    ax25    IZ6RDB-7   C     ax0
> > 
> > while, when the connection is not working, that line does not appear
> > anymore in arp.
> > 
> > The following lines are also missing from the tcpdump output when the
> > server is not replying:
> > 
> > 20:19:35.011128 arp who-has 44.134.241.21 tell iz6rdb.ampr.org
> > 20:19:35.934448 arp reply 44.134.241.21 is-at IZ6RDB-7
> > 20:19:35.934448 arp reply 44.134.241.21 is-at IZ6RDB-7
> > 
> > Any help would be greatly appreciated.
> > 
> 
> 
> 
> did you try arp -s ?

The first machine which is not replying to connection attempts is an
unattended server, so that would not make sense anyway because it is not
possible to configure the arp cache manually for every unknown possible
client that tries to connect.

On the second host I can do arp manually and in fact I do that.

Before creating the arp cache manually on the second machine (client):

17:24:22.335014 arp who-has iz6rdb.ampr.org tell 44.134.241.21
17:24:23.338005 arp who-has iz6rdb.ampr.org tell 44.134.241.21
17:24:24.340004 arp who-has iz6rdb.ampr.org tell 44.134.241.21
17:24:25.343016 arp who-has iz6rdb.ampr.org tell 44.134.241.21
17:24:26.346004 arp who-has iz6rdb.ampr.org tell 44.134.241.21

Then on the second machine (the client) I issue:

arp -H ax25 -s 44.134.241.1 IZ6RDB

and after that the packets are sent out:

17:27:23.666881 IP 44.134.241.21.57633 > iz6rdb.ampr.org.trap-daemon:
Flags [S], seq 1282873166, win 1024, options [mss 256,sackOK,TS val
1536044 ecr 0,nop,wscale 6], length 0
17:27:24.662004 TMD710
17:27:26.670041 IP 44.134.241.21.57633 > iz6rdb.ampr.org.trap-daemon:
Flags [S], seq 1282873166, win 1024, options [mss 256,sackOK,TS val
1539048 ecr 0,nop,wscale 6], length 0
17:27:32.678039 IP 44.134.241.21.57633 > iz6rdb.ampr.org.trap-daemon:
Flags [S], seq 1282873166, win 1024, options [mss 256,sackOK,TS val
1545056 ecr 0,nop,wscale 6], length 0

but unfortunately the first machine (the server) is not replying.

If I try the following on the first machine:

arp -H ax25 -s 44.134.241.21 IZ6RDB-7

I get:

SIOCSARP: Invalid argument

so then I have issued the following command to the first machine (added
"-i ax0"):

arp -H ax25 -i ax0 -s 44.134.241.21 IZ6RDB-7

and the table gets updated:

44.134.241.21      ax25    IZ6RDB-7     CM      ax0

note the flag "CM" instead of "C". But unfortunately it is still not
replying to clients' requests.

So I am not even sure it is a problem related to arp, surely I have
noticed something odd there.

Any other hint ?

Regards,

Guido

