From: csmall@enc.com.au (Craig Small)
Subject: Re: [PATCH] node and libax25io nonblocking
Date: Fri, 21 Feb 2003 21:37:51 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030221103751.GA16223@enc.com.au>
References: <20030218233527.K507@jeroen.pe1rxq.ampr.org> <Pine.LNX.4.44.0302190033590.14956-200000@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0302190033590.14956-200000@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Manninen <tpm@prkele.tky.hut.fi>
Cc: Jeroen Vreeken <pe1rxq@amsat.org>, csmall@small.dropbear.id.au, linux-hams@vger.kernel.org

On Wed, Feb 19, 2003 at 12:37:03AM +0200, Tomi Manninen wrote:
> On Tue, 18 Feb 2003, Jeroen Vreeken wrote:
> 
> > Attached the same patch against what should have been in the CVS :)
> > 
> > btw getline changed a bit, the buffer is no longer global but in the ax25io
> > structure so each connection has its own (this is not a problem yet, but
> > might become one...)
> 
> Ok, after a very quick look this looks FB. And just in case Craig
> misplaced the earlier patch I was talking about, I added it here. So first
> my patch, then Jeroen's.

Great,  I've added both patches to the CVS.  You mention some programs
will break, what programs are they?

I'd like to release this library just with this patch but those programs
need fixing first, or at least the maintainers to be ready.

  - Craig
-- 
Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE  95CB C76C E5AC 12CA DFA5
Eye-Net Consulting http://www.enc.com.au/                <csmall@enc.com.au>
MIEEE <csmall@ieee.org>                 Debian developer <csmall@debian.org>
