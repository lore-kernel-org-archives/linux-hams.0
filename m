From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: axctl utility
Date: Tue, 09 Sep 2003 00:00:28 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1063054828.1357.133.camel@oh2bns.ampr.org>
References: <3F5CE356.3050702@rz-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3F5CE356.3050702@rz-online.de>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Manfred Haertel, DB3HM" <Manfred.Haertel@rz-online.de>
Cc: linux-hams@vger.kernel.org

On Mon, 2003-09-08 at 23:15, Manfred Haertel, DB3HM wrote:

> I have read the source of the utility, it's actually very simple, just
> passes the parameters to an ioctl call with SIOCAX25CTLCON as the second
> parameter.
> 
> Is there a chance to specify a digipeater in the ioctl() call? I have 
> not found a documentation of this call yet.

The ioctl call is passing a "struct ax25_ctl_struct" to the kernel. That
structure has the fields digi_count and digi_addr (see netax25/axlib.h)
that should probably be filled in. The argument parsing should be
modified to accept a digi path in addition to to dest call (maybe use
ax25_aton() to fill in a temporary "struct full_sockaddr_ax25" and copy
the digi stuff from there to the ax25_ctl_struct).

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

