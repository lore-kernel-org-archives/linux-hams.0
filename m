From: folkert <folkert@vanheusden.com>
Subject: Fw: Fw: AX.25
Date: Fri, 14 Feb 2014 16:19:27 +0100
Message-ID: <20140214151927.GU30054@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

[ also posted in netdev@vger.kernel.org, this list is probably more
on-topic ]

Hi,

In my neighbourhood (the Netherlands) I'm trying to make people
enthousiast again for packet radio (AX.25) over CB radio (27mc).

For that I'm setting up a couple of nodes spread out of the netherlands
which I want to interconnect over the internet (untill there is enough
coverage).
Each node has a radio and a pc with a baycom- or soundmodem setup (and
maybe in the future these nice tnc-pi devices).

I've been investigating how to do this. For the distribution over the
internet there's ax25ipd. Documention is a bit sparse though. Also I
could not find how to bridge the ax.25 device of the baycom/sound-modem
and the network device brought up by ax25ipd. It does mention bpqether
module but from the name (and the modinfo output) I concluded that it is
for bridging over ethernet, so not for bridging between two ax.25
devices. Also I did not find anything like "ax25_forward" or so
underneath /proc (like the /proc/sys/net/ipv4/ip_forward we have for
ipv4).
I think I read something about interfacing to TNC devices directly by
ax25ipd but that won't work with baycom- and soundmodems.

I'm capable of developing my own software, I wrote a network sniffer
(in "sysopview") and stuff that creates raw-packets for IP, so how
difficult can ax.25 be?
	My plan is: using pcap sniff each packet from the two network
devices and then using raw sockets feed them to the opposite interface.
Yeah or I could create my own ax25ipd alike program, that does not
matter.
	My question is: apart from the design, is this the way to go?
Should I indeed inject packets using raw ax25 sockets and retrieve them
using pcap? Or also retrieve them using raw sockets? Or is there maybe
even ready-made solution that I overlooked during the lengthy google
search?


regards,

Folkert van Heusden

-- 
Afraid of irssi? Scared of bitchx? Does xchat gives you bad shivers?
In all these cases take a look at http://www.vanheusden.com/fi/ maybe
even try it or use it for all your day-to-day IRC conversations!
-----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
