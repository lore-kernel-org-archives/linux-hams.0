From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: Kernel compile option?
Date: Wed, 25 Dec 2002 22:24:12 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212252216050.1449-100000@oh2bns.ampr.org>
References: <20021225084305.55963.qmail@web14407.mail.yahoo.com>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20021225084305.55963.qmail@web14407.mail.yahoo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vivi Kusumo <vivi_ksm@yahoo.com>
Cc: linux-hams@vger.kernel.org

On Wed, 25 Dec 2002, Vivi Kusumo wrote:

> The driver is implemented as the user-mode program
> soundmodem. The graphical soundmodemconfig program
> allows configuring and testing the soundmodem driver.
> As well as kernel sound support you need the kernel
> AX.25 mkiss driver.
> 
> Should I do the following for the kernel compile
> option?:

You simply need working sound card support so what ever gets your "xmms"  
or whatever working should suffice.

Note however that not all soundcards have good enough drivers to be used 
with soundmodem. Soundmodem requires a bit more from the drivers than 
usual. You will have to test if your card works. Fortunately I think most 
cards/drivers work just fine.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

