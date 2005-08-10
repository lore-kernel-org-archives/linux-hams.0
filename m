From: Chuck Hast <wchast@gmail.com>
Subject: Re: Announcing Perl module for parsing APRS packets
Date: Wed, 10 Aug 2005 12:14:04 -0400
Message-ID: <620c905705081009143dc3bcb0@mail.gmail.com>
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
Cc: Jeff Laughlin <jeff.laughlin@gmail.com>, Linux-Hams@vger.kernel.org

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

Could this be used to dump APRS data into a db like MySQL? I am interested
in doing something like that, but have to learn about db. I work with them up
to a certain point, time to learn the rest and getting APRS data into a db would
be a neat exersize.


-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
