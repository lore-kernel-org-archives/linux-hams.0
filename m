From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: RE: Status of AX.25 in 2.5 / 2.6
Date: Tue, 30 Jul 2002 12:14:26 +0300 (EETDST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10207301047380.2883-100000@saturn.trs.ntc.nokia.com>
References: <Pine.LNX.4.10.10207292343130.24073-100000@linux-gb7lgs.ampr.org>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.10.10207292343130.24073-100000@linux-gb7lgs.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stewart Wilkinson <g0lgs@gb7lgs.co.uk>
Cc: linux-hams@vger.kernel.org

On Mon, 29 Jul 2002, Stewart Wilkinson wrote:

> Station A wants to send some as yet unknown Frame Type to (or via)
> 	Station B:
> 
> 	Station A sends AX25 SABM request to Station B
> 
> 	Station B responds with an AX25 UA and waits for further frames
> 	from Station A.
> 
> 	Station A sends a Frame with L4:
> 		Oh we know how to handle that.
> 
> 	Station A sends a Fram with IP:
> 		Oh we can handle that too.

These are no problem. Linux can handle these quite nicely as is.

> 	Station A sends a Frame with just AX25 Data:
> 		We can handle that too.

This is the potential problem. Here we need to know whether to launch a
user interface to serve a user or not. Remember that in linux the protocol
handling (including the L4 and IP cases above) is done in kernel space and
the user interface in, well, user space. With programs like BPQ, TheNet
(the TNC firmware) and maybe PZT (I really don't know) this separation
isn't probably really an issue. Since they effectively have control of the
whole hardware alone and the whole software is one monolithic thingy where
such things as proper protocol layering don't count, it isn't a problem to
do whatever (possibly ugly things) they do to accomplish it.

Actually I think most of them resort to just waiting for the first
information packet to arrive from the connectee. That means there won't be
any welcoming texts or such. The poor user is blindly connected somewhere
and needs to start using the system without knowing where he is... This is
something that probably _could_ be implemented in Linux.

In xNOS (which I last looked at something like 7-8 years ago) there used
to be all sorts of weird hacks like "mbox jumpstart" or "look at nodes
list" etc. to guess which incoming connects are from users and which from
other network elements. Then someone finally found the ultimate solution:
lets give the mbox a different callsign!!! Things might of course have
changed since...

In _my_ opinion the only viable solution would be (an option) to wait for
the first I-packet. Can it be done in kernel space? To be honest I don't
know. One thing is for sure: if it needs changes outside the AX.25
protocol stack (like in the socket API), it will never be accepted in the
official kernel.

Can it be done in user space? Probably ax25d could handle it somehow.
Without much thought I'd say it is possible but probably not too simple.
But if someone feels like it, go ahead, start coding! I dare you to... ;)

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

