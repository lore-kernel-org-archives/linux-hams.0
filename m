From: "Steve Fraser" <sfraser@sierra.apana.org.au>
Subject: Re: AX25 Nightmare!
Date: Sat, 5 Oct 2002 12:22:54 +0930
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <001401c26c1a$5ba53b60$04590cca@apana.org.au>
References: <3D9E5288.76B22B08@kj6eo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Walton <kj6eo@kj6eo.com>, LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

Hi Bill,

I sympathise with you!

> I notice that in the "ax25d.conf" file there is a path indicated to run
the node daemon
> for the callsigns and alias's.  I have nothing at that location? at
/usr/sbin/ there is no
> "node" file there.  Could this be why I am getting disconnected because
the node
> daemon is not running when I connect?
>
Well, node is not actually a daemon, but yes, that'd be a real good reason
:-) The node program is NOT part of the utils/tools/lib suites - it comes as
a separate file. Its a program that ax25d.conf tells the real daemon, ax25d,
to run. However, being missing, ax25d accepts the connect, fails to find
/usr/sbin/node, and disconnects you. From memory, I think it puts a message
in syslog (or messages?) when it does this.

I cant remember where to find node, (funet?) but a web search should find it
for you.

73

Steve


