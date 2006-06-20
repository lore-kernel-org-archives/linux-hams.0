From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: APRS Parser
Date: Tue, 20 Jun 2006 04:00:00 -0700 (PDT)
Message-ID: <Pine.SUN.4.58.0606200356580.19102@eskimo.com>
References: <620c90570606191918h7605ecbax20325ecffe1546e2@mail.gmail.com>
 <8ea83f40606192129t28c742y94299329b8548076@mail.gmail.com>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <8ea83f40606192129t28c742y94299329b8548076@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Laughlin <jeff.laughlin@gmail.com>
Cc: Chuck Hast <wchast@gmail.com>, linux-hams@vger.kernel.org

On Mon, 19 Jun 2006, Jeff Laughlin wrote:

> I started on an APRS parser written in perl. It handles most of the
> major bits of the standard and I used it to dump APRS data into
> postgresql and it kept up with the global APRS internet feeds no
> problem, in fact I was suprised at how fast it was. It turned out that
> PostgreSQL consumed vastly more system resources than the parser and
> that was mostly disk IO, CPU load was relatively light. It could
> certainly still use some work but it's functional and well documented
> and I included example code. You can get it from
> http://sourceforge.net/projects/ham-aprs-parser/

There's also the Perl APRS code that Ian wrote (the APRS spec
editor) which validates packets.  I should have a copy of it around
somewhere if you can't find it on the 'net.  That would be excellent
code to have around as an example, just because it was at one time
the most complete Perl decoder implementation.

On SourceForge I believe there are C++ classes and perhaps Java code
for parsing APRS sentences, and of course the Xastir project
(SourceForge again) has a bunch of C code.  It's a _bunch_ of C code
though!

I also have Perl code for authenticating on the 'net if you'd like
that.  It's a direct Perl translation of the C-code that Steve Dimse
published and I use it extensively in my Perl scripts which inject
objects into Firenet.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
