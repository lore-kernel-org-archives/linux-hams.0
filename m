From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: nrattach ports
Date: Mon, 26 Jan 2004 00:21:38 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40145D92.4020408@ccr.jussieu.fr>
References: <1074877572.1299.114.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1074877572.1299.114.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux-hams List <linux-hams@vger.kernel.org>

Hi,

I have been playing for a few days with ax25 routing on radio with linux 
2.6.1 kernel.
Because ROSE module, FPAC and xfbb BBS are not (yet ?) working with this 
new
kernel, I found myself limited, for the moment, to use netrom and node 
0.3.2 with
two dual ports TNCs KPC9612 and mkiss.

I followed the AX25 HOWTO and Netrom - Node mini Howto for the installation
http://www.tldp.org/HOWTO/Netrom-Node.html
Things went quite well as I am able to connect a neighbour FPAC node 
station through a
netrom call as simple as : 'call netnod LNXKCK'
 From there I can call myself back and make a connection to node F6BVP-10.

Now, here is my question.
nrattach example says :

# /usr/sbin/nrattach -i 44.30.2.5 netrom
# /usr/sbin/nrattach -i 44.30.2.5 netmod

However nrattach creates two ports on my system that are identified as 
nr0 and nr1
not netrom and netmod as I can see with 'ip address' command.
Is there a problem with nrattach ? It does'nt seem to use the 
netrom/netmod argument ?
However I know that it works for I can use the netrom ports defined in 
/etc/nrports alias.
So maybe its only a display problem ?

73 de Bernard, F6BVP

