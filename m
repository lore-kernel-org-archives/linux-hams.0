From: Chuck Hast <wchast@gmail.com>
Subject: Re: YAPP File Transfer with Linux
Date: Wed, 13 Jul 2005 10:41:18 -0400
Message-ID: <620c905705071307411896cb52@mail.gmail.com>
References: <MAEBLGENFLMMCIMBCMPOEEJOCKAA.la6gha@robenel.com>
	 <Pine.GSO.4.61.0507131342520.12837@vipunen.hut.fi>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.GSO.4.61.0507131342520.12837@vipunen.hut.fi>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: oh2bns@sral.fi
Cc: linux-hams@vger.kernel.org

On 7/13/05, Tomi Manninen <oh2bns@sral.fi> wrote:
> On Wed, 13 Jul 2005, Robert Eliassen wrote:
> 
> > Avoiding the AX.25 overhead is close to impossible. But it should be
> > possible to skip netrom and load TCP/IP right into the info-field of an
> > AX.25 frame. Fragmented of course. But... Having double ACK (both AX.25 and
> > TCP) is bad and a waste of bandwidth.
> 
> This is how IP over AX.25 works. You have the choise of using connected or
> unconnected mode AX.25. Unconnected (UI) has the advantage of lower
> overhead and avoiding double ack's but connected mode gives you lower
> packet loss (as visible to TCP). Relying solely on the TCP retransmissions
> with it's exponential backoff is a quick way to frustration. The
> non-TCP/IP band users will steal your bandwidth as they are running linear
> or no backoff and in general much more aggressive timers.
> 
> > Another problem is the routing. It would be possible to rewrite the
> > ARP-protocol and replace hardware addresses (MAC) with callsigs. And of
> > course we would need to broadcast the ARP protocol...  Unconnected <UI>
> > frame mode perhaps... (starting to sound like netrom)
> 
> Callsigns are used in ARP over AX.25. Broadcasted as UI frames, destined
> to the AX.25 address "QST".
> 
> > But the double ACK problem is still unsolved.
> 
> Actually the ACK'ing isn't all that bad. What's bad is retransmissions on
> several layers. On a busy or lossy channel, when using connected mode
> AX.25, you quickly get in to the situation where you have TCP
> retransmissions in your AX.25 send queue, while the original data hasn't
> even been transmitted yet.
> 
> There used to be a re-write of the linux AX.25 stack around, based on work
> done in the Flexnet project I think (?), that had a few quite clever
> tricks in it. By using connected mode AX.25 to transport IP frames, they
> could for example use VJ compression to squeeze out some of the IP header
> overhead. But also they had a mechanism that purged any duplicate TCP
> retransmissions from the AX.25 send queue. I never got around to test it
> but reportedly it worked quite well.
> 
> Unfortunately the so called NEWAX25 stack died because of loss of
> time/interest of the original authors. :(
> 
> > Another question: There is no length-field in an AX.25-frame, right? The
> > payload is wrapped in 01111110-flags if I remember correct. So in theory we
> > can transmit fullsize IP-frames (1500 bytes), in a single AX.25-frame ?
> 
> Yes. You might get some negative feedback from other users though. At
> least in the past some AX.25 stacks didn't quite like seeing such
> oversized frames and crashed... But I guess that is history now.
> 
> > But I guess all this has been discussed years ago.  :-)
> 
> Yes. Discussed and implemented (in KA9Q NOS) about 20 years ago. :)

Some years back we had some links that we ran IP over ROSE, we used
TNOS boxes on each end of the path to talk to the network, we took advantage
of the fact that ROSE handled the 'M' bit such that you could hand a IP frame
in fragments to the network and it would rebuild the thing on the far end and
pass it on in it's original state. ROSE did so quite elegantly, and it's follow
on FPAC does the same thing quite well
It appears that the ax25 implementation will allow for frame sizes of up to 512
bytes, and it will also appears to allow for extended ax25 i.e. module
128 rather
than modulo 7, and by going to modulo 128 you can then run selective reject.

I would think that on good paths a combination of the above should be able to
give some impressive results. Combining that with FPAC should make it run even
better if the testing we did with the older ROSE and max 7 frames with
no selective
reject worked so well. As we replace the old network here in Florida I
hope to give
some of this a try. too bad the newax15 did not prosper, it sounds like it may
have been a good move.

Using KISS TNC's talking with TNOS boxes I have tested the sending of 1500 byte
packets, it worked just fine and that was back 10 - 12 years ago,
using tek radios
at 9k6 b/s

One thing that both ROSE and FPAC do is extend the size of the level 3 frame in
order to avoid taking space from the 256 bytes of bearer space unlike NetRom, so
we did not have to worry about that issue when passing IP over ROSE/FPAC
links. But indeed some tnc's even did not like to see the large frames, too bad
that that some were short sighted in this area. The use of the 'm' bit
reduced the
IP over head to just the first frame of the series of frames that made
up the larger
IP frame. It was neat to watch it on a monitor screen, indeed the monitor screen
on TNOS and I am pretty sure JNOS would show those segements arriving and
show the segemnt number count down as they arrived. 

You know I miss that stuff, it was fun...

-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
