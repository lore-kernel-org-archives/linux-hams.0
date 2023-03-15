From: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v3 20/38] net: handle HAS_IOPORT dependencies
Date: Wed, 15 Mar 2023 09:47:04 +0000 (GMT)
Message-ID: <alpine.DEB.2.21.2303150938001.53876@angie.orcam.me.uk>
References: <20230314121216.413434-1-schnelle@linux.ibm.com> <20230314121216.413434-21-schnelle@linux.ibm.com>
Mime-Version: 1.0
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20230314121216.413434-21-schnelle@linux.ibm.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Jesse Brandeburg <jesse.brandeburg@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Ralf Baechle <ralf@linux-mips.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, P

On Tue, 14 Mar 2023, Niklas Schnelle wrote:

> those drivers requiring them. For the DEFXX driver there use of I/O
> ports is optional and we only need to fence those paths.can It also

 Some writing mess-up here, should it read:

"For the DEFXX driver the use of I/O ports is optional and we only need to 
fence those paths. It also [...]"

?

> diff --git a/drivers/net/fddi/Kconfig b/drivers/net/fddi/Kconfig
> index 846bf41c2717..fa3f1e0fe143 100644
> --- a/drivers/net/fddi/Kconfig
> +++ b/drivers/net/fddi/Kconfig
> @@ -29,7 +29,7 @@ config DEFZA
>  
>  config DEFXX
>  	tristate "Digital DEFTA/DEFEA/DEFPA adapter support"
> -	depends on FDDI && (PCI || EISA || TC)
> +	depends on FDDI && (PCI || EISA || TC) && HAS_IOPORT

 This part would incorrectly disable the driver for !HAS_IOPORT and is not 
needed given the change below:

> diff --git a/drivers/net/fddi/defxx.c b/drivers/net/fddi/defxx.c
> index 1fef8a9b1a0f..5f386eba9618 100644
> --- a/drivers/net/fddi/defxx.c
> +++ b/drivers/net/fddi/defxx.c
> @@ -254,7 +254,7 @@ static const char version[] =
>  #define DFX_BUS_TC(dev) 0
>  #endif
>  
> -#if defined(CONFIG_EISA) || defined(CONFIG_PCI)
> +#ifdef HAS_IOPORT
>  #define dfx_use_mmio bp->mmio
>  #else
>  #define dfx_use_mmio true

is it?

  Maciej
