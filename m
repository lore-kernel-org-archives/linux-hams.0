From: Iain Young - G7III <g7iii@g7iii.demon.co.uk>
Subject: Re: KJD 2.3.9 patch on 2.5.29
Date: Fri, 2 Aug 2002 19:28:54 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020802182854.GA503@columbia.g7iii.bogus>
References: <20020801194618.GA722@columbia.g7iii.bogus> <20020802023237.B28097@dea.linux-mips.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020802023237.B28097@dea.linux-mips.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle DO1GRB <ralf@uni-koblenz.de>
Cc: linux-hams@vger.kernel.org

Hi Ralf,

You Wrote:
 
> > (since the AX25 stack hasn't been touched much for a while, I
> > thought it would be easier than other subsystems, that have had
> > constant change).
> 
> Definately not.  The whole AX.25, NET/ROM and ROSE code is suffering from
> severe bitrot.  None of the internal data structures are properly locked
> etc.  I'm currently working on that.

I meant easier as in easier to merge, as there would be few patches
that have been added to the mainline, thus less rejects.

Id actually be interested in your fixes, I may be able to integrate
them into any 2.5 version of the KJD AX25 stack that I manage to
produce.
 
> So you may find it easy to get old code into the current kerrnel - but
> then it'll suffer from the same problems.  The fact is that the AX.25
> code is looking like it was written for a 2.0 or 2.2 kernel ...

The KJD 'patch' is more like an entirely new AX25 stack - The Stack
in 2.4/2.5 currently predates it. The origional idea was to get the
KJD/FEF stack into 2.3, and thus 2.4 when it was released.

Unfortunatley Matt and Jens ran out of time, and priorties changed,
however a 2.4.x version was started by Jens, and was up to 2.4.9, but
is only a partial patch (there are a few .rej's actually in the patch).

Checkout http://www.afthd.tu-darmstadt.de/~dg1kjd/linux-ax25 for more
details, and why Jens gave it up.


All the Best

Iain.

