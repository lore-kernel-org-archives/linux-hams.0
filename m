From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: trouble with ax25ipd
Date: Mon, 15 Apr 2002 20:36:08 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0204152034010.3336-100000@oh2bns.ampr.org>
References: <Pine.LNX.4.33.0204151837460.2097-100000@localhost.localdomain>
Reply-To: <tpm@prkele.tky.hut.fi>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0204151837460.2097-100000@localhost.localdomain>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ricardo Saiz Villoria <ea1apm@amsat.org>
Cc: linux-hams <linux-hams@vger.kernel.org>

On Mon, 15 Apr 2002, Ricardo Saiz Villoria wrote:

> The ax25ipd.conf contains:
> device /dev/ptyp0

> Then I run kissattach:
> /usr/sbin/kissattach /dev/ptyp0 axip 44.133.36.1

You are trying to use the master side of the pty/tty pair twice. Try 
changing the ax25ipd.conf one to /dev/ttyp0.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

