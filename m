From: Chuck Hast <wchast@gmail.com>
Subject: Re: Announcing Perl module for parsing APRS packets
Date: Wed, 10 Aug 2005 12:55:14 -0400
Message-ID: <620c905705081009556eaf5746@mail.gmail.com>
References: <8ea83f405080514263ae2ec3d@mail.gmail.com>
	 <Pine.SUN.4.58.0508100852220.1839@eskimo.com>
	 <620c905705081009143dc3bcb0@mail.gmail.com>
	 <8ea83f405081009332564220c@mail.gmail.com>
	 <Pine.SUN.4.58.0508100937240.1839@eskimo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.SUN.4.58.0508100937240.1839@eskimo.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Curt Mills, WE7U" <archer@eskimo.com>
Cc: Jeff Laughlin <jeff.laughlin@gmail.com>, Linux-Hams@vger.kernel.org

On 8/10/05, Curt, WE7U <archer@eskimo.com> wrote:
> On Wed, 10 Aug 2005, Jeff Laughlin wrote:
> 
> > Yes that is certainly a possibility... In fact I am working on that
> > right now! My next code release will be a complete FOSS findu.com
> > replacement, with a postgresql backend.
> >
> > http://www.trackulator.com/
> >
> > Expect to see it sometime in the next few weeks.
> 
> With PostGIS extensions I hope?
> 
> Hey, how about working in 'C' and doing the same thing for
> Xastir-2????  That's the direction we're wanting to go.

Yes, that is where I want to go, I would like to be able to dump the APRS
data to a db, probably will try to set things up to where only certain calls
are dumped to the db because I want to gather this for disaster activities,
actually my mapper would be linked to the db and so all data goes into
the db and the mapping is done out of the db. That is the way we do RF
coverage study data where I work. We dump all of the data captures into
a db and then I link the mapper to the db and look at the selected data.


-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
