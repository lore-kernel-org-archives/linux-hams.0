From: Jonathan Naylor <jonathan.naylor@ggaweb.ch>
Subject: Re: JT44 on Linux
Date: Wed, 14 Aug 2002 15:05:32 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <02081415053208.00798@g4klx>
References: <Pine.HPX.4.10.10208141518580.21861-100000@saturn.trs.ntc.nokia.com>
Reply-To: g4klx@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.HPX.4.10.10208141518580.21861-100000@saturn.trs.ntc.nokia.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Cc: linux-hams@vger.kernel.org

Hi Tomi

>  FWIW you could take a look at my gMFSK. While I don't claim it's
>  necessarily very well coded or anything, it could serve as some sort
> of basis for a Linux JT44 implementation. At the least there might be
> some code that can be reused.
>
>  Do you have a pointer to the mode specification. I would like to
> take a look.

I've downloaded the user-mode soundmodem code which includes yours, and 
will use it heavily as a basis. The AFSK modem is great as a basis for 
the TX side, in fact JT44 is simpler, no scrambling, no bit-stuffing, 
etc. From the soundmodem code I can also get the soundmodem interface 
code, the PTT interface code and probably other things also.

I will cut & paste a document into this e-mail which was the original 
JT44 specification document. A more modern description is available as 
a PDF from Joe's web pages at 
http://pulsar.princeton.edu/~joe/K1JT/WSJT222.PDF

In some ways the older description says more about the internals of the 
WSJT implementation, although the newer document has more details and 
you really need both for an implemenation. I've already started on the 
TX sidem with a simple command line based program to test some of the 
concepts. I have a friend who has JT44 receive capability who is over a 
variable 250kms 23cms path which would be an interesting test. I can 
give you the URL of a web page with .wav files of JT44 signals at 
various strengths if you are intersted.

Jonathan  HB9DRD/G4KLX


                     Development Notes on JT44
                     -------------------------
                         Joe Taylor, K1JT
                          March 28, 2002
 
I have not yet committed a technical description of the JT44 protocol
to paper.  It will be posted here as soon as it becomes available.  In
the meantime, for the curious, here are some notes on the essentials.
Some familiarity with the WSJT program will be necessary for full
understanding of what follows.
 
1.  Transmit and receive periods are nominally 30 sec each, starting
on UTC half-minutes.  JT44 is a time-synchronized communication mode,
and in WSJT the only way to transmit or receive it is to set the
program to "Auto Mode ON".
 
2. Transmit audio starts 1 second into the TX interval and lasts for
135 * 2048 samples at the 11025 Hz soundcard sampling rate, or about
25.08 seconds.
 
3. The last 3.9 seconds (minus necessary relay switching time, etc.)
of the transmit period will probably be used for a fast CW ID.  (This
function is not yet implemented in WSJT v1.9.4).  The idle time also
serves to accommodate EME propagation delays.
 
4. The message format involves 135 intervals of data transmission,
each 2048 samples long.  Of these, 69 intervals carry a synchronizing
tone at frequency 118*11025/1024=1270.5 Hz (approximately).
 
5. The remaining 66 intervals carry tones at frequencies
(120+N)*11025/1024, with 1 <= N <= 43.  The value of N conveys the
character code.  Permissible characters include the digits 0-9,
letters A-Z, and special characters .,/#?$ and <space>.  The 66
character intervals carry a 22-character message, repeated three
times.
 
6. The 69 sync-tone intervals and 66 character-tone intervals are
interleaved according to a pseudo-random pattern having the desirable
property that its auto-correlation function has a single spike at lag
zero and falls to low values everywhere else.  Detecting and aligning
with this sync-tone pattern is one of the the main "secrets" of JT44,
allowing the software to accommodate large frequency and clock errors.
 
7. At present the program synchronizes reliably with frequency errors
in the range +/- 600 Hz and clock offsets from -2 to +4 seconds.  The
time range was made asymmetrical so as to accommodate EME delays.
 
8. The cost of using about half of the transmission time for the sync
tone is approximately 1.5 dB.  This seems to be a very good compromise
in practice.  It means that transmissions will "sync up" reliably at
the receive end even when the S/N is -25 dB relative to the system
noise in a 2500 Hz bandwidth.  Note that by comparison, the minimum CW
signal strength that can be copied is about -11 dB relative to same
noise level.  JT44 can get through with solid copy whan you cannot
even hear the other station's signals.
 
9. Single letters in the 22-character message will have worse
signal-to-noise ratios than that of the sync tone by a factor equal to
the square root of 69/3, or 6.8 dB.  However, that loss can be made up
by averaging the received character-tone spectra over many 30-second
reception periods. For such incoherent averaging, each doubling of the
number of periods buys you 1.5 dB in S/N.  Four periods gets you 3 dB
improvement, 16 periods gets 6 dB, and so on. If the signal strength
remains fairly steady, these numbers mean that good copy of any
reliably synchronizable message can be achieved in about 15-20
minutes.
 
10. See also the accompanying file EXAMPLE.TXT, which describes an
example of JT44 usage.
