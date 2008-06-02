From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: BUGs into libax25
Date: Mon, 2 Jun 2008 10:16:02 +0100
Message-ID: <20080602091601.GC997@linux-mips.org>
References: <4843220B.20703@upmc.fr> <4843579E.8030003@w1nr.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4843579E.8030003@w1nr.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Mike McCarthy, W1NR" <lists@w1nr.net>
Cc: Bernard Pidoux <bernard.pidoux@upmc.fr>, linux-hams <linux-hams@vger.kernel.org>, Ray Wells <vk2tv@exemail.com.au>, Charlie k4gbb <k4gbb1@earthlink.net>, Jerry DeLong <KD4YAL@tampabay.rr.com>, F1TE <f1te@f1te.org>, f8arr <f8arr@f8arr.org>

On Sun, Jun 01, 2008 at 10:14:54PM -0400, Mike McCarthy, W1NR wrote:

> As I recall, there is a limit to the size of a callsign in the AX.25 
> protocol specification.  Will changing it create an incompatibility with 
> standard TNC protocol stacks?

Afaik the currently only user of 6-letter callsigns aside of special
event stations are Australien foundation license which look like VK3FABC
so 4-letter suffix and those are not permitted to use packet radio anyway.
I was wondering if Swaziland which only has a half-series assignment is
possibly using 3+3 calls.

Anyway, the maximum callsign length in the AX.25 spec is 6 characters and
(I looked into that ...) there is no way of extending that without causing
large scale software breakage :-(  It's almost like retrofitting 128-bit
addresses into IPv4 - it took a new protocol.

  Ralf
