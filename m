From: Chuck Hast <wchast@gmail.com>
Subject: Re: [PATCH] SMP fix for 6pack driver
Date: Tue, 5 Jul 2005 04:45:56 -0600
Message-ID: <620c905705070503452dce267a@mail.gmail.com>
References: <20050704173042.GA3090@linux-mips.org>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050704173042.GA3090@linux-mips.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Jeff Garzik <jgarzik@pobox.com>, stable@kernel.org, linux-hams@vger.kernel.org, Marc Schneider <macke@macke.org>

On 7/4/05, Ralf Baechle <ralf@linux-mips.org> wrote:
> Drivers really only work well in SMP if they actually can be selected.
> This is a leftover from the time when the 6pack drive only used to be
> a bitrotten variant of the slip driver.
> 
> Signed-off-by: Ralf Baechle DL5RB <ralf@linux-mips.org>
> 
>  Kconfig |    2 +-
>  1 files changed, 1 insertion(+), 1 deletion(-)
> 
> Index: linux-cvs/drivers/net/hamradio/Kconfig
> ===================================================================
> --- linux-cvs.orig/drivers/net/hamradio/Kconfig 2005-05-20 12:29:58.000000000 +0100
> +++ linux-cvs/drivers/net/hamradio/Kconfig      2005-07-04 18:23:17.000000000 +0100
> @@ -17,7 +17,7 @@
> 
>  config 6PACK
>         tristate "Serial port 6PACK driver"
> -       depends on AX25 && BROKEN_ON_SMP
> +       depends on AX25
>         ---help---
>           6pack is a transmission protocol for the data exchange between your
>           PC and your TNC (the Terminal Node Controller acts as a kind of
> 
> -
Ralf,
Does 6pack still only handle 1 tnc under Linux or have you got it to do
a ring of TNC's like the DOS one does? Sure would like to see that on
Linux, would cut cost for us where we have multiple TNC's and want to
use a simple machine.


-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
