From: Dave Platt <dplatt@radagast.org>
Subject: Re: 300bps Packet (and EHAS) - what is pam, psk, and newpsk,
Date: Thu, 25 Nov 2010 22:57:52 -0800
Message-ID: <4CEF5A70.4050600@radagast.org>
References: <4CEB5074.2070008@complete.org> <4CEB5C66.1050803@exemail.com.au> <6CE4D96A7B544D30919A49105B458915@LIVINGROOM> <4CEC16EF.8060106@radagast.org> <BD133160888F43CA9735B652903C2FF1@LIVINGROOM> <4CED5B60.5040108@radagast.org> <40C75B79D58C4ECDBC044010559CE8CA@LIVINGROOM> <4CEEB394.3020305@trinnet.net> <CF65928CBF594B608362298FFC1B9470@LIVINGROOM> <4CEF444F.6010308@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CEF444F.6010308@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: linux-hams@vger.kernel.org


> fsk - I know what FSK is but what does it mean in respect to soundmodem?
> My Yaesu FT-950 supports an FSK input and my US Interfaces Navigator
> device does FSK too but how would soundmodem use it? Seems it's slowest
> speed is 4800Bits/sec.

FSK is the common way of doing AX.25 packet operations at 9600
baud.  In this mode, the voltage coming out of the sound card's
line output is fed fairly directly to the modulator in the radio...
a positive voltage shifts the RF frequency in one direction, a
negative voltage shifts it in the other.  This mode of hookup and
operation requires a radio-to-rig connection with very good
low-frequency response (down to DC or close to it is ideal),
and very careful adjustment of the sound-card volume control
in order to adjust the maximum signal level (and thus the
peak FM deviation) fairly precisely.

If I understand correctly, the soundmodem FSK mode (when properly
adjusted) should be compatible with the G3RUH 9600-baud
modem designs.

> pam - what is pam?

Sounds to me like Phase and Amplitude Modulation, in which
the bits being transmit control both the amplitude and the
relative phase of the carrier signal.  QAM (quadrature
amplitude modulation) is a common form of this... a signal
might transmit three or four bits for each symbol, with
two bits controlling the relative amount of phase shift
from the previous symbol, and another one or two bits
controlling the amplitude.

I don't know the details of the soundmodem's PAM.  From
what I see in the code, it appears to be doing some
filtering or convolution in the process of converting
the bits to the symbols being transmitted, and some
maximal-likelihood decoding upon reception.

I assume that one would use it as the other modes would
be used... set up two soundmodems with compatible
configurations and start transmitting, and then see how
well it works.

> psk - I know what PSK is and I use the BPSK31 mode in Fldigi but what
> would soundmodem do with it in respect to a packet mode?

See above...

> 
> newqpsk - I know what QPSK is and I've used the QPSK31 mode in Fldigi
> (has forms of FEC enabled on it) but what would soundmodem do with it in
> respect to a packet mode? Seems it's slowest speed is 1000Bits/sec.

This one looks rather interesting, in that it seems to incorporate
symbol interleaving and forward error correction.  This might
make it more robust in the face of some sorts of errors.

> I would love to learn what these modes do, are they stable, and maybe
> these modes could be used as a strong alternative to trying/failing
> 300BAUD HF packet.

There's a bit of a gotcha in the regs (in the U.S. at least) in that
most HF bands limit data transmissions to baud rates of no
more than 300 (or an FSK frequency shift of no more than 1 kHz).
Using a 1000 or 1200 baud QPSK would not be permissible on
frequencies below 10 meters, I think.

An alternative might be to use a multi-carrier HF digital
mode - one which sends a bunch of different carriers,
each modulated at a relatively low rate.  Some of the
keyboard-to-keyboard HF digital modes work this way...
but I'm not aware of anyone having used those modulations
as ways of wrapping an AX.25 or IP packet for HF digital
use.


