From: terry <wd0fpc@aniota.com>
Subject: Re: Redhat 8 or 9 modules ?
Date: Wed, 23 Apr 2003 01:02:14 -0700 (PDT)
Sender: linux-hams-owner@localhost
Message-ID: <Pine.LNX.4.50.0304230038300.11684-100000@yossarian.aniota.net>
References: <002301c307d3$cc2e8300$14000a0a@p75> <1050973440.3572.12.camel@bobcp4.lingpgmr.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1050973440.3572.12.camel@bobcp4.lingpgmr.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

On Mon, 21 Apr 2003, Robert L Cochran wrote:

> There have been several updated glibc releases for recent Red Hat
> distributions including 8 and 9.

... as i understand it, the latest spate of glibc issues involved an RPC
function within the 'desktop'.


> I definitely don't try compiling myself unless all the Red Hat bug fixes
> are installed on my system.

    there is a certain danger in that, even though, it's a healthy
mindset.  depending on RH to provide 'all your security' needs "traps" the
user.  more often than not, RH trails public disclosure of vulnerabilities
and fixes for them, by some time.  i am not willing to wait on RH to
'back-port' , and generate an RPM for it.
    as an aside, i built a new kernel, 2.4.20 using the the tools at hand
from a pristine RH-8.0 install.  also, that kernel has proven to be more
stable than RH's offering.

> see Red Hat's Bugzilla bug #87682, and use the suggested workaround
> mentioned in that for LANG before you do anything with CPAN. Be very
> careful about messing with your LANG/locale settings though. I'd
> probably change them back to what they were when I finish downloading
> Perl modules off CPAN.

    RH in its infinate wisdon chose to us (i think it's) UTF-8 as the
default LANG.  the RH-8 ncurses install puked because of it.  this , as i
understand it, was for 'internationalization'.  that's just dandy, only i
live in the US and really like being able to have more than 8 colors
available to my VC's.  for me, staying with RH's default encoding is not
an attractive option, but as has been mentioned, caution is warranted ...


-- 
73 , de WD0FPC		Pacific Nowthwest 2M Repeaters
    aka: terry 		http://www.aniota.com/~wd0fpc
