From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 3/5] arch: mips: update references to current linux-mips
 list
Date: Tue, 23 Feb 2021 13:29:28 +0100
Message-ID: <20210223122928.GD7765@alpha.franken.de>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com>
 <20210222161905.1153-4-lukas.bulwahn@gmail.com>
Mime-Version: 1.0
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210222161905.1153-4-lukas.bulwahn@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-mips@vger.kernel.org, "Maciej W . Rozycki" <macro@orcam.me.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 22, 2021 at 05:19:03PM +0100, Lukas Bulwahn wrote:
> The linux-mips mailing list now lives at kernel.org. Update all references
> in the kernel tree.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  arch/mips/kernel/r4k-bugs64.c | 2 +-
>  arch/mips/lib/iomap-pci.c     | 2 +-
>  arch/mips/sgi-ip32/ip32-irq.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

applied only this patch to mips-next.

For the other patches I'll wait for how the resolution for linux-mips.org
looks like.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
