From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: [PATCH] node and libax25io nonblocking
Date: Tue, 18 Feb 2003 00:13:48 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0302180001290.1481-100000@oh2bns.ampr.org>
References: <20030217215608.A801@jeroen.pe1rxq.ampr.org>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030217215608.A801@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: linux-hams@vger.kernel.org, csmall@small.dropbear.id.au

On Mon, 17 Feb 2003, Jeroen Vreeken wrote:

> The libax25 patch is basicly the same I posted a while back with the buffer
> check added and a few changes to axio_puts(), axio_gets() and
> axio_getline().

Question: is this different from the patch I sent you and Craig a few 
months back? The version that should be in the CVS now (I haven't checked 
the CVS).

The approach you have used for fixing node seems after a quick look 
similar to what I had done, but there is one thing I need to discuss with 
you. I'll get back to you on that later.

You have covered a few cases that I had missed but also you have a 
few cases that I think are not needed. (It shouldn't be necessary to add 
any extra select() loops or other blocking measures when the socket 
already is blocking...)

More comments tomorrow.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

