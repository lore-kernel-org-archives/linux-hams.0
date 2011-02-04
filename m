From: Guido Trentalancia <iz6rdb@trentalancia.com>
Subject: help needed with debugging tcp/ip over ax25
Date: Fri, 04 Feb 2011 23:16:33 +0100
Message-ID: <1296857793.3329.22.camel@tesla.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello everybody !

I am experiencing problems when trying to run TCP/IP over AX.25 on
Linux.

I have two hosts 44.134.241.1 and 44.134.241.21, both of them are using
Linux. The kiss interfaces are up and running and the ax25 interfaces
have been configured.

The first machine is running a few servers, for example conversd on port
3600.

After a fresh reboot, the first machine is responding correctly to any
TCP/IP connection, for example telnet 44.134.241.1 3600 (from the second
machine) works correctly and leads to a connection and a successful
telnet session.

However, after a while (kissattach is killed, the ax25 interface is
brought down and then kissattach and the ax25 interface are restarted
again on the first machine), the TCP/IP connection does not work
anymore. In other words I can no longer telnet from the second machine
to the first one.

The packets are still there, as shown in the logs below.

Output from tcpdump -i ax0 on the first machine:

19:51:46.932089 IP 44.134.241.21.43675 > iz6rdb.ampr.org.convers: Flags
[S], seq 2030721846, win 1024, options [mss 256,sackOK,TS val 149718 ecr
0,nop,wscale 6], length 0
19:51:46.932089 IP 44.134.241.21.43675 > iz6rdb.ampr.org.convers: Flags
[S], seq 2030721846, win 1024, options [mss 256,sackOK,TS val 149718 ecr
0,nop,wscale 6], length 0

Output from tcpdump -i ax0 on the second machine:

19:51:46.386898 IP 44.134.241.21.43675 > iz6rdb.ampr.org.trap-daemon:
Flags [S], seq 2030721846, win 1024, options [mss 256,sackOK,TS val
149718 ecr 0,nop,wscale 6], length 0
19:51:49.388715 IP 44.134.241.21.43675 > iz6rdb.ampr.org.trap-daemon:
Flags [S], seq 2030721846, win 1024, options [mss 256,sackOK,TS val
152720 ecr 0,nop,wscale 6], length 0

The output from axlisten -a (on both machines) also shows that packets
are getting transmitted and received correctly.

But unfortunately, the first machine is not responding anymore !

Similar things can be said about ping or other TCP/IP connections (such
as ssh).

It shouldn't be an iptables issue (as bringing iptables down does not
improve things and in any case, everything is working fine just after a
reboot).

However, it could be an arp issue because when the connection is
working, on the first machine (the one which runs the servers that do
not respond) I have the following line in arp:

44.134.241.21    ax25    IZ6RDB-7   C     ax0

while, when the connection is not working, that line does not appear
anymore in arp.

The following lines are also missing from the tcpdump output when the
server is not replying:

20:19:35.011128 arp who-has 44.134.241.21 tell iz6rdb.ampr.org
20:19:35.934448 arp reply 44.134.241.21 is-at IZ6RDB-7
20:19:35.934448 arp reply 44.134.241.21 is-at IZ6RDB-7

Any help would be greatly appreciated.

73,

Guido IZ6RDB

