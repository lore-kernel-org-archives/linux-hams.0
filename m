From: Jeff Laughlin <jeff.laughlin@gmail.com>
Subject: Re: Announcing Perl module for parsing APRS packets
Date: Wed, 10 Aug 2005 12:21:31 -0400
Message-ID: <8ea83f4050810092139d7034c@mail.gmail.com>
References: <8ea83f405080514263ae2ec3d@mail.gmail.com>
	 <Pine.SUN.4.58.0508100852220.1839@eskimo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.SUN.4.58.0508100852220.1839@eskimo.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Curt Mills, WE7U" <archer@eskimo.com>
Cc: Linux-Hams@vger.kernel.org

Hi Curt,

Thanks for the suggestion. I wasn't aware that it existed.

After thwarting a few broken links I did manage to find a copy. It
targets perl 4, it's not a module, and it outputs formatted text
instead of a data structure, so it doesn't exactly acheive the same
goals that I have. However it is GPL'ed which is good, so I may be
able to re-use some of it's parsing code without tainting my code. I
still have quite a bit left to implement to have a complete
implementation. And it will certainly be nice to have another GPL code
base to reference other than XASTIR.

On 8/10/05, Curt, WE7U <archer@eskimo.com> wrote:
> On Fri, 5 Aug 2005, Jeff Laughlin wrote:
> 
> > I've written a Perl module, Ham::APRS::Parser, for parsing APRS
> > packets, and I've released it under the GPL. You can find it here:
> > http://aprs.n1ywb.com/Ham-APRS-Parser-0.01/
> >
> > It takes the packet string, parses it, and returns a hash with the
> > data in a consistent and easy to process format. Currently it reliably
> > returns position, from and to calls, digi-path, symbols, and Mic-E
> > status reports from normal position reports, compressed position
> > reports, and Mic-E position reports. More work is needed to fully
> > implement the APRS protocol.
> 
> Have you considered tracking down the Perl code that Ian (the APRS
> spec editor) created which decodes packets?  That was quite
> complete and fully decoded everything similar to the "listen"
> command.
> 
> --
> Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
> "Lotto:    A tax on people who are bad at math." -- unknown
> "Windows:  Microsoft's tax on computer illiterates." -- WE7U
> "The world DOES revolve around me:  I picked the coordinate system!"
>
