From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: KISS mode
Date: Sat, 27 Apr 2002 02:28:51 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0204270228050.20910-100000@oh2bns.ampr.org>
References: <20020426222748.GB3430@oz.net>
Reply-To: <tpm@prkele.tky.hut.fi>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020426222748.GB3430@oz.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Fri, 26 Apr 2002, Bob Nielsen wrote:

> To get out of KISS mode is a bit more complicated.  You need to send
> the three bytes $C0, $FF, $C0 (192, 255, 192) to the TNC to restore
> normal operation.  I've seen DOS programs to do this, but haven't run
> across anything for Linux.

kissparms -x

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

