From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: RE: Status of AX.25 in 2.5 / 2.6
Date: Mon, 29 Jul 2002 18:27:50 +0300 (EETDST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10207291757180.25868-100000@saturn.trs.ntc.nokia.com>
References: <000001c2370f$242f6c40$e239832c@jrws2>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <000001c2370f$242f6c40$e239832c@jrws2>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, 29 Jul 2002, Robert Jenkins wrote:

> Every port is allocated a unique name in axports anyway, so why the need
> for the unique call as well???

The names in axports are simply directly mapped to those callsigns by the
ax25-utils (libax25 to be exact). Kernel does not know anything about the
axports names, it deals with the ifconfig callsigns. They have to be
unique.

> As far as I know, the callsigns / aliases that the AX25 code uses for
> incoming connects are the ones set in ax25d.conf and have no connection
> to the 'axports' callsigns; these are used for outgoing connects only.

They are used for IP traffic and as default callsigns for other stuff. So
if you don't use IP on a port and have configured stuff properly, the
ifconfig callsigns don't have to be valid callsigns. They could be PORT-1,
PORT-2 or whatever.

However you are right in that this a bit annoying feature. The kernel now
supports BINDTODEV and it should be possible to get rid of all this.

> 2: The apparent requirement for two or more Netrom ports / aliases for
> the Netrom system to work correctly? Most of the docs on setting up
> netrom say separate ports are needed for incoming and outgoing connects.

It's actually: one port for internode traffic (using NET/ROM protocol) and
one port for user access.

> Why???
> Again, it's not a fundamental requirement for Netrom, it's an oddity in
> the Linux implementation.

No. It's a bug in AX.25 protocol specification if anything.

The AX.25 SABM packet does not have a protocol ID. So when receiving an
incoming connect request the system can not know (without hackery and
guesswork) what kind of connection is requested. The main problem with
this is that if you use the same netrom port, you will risk getting bad
interaction with your neighbor netrom nodes. Note that I said "risk"; you
don't _have_to_ use two netrom ports, _if_ you know what you are doing. If
you don't know what you are doing, you can cause trouble.

Other implementations use all kinds of hacks to circumvent the problem but
I don't think there is any really clean solution (if there is please
educate me). Jonathan didn't want to include those hacks to Linux and I
quite agree to his decision.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

