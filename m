From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: RE: Status of AX.25 in 2.5 / 2.6
Date: Mon, 29 Jul 2002 21:07:01 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0207292101070.5578-100000@oh2bns.ampr.org>
References: <000001c23727$b5a18970$e239832c@jrws2>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <000001c23727$b5a18970$e239832c@jrws2>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Jenkins <raj@jrw.co.uk>
Cc: linux-hams@vger.kernel.org

On Mon, 29 Jul 2002, Robert Jenkins wrote:

> My only thought re. the problem you mention with the SABM frame not
> having a protocol ID is that surely this applies equally to IP via ax25
> etc.? 

Yes. That is why you should not have any user services (that are called
with plain AX.25) like LinuxNode or a BBS using the same callsign as you 
have in ifconfig/axports.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

