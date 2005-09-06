From: Bob Morgan <wb5aoh@wb5aoh.dyndns.org>
Subject: ax25ipd UDP mode documentation
Date: Tue, 6 Sep 2005 18:54:02 -0500
Message-ID: <17182.11291.163355.614676@halvor.tensleep.com>
Reply-To: wb5aoh@wb5aoh.dyndns.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


Well, for several years, I have had a nagging problem getting the udp mode
of ax25ipd to work at all.  Yesterday I finally hacked my way through
it with use of strace and reference to various parts of the source,
and lots of trial and error.  It turns out to be a documentation problem,
I didn't have to change any code, just the .conf file.

Just now, Ralf posted a request for improvements to ax25-howto, and this
may fit in with that also.  Ralf, I can take the ax25ipd portion of ax25-howto
and edit it with this newer material if you like, but I guess I need to
know where the recent official copy of it lives.  (I might even redo
the ax25ipd manpage, but I would have to figure out how to do the
manpage editing.  I haven't done anything with manpages before except READ them.)

Continuing with the matter of running udp transport with ax25ipd:
For various reasons, here centered around a simplistic DSL masquerading
modem/router, I have a need to actually make the udp mode work.  The dsl box
allows me to masquerade a few tcp and/or udp ports through it to various
hosts on its lan, but it doesn't allow me to masquerade any other protocols,
such as axip # 93 for instance.  The only other option is to demasquerade
the whole thing and expose the lan to the internet, which I am not
in a position to do with this particular lan.  And I have a few other reasons
as well that amount to experimentation with other gadgets that I would like
to interconnect with ax25 and they also only have tcp and udp hooks, not ip.

So, with the existing documentation I have been able to find, namely
the ax25-howto, and the .conf file and some things that come with
the ax25ipd tarball, anytime I configured it for udp, absolutely
nothing happened.  It just swallowed up the packets and never threw
any udp packets out onto the lan.  What isn't mentioned in the docs is
that in addition to setting the udp option in the socket definition near
the top of the .conf file, one must ALSO specify a udp option on the
tail end of EACH routing line in the routing section near the end of
the .conf file.  It didn't tell me that, and the source didn't really
help much, until I did a lot of trial and error with strace
running, and I satisfied myself where routing was getting lost, and then
after more trial and error, I eventually found what the config parsing
wanted to see to set the flags that the routing processing wanted.

When I added a udp option to the end of all of the route definitions,
it started working.  It doesn't say this anyplace that I have found.

The code in the config parsing routines looks at first glance like some
flags (b and d) might not parse in combination with the udp option.
I didn't pursue or test that possibility any farther, although
I think it needs to be looked at.  That's a TODO or FIXME item.

It also happens to be possible to listen on one udp port, and send
udp packets to the far end under some other port number, although that
would be a weird asymetrical routing situation that not very many
situations would ever need.  It turns out that the default udp port number
of 10093 can be overridden by specifying some other port number just
after the udp option on the end of either the socket or the route definitions.

The socket definition sets the udp listen port, and also the source port
on outgoing packets, so the other end knows what the return address/port is.
The route definition sets the udp destination port for each route.
Leaving off the udp option on a route leaves the packets in no-mans-land
and they disappear entirely if udp socket has been defined.  I think
that is actually a bug, but anyway that is what it does.

Of course, by specifying other ports on both socket and routes, some
other udp port number can be used if necessary, in case some combination
of firewalls and routers only allow some specific ports through.
It is quite flexible it looks like, if one finds out how to set it up.

Previously I also had to use some different param definitions to implement
a higher speed modem on a tnc that I was feeding with one end of ax25ipd,
and I have also documented how to specify the various params in the
.conf file.  They follow straight from the kiss definition itself.
I also have encountered a situation a few times where the tnc gets
reset while ax25ipd is running unaffected, and at that time, the tnc
restarts with some default params of its own which may not be optimum,
particularly if some params are deliberately set up in the .conf file.
I then have to do things like stop and restart ax25ipd, or maybe
disconnect the serial port from the tnc and send it some params
from some other device, or maybe a kill -s SIGHUP <pid> to ax25ipd
would accomplish the same thing.  I think I vaguely recall that others
have also observed that behavior.  Maybe the workaround is to use
a cronjob to periodically send the SIGHUP, but the real fix is to code
up a periodic broadcast params patch in ax25ipd to refresh a tnc.
(Or has this been done in later revisions of ax25ipd, I am not sure?)

I also added a little blurb on how to set up pipes to kissattach,
what naming conventions, which to start first and last, etc.
I think that Tomi recently had a short blurb on that in the last
few months, although I don't remember if it involved ax25ipd or
something else piped to kissattach.

So, below I have pasted in the relevant portions of my ax25ipd.conf
file where I have showed a few more examples and comments.
I am testing this against 1.0.2/0.0.5, and also I think 0.0.4 of ax25ipd.
I do have it working on a couple pair of boxes, but only for a day or
less, so it isn't extensively tested yet.  I have had ip mode running on
one pair for several months and it is otherwise just fine, I just swapped
it over to udp mode a few hours ago and it works.
I hope this helps someone else out.  Read on...

73 de Bob WB5AOH
(wb5aoh at arrl.net)



---PARTIAL of ax25ipd.conf, showing udp, pipes, tnc params docs and examples---
#
# ax25ipd configuration file for station halvor.wb5aoh.ampr.org
#
#  start up as:
#    ax25ipd -c /etc/ax25/ax25ipd.conf
#    ax25ipd -c /etc/ax25/ax25ipd-1.conf
#
# Select axip transport. 'ip' is what you want for compatibility
# with most other gates ...
# For situations with evil firewalls and simplistic dsl/cable modem
#  masquerading routers that won't/can't pass/masq ip protocol 93, you may
#  have to instead use udp at all endpoints of your ax25ip network.
# It isn't possible to mix ip and udp in the same network, but it
#  may be possible to run more than one copy of ax25ipd, and start them
#  with -c options pointing to different copies of ax25ipd.conf,
#  also probably sourcing them with separate ax25 kissattach pipe ports.
#
# socket <ip | udp [udp_orig_port_num] >
#
# note for udp: default port number is 10093 if not specified otherwise.
#  additional note: this is the port number we LISTEN on for udp,
#  and for which outgoing packets are marked with as the originating port.
#
#socket ip
#socket udp
socket udp 10093
#
---SNIP---

#
# Serial port, or pipe connected to a kissattach in my case
#
# Note for kissattach and pipes: kissattach needs to be the master end
# and will attach to pipes of the form /dev/ptyq0 ...
# AX25IPD needs to attach to slave end of pipes of the form /dev/ttyq0 ...
# Note also that kissattach to these master ends needs to be executed
#  first in startup scripts and left up forever, and that ax25ipd needs to
#  be executed later on, and may be possibly stopped and restarted if necessary
#  without disturbing kissattach or the master end of the pipe.
#
#device /dev/ttyq0
device /dev/ttyS0
#
---SNIP---

#
# We might have a real tnc here, so use param to
# set the tnc parameters ...
#
# Possible problem: a real tnc may reset/powercycle and lose params while
#  system/ax25ipd continues to run, and it will revert to some non-optimum
#  default params of its own choosing, and it may be necessary to
#  stop/start/SIGHUP ax25ipd to re-output these params.
#  Cronjob workaround maybe?  bugfix: periodic param broadcast to tncs.
#
# (from kiss original spec)
# param 1 is txdelay, 10 mSec units
# param 2 is P, 0-255 for p=0-1.0
# param 3 is slottime, 10 mSec units (or just dwait if P=255)
# param 4 is obsolete txtail, 10 mSec units
# param 5 is hdup/fdup, hdup=0, fdup!=0
# param 6 is tnc specific parameter
#param 1 20
# these are for my tprs 9600b fsk modem:
param 1 10
param 2 192
param 3 4
#
---SNIP---

#
# ax.25 route definition, define as many as you need.
# format is route (call/wildcard) (ip host at destination)
# ssid of 0 routes all ssid's
#
# route <destcall> <destaddr> [flags]
# route <destcall> <destaddr> [udp [udp_dest_port_no] ]
#
# note for udp: if you specify udp above in socket definition,
#  you MUST specify all udp routes here also, or it won't work.
#   (It will silently drop the outgoing packets internally.)
#  Also it IS possible to transmit to a different UDP port number
#  than the one we listen on, if some peculiar asymetrical routing
#  situation needed to be satisfied.  Default udp port is 10093.
#  Parsing might not work for flags in combination with udp?
#
# Valid flags are:
#         b  - allow broadcasts to be transmitted via this route
#         d  - this route is the default route
#
#route vk2sut-0 44.136.8.68 b
#route vk5xxx 44.136.188.221 b
#route vk2abc 44.1.1.1
#
#route wb5aoh-0 192.168.254.199 b d
#route wb5aoh-0 192.168.254.199 udp
route wb5aoh-0 192.168.254.199 udp 10093
#
---END---

