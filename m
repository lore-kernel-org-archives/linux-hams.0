From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: libax25 0.0.11
Date: Mon, 17 Mar 2003 18:04:44 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10303171803050.5861-100000@saturn.trs.ntc.nokia.com>
References: <200303171755.47880.oh1mrr@nic.fi>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200303171755.47880.oh1mrr@nic.fi>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, 17 Mar 2003, Jarmo wrote:

> Hate to make this announce...But vers 0.0.11 brakes my wavelan system..
> 0.0.10 works fine...
> 
> Mar 17 17:28:06 oh1mrr kernel: NETDEV WATCHDOG: eth1: transmit timed out
> Mar 17 17:28:06 oh1mrr kernel: eth1: Tx timeout! ALLOCFID=01f7, 
> TXCOMPLFID=0000, EVSTAT=8000
> Mar 17 17:28:06 oh1mrr kernel: eth1: orinoco_reset: Error -19 re-initializing 
> firmware

It is _HIGHLY_ unlikely that libax25 had anything to do with this... Are
you sure you haven't changed _anything_ else than the libax25?

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

