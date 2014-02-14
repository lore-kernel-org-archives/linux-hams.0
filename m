From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Fw: Fw: AX.25
Date: Fri, 14 Feb 2014 09:21:34 -0800
Message-ID: <52FE509E.20306@trinnet.net>
References: <20140214151927.GU30054@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20140214151927.GU30054@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: folkert <folkert@vanheusden.com>, linux-hams@vger.kernel.org


Hello Folkert,

The AMPR group at http://wiki.ampr.org/index.php/Main_Page and it's 
email list at 44net@hamradio.ucsd.edu will be the best place to follow 
up on getting Internet forwarding going.  The one challenge for you will 
be that the AMPR group is focused for licensed amateur radio (HAMs) who 
have built extensive, worldwide ax25ipd enabled overlay network.  I 
don't know if they would give you any IPs unless you and your third 
party traffic would be coming from licensed HAMs.  I leave that to you 
to investigate.

Beyond that previous key point, I don't know in your email if you really 
intend to use the very old Baycom TNCs (require true 16550 serial UARTS, 
not USB-to-serial adapters) or you're referring to Thomas Sailers's 
excellent but deprecated "soundmodem" that used to be hosted on the 
Baycom website (now gone).  Instead, I encourage you to check out 
Direwolf which is a vastly superior sound card TNC - 
http://home.comcast.net/~wb2osz/site/ . Not only does it support 
superior decoding of 1200 and 9600 packet but also integrated APRS and 
AGWPE support.

--David
KI6ZHD


> [ also posted in netdev@vger.kernel.org, this list is probably more
> on-topic ]
>
> Hi,
>
> In my neighbourhood (the Netherlands) I'm trying to make people
> enthousiast again for packet radio (AX.25) over CB radio (27mc).
>
> For that I'm setting up a couple of nodes spread out of the netherlands
> which I want to interconnect over the internet (untill there is enough
> coverage).
> Each node has a radio and a pc with a baycom- or soundmodem setup (and
> maybe in the future these nice tnc-pi devices).
>
> I've been investigating how to do this. For the distribution over the
> internet there's ax25ipd. Documention is a bit sparse though. Also I
> could not find how to bridge the ax.25 device of the baycom/sound-modem
> and the network device brought up by ax25ipd. It does mention bpqether
> module but from the name (and the modinfo output) I concluded that it is
> for bridging over ethernet, so not for bridging between two ax.25
> devices. Also I did not find anything like "ax25_forward" or so
> underneath /proc (like the /proc/sys/net/ipv4/ip_forward we have for
> ipv4).
> I think I read something about interfacing to TNC devices directly by
> ax25ipd but that won't work with baycom- and soundmodems.
>
> I'm capable of developing my own software, I wrote a network sniffer
> (in "sysopview") and stuff that creates raw-packets for IP, so how
> difficult can ax.25 be?
> 	My plan is: using pcap sniff each packet from the two network
> devices and then using raw sockets feed them to the opposite interface.
> Yeah or I could create my own ax25ipd alike program, that does not
> matter.
> 	My question is: apart from the design, is this the way to go?
> Should I indeed inject packets using raw ax25 sockets and retrieve them
> using pcap? Or also retrieve them using raw sockets? Or is there maybe
> even ready-made solution that I overlooked during the lengthy google
> search?
>
>
> regards,
>
> Folkert van Heusden
>

