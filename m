From: Nate Bargmann <n0nb@n0nb.us>
Subject: Re: Netrom
Date: Tue, 9 Jul 2013 22:17:28 -0500
Message-ID: <20130710031728.GI16655@n0nb.us>
References: <20130708115635.A4B233700A5@n1uro.ampr.org>
 <51DABEDA.8020905@junglevision.com>
 <1373314487.13641.19.camel@n1uro.ampr.org>
 <51DB9383.1050304@junglevision.com>
 <1373371546.6646.26.camel@n1uro.ampr.org>
 <20130709223429.GD18314@x-berg.in-berlin.de>
 <51DCC209.8080006@junglevision.com>
 <51DCC337.9030204@junglevision.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51DCC337.9030204@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

* On 2013 09 Jul 21:15 -0500, Cathryn Mataga wrote:
> On 7/9/13 7:08 PM, Cathryn Mataga wrote:
> >On 7/9/13 3:34 PM, Thomas Osterried wrote:
> >>((255*255)+128)/256 = 254 => It does decrease on the next hop
> >>and behind.
> >
> >
> >
> >Oops, you're right.  So what about this situation.
> >
> >A -- B   -- C
> >         \   /
> >           D
> >
> >
> >If A sends a broadcast to B.   The link from B back to A should
> >decrease the 'obsolete' value with each broadcasts.  But can the
> >listing loop around from C to D back to B?
> >
> >But the loop of death should eventually run out of gas when the
> >quality hits 0.  So, how are all those nodes sticking around for
> >years and years.  Even if misconfigured, can Netrom do this all by
> >itself.  Hmm.
> >--
> 
> Err, if A sends a broadast to B and then disconnects.

It has been a long time, nearly 20 years since I worked with NetROM, but
I do recall this.  Broadcasts are AX.25 UI (unconnected) packets and are
sent to the destination of NODES, at least that is what I recall of the
original NetROM, early TheNet, and G8BPQ nodes.  So Node A in this case
does not "disconnect" nor does it ever send its nodes list as part of
the connected level 2/level 3 session.  Even when there was a level
2/level 3 connection between nodes, the nodes broadcast was a UI packet
typically broadcast every 60 minutes often refered to as "node barf" by
some who didn't care to understand about their operation.

Most of us ran the nodes at the firmware default values although I'm
sure somebody tweaked things for better performance.

Actually, while NetROM was deployed on a single frequency in many areas,
particularly here in Kansas, Oklahoma and Nebraska due to financial
constraints, doing so really hurt performance.  As I recall, the system
was really designed to be sort of a cellular system with neighboring
user nodes on separate frequencies tied together by a common higher
speed backbone and coordination used to isolate user nodes.  However,
out here in the sticks, just getting one node on the air was an
accomplishment let alone doing it right.  But that is a topic for
another time.  In this scenario, user nodes would not send a nodes
broadcast on their radio port but would over the RS-232 port which is
how back-to-back and node stacks were built (three or more TNCs were
tied via a diode matrix to each other's RS-232 port to build a stack),
thus eliminating node barf from being seen by the users.

Once upon a time I had a Software 2000 NetROM manual that described a
lot of the protocol.  I have no idea if the authors of the Linux NetROM
code had access to that document or any other reference.  After years of
watching it, even when I had access to a NetROM network with a backbone,
NetROM seemed to fall apart after more than about three or four hops.
The most reliable way to make BBS forwarding work was to script the
connection through each node to the next manually as then a weaker path
would retry more often at level 2.  Otherwise, connecting to a distant
node a few hops away would result in level 3 timeouts from the first
node and kill the connection.  The nodes had no ability for true store
and forward and did not behave like routers.  

All of this is a bit hazy in my memory.

73, de Nate >>

-- 

"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."

Ham radio, Linux, bikes, and more: http://www.n0nb.us
