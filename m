From: folkert <folkert@vanheusden.com>
Subject: Re: AX.25
Date: Fri, 14 Feb 2014 22:45:13 +0100
Message-ID: <20140214214513.GB30054@belle.intranet.vanheusden.com>
References: <20140214151927.GU30054@belle.intranet.vanheusden.com>
 <52FE509E.20306@trinnet.net>
 <E7E550C2-3CA6-4A6C-BD6F-4B4E1F0FED5C@gmail.com>
 <20140214203326.GY30054@belle.intranet.vanheusden.com>
 <14AFFEA1-EEB9-44A0-A674-9A04F43C4E06@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <14AFFEA1-EEB9-44A0-A674-9A04F43C4E06@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt VK2RQ <matt.vk2rq@gmail.com>
Cc: David Ranch <linux-hams@trinnet.net>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

Yeah you can do whatever you like over CB here.
Not entirely sure about encryption but from what I heard nobody is
monitoring things.

On Sat, Feb 15, 2014 at 07:57:34AM +1100, Matt VK2RQ wrote:
> Well, in Australia running packet radio over CB is illegal except in some very restricted scenarios. But if it is legal in your country, then by all means go for it :-)
> 
> 73,
> Matt VK2RQ
> 
> > On 15 Feb 2014, at 7:33 am, folkert <folkert@vanheusden.com> wrote:
> > 
> > The idea is to setup, to bring back that old hackers-feeling, that you
> > can tinker without anyoing bothering you with rules this rules that.
> > Also no limit on what you're transmitting. I'm focussing on ax.25 now as
> > I found it interesting technology but hey if someone wants to transmit
> > ip; let him do it.
> > 
> >> On Sat, Feb 15, 2014 at 04:43:09AM +1100, Matt VK2RQ wrote:
> >> AMPRnet is a completely different topic, and technically has nothing to do with AX25 (although of course in some cases AMPRnet IP packets may be encapsulated into AX25 frames and transported over AX25 links).
> >> 
> >> The OP didn't really specify the intended use cases for his packet network. If one of the requirements involves transporting or IP traffic, and possibly connecting to the Internet, then this is possible using a private IP addressing scheme with a NAPT function on the internet-facing gateway. Or, if the internet gateway has a block of public IPs available, then these can be distributed and routed around his packet network. As you say, AMPRnet is only for licensed hams, and so is not an option in this case.
> >> 
> >> 73, Matt VK2RQ
> >> 
> >> 
> >>> On 15 Feb 2014, at 4:21 am, David Ranch <linux-hams@trinnet.net> wrote:
> >>> 
> >>> 
> >>> Hello Folkert,
> >>> 
> >>> The AMPR group at http://wiki.ampr.org/index.php/Main_Page and it's email list at 44net@hamradio.ucsd.edu will be the best place to follow up on getting Internet forwarding going.  The one challenge for you will be that the AMPR group is focused for licensed amateur radio (HAMs) who have built extensive, worldwide ax25ipd enabled overlay network.  I don't know if they would give you any IPs unless you and your third party traffic would be coming from licensed HAMs.  I leave that to you to investigate.
> >>> 
> >>> Beyond that previous key point, I don't know in your email if you really intend to use the very old Baycom TNCs (require true 16550 serial UARTS, not USB-to-serial adapters) or you're referring to Thomas Sailers's excellent but deprecated "soundmodem" that used to be hosted on the Baycom website (now gone).  Instead, I encourage you to check out Direwolf which is a vastly superior sound card TNC - http://home.comcast.net/~wb2osz/site/ . Not only does it support superior decoding of 1200 and 9600 packet but also integrated APRS and AGWPE support.
> >>> 
> >>> --David
> >>> KI6ZHD
> >>> 
> >>> 
> >>>> [ also posted in netdev@vger.kernel.org, this list is probably more
> >>>> on-topic ]
> >>>> 
> >>>> Hi,
> >>>> 
> >>>> In my neighbourhood (the Netherlands) I'm trying to make people
> >>>> enthousiast again for packet radio (AX.25) over CB radio (27mc).
> >>>> 
> >>>> For that I'm setting up a couple of nodes spread out of the netherlands
> >>>> which I want to interconnect over the internet (untill there is enough
> >>>> coverage).
> >>>> Each node has a radio and a pc with a baycom- or soundmodem setup (and
> >>>> maybe in the future these nice tnc-pi devices).
> >>>> 
> >>>> I've been investigating how to do this. For the distribution over the
> >>>> internet there's ax25ipd. Documention is a bit sparse though. Also I
> >>>> could not find how to bridge the ax.25 device of the baycom/sound-modem
> >>>> and the network device brought up by ax25ipd. It does mention bpqether
> >>>> module but from the name (and the modinfo output) I concluded that it is
> >>>> for bridging over ethernet, so not for bridging between two ax.25
> >>>> devices. Also I did not find anything like "ax25_forward" or so
> >>>> underneath /proc (like the /proc/sys/net/ipv4/ip_forward we have for
> >>>> ipv4).
> >>>> I think I read something about interfacing to TNC devices directly by
> >>>> ax25ipd but that won't work with baycom- and soundmodems.
> >>>> 
> >>>> I'm capable of developing my own software, I wrote a network sniffer
> >>>> (in "sysopview") and stuff that creates raw-packets for IP, so how
> >>>> difficult can ax.25 be?
> >>>>    My plan is: using pcap sniff each packet from the two network
> >>>> devices and then using raw sockets feed them to the opposite interface.
> >>>> Yeah or I could create my own ax25ipd alike program, that does not
> >>>> matter.
> >>>>    My question is: apart from the design, is this the way to go?
> >>>> Should I indeed inject packets using raw ax25 sockets and retrieve them
> >>>> using pcap? Or also retrieve them using raw sockets? Or is there maybe
> >>>> even ready-made solution that I overlooked during the lengthy google
> >>>> search?
> >>>> 
> >>>> 
> >>>> regards,
> >>>> 
> >>>> Folkert van Heusden
> >>> 
> >>> --
> >>> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> >>> the body of a message to majordomo@vger.kernel.org
> >>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> > 
> > Folkert van Heusden
> > 
> > -- 
> > MultiTail is a versatile tool for watching logfiles and output of
> > commands. Filtering, coloring, merging, diff-view, etc.
> > http://www.vanheusden.com/multitail/
> > ----------------------------------------------------------------------
> > Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com


Folkert van Heusden

-- 
Ever wonder what is out there? Any alien races? Then please support
the seti@home project: setiathome.ssl.berkeley.edu
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
