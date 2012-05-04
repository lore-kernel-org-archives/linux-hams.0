From: Patrick Ouellette <pat@flying-gecko.net>
Subject: Re: AX25 and related software's future in Debian
Date: Thu, 03 May 2012 22:10:30 -0400
Message-ID: <20120504021030.GA4017@flying-gecko.net>
References: <20120504013200.GB3489@flying-gecko.net>
 <4FA33509.5070006@radagast.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <4FA33509.5070006@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Platt <dplatt@radagast.org>
Cc: linux-hams@vger.kernel.org, debian-hams@lists.debian.org

Dave,

I appreciate the response.  Having been with Debian for somewhere
around 15 years I'm no stranger to the "discussions" that erupt
over various issues.

I usually prefer to not comment on most of them.  Unfortunately I
am in the center of this one.

On Thu, May 03, 2012 at 06:46:49PM -0700, Dave Platt wrote:
> 
> I'm enough of a "tweaker" that I'd much prefer an actively-
> maintained, distribution-agnostic "master kit" that I can
> build and install myself, to an "easy install" package that's
> not used by enough people to justify the effort needed to track
> a changing distribution rule-set and fight battles such as the
> one that seems to have erupted here.  My 8mpression is that the
> Debian AX.25 apps have lagged significantly behind what's been
> available "from source", perhaps due in part to this same
> "lack of adequate use" problem, and that it's been preferable to
> build from sources anyhow.

Actually the AX25 versions in Debian only lagged "far" behind the last
release (which has problems) and cvs (a situation I was trying to remedy).
Granted the last release was about 2 years ago (the -rc2 packages), but in 
Debian release cycle time that is barely a single stable release.
The upstream change logs most recent entries are dated 2002,2003,2009,2012.
(Those are for libax25)

> 
> AX.25 on Linux has (I think) always been enough of an "oddball"
> niche interest that I suspect most users of it were "self-
> installers" from the beginning, rather than being dependent on
> support from their distribution.  If I recall correctly, many
> of the standard Debian kernels have not supported AX.25 by
> default, and installing a custom kernel has been close to a
> "must".  Anybody who can do this, can probably manage to build
> and install the libraries and apps themselves from the original
> source kits.

Debian kernels have pretty much always had the ax25 support either
compiled in or as modules.  That was one of the legacies from the early
efforts to make Debian a ham friendly distro (way back in 1997).

73,

Pat NE4PO
-- 
,-----------------------------------------------------------------------------.
>  Patrick Ouellette        |   Start by doing what's necessary; then do      <
>  pat(at)flying-gecko.net  |   what's possible; and suddenly you are doing   <
>  Amateur Radio: NE4PO     |   the impossible.  -- Francis of Assisi         <
`-----------------------------------------------------------------------------'
