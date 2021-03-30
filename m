From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 1/6] mips/sgi-ip27: Delete obsolete TODO file
Date: Tue, 30 Mar 2021 15:07:40 +0200
Message-ID: <20210330130740.GA11217@alpha.franken.de>
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
 <1617087773-7183-2-git-send-email-wangqing@vivo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1617087773-7183-2-git-send-email-wangqing@vivo.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wang Qing <wangqing@vivo.com>
Cc: Adaptec OEM Raid Solutions <aacraid@microsemi.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net, gregkh@linuxfoundation.org

On Tue, Mar 30, 2021 at 03:02:44PM +0800, Wang Qing wrote:
> The TODO file here has not been updated for 15 years, and the function 
> development described in the file have been implemented or abandoned.
> 
> Its existence will mislead developers seeking to view outdated information.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  arch/mips/sgi-ip27/TODO | 19 -------------------
>  1 file changed, 19 deletions(-)
>  delete mode 100644 arch/mips/sgi-ip27/TODO

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
