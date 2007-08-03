From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: AX25 tools and packages
Date: Fri, 03 Aug 2007 17:07:50 +0200
Message-ID: <46B344C6.5050001@ccr.jussieu.fr>
References: <5abd436b0707261023nada8cf5n90532459745cd2ac@mail.gmail.com> <20070802012451.GA1238@cloud.net.au> <20070802112715.GB25597@linux-mips.org> <200708021720.56251.n7ipb@wetnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200708021720.56251.n7ipb@wetnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi,

I have also been working for a while on libax25, ax25-apps and 
ax25-tools adaptation for compilation with 2.6 kernels and recent compilers.

All is working quite well together with Rose-FPAC switching node and 
LinFBB BBS applications with last 2.6.22 stable kernel.

I would be glad to share my experience and results with other 
developpers. We could compare our solutions.

My work is publically available here :

AX25
http://f6bvp.free.fr/logiciels/ax25/libax25-0.0.11.2src_f6bvp.tgz
http://f6bvp.free.fr/logiciels/ax25/ax25-tools-0.0.8.2src_f6bvp.tgz
http://f6bvp.free.fr/logiciels/ax25/ax25-apps-0.0.6.2src_f6bvp.tgz

ROSE-FPAC
http://f6bvp.free.fr/logiciels/rose-fpac/fpac327-2src.tar.gz

FBB BBS patch against f6fbb704j
http://f6bvp.free.fr/logiciels/BBS-f6fbb/fbbsrc.704l.patch
http://f6bvp.free.fr/logiciels/BBS-f6fbb/xd704j-src.tgz

There are newer versions of FPAC (fpac327-4) and BBS (xd704m), but less 
stable. Work is still in progress...

73 de Bernard, f6bvp


----------

Ken Koster wrote:
> On Thursday 02 August 2007, Ralf Baechle DL5RB wrote:
>> On Thu, Aug 02, 2007 at 11:24:51AM +1000, Hamish Moffatt wrote:
>>
>>>> I'm using the latest patches from Debian since that seemed to be the latest 
>>>> I could find.  Because my current builds are targeted at a 2.4 series kernel in
>>>> an embedded system they work with a few small patches but I'm planning
>>>> on switching to 2.6 as soon as possible.
>>> There appears to be a misconception that 2.6 requires new tools. Notice
>>> that Ralf said newer Linux distributions (meaning newer libc, gcc etc)
>>> rather than newer kernels.
>> Correct.  Binary compatibility across kernels is one of the holy grails
>> in Linux and AX.25 is not exception to that.  Unfortunately that's a
>> little different for source code of the tools which at times may need a
>> little update to compile on a more recent system.
> 
> Thanks, I figured that out last night when I discovered my cross-compile 
> issues were environment related :-)
> 
> Still it would be nice to have a release with any bug-fixes.
> 
> Ken,  N7IPB  
> (running openwrt kamikaze, ax25, and kiss to multiple tnc7multi's
> on a linksys wrtsl54g,   :-) )
