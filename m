From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: ax25 kernel problem sometimes accur
Date: Tue, 10 Dec 2002 16:09:20 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10212101608040.23101-100000@saturn.trs.ntc.nokia.com>
References: <20021208003911.A30880@linux-mips.org>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20021208003911.A30880@linux-mips.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

On Sun, 8 Dec 2002, Ralf Baechle DO1GRB wrote:

> On Sat, Dec 07, 2002 at 09:32:44PM +0200, Tomi Manninen wrote:
> 
> > > As is the 2.4 AX.25 code is totally racy.  Basically it only has a chance
> > > to survive if the user is nice ...
> > 
> > This reminds me... What is the situation with your fixes? I understood the 
> > kernel is now in feature freeze. Will the next release kernel have a bit 
> > more un-racy AX.25 stack?
> 
> I consider everything I'm currently working on as pure bug fix.  As such
> they're not affected by the feature freeze.

Agreed.

Anyway, what is the situation now? Are there still lots of known races
unfixed in your tree?

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

