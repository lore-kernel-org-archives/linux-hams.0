From: Stewart Wilkinson <g0lgs@gb7lgs.co.uk>
Subject: RE: Status of AX.25 in 2.5 / 2.6
Date: Mon, 29 Jul 2002 23:44:03 +0000 (GMT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.10.10207292343130.24073-100000@linux-gb7lgs.ampr.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


On Mon, 29 Jul 2002, Tomi Manninen wrote:

> On Mon, 29 Jul 2002, Robert Jenkins wrote:
> 
> > My only thought re. the problem you mention with the SABM frame not
> > having a protocol ID is that surely this applies equally to IP via ax25
> > etc.? 
> 
> Yes. That is why you should not have any user services (that are called
> with plain AX.25) like LinuxNode or a BBS using the same callsign as you 
> have in ifconfig/axports.

Other Programs such as BPQ and PZT's Xrouter manage to do AX25, NETROM,
TCP/IP (and now APRS) using the same callsign on ALL Radio Ports and if I
am not mistaken JNOS & TNOS do too.

Surley if they can do it, then with the correct programming it could also
be done in Linux ?

I seem to recall seeing a flow diagram that described how one of those
other programs managed to cope with such things, I don't remember which
one, or the full details.

As I recall its starts something like this:

	Station A wants to send some as yet unknown Frame Type to (or via)
	Station B:

	Station A sends AX25 SABM request to Station B

	Station B responds with an AX25 UA and waits for further frames
	from Station A.

	Station A sends a Frame with L4:
	
		Oh we know how to handle that.

	Station A sends a Fram with IP:

		Oh we can handle that too.

	Station A sends a Frame with just AX25 Data:

		We can handle that too.

Now I don't (at 01.30) see any problem ?

---
Stewart G0LGS
g0lgs@gb7lgs.co.uk


