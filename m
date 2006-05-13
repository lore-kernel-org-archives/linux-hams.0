From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: AX.25, NETROM and ROSE changes in 2.6.17
Date: Sat, 13 May 2006 15:42:58 +0100
Message-ID: <20060513144258.GA3640@linux-mips.org>
References: <20060506223800.GA4419@linux-mips.org> <4465D18F.5070405@ccr.jussieu.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4465D18F.5070405@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: linux-hams@vger.kernel.org

On Sat, May 13, 2006 at 02:31:11PM +0200, Bernard Pidoux wrote:

> By the way, its a long time since I want to ask if there is any reason 
> to keep the same name for different ax25.h include files.
> 
> -rw-r--r--  1 root root 4877 mar 21 01:26 /usr/include/netax25/ax25.h
> [root@bernard tools]# ll /usr/src/linux/include/linux/ax25.h
> -rw-rw-rw-  1 root root 2752 mar 20 06:53 
> /usr/src/linux/include/linux/ax25.h
> [root@bernard tools]# ll /usr/src/linux/include/net/ax25.h
> -rw-rw-rw-  1 root root 14842 avr 30 11:27 /usr/src/linux/include/net/ax25.h
> 
> Somehow it may be confusing.

One for building applications, one for the kernel itself.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
