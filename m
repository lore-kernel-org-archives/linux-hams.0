From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: netstat with rose support?
Date: Thu, 13 Jul 2006 08:43:12 -0400
Message-ID: <620c90570607130543k69a5e560oe75f1e2c013b913a@mail.gmail.com>
References: <620c90570607112014j5857afecs2e4a69eb4b1bc2e7@mail.gmail.com>
	 <20060712231643.GA16205@linux-mips.org>
	 <620c90570607130408w44cc5d59n508ab8268db24021@mail.gmail.com>
	 <20060713112041.GA20294@linux-mips.org>
	 <20060713122824.GA4729@lina.inka.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060713122824.GA4729@lina.inka.de>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bernd Eckenfels <be-mail2006@lina.inka.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-hams <linux-hams@vger.kernel.org>

On 7/13/06, Bernd Eckenfels <be-mail2006@lina.inka.de> wrote:
> On Thu, Jul 13, 2006 at 12:20:41PM +0100, Ralf Baechle wrote:
> > > Thank you for this information, does this mean that if I re-compile
> > > the net-tools
> > > all I need to do is enable ROSE? If so I guess I will have to try to do it,
> > > unless of course there is a binary which I can download somewhere.
> >
> > Yes, you just need to recompile net-tools.
>
> I think the reason why rose is not enabled by default is because there are
> some header files (kernel, libc, other package - cant remeber) which are not
> available on all distributions.
>
> This used to be also the case for AX25, but that changed with recent libcs.
>
> Running configure is enough to enable ROSE support. If your system misses
> some headers in that case, let me know so i can document this.
>

Thank you, I shall try my hand at it (hide and fear for ye know not what I
will cook up on this one as I have not done this too much) and see what
happens.


-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
