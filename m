From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [PATCH] SMP fix for 6pack driver
Date: Tue, 5 Jul 2005 19:12:22 +0100
Message-ID: <20050705181222.GB18772@linux-mips.org>
References: <20050704173042.GA3090@linux-mips.org> <620c905705070503452dce267a@mail.gmail.com> <20050705155301.GM5171@linux-mips.org> <620c905705070509063b3f65fb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <620c905705070509063b3f65fb@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Hast <wchast@gmail.com>
Cc: Jeff Garzik <jgarzik@pobox.com>, linux-hams@vger.kernel.org, Marc Schneider <macke@macke.org>

On Tue, Jul 05, 2005 at 12:06:41PM -0400, Chuck Hast wrote:

> Ralf,
> What is lacking that would allow 6pack TNC's to be daisy chained?
> By doing so we would be able to use a single serial port to support
> multiple TNC's I have the documentation on how to wire the hardware
> and that is no big deal.

Well, by the time I was writing that driver I didn't have a 6pack TNC
at all, so I wrote a 6pack TNC emulator that is capable of simulating
a single TNC.  I still don't have multiple TNCs, unfortunately, so I'm
planning on extending that emulator for my work :-)

You could try EB6EBU's m6pack which is an application level solution
to the problem. I'm undecieded, maybe it's even preferable over a kernel
solution.

> I have USB running on a laptop, it works well most of the time but
> at times when the machine boots one or other ports generates the
> "trying to synch tnc" message. The serial port always works. 
> 
> I think that at times the USB part is slow to get totally initialized so
> I have gone in and added sleeps to slow things down a bit at init.

Mine seems to be ok as long as the machine survives plugging in the
USB device and open()ing the device file.  Never really looked into it,
blaming the driver for now.

> > (For dare devils, attaching a remote 6pack TNC via for example ssh sort
> > of works also ;-)
> > 
> 
> Ahh a subversive TNC to spy on a remote network???

It's a strategy that allows attaching the TNC to any UNIX machine,
even without AX.25 support.  It's a hack but I was playing with it
for a while when I ran out of interfaces.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
