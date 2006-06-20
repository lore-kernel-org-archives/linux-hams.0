From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: APRS Parser
Date: Tue, 20 Jun 2006 07:15:35 -0400
Message-ID: <620c90570606200415g60a46a96nc38bd90b7cb2aab5@mail.gmail.com>
References: <620c90570606191918h7605ecbax20325ecffe1546e2@mail.gmail.com>
	 <8ea83f40606192129t28c742y94299329b8548076@mail.gmail.com>
	 <Pine.SUN.4.58.0606200356580.19102@eskimo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.SUN.4.58.0606200356580.19102@eskimo.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Curt Mills, WE7U" <archer@eskimo.com>
Cc: Jeff Laughlin <jeff.laughlin@gmail.com>, linux-hams@vger.kernel.org

On 6/20/06, Curt, WE7U <archer@eskimo.com> wrote:
> On Mon, 19 Jun 2006, Jeff Laughlin wrote:
>
> > I started on an APRS parser written in perl. It handles most of the
> > major bits of the standard and I used it to dump APRS data into
> > postgresql and it kept up with the global APRS internet feeds no
> > problem, in fact I was suprised at how fast it was. It turned out that
> > PostgreSQL consumed vastly more system resources than the parser and
> > that was mostly disk IO, CPU load was relatively light. It could
> > certainly still use some work but it's functional and well documented
> > and I included example code. You can get it from
> > http://sourceforge.net/projects/ham-aprs-parser/
>
> There's also the Perl APRS code that Ian wrote (the APRS spec
> editor) which validates packets.  I should have a copy of it around
> somewhere if you can't find it on the 'net.  That would be excellent
> code to have around as an example, just because it was at one time
> the most complete Perl decoder implementation.
>
> On SourceForge I believe there are C++ classes and perhaps Java code
> for parsing APRS sentences, and of course the Xastir project
> (SourceForge again) has a bunch of C code.  It's a _bunch_ of C code
> though!
>
> I also have Perl code for authenticating on the 'net if you'd like
> that.  It's a direct Perl translation of the C-code that Steve Dimse
> published and I use it extensively in my Perl scripts which inject
> objects into Firenet.
>

Curt,
Thank you, I will go dig it up too, I am not a coder, but will try anything if
I have enough samples!!

-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
