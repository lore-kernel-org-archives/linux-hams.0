From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: callsign limit
Date: Thu, 1 Jun 2006 02:40:48 +0100
Message-ID: <20060601014047.GB27504@linux-mips.org>
References: <200605310927.56706.vk3heg@iinet.net.au> <20060531093716.GA21395@cloud.net.au> <620c90570605310403o1e4b94bcgf4ab922ef26983e4@mail.gmail.com> <20060531111919.GA22980@cloud.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060531111919.GA22980@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Wed, May 31, 2006 at 09:19:19PM +1000, Hamish Moffatt wrote:

> > I believe (I maybe taking one in the wind but so far my digging around the
> > web would show this correct) that the ITU format for amateur calls is a max-
> > imum of 6 alpha-numerics, 
> 
> I think that's no longer true as of WRC 2003. It's a bit late to change
> AX.25 though!

Indeed.  And the problem isn't even new.  The ITU has always assigned
callsigns blocks with three characters (such as DAA-DRZ to Germany).  It
was just a courtesy to the ham community that only 1 and 2 character
prefixes were ever issued with Swaziland (3DA) as the only exception
I know of.

One of my crazier ideas to deal with the issue of the longer callsigns
was using a hash value instead.  The probability of colissions is low but
how to do the reverse mapping from hash to callsign ...

  Ralf
