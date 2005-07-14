From: Dave Platt <dplatt@radagast.org>
Subject: Re: YAPP server pgm - Packet File Transfer
Date: Thu, 14 Jul 2005 16:01:49 -0700 (PDT)
Message-ID: <20050714230149.31626.qmail@radagast.org>
References: <42D6E7EA.7010000@jnos.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42D6E7EA.7010000@jnos.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wa7nwp@jnos.org
Cc: linux-hams@vger.kernel.org

> It sounds like you are very close with the core functionality of
> what I'm looking for.
> 
> My objective here is to transfer a binary file between two systems with 
> packet radio.
> 
> The file will be highly compressed standard Email and NNTP posts - the
> old UUCP way of doing things.  I believe the existing tools allow 
> setting the size of the outgoing file bundle so we'll be able to limit 
> it to something like 50K which would probably be fine for most of the 
> exchanges.
> 
> I'd like the transfer to be very fast, aggressive and efficient.  To get 
> the job done as quick as possible and get out of the way.   No doubt 
> that FTP/TCP would be better for larger and more robust transfers but in 
> this case the overhead of TCP is unacceptable.
> 
> I'm attempting to keep this scheme as standard as possible by minimizing 
> the value added tools.   A single specialized "ax25" file copy program 
> that works through the AX25 tools would be a good solution.
> 
> While this is basically Linux, I'm considering the issues and 
> possibilities of running this on the other OS's.  (UUPC anyone?)

That latter is an interesting suggestion.

The uucp protocol was originally designed for efficient host-to-host
file transfer over modem links whose behavior isn't all that difference
from low-speed AX.25 in a lot of way - slow and somewhat noise-prone.
It might actually make sense to implement uucp, wrapped directly in
AX.25 Level 2 UI frames... just steal a Level 2 protocol ID to do it
with.

uucp supports multiple data-transfer protocols, optimized for different
sorts of links.  The 'g' protocol is the standard one - relatively small
packets (64 bytes standard), with a sliding-window acknowledgement 
system using small ACK packets (6 bytes).  It's optimized for full-duplex 
lines, as it can't keep the pipeline full if it doesn't hear ACKs fairly 
frequently.

'g' protocol with 128- or 256-byte packets, and a standard three-packet
window might work out tolerably well for 1200-baud AX.25 use.

Another possibility would be to make use of the 'i' protocol, implemented
in Ian Taylor's uucp package (the standard for Linux systems these days)
and also in some others.  'i' has quite a few sophisticated capabilities,
including the ability to interleave multiple files being sent at once,
the ability to send files in both directions simultaneously, and a
NAK (selective reject) feature to request the retransmission of only
a single packet in the transmission window.

Taylor uucp also has some tweaks which cut down on the per-file or
per-message overhead - it can include the specification of the command
to be run on the received file as part of the "transfer file" command,
rather than having to send two separate file transfers (one with the
data and one with the "Do this to it!" command, as the legacy uucp
packages do).

It's been years since I played around much with this (back when I was
the de facto code-wrangler for the Macintosh port of UUPC), but I still
maintain a uucp link between my system here at work, and my home system.
It's normally done over TCP/IP but I could drop back to using a direct-
dial connection if I had to.  Fun stuff!
