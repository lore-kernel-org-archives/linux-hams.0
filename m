From: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v4 20/41] net: handle HAS_IOPORT dependencies
Date: Tue, 16 May 2023 16:48:02 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2305161644060.50034@angie.orcam.me.uk>
References: <20230516110038.2413224-1-schnelle@linux.ibm.com> <20230516110038.2413224-21-schnelle@linux.ibm.com>
Mime-Version: 1.0
Return-path: <netdev+bounces-3034-gl-netdev-2=m.gmane-mx.org@vger.kernel.org>
In-Reply-To: <20230516110038.2413224-21-schnelle@linux.ibm.com>
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Jesse Brandeburg <jesse.brandeburg@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Ralf Baechle <ralf@linux-mips.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <pa>

On Tue, 16 May 2023, Niklas Schnelle wrote:

> diff --git a/drivers/net/fddi/defxx.c b/drivers/net/fddi/defxx.c
> index 1fef8a9b1a0f..0fbbb7286008 100644
> --- a/drivers/net/fddi/defxx.c
> +++ b/drivers/net/fddi/defxx.c
> @@ -254,7 +254,7 @@ static const char version[] =
>  #define DFX_BUS_TC(dev) 0
>  #endif
>  
> -#if defined(CONFIG_EISA) || defined(CONFIG_PCI)
> +#ifdef CONFIG_HAS_IOPORT
>  #define dfx_use_mmio bp->mmio
>  #else
>  #define dfx_use_mmio true

 For this part:

Acked-by: Maciej W. Rozycki <macro@orcam.me.uk>

  Maciej

