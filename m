From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [PATCH] ax25 fix char type assumption in ax25_digi structure
Date: Mon, 3 Oct 2005 14:58:00 +0100
Message-ID: <20051003135800.GJ2624@linux-mips.org>
References: <20051003035120.21386.qmail@kunk.qbjnet.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20051003035120.21386.qmail@kunk.qbjnet.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Brose N0QBJ <linuxhams@n0qbj-11.ampr.org>
Cc: linux-hams@vger.kernel.org

On Mon, Oct 03, 2005 at 03:51:20AM -0000, Bob Brose N0QBJ wrote:

> This trivial fix allows ax25 IP to work on the PPC architecture.
> The patch is against 2.6.14-rc1 and works with a offset against
> 2.6.14-rc3 as well. 
> 
> If not explicitly declared, PPC assumes chars are unsigned.
> x86 assumes they are signed. The code in ax25_addr.c uses -1 with
> char lastrepeat in the ax25_digi struct which fails later comparisons
> to -1 on PPC. Explicitly declaring the char as signed char fixes the
> problem.

I'll take care of your patch.

  Ralf
