From: Chuck Hast <wchast@gmail.com>
Subject: Re: [PATCH] SMP fix for 6pack driver
Date: Tue, 5 Jul 2005 12:06:41 -0400
Message-ID: <620c905705070509063b3f65fb@mail.gmail.com>
References: <20050704173042.GA3090@linux-mips.org>
	 <620c905705070503452dce267a@mail.gmail.com>
	 <20050705155301.GM5171@linux-mips.org>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050705155301.GM5171@linux-mips.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: Jeff Garzik <jgarzik@pobox.com>, linux-hams@vger.kernel.org, Marc Schneider <macke@macke.org>

On 7/5/05, Ralf Baechle DL5RB <ralf@linux-mips.org> wrote:
> On Tue, Jul 05, 2005 at 04:45:56AM -0600, Chuck Hast wrote:
> 
> > Does 6pack still only handle 1 tnc under Linux or have you got it to do
> > a ring of TNC's like the DOS one does? Sure would like to see that on
> > Linux, would cut cost for us where we have multiple TNC's and want to
> > use a simple machine.
> 
> Such a limitation has never existed as far as I can tell; the sole
> limitation is to a single TNC per RS-232 interface.  Daisy chaining
> multiple TNCs per interface is still not supported.  If you run out
> of serial interfaces using for example USB serial interfaces should
> work just fine.
> 
Ralf,
What is lacking that would allow 6pack TNC's to be daisy chained?
By doing so we would be able to use a single serial port to support
multiple TNC's I have the documentation on how to wire the hardware
and that is no big deal.

I have USB running on a laptop, it works well most of the time but
at times when the machine boots one or other ports generates the
"trying to synch tnc" message. The serial port always works. 

I think that at times the USB part is slow to get totally initialized so
I have gone in and added sleeps to slow things down a bit at init.



> (For dare devils, attaching a remote 6pack TNC via for example ssh sort
> of works also ;-)
> 

Ahh a subversive TNC to spy on a remote network???



-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
