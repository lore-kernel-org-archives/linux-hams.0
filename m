From: Kjell Jarl <K-Jarl@algonet.se>
Subject: Re: libax25 axio_flush bug hangs node and fix
Date: Thu, 17 Oct 2002 20:41:54 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3DAF0472.DA0D4FF2@algonet.se>
References: <Pine.LNX.4.44.0210171640370.17440-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

> No it isn't. This bug is only in 0.0.10. What exactly freezes?

I get a kernel panic. Similar to

> <0> Kernel panic: Aiee, killing interrupt handler!
> In interrupt handler - not syncing

I do not have a recent write down.

I am using a USCC card, which I have been suspecting before. But it
seems to be related to either netrom/node disconnects possibly with
outstanding frames or tcp/ip started from node, or an DISC/UA at the
ax.25 link layer.

I have seen the DISC/UA in listen on a frozen vnc screen before (vnc)
tcp retried out and the screen wanished.

Nothing in the logs of the failure, except

Oct 16 21:55:27 pc2 node[650]: sm6tpn @ 213.x.x.x logged in
Oct 16 21:55:45 pc2 node[650]: Connected to VAXJO:SK7HW-5
Oct 17 01:47:21 pc2 syslogd 1.4-0: restart.

suggesting node involved, probably sm6tpn issued a netrom connect.

73
Kjell

RH7.1
Linux pc2 2.4.19 #3 Tue Sep 17 18:33:09 CEST 2002 i586 unknown
libax25-devel-0.0.7-7
libax25-0.0.7-7
ax25-tools-0.0.6-13
ax25-apps-0.0.4-9
node-0.3.0-5
