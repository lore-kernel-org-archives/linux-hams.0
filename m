From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: [PATCH] node and libax25io nonblocking
Date: Tue, 18 Feb 2003 01:17:50 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0302180116370.1481-100000@oh2bns.ampr.org>
References: <20030218001400.I801@jeroen.pe1rxq.ampr.org>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030218001400.I801@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: linux-hams@vger.kernel.org

On Tue, 18 Feb 2003, Jeroen Vreeken wrote:

> > Question: is this different from the patch I sent you and Craig a few 
> > months back? The version that should be in the CVS now (I haven't checked
> > the CVS).
> 
> Not much, I took your check for the buffer length during init but haven't
> taken in the other stuff (mostly IAC rewrite). The big difference is
> axio_puts(), axio_gets() and axio_getline() these weren't done yet.

Ok, could you please take those too, or better make the patch against the 
CVS version (assuming the CVS version was updated) ?

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

