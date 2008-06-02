From: Dave Platt <dplatt@radagast.org>
Subject: Re: BUGs into libax25
Date: Mon, 02 Jun 2008 10:16:57 -0700
Message-ID: <48442B09.7060001@radagast.org>
References: <4843220B.20703@upmc.fr> <4843579E.8030003@w1nr.net> <20080602091601.GC997@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20080602091601.GC997@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams <linux-hams@vger.kernel.org>


> Anyway, the maximum callsign length in the AX.25 spec is 6 characters and
> (I looked into that ...) there is no way of extending that without causing
> large scale software breakage :-(  It's almost like retrofitting 128-bit
> addresses into IPv4 - it took a new protocol.

It might not be *that* bad.  I believe that it would be possible to
support 7-ASCII-character callsigns in the six octets that are
available.  It would require specialized encoding and decoding of
the longer callsigns, but would not change the layout of the AX.25
packet header.

Consider that callsigns are strictly alphanumeric and case-
insensitive.  That means that there are only 37 possible
characters (A-Z, 0-9, space).  That's just barely more than
five bits of information per character.  There are less than
37^7 possible callsigns.

There are numerous ways to encode 37^7 different values in
six octets.  It's very easy if you're willing to just fill
the octets with binary data.  It's almost as easy if you
want to use printable ASCII only (blank through tilde,
avoiding DEL and all of the 32 nonprintables at the start
of the character set)... there are 95 such printable
characters, and 95^6 >> 37^7.

I suspect that there's probably a fairly easy way to ensure
that any such encoding of the long callsign would result in
a set of six octets which could be guaranteed to be
recognizable as *not* a standard unencoded ASCII callsign,
and thus make the meaning (and the decoding) entirely
unambiguous.

This method would certainly cause compatibility problems
for many TNCs and other AX.25 devices, but at least it's
vaguely upwards-compatible and doesn't change the packet
structure - just the interpretation of the callsign/address
field.

Whether it'll ever happen?  Probably not, would be my guess, at
least not as-is.  Maybe an approach which can embed an encoded
callsign in an IPV6 address would work better.

