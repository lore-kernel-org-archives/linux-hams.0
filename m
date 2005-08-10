From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Announcing Perl module for parsing APRS packets
Date: Wed, 10 Aug 2005 09:33:04 -0700 (PDT)
Message-ID: <Pine.SUN.4.58.0508100920130.1839@eskimo.com>
References: <8ea83f405080514263ae2ec3d@mail.gmail.com> 
 <Pine.SUN.4.58.0508100852220.1839@eskimo.com> <620c905705081009143dc3bcb0@mail.gmail.com>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c905705081009143dc3bcb0@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Hast <wchast@gmail.com>
Cc: Jeff Laughlin <jeff.laughlin@gmail.com>, Linux-Hams@vger.kernel.org

On Wed, 10 Aug 2005, Chuck Hast wrote:

> > Have you considered tracking down the Perl code that Ian (the APRS
> > spec editor) created which decodes packets?  That was quite
> > complete and fully decoded everything similar to the "listen"
> > command.
>
> Could this be used to dump APRS data into a db like MySQL?

Perl?  Or Ian's program?

Yes to the first.  Combine Either Ian's or this new program with a
bit of Perl database code and you can inject this into a database.
I've done a bunch of sybperl and Perl5 talking to Sybase and it
works quite well.


> I am interested
> in doing something like that, but have to learn about db. I work with them up
> to a certain point, time to learn the rest and getting APRS data into a db would
> be a neat exersize.

Yep!

MySQL has some spatial extensions which would be useful (so you can
query on lat/long).  PostgreSQL with the PostGIS extensions also
gives you this.  I've been hoping to play with these at some point
myself.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
