From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: SCC cards
Date: Thu, 30 Dec 2004 16:58:48 +0200
Message-ID: <20041230145848.GC8704@mea-ext.zmailer.org>
References: <33915.203.214.147.100.1104366857.squirrel@203.214.147.100>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <33915.203.214.147.100.1104366857.squirrel@203.214.147.100>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ggb112@rsphysse.anu.edu.au
Cc: Linux-Hams@vger.kernel.org

On Thu, Dec 30, 2004 at 11:34:17AM +1100, ggb112@rsphysse.anu.edu.au wrote:
> Hello all
> 
> I have been playing around with asynchronous serial comms on
> a wireless link for some time now using mkiss. What I really
> need though is a TNC with digital outputs and no need for PTT
> as I do full duplex.
> 
> I could instead try out some synchronous, FEC and HDLC SCC card
> / USART that either plugs into PCI or even the async serial ports
> for modest >~ 100 kbps data rates.

Hopefully you do it at sufficiently high UHF so that it fits
into frequency allocations..

> I see that there is a lot of information implying cards that may
> anwer this descrption on the linux-ham archives. However I am
> confused a bit in that I would like the card to have RS232 output
> voltage levels (or at least TTL/digital). On the contrary I get
> the impression that some of these cards must either plug into
> ADC/DACs to feed HAM radios.

I see your problem.
The thing is:  digital bitstream (that a HDLC speaking interface
can produce) can be used fairly easily to produce a bpsk/gmsk
modulation stream,  but converting that stream back to bits
is whole another kettle of fish..

You want this pipe in transmit side:

  ------       -------------------       --------------
  HDLC | -->-- | FEC+INTERLEAVER | -->-- | modulation | ---> RF
  ------       -------------------       --------------

Doing successfull demodulation out of that stuff will actually
tax heavy DSP even in moderate bitrates so that you will get
correct frame out of it. (A 1 GHz Pentium-III can decode about
30 kbps link speed to data frame.)


There do exist ready-made hardware chips that offer FEC+IL+GMSK
modems (www.cmlmicro.com comes to mind) but they are more or less
proprietary - and for fairly low datarates (narrowish bandwidths, too)
  http://www.cmlmicro.com/products/innovate/docs/Inn990.pdf

Reading CMLMICRO's product pages, it does look like FEC+IL is
something you can't quite so easily get as a stand-alone module,
but CMX589A GMSK modem does exist, there you get:

  ------       --------------
  HDLC | -->-- | modulation | ---> RF
  ------       --------------

Adding FEC+IL in serial form needs looking for some other hardware
source.  Possible to design your own FPGA logic.



In usual ham environment doing packet radio goes over most inefficient
possible link modulation, namely wireline modem produced audio tones
are sent out with FM (of all things!) modulated RF carrier.
On reception you have to have sufficiently high S/N even to demodulate
the FM, let alone the payload signal.

Running the same modem (with same audio interface) over SSB will
allow the link-span to be 3-5 times longer with ease.  Of course
the SSB radios are more expensive/complex than FM ones, and you
won't be getting them out of junk heaps quite to easily...
However careful choice of modulations will allow recycling of FM-only
intended C-class RF power amplifiers for such data radios; namely
the choice will then be GMSK.



These days at these modest bitrates I do suggest using USB interfaced
hardware for the data.  AMD has Am186CC embedded processor with
USB target interface hardware, and HDLC hardware intended for ISDN
BRI applications.


> Any suggestions of make, model and suppliers would be greatly
> appreciated.

Your own lab ?

A box that interfaces with full-speed USB 1.1 to your PC, presents
to the PC a standard communications device profile (so that e.g. Linux
can handle it as standard USB-ethernet, or whatever) and to radio
side it presents 455 kHz or 10.7 MHz IF input and output -- plus
PTT out, RSS in, etc. minor things.

> Gerard Borg

/Matti Aarnio - OH2MQK
