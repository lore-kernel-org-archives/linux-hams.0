From: Dave Platt <dplatt@radagast.org>
Subject: Re: Linux Packet Interface Hardware
Date: Tue, 15 Jun 2010 19:05:29 -0700
Message-ID: <4C183169.3060206@radagast.org>
References: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jim Kusznir <jkusznir@gmail.com>
Cc: linux-hams@vger.kernel.org


> I know one solution is to get modern TNCs (such as the PK-96, etc),
> and either put them in kiss mode or replace the rom with a KISS-only
> rom.  I know that linux can do sound card packet as well.  However,
> I'm wondering if there's something inbetween.  I'm not entirely
> against the sound card TNC option, but have some questions as to the
> robustness and performance of such a system.  Also, its likely in my
> implementation that I'd be using usb audio adapters to provide the
> sound card.  And I want to do 9600 baud with them.  Of course, there's
> also the how-to-key-the-transmitter problem as well.
> 
> I see in the linux kernel support for YAM and some others; are any of
> these viable solutions?  Anything else to recommend?

Just some comments, based on my own fiddling-around over the past
few years.

First meta-comment:  I'd strongly suggest that you review the information
at

	http://www.scc-ares-races.org/packet.html

and consider getting in touch with Michael N6MEF and Fish K6FSH, two
of the lead packet guys in our area.  They and others have been doing
a really major re-work of the packet network that we use for ARES/RACES
support here in Santa Clara County... upgrading from a single BBS to
a multi-node backbone, switching to newer TNCs and radios, and using
Linux for a lot of the infrastructure.  We're also making a lot of use
of the "Outpost" front-end software developed for us by Jim KN6PE
(written up in QST in April of last year)... this does not run natively
on Linux, alas (I'm considering both WINE and VirtualBox solutions, as
well as a native Outpost work-alike of some sort)

I've used traditional command-line TNCs with Linux, as well as KISS-mode
(both a TNC-2 with a KISS-only replacement ROM, and a TNC-X), and
have used soundmodem in several versions on several different PCs.  Each
has its advantages and disadvantages.

Using the Linux AX.25 kernel stack can be immensely convenient, since
it allows you to drive many different sorts of TNCs, and to write
all sorts of Linux-based AX.25 clients and servers in almost any
language you want.  It ought to be possible (for example) to write
a sophisticated packet-radio client or gateway in Perl.

However, using the kernel AX.25 stack is not without its gotchas.

There seems to be a quirk in the way that the kernel handles
AX.25 connection timers, which I think may lead to less-than-ideal
behavior under conditions of network congestion.  The quirk is
this:  the T1 (lost-packet retransmit) timer is started at the time
that the kernel's packet layer hands the current set of frames off
to the driver (hardware or KISS) to be transmitted... *not* at the
time when the driver has actually transmitted them.  Under congested
network conditions, this can result in the T1 timer expiring before
the frames have even been transmitted by the radio... and this leads
to possibly-unnecessary frame retransmissions.

As I read the code, this is going to affect *all* AX.25 packet
drivers.  I think it *might* be possible to correct it for those
packet drivers which actually interface directly with the radio
hardware (e.g. Baycom, Z8560SCC) and for 6Pack.  I don't think
it's possible to correct it at all for KISS, since the KISS protocol
doesn't include any sort of "OK, I sent it!" feedback from the TNC
to the host.

This is an annoyance, but probably not a severe problem... the
kernel's code to estimate round-trip time (and adjust the T1
timer setting accordingly) ought to adapt to the presence of
congestion, use a longer T1 timer in the future, and the extra
retransmissions will not occur (or will occur less frequently).

Now... as far as specific modem/TNC types and hookups go...
you've got a bunch of choices.

Probably the most obvious is the first you've considered...
KISS hookups to traditional TNCs, over serial ports.  Clean,
simple, pretty scalable (you may want something like an
8-serial-port USB adapter), and your transmission and reception
quality will be as good as each TNC's modem will provide.  You
may be able to re-use many of your existing TNCs for this,
and keep the cost down.  This is probably the most straightforward
approach.

A variant on this would be talking to a bunch of TNCs over
a single serial port using 6Pack.  I don't know how many TNCs
support this protocol, though.

TNC or radio interfaces which require tight CPU interaction
with the hardware (e.g. Baycom) are probably a Really Bad
Idea for your application... not scalable.

Running multiple soundmodems, over multiple sound interfaces...
yes, this should be possible.  For 1200-baud AFSK, most decent
sound interfaces ought to work reasonably well once you get the
levels set properly.  Using USB audio adapters may well work
OK... I don't know how many a single USB interface will be able
to support without suffering from dropouts or other glitches.
You might need to hack on the soundmodem code in order to
provide some sort of shared-PTT capability (e.g. setting
individual bits on the parallel port) to control individual
radios' PTT lines).  You could probably use multiple SignaLink USB
adapters - these seem to have good audio quality, and have their
own built-in VOX-based PTT circuit.

You'll want to use the ALSA drivers for talking to such USB
audio devices.  Make sure you've got a current version of the
soundmodem program (0.13, I think?) - older versions didn't
implement all of the "start" and "stop" calls in the ALSA API
quite right, and could lock up on some ALSA devices.

For 9600-baud... well, you'd be on more uncertain territory there.
I don't think the 9600-baud FSK support in the soundmodem has been
used anywhere near as much as the 1200-baud support, and I haven't
heard anything about its actual performance.  I understand that
9600 FSK requires very flat frequency response of the data channel
(down to fairly near DC), and simple USB-audio adapters designed
for driving headphones may roll off at too high a frequency due
to too-small DC-blocking capacitors.  VOX-based PTT control might
not work well (hard to get the hang-time adjusted properly, to
allow fast turnaround of the radio channel, without dropping
out inappropriately).

Do consider the fact that each soundmodem process is going to
be chewing up CPU cycles constantly (well, when receiving, at
least) even when there's no traffic.  A good modern CPU can
probably handle quite a few of these (e.g. an Atom) but
at the cost of using somewhat more electricity than if the CPU
were idling and just waiting for input from a KISS TNC.  This
might or more not be more power than a stack of TNCs would use.

The soundmodem code does have one AX.25 quirk you ought to be
aware of.  When sending two or more AX.25 frames in a single
transmission, it tends to violate the recommendation in section
2.2.11 of the AX.25 spec:

  2.2.11 Interframe Time Fill

  Whenever it is necessary for a DXE to keep its transmitter on while
  not actually sending frames, the time between frames should be filled
  with contiguous flags.

The actual behavior of the soundmodem is to send one flag at the
end of the current frame, then insert between zero and seven 0-bits,
and then send another flag to begin transmission of the next frame.

This has the effect (seven times out of eight) of inserting a short,
invalid frame between two good ones.  Most TNCs will simply detect the
runt frame and silently discard it.  A very few (e.g. the TNC-X with
its original firmware) will lose HDLC sync, won't be re-sync'ed properly
by the second flag, and will end up missing the second real frame.  I
understand that the revised firmware for the TNC-X is better at handling
these not-quite-as-recommended AX.25 transmissions by the soundmodem.

I hope that this semi-random brain dump has been of some slight use!

73,

	Dave AE6EO

