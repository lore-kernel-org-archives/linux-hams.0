From: Brian Rogers <n1uro@n1uro.ampr.org>
Subject: Re: Netrom
Date: Wed, 10 Jul 2013 00:51:03 -0400
Message-ID: <1373431863.12034.11.camel@n1uro.ampr.org>
References: <20130708115635.A4B233700A5@n1uro.ampr.org>
	 <51DABEDA.8020905@junglevision.com>
	 <1373314487.13641.19.camel@n1uro.ampr.org>
	 <51DB9383.1050304@junglevision.com>
	 <1373371546.6646.26.camel@n1uro.ampr.org>
	 <20130709223429.GD18314@x-berg.in-berlin.de>
	 <51DCC209.8080006@junglevision.com> <51DCC337.9030204@junglevision.com>
	 <20130710031728.GI16655@n0nb.us>
Reply-To: n1uro@n1uro.ampr.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20130710031728.GI16655@n0nb.us>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

On Tue, 2013-07-09 at 22:17 -0500, Nate Bargmann wrote:

> It has been a long time, nearly 20 years since I worked with NetROM, but
> I do recall this.  Broadcasts are AX.25 UI (unconnected) packets and are
> sent to the destination of NODES, at least that is what I recall of the
> original NetROM, early TheNet, and G8BPQ nodes.  So Node A in this case
> does not "disconnect" nor does it ever send its nodes list as part of
> the connected level 2/level 3 session.  Even when there was a level
> 2/level 3 connection between nodes, the nodes broadcast was a UI packet
> typically broadcast every 60 minutes often refered to as "node barf" by
> some who didn't care to understand about their operation.

Absolutely the way it was (and in some parts still is). If you can find
some of the old NEDA pages, they used a default quality of 203, and a
min qual of 50. Only user tnc's were shown and never broadcast nodes as
you mention. The backbone tncs linked via rs232/diode matrix cables had
hidden alias's... so the only visible nodes to an end user in a "nodes
list" were those of the userport TNCs. By using 203, the next visible
hop would degrade to a quality of 181 (with the hidden port having a
quality of I think 192). The next visible hop after that if my memory
serves me well would be 164, and so on. The mathematics was so that the
8th visible hop to your own node would have a quality of 51, thus the
9th hop would be below the minqual of 50, and wouldn't be
shown/broadcasted or added.

> Once upon a time I had a Software 2000 NetROM manual that described a
> lot of the protocol.  I have no idea if the authors of the Linux NetROM
> code had access to that document or any other reference.  After years of
> watching it, even when I had access to a NetROM network with a backbone,
> NetROM seemed to fall apart after more than about three or four hops.

The NEDA system worked extremely well beyond 4 hops. They very carefully
studied it and when TheNet was replaced with X1J-4 we migrated over to
that. The neat thing about X1J-4 was that it did have a tiny IP router
in it... which was in a sense pointless because it had no IP daemons.
In the event of IP on RF though, you're better off w/o the added
protocol headers of NetRom and use vanilla ax25.

> All of this is a bit hazy in my memory.

Your memory is quite clear it seems :) Thanks for the trip down memory
lane! Brought me back to my old TheNet/BPQ days as well.
-- 
73 de Brian Rogers - N1URO
email: <n1uro@n1uro.ampr.org>
Web: http://www.n1uro.net/
Ampr1: http://n1uro.ampr.org/
Ampr2: http://nos.n1uro.ampr.org
Linux Amateur Radio Services
axMail-Fax & URONode
AmprNet coordinator for:
Delaware, all New England, 
and New Jersey.

