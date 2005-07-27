From: Rodolfo Brasnarof <rodob@datafull.com>
Subject: Re: Hamlib: "ppdev0: claim the port first"
Date: Wed, 27 Jul 2005 09:00:48 -0300
Message-ID: <20050727090048.5b0d92b2.rodob@datafull.com>
References: <40764501050726193096edae3@mail.gmail.com>
	<200507271513.37262.w.knol@niwa.co.nz>
	<4076450105072620427655487b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4076450105072620427655487b@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>
Cc: Jonathan Lassoff <jlassoff@gmail.com>

On Tue, 26 Jul 2005 20:42:38 -0700
Jonathan Lassoff wrote:

> On 26/07/05, Wilbert Knol <w.knol@niwa.co.nz> wrote:
> > A level converter designed to work with EIA232 ports won't work on a
> > parallel port. They are different beasts with different voltage
> > levels and pin-outs.
> > ...
> > Hope this helps.
> >
> > Wilbert, ZL2BSJ 
> 
> I realized about 10 minutes after sending that message that I made a
> mistake as to the different device architectures. Is there any
> crossover between the the parallel port design and the older RS-232
> ports? Does the parallel port actually send the same data?

Yes, but they work in a totally different way. Serial port sends it's
data one bit at a time through the tx line, and parallel sends it all
bits at the same time, using different lines.

Many applications don't even use the serial port as a serial device
(transmitting data) but as a control device (such as soundmodem ptt
control). In those cases, they generally use handshaking lines, instead
of data lines. In those cases, you could use a parallel port, if the
application can support it.

> The level converter uses the voltage from the DTR and RTS through a
> 5V regulator to power an IC that converts the TTL voltages to RS-232
> levels and vice versa. Anyone have thoughts on the matter?

I don't understand if you need ttl levels output or rs-232 level output.
Standard serial port uses rs-232 levels. If you need ttl levels, you
need a converter.

Parallel port, on the other hand, uses ttl levels. So, if your
application supports using a parallel port, you don't need a converter.
Notice that your program must have support for it, and cabling is
different.
