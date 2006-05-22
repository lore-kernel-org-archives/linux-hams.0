From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: AX.25, NETROM and ROSE changes in 2.6.17
Date: Mon, 22 May 2006 01:06:29 +0100
Message-ID: <20060522000629.GA20046@linux-mips.org>
References: <20060506223800.GA4419@linux-mips.org> <4470E0EA.70104@ccr.jussieu.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4470E0EA.70104@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: linux-hams@vger.kernel.org

On Sun, May 21, 2006 at 11:51:38PM +0200, Bernard Pidoux wrote:

> -rw-r--r--  1 root root 0 mai 21 23:25 dama_slave_timeout
> -rw-r--r--  1 root root 0 mai 21 23:25 protocol
> 
> It appears that dama_slave_timeout and protocol parameters are not in 
> the AX25 table.

They are only there if CONFIG_AX25_DAMA_SLAVE has been selected.

>  ll /proc/sys/net/netrom/

> -rw-r--r--  1 root root 0 mai 21 23:36 reset
> 
> reset parameter is not listed. Not ajustable ?

It's a relativly new thing, the G8ZPT-style NET/ROM circuit resets.  It's
of course ajustable, the file has "rw" set.

>  ll /proc/sys/net/rose/

> -rw-r--r--  1 root root 0 mai 21 23:33 no_activity_timeout
> 
> Again, parameter no_activity_timeout is not in the ROSE table.

I suppose this was just inherited from the old, less than perfect
documentation.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
