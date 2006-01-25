From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Unwanted packets on AX25 interface
Date: Wed, 25 Jan 2006 14:00:27 +0000
Message-ID: <20060125140027.GC3454@linux-mips.org>
References: <96cafccb0601241332w67b8f3bewa5052694619f3e98@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <96cafccb0601241332w67b8f3bewa5052694619f3e98@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josh Freeman <cpe.jfreeman@gmail.com>
Cc: linux-hams@vger.kernel.org

On Tue, Jan 24, 2006 at 03:32:51PM -0600, Josh Freeman wrote:

> I'm running Fedora Core 4 and user-mode Soundmodem 0.10.1 in MKISS
> mode to operate APRS, primarily with XASTIR. When I start up
> Soundmodem, it creates interface ax0 with an IP address of 10.0.0.1.
> It immediately sends a packet

This is a known problem.  For unknown reasons ages ago the use of an IP
address with every AX.25 address was made mandatory and recently DL9SAU
started undoing that again.

Until then you may try to limit the problem by setting up a packet filter
blocking all ARP/IP traffic over your mkiss interface.

  Ralf
