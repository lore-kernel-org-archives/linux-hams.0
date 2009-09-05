From: Dave Platt <dplatt@radagast.org>
Subject: Re: AX25 help site
Date: Sat, 05 Sep 2009 15:20:02 -0700
Message-ID: <4AA2E412.1090104@radagast.org>
References: <9923fd660908310727o354e03dqaf90abe05b4ea800@mail.gmail.com> <1251842807.8971.1.camel@w8iss-desktop> <4A9DA743.9090101@radagast.org> <4AA2CCDA.4060400@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4AA2CCDA.4060400@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Ranch <linux-hams@trinnet.net>
Cc: linux-hams@vger.kernel.org


> Curious, does your soundmodem patch cleanly apply against Soundmodem 0.14?
> 
>    http://www.baycom.org/~tom/ham/soundmodem/
> 
> 
> I think I've been seeing some strange compatibility issues with some
> local TNCs and I'd like to see if this patch would help.
> 
> Maybe you could post it on the web somewhere?

It does appear to apply, with an offset of a few lines but
no rejected patch chunks, by using the -p1 option.  The
patched source compiled without error.  I haven't tried to use
it yet but I'd expect it'll work OK.

It's available at

   http://www.radagast.org/~dplatt/hamradio/soundmodem-0.7b.patch

I'd be very curious to know whether it addresses the compatibility
problems you've been seeing (and, if so, which TNCs were affected).

