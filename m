From: Robert L Cochran <cochranb@speakeasy.net>
Subject: Re: Redhat 8 or 9 modules ?
Date: 21 Apr 2003 21:04:00 -0400
Sender: linux-hams-owner@localhost
Message-ID: <1050973440.3572.12.camel@bobcp4.lingpgmr.com>
References: <002301c307d3$cc2e8300$14000a0a@p75>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <002301c307d3$cc2e8300$14000a0a@p75>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Colin Harris <charis.g3orh@virgin.net>, Linux-Hams <linux-hams@vger.kernel.org>

The initial release of Red Hat 8.0 had a problem with glibc that might
be affecting you here. There have been several updated glibc releases
for recent Red Hat distributions including 8 and 9.

I strongly suggest first updating your Red Hat 8 or 9 system with all
the current bug fixes and updates before attempting to compile anything.
I definitely don't try compiling myself unless all the Red Hat bug fixes
are installed on my system. 

Also, if you use CPAN to fetch and compile Perl modules under Red Hat 9,
see Red Hat's Bugzilla bug #87682, and use the suggested workaround
mentioned in that for LANG before you do anything with CPAN. Be very
careful about messing with your LANG/locale settings though. I'd
probably change them back to what they were when I finish downloading
Perl modules off CPAN.

Thanks

Bob Cochran

Greenbelt, Maryland, USA

On Mon, 2003-04-21 at 03:00, Colin Harris wrote:
> Hi all,
>            Can anyone out there shed some light please. A
> colleague has high speed access to inet. He downloaded RH
> 8.0 with a copy on CD's for me. Apart from some screen
> anomalies , RH 8.0 compiles with ax25 BUT it * will NOT
> make_modules * and complains that file devlist.h is missing.
> He has just downloaded RH 9.0 himself , which compiled , but
> he says that HE now has the make_modules failure ( devlist.h
> missing ). What IS going on ?
>           Has anyone else ( with RH 8.0 or 9.0 ) had this
> persistent failure to make modules and know's the answer ?
> I did ask once before but the only reply I got was from an
> 8.0 user who said he didn't have devlist.h on his system
> either but it made modules ok.
> 
> ( Is Redhat going down the plug hole ? ).
> 
> - Regards Colin
> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-- 
Bob Cochran
Greenbelt, Maryland, USA
Please avoid sending me Word or PowerPoint attachments.
See http://www.fsf.org/philosophy/no-word-attachments.html


