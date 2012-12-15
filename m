From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: ax.25 localhost?
Date: Sat, 15 Dec 2012 10:26:30 +0100
Message-ID: <20121215092630.GK32411@x-berg.in-berlin.de>
References: <D0195002-701A-4075-88AE-112281619159@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <D0195002-701A-4075-88AE-112281619159@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt VK2RQ <matt.vk2rq@gmail.com>
Cc: linux-hams@vger.kernel.org

On 2012-12-15 15:44:58 +1100, Matt VK2RQ <matt.vk2rq@gmail.com>
wrote in <D0195002-701A-4075-88AE-112281619159@gmail.com>:
> > > is it not possible to an 'axcall' to a call on the local system?
> > 
> > 
> > What kind of AX.25 device are you having axcall use?  My experience is

axcall uses libax25 as abstraction layer.
programs using libax25 use "interfaces" (this kind of thing you see with
ifconfig, ip, etc.). an interface is mostly known from ethernet - and
the configured callsign corresponds to a MAC address. in fact, it mostly
works like talking over ethernet (systemcalls like connect(), listen(),
bind() are the same, and only differs in the AF_TYPE); see socket(5).

There are several ways to get an AX.25 interface. You mentioned bpqether
(which works out of the box and is really cool). It's fast too, because
it runs _inside_ the kernel.
The most usual way is kissattach or spattach over a tty (to outside, i.E.
a TNC, RMNC, etc..). A more special way is to connect software that
speaks kiss to a pty-pair.
pty-operations are much slower than the bpqethernet.
Another approach you mentioned is axip/axudp with the userspace daemon
ax25ipd; ax25ipd can either use serial ports or bpqether interfaces.
Other drivers like soundmodem or special card drivers (which directly
talk to the outer world) create their interface directly.

Unfortunately, the kernel does not have a digipeating functionality inside.
-> These examples do not work:

 ,---- Program A likes to connect over ax0 to Program B
 v
ax0 (spattach)
 ^
 `---- Program B

..because Program B does not see that Program A likes to connect.

Personaly, I'd like to have a loopback interface (inside the kernel)
where each program could directly reach another program.
I've discussed this with Ralf dl5rb. But there were other things in
the kernel which have more priority..

This example does also not work:

 ,---- Program A likes to connect over ax0 to Program B
 v
ax0 (spattach)

ax1 (another spattach)
 ^
 `---- Program B

The interfaces are isolated. Kernel should do l2-digipeating, which is
not build in. There's userspace software like axdigi.

I had some systems where I used the program rxecho, which is kind of
a "bridge" (known from ethernet), but it comes with other problems.

Another approach for bringing these two interfaces together could be a
kernel enhancement for being able to add ax0 and ax1 to a bridge.


Best practise, imho opinion, for a complex mailbox system is currently this:

  +------ Packet-Radio-Digipeater-World (i.E. with flexnet routing protocol)
  |
  |serial or axip/axudp
  +-- xnet (running as userspace process in linux)

  xnet binds to the linux kernel 
    - either over a pty-pair and spattach 
    - or using ax25ipd. This is more performant.
      The communication is axudp and is configured asymmetricaly:
       xnet autoexec.net:
         attach ip0 axUDP 0 1 l9394 d94 127.0.0.1
       ax25id:
         socket udp 94
	 mode tnc
	 mycall db0aaa-10
	 device xnet-eth
	 route db0aaa localhost udp 9394
      The most important line is "device <devicename>". If it does not
      refer a path to a serial port, it assumes tun/tap mode and gets
      from the kernel an ethernet device (which name is xnet-eth, in
      our example).
      To this device, the bpqether module automaticaly binds.
        # cat /proc/net/bpqether 
        dev   ether      destination        accept from
        xnet  xnet-eth   ff:ff:ff:ff:ff:ff  *
      xnet is the name of the ax25-Interface. 


Back to the initial question, if one userspace program could directly
connect to another.
Using the xnet case described above, "program A" could use xnet's
call as l2 digipeater and could connect "program B's SSID" "via xnet's call".

I use xnet, because it does speak natively the flexnet protocol.
I let it also make the connection to the IGATE project (connect ax25-isles over
the internet). Another important thing is, that we could easily connect
to other nodes over our HAMNET (44.x.x.x IP over high-speed wireless-lan links
on 2.3 and 5 Ghz).


The xnet approach has obsoleted my old setup with:
  spattach ttyS0 to the rmnc
  ax25ipd to the igate project
  rxecho, which "bridged" igate/igateb to the rmnc, making it a "direct
  visible neighbor").
  the problem:
    - if user comes via igate and connects to the rmnc, he could not
      connect "backward" (same port on the rmnc) to the programs running
      on the local linux.
    - programs on linux (like the bbs) have to be configured using either
      the path via the rmnc call (to the ax25 hf net) or via the axudp
      linkpartner (igate, hamnet partner, etc).
      If a link is broken, the software had to be reconfigured.

With the new approach, the software has one interface to outside.
The xnet node knows (due to flexnet protocol) if the better path is via
hamnet or via the rmnc (connected to the old-pr-network). And due to the
example for users connecting from outside, there's no "loop" anymore.


Instead of xnet, I'd also may have used software like ka9q net derivate
WAMPES.
There are some small reasons for me why I moved to xnet:
  - WAMPES has a small problem with AX25 mode VC TCP van-jacobsen header
    compression, where connections get stuck (waits a few seconds, until a
    timeout occurs).  I've never found the bug.
  - xnet has a feature called "getip". An ax25 user could issue this
    command, get's a free IP from a pool (like manual dhcp ;) and could
    use this IP address for some time.
  - xnet has a feature for having more than one path to a destination.
    I.e. if you have a link via old-pr and via HAMNET to your linkpartner,
    you configure two ports to this direct linkpartner and flexnet
    uses the faster link. If the faster link goes down, flexnet uses the
    slower one. You do not have to configure another SSID for the link
    partner's second interface.


Sorry for being a bit off-topic. But I've found it useful to describe
approaches and working setups here, also for documenting what's missing
inside the linux kernel.

vy 73,
	- Thomas  dl9sau


> > that BPQ Ethernet won't do anything unless it actually hits an Ethernet
> > device, so I usually use a virtual machine for testing that way.  You
> > could probably set up an AXIP/AXUDP tunnel, but I've never tried it.
> 
> That is exactly what I have been doing. I have a main AX.25 AXUDP device
> which I use to connect to other systems over the local LAN or internet.
> I then created a second AX.25 AXUDP device on my local machine,
> and set up the main AXUDP device to route UDP traffic to this second
> AXUDP device for the callsigns of the BBS, node, etc. running on this
> same machine. I then configured the BBS, ax25d, etc. to listen to the AX.25
> device associated with this second AXUDP instance. When I want to
> connect to the BBS, node, etc. on my own machine, I just call out on
> the main AXUDP device, and the BBS/node/etc. receives the connection
> via the AX.25 interface associated to the second AXUDP instance.
> 
> You can also this with back-to-back AX.25 devices connected via a
> pseudo terminal pair, but I prefer to use AX25UDP so that
> when I call out, I always use the same AXUDP device,
> regardless of whether I am connecting to my own machine or 
> someone else's.
> 
> 73, Matt VK2RQ.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
