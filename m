From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: [PATCH] node and libax25io nonblocking
Date: Fri, 21 Feb 2003 16:35:21 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0302211625520.1561-100000@oh2bns.ampr.org>
References: <20030221103751.GA16223@enc.com.au>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030221103751.GA16223@enc.com.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Craig Small <csmall@enc.com.au>
Cc: Jeroen Vreeken <pe1rxq@amsat.org>, linux-hams@vger.kernel.org

On Fri, 21 Feb 2003, Craig Small wrote:

> > Ok, after a very quick look this looks FB. And just in case Craig
> > misplaced the earlier patch I was talking about, I added it here. So first
> > my patch, then Jeroen's.
> 
> Great,  I've added both patches to the CVS.  You mention some programs
> will break, what programs are they?

As far as I know the only program that really uses libax25io is node.  

Things have always been "broken" with node, at least up till
libax25-0.0.9. The fix in libax25-0.0.10 was wrong and buggy (wrong
approach, caused another just as bad problem). This patch is more or less
going back to the 0.0.9 behaviour but with a few relatively minor (but
important) problems fixed.

> I'd like to release this library just with this patch but those programs
> need fixing first, or at least the maintainers to be ready.

The original "brokenness" needs to be fixed in the applications using 
libax25io, like node. I have been working on this with help from Jeroen. I 
hope to be able to release a new node version soon.

If someone knows any other programs using libax25io, now would be a good 
time to let us know!

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

