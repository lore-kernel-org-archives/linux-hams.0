From: folkert <folkert@vanheusden.com>
Subject: Re: AX.25
Date: Fri, 14 Feb 2014 21:20:22 +0100
Message-ID: <20140214202022.GW30054@belle.intranet.vanheusden.com>
References: <20140214151927.GU30054@belle.intranet.vanheusden.com>
 <0FBD8E21-31DF-4DC5-9D5F-D6E7D0CC567E@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0FBD8E21-31DF-4DC5-9D5F-D6E7D0CC567E@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt VK2RQ <matt.vk2rq@gmail.com>
Cc: linux-hams@vger.kernel.org

Matt,

Thanks for the reply!

It is very interesting material, this packet radio.
I'll dive into the documentation you've suggested.
So netrom is a bit like bgp if I understand it correctly?

regards

On Sat, Feb 15, 2014 at 04:16:24AM +1100, Matt VK2RQ wrote:
> What you probably want to do is set up NETROM on each Linux machine. Each machine will broadcast a list of the other NETROM nodes it has learned about by listening for NETROM broadcasts from other nodes on its AX25 ports. You can set up the Linux machine to advertise only over internet AXUDP links, or you can also advertise out over the air by including the soundmodem or bayom AX25 port in the nrbroadcast config file.
> 
> You can then use the "call" (or axcall?) command to connect to other machines, and depending on the NETROM routing tables that are built up through the NETROM broadcasts, the connection will be made via the AX25 port with the highest quality connection, whether that be via RF or internet. The "node" software provides a convenient user interface to the NETROM system, so that you can view the NETROM routing table, connect to other machines via AX25 or NETROM connections, etc.. You can also view the NETROM routing table information in /proc/net/nr_neigh and /proc/net/nr_nodes, although this is less user friendly.
> 
> The starting point for setting all this up is here:
> http://tldp.org/HOWTO/AX25-HOWTO/
> 
> There are also some links to various resources on packet radio on my web page, which you may or may not find useful:
> http://www.vk2rq.ampr.org/packet.html 
> 
> 73, Matt VK2RQ
> 
> 
> On 15 Feb 2014, at 2:19 am, folkert <folkert@vanheusden.com> wrote:
> 
> > [ also posted in netdev@vger.kernel.org, this list is probably more
> > on-topic ]
> > 
> > Hi,
> > 
> > In my neighbourhood (the Netherlands) I'm trying to make people
> > enthousiast again for packet radio (AX.25) over CB radio (27mc).
> > 
> > For that I'm setting up a couple of nodes spread out of the netherlands
> > which I want to interconnect over the internet (untill there is enough
> > coverage).
> > Each node has a radio and a pc with a baycom- or soundmodem setup (and
> > maybe in the future these nice tnc-pi devices).
> > 
> > I've been investigating how to do this. For the distribution over the
> > internet there's ax25ipd. Documention is a bit sparse though. Also I
> > could not find how to bridge the ax.25 device of the baycom/sound-modem
> > and the network device brought up by ax25ipd. It does mention bpqether
> > module but from the name (and the modinfo output) I concluded that it is
> > for bridging over ethernet, so not for bridging between two ax.25
> > devices. Also I did not find anything like "ax25_forward" or so
> > underneath /proc (like the /proc/sys/net/ipv4/ip_forward we have for
> > ipv4).
> > I think I read something about interfacing to TNC devices directly by
> > ax25ipd but that won't work with baycom- and soundmodems.
> > 
> > I'm capable of developing my own software, I wrote a network sniffer
> > (in "sysopview") and stuff that creates raw-packets for IP, so how
> > difficult can ax.25 be?
> > 	My plan is: using pcap sniff each packet from the two network
> > devices and then using raw sockets feed them to the opposite interface.
> > Yeah or I could create my own ax25ipd alike program, that does not
> > matter.
> > 	My question is: apart from the design, is this the way to go?
> > Should I indeed inject packets using raw ax25 sockets and retrieve them
> > using pcap? Or also retrieve them using raw sockets? Or is there maybe
> > even ready-made solution that I overlooked during the lengthy google
> > search?
> > 
> > 
> > regards,
> > 
> > Folkert van Heusden
> > 
> > -- 
> > Afraid of irssi? Scared of bitchx? Does xchat gives you bad shivers?
> > In all these cases take a look at http://www.vanheusden.com/fi/ maybe
> > even try it or use it for all your day-to-day IRC conversations!
> > -----------------------------------------------------------------------
> > Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html


Folkert van Heusden

-- 
MultiTail is a versatile tool for watching logfiles and output of
commands. Filtering, coloring, merging, diff-view, etc.
http://www.vanheusden.com/multitail/
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
