From: Bob Morgan <wb5aoh@wb5aoh.dyndns.org>
Subject: Re: Would you run Linuxnode
Date: Mon, 1 Mar 2004 15:16:24 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <16451.43048.643005.128185@halvor.tensleep.com>
References: <200402270023.02872@www.cabodesantapola.org>
	<20040227180708.A6790@jeroen.pe1rxq.ampr.org>
	<001201c3fd8e$73ddb980$1400a8c0@IZ4EFN>
	<1077935047.1249.3.camel@oh2bns.ampr.org>
Reply-To: wb5aoh@wb5aoh.dyndns.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1077935047.1249.3.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tomi Manninen <oh2bns@sral.fi>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

Tomi Manninen writes:
 > On Sat, 2004-02-28 at 02:04, IZ4EFN Alessio wrote:
 > 
 > > I'm asking this because, reading some bug reports and security exploit on
 > > the web, it seems like Linuxnode uses a big amount of memory and resources
 > > to administrate multiple telnet connection.
 > 
 > As the author of LinuxNode I would be interested in what these bugs and 
 > exploits are... Please, anyone?
 > 
 > -- 
 > Tomi Manninen / OH2BNS / KP20ME04

Tomi,

I have been running node for several years with good results, and have
had few problems.  This is on servers that don't get much if any
physical access and have to run for months/years at a time, and they
just keep going.

Over the last year or so, I have been developing a daemon that will
be a gnu-license workalike replacement for the old dos aresdata
database system.  It involves multiple ax25 connects inbound to it,
and presently it does use node as a frontend, meaning that if I get
10 or 20 simultaneous connects, that many copies of node are launched.
On servers that have 32+ mb of ram, that doesn't seem to be a particular
challenge in itself, but it did cause me to write the database frontend
daemon to only run one copy of itself, and accept(poll) as many telnet
connects from node as it had users, since it became apparent quite early on
that I couldn't expect to launch 20+ copies each of node, frontend, and postgresql
dbase backend itself, and still have a server with a tolerable memory size.
So, I use the outbound telnet connect facility of node to facilitate
things and serve as the ax25 frontend itself, and this appears to work fine.
Additionally, node can provide the client with quite a few other services,
so the client doesn't have to disconnect from something else to use the db.
I probably ought to add that I am operating a mix of direct ax25 connects
and also some that arrive via the netrom layer, but no rose is implemented,
so I can't comment on rose.

In the process of debugging the daemon I was writing, it became apparent
that I had a memory leak someplace, and after some afternoons of
experimentation it became apparent that for each instance of a telnet
connection from node (launched by an incoming ax25 client), 8K of memory
would disappear from the freelist, for each instance of the continuously
connected ax25 user initting a telnet call to any tcp socket on the box
or elsewhere, and that all of the memory was recovered upon disconection
of the ax25 client.  In other words, a packet station connects to node,
and initiates 3 successive connects and disconnects through the telnet
facility of node, so 24K of memory are consumed, 8K at a time, but are recovered
upon the disconnect of the ax25 client from node.  I was seeing
this with both 2.2 and 2.4 kernels.  To my knowledge I haven't
seen any of the sporadic ax25 instabilities under 2.4 kernels that
have been reported on this list in the last month or so.  Unless
we have a hardware glitch or a power failure the servers keep running.
I recently had to physically relocate a 2.2 kernel packet server
with just over two years continuous runtime since previous boot,
when the EOC itself relocated across town (Austin TX), and it
was still serving packets and connects to node when I powered it down.
(The 2.4 kernel units have physically not existed that long here).

To my knowledge, there was no memory leak if the telnet facility of
node was not involved.

I am not certain without going back and looking at some of these
servers exactly what version of node this is, but it is a binary/src copy
that SuSe has furnished for several years, and I want to say 0.3.0
or something like that.  I tried running a binary of it just now at the office,
(directly from the command line, not via inbound ax25)
and I guess it doesn't have a -v option to tell me a version number. (hint).
Anyhow, maybe this will give a clue to a possible dormant problem.
I didn't consider the leak a critical problem here due to the fact
that the memory would eventually be recovered by the kernel, so for
me it just fit into the curiousity category to be eventually dealt
with.  If there is a buffer overflow problem lurking about, possibly
the two might even be related, and looking for this problem might
help find the other one.  As far as I am concerned, node is a useful
and fairly solid program, and I plan on continuing to use it.

I have come up with a few locally used hacks to node, one of which is
to facilitate the ***Linked to bbs and network callsign handoff,
and a few other tricks, but probably of limited general interest.
If I knew for sure which was the current revision I could eventually forward
a patch for these things.  I do use the program quite a bit
in our local area, and plan to do so for quite some time.

When I get past the point where the aresdata replacement advances
from a locally used alpha release to a beta, I plan on announcing it here.
For the time being, if anyone is interested, there is some local
documentation concerning its local use and testing on the local
ares website, www.tcares.org, and I think that the name of the
program I have chosen, gnuares, has since found its way onto google.
Again, when it gets a little farther along, I will make it known here.

73 de Bob WB5AOH

