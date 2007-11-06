From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: AX25 tools and packages
Date: Tue, 6 Nov 2007 22:08:29 +0200
Message-ID: <20071106200829.GM6372@mea-ext.zmailer.org>
References: <5abd436b0707261023nada8cf5n90532459745cd2ac@mail.gmail.com> <20070802012451.GA1238@cloud.net.au> <20070802112715.GB25597@linux-mips.org> <200708021720.56251.n7ipb@wetnet.net> <46B344C6.5050001@ccr.jussieu.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <46B344C6.5050001@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: linux-hams@vger.kernel.org

Picking old topic, but HAM things in Linux are not changeing very rapidly.

On Fri, Aug 03, 2007 at 05:07:50PM +0200, Bernard Pidoux wrote:
> Hi,
>
> I have also been working for a while on libax25, ax25-apps and ax25-tools 
> adaptation for compilation with 2.6 kernels and recent compilers.
>
> All is working quite well together with Rose-FPAC switching node and LinFBB 
> BBS applications with last 2.6.22 stable kernel.
>
> I would be glad to share my experience and results with other developpers. 
> We could compare our solutions.
>
> My work is publically available here :
>
> AX25
> http://f6bvp.free.fr/logiciels/ax25/libax25-0.0.11.2src_f6bvp.tgz
> http://f6bvp.free.fr/logiciels/ax25/ax25-tools-0.0.8.2src_f6bvp.tgz
> http://f6bvp.free.fr/logiciels/ax25/ax25-apps-0.0.6.2src_f6bvp.tgz

Thanks!   Recently Fedora added(*) AX.25 / ROSE / NETROM protocols, and
many HAM drivers into their kernel, and now I am looking into making
up to date utilities for it.

*) .. after I bugzillaed them about the issue.

You didn't do much changes on  libax25, I see...


> ROSE-FPAC
> http://f6bvp.free.fr/logiciels/rose-fpac/fpac327-2src.tar.gz
>
> FBB BBS patch against f6fbb704j
> http://f6bvp.free.fr/logiciels/BBS-f6fbb/fbbsrc.704l.patch
> http://f6bvp.free.fr/logiciels/BBS-f6fbb/xd704j-src.tgz
>
> There are newer versions of FPAC (fpac327-4) and BBS (xd704m), but less 
> stable. Work is still in progress...
>
> 73 de Bernard, f6bvp


73 de Matti, OH2MQK
