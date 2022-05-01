From: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [RFC v2 21/39] net: add HAS_IOPORT dependencies
Date: Sun, 1 May 2022 23:48:09 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2205012324130.9383@angie.orcam.me.uk>
References: <20220429135108.2781579-1-schnelle@linux.ibm.com> <20220429135108.2781579-36-schnelle@linux.ibm.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <20220429135108.2781579-36-schnelle@linux.ibm.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-pci@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, Arnd Bergmann <arnd@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Wolfgang Grandegger <wg@grandegger.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Ralf Baechle <ralf@linux-mips.org>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, "open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>, "moderated list:INTEL ETHERNET DRIVERS" <intel-wired-lan@lists.osuosl.org>, open

On Fri, 29 Apr 2022, Niklas Schnelle wrote:

> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. We thus need to add HAS_IOPORT as dependency for
> those drivers using them. It also turns out that with HAS_IOPORT handled
> explicitly HAMRADIO does not need the !S390 dependency and successfully
> builds the bpqether driver.
[...]
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
>  	help
>  	  This is support for the DIGITAL series of TURBOchannel (DEFTA),
>  	  EISA (DEFEA) and PCI (DEFPA) controllers which can connect you

 NAK, this has to be sorted out differently (and I think we discussed it 
before).

 The driver works just fine with MMIO where available, so if `inb'/`outb' 
do get removed, then only parts that rely on port I/O need to be disabled.  
In fact there's already such provision there in drivers/net/fddi/defxx.c 
for TURBOchannel systems (CONFIG_TC), which have no port I/O space either:

#if defined(CONFIG_EISA) || defined(CONFIG_PCI)
#define dfx_use_mmio bp->mmio
#else
#define dfx_use_mmio true
#endif

so I guess it's just the conditional that will have to be changed to:

#ifdef CONFIG_HAS_IOPORT

replacing the current explicit bus dependency list.  The compiler will 
then optimise away all the port I/O stuff (though I suspect dummy function 
declarations may be required for `inb'/`outb', etc.).

 I can verify a suitable change with a TURBOchannel configuration once the 
MIPS part has been sorted.

  Maciej
