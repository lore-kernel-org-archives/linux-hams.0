From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: ax25 kernel problem sometimes accur
Date: Sat, 7 Dec 2002 21:32:44 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212072115500.2444-100000@oh2bns.ampr.org>
References: <20021207021016.A15120@linux-mips.org>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20021207021016.A15120@linux-mips.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sat, 7 Dec 2002, Ralf Baechle DO1GRB wrote:

> As is the 2.4 AX.25 code is totally racy.  Basically it only has a chance
> to survive if the user is nice ...

This reminds me... What is the situation with your fixes? I understood the 
kernel is now in feature freeze. Will the next release kernel have a bit 
more un-racy AX.25 stack?

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

