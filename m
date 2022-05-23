From: Thomas Osterried <thomas@osterried.de>
Subject: Re: Regression in "ax25: Fix UAF bugs in ax25 timers", patch
 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
Date: Mon, 23 May 2022 21:14:21 +0200
Message-ID: <YovdDeh2Lzy3QrKM@x-berg.in-berlin.de>
References: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
 <57922f90.2c358.180f13e25f0.Coremail.duoming@zju.edu.cn>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57922f90.2c358.180f13e25f0.Coremail.duoming@zju.edu.cn>
Sender: Thomas Osterried <thomas@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: duoming@zju.edu.cn
Cc: Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org

> > Due to patch 82e31755e55fbcea6a9dfaae5fe4860ade17cbc, any ax25 session is cleaned up anymore on disconnect.
> > -> netstat --ax25 shows the ex-connected session it in state "LISTEN". Makes ax25 unusable in a production environment.
> > => Regression.
> 
> Is there any ways to reproduce this problem? 

I found no ax25 connection that cleaned up anymore.

It's useful to test many (best: all) of these cases:
incoming connection from remote. and initiate disconnect from remote.
  [In this case, we have no socket to userspace]. and send terminate it from there.
outgoing connection initiated by sending an ip packet to remote (iface configured for mode VC).
  [In this case, we have no so socket to userspace]
Incoming connection fron remote and local started ax25d which listens 
for pid=test (-> socket is allocated).
outgoing connection initiated by userspace connect(). and terminate it.

And for each one, kill hard the remote site and 
- see if after idle timer expiry everything goes the correct way.
- send a packet (-> retries until retry timer expiry) and see if after timer expiry everything goes the correct way.

I tested many of these combinations, but not all.

All these cases can happen normaly in the real world.


