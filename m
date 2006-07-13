From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: netstat with rose support?
Date: Thu, 13 Jul 2006 07:25:13 -0400
Message-ID: <620c90570607130425o26d39ba3m318e1a0d84ab09f0@mail.gmail.com>
References: <620c90570607112014j5857afecs2e4a69eb4b1bc2e7@mail.gmail.com>
	 <20060712231643.GA16205@linux-mips.org>
	 <620c90570607130408w44cc5d59n508ab8268db24021@mail.gmail.com>
	 <20060713112041.GA20294@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060713112041.GA20294@linux-mips.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams <linux-hams@vger.kernel.org>, Bernd Eckenfels <ecki@debian.org>

On 7/13/06, Ralf Baechle <ralf@linux-mips.org> wrote:
> On Thu, Jul 13, 2006 at 07:08:39AM -0400, Chuck Hast wrote:
>
> > >All protocol and hardware support in net-tools is configurable and
> > >unfortunately the default configuration has shipped enables AX.25 and
> > >NETROM and disables ROSE.
> > >
> > >It seems all Linux distributions just stick to the default configuration
> > >so I cc my reply to the net-tools maintainer with the request to enable
> > >ROSE in the net-tools default configuration.
>
> > Thank you for this information, does this mean that if I re-compile
> > the net-tools
> > all I need to do is enable ROSE? If so I guess I will have to try to do it,
> > unless of course there is a binary which I can download somewhere.
>
> Yes, you just need to recompile net-tools.
>

OK, will try it and see how I come out.



-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
