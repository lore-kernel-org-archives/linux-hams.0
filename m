From: Tomi Manninen <tomi.manninen@saunalahti.fi>
Subject: Re: 300bps Packet (and EHAS) - what is pam, psk, and newpsk,
Date: Fri, 26 Nov 2010 10:55:17 +0200 (EET)
Message-ID: <12761036.9749981290761717844.JavaMail.tomi.manninen@saunalahti.fi>
Reply-To: oh2bns@sral.fi
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="Flowed"
To: linux-hams@vger.kernel.org

David Ranch [linux-hams@trinnet.net] kirjoitti: 

> It's interesting you bring up the newQPSK setting. I've never found any 
> comprehensive documentation on soundmodem and what some of these other 
> modes are. Do you know? Anybody else on the list know or could comment?

Tom would know best but I don't know if he reads this list anymore (?).

> fsk - I know what FSK is but what does it mean in respect to soundmodem? 
> My Yaesu FT-950 supports an FSK input and my US Interfaces Navigator 
> device does FSK too but how would soundmodem use it? Seems it's slowest 
> speed is 4800Bits/sec.

This modem implements what is typically known as G3RUH modulation 
(other callsigns seem to be assosiated with it as well, but James' is
most familiar to me at least :)

The modem is actually a binary PAM modem (Pulse Amplitude Modulation),
ie. it outputs the data as voltage pulses. When these are fed to an FM
modulator, the resulting signal on RF is FSK modulated. Hence the name.

Of course there are other features that make this modem G3RUH - like
the way the data is scrambled before modulation etc.

> pam - what is pam?

See above. This modem seems to do a fairly simple
modulation of the data to PAM, adding a training sequence in front of
the data packet. The demodulator seems to use maximum likelihood
estimation for the channel response.

This is probably intended to be used the same way as the fsk modem,
ie. connected to a FM radio, resulting in FSK on air. The idea being that
this modem might allow faster data rates or better performance.
My guess this modem is Tom's original work and probably not
compatible with anything else.

> psk - I know what PSK is and I use the BPSK31 mode in Fldigi but what 
> would soundmodem do with it in respect to a packet mode?

Possibly similar to the above PAM modem but with PSK modulation.
Intended to be connected to a SSB radio (SSB maps the PSK on
audio to PSK on RF).

> newqpsk - I know what QPSK is and I've used the QPSK31 mode in Fldigi 
> (has forms of FEC enabled on it) but what would soundmodem do with it in 
> respect to a packet mode? Seems it's slowest speed is 1000Bits/sec.

Now this one I really know. No need for guesswork as I wrote the code :)

This modem is also known as Q15X25, newqpsk being the original
name that Pawel, SP9VRC (of MT63, Olivia etc. fame) gave his invention.

The modulation uses 15 carriers with differential QPSK, three level FEC and
a two-phase preamble for frequency/timing sync. It's intended to be 
connected to an SSB radio. Note that while soundmodem
allows various bitrates, only 2500 and 3000 are supported by the original
implementation (on DSP56002EVM) and I really don't recommend
anything else.

> I would love to learn what these modes do, are they stable, and maybe 
> these modes could be used as a strong alternative to trying/failing 
> 300BAUD HF packet.

Newqpsk was intended as a HF packet replacement. I used it a lot on
80m and in my experience the performance was good. However others
have had worse luck. After the modem was added to MixW I got a
lot of complaints that it didn't work at all. I never figured out what 
the problem was but one thing is that the modem seems to be quite 
sensitive to samplerate errors. Also the modem shares a lot with MT63
and many of the caveats about signal levels etc. apply.

It's long since I've last used newqpsk (and actually any of the modems)
and there might be better ones out there these days. I'm not really
in touch with the scene anymore :)

/Tomi

