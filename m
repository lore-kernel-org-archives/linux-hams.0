From: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [RFC v2 21/39] net: add HAS_IOPORT dependencies
Date: Tue, 03 May 2022 14:45:21 +0200
Message-ID: <867e70df01fc938abf93ffa15a3f1989a8fb136b.camel@linux.ibm.com>
References: <20220429135108.2781579-1-schnelle@linux.ibm.com>
         <20220429135108.2781579-36-schnelle@linux.ibm.com>
         <alpine.DEB.2.21.2205012324130.9383@angie.orcam.me.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=z5pRrwadTvaMNn3IfMVuln6dl3dg7299RmoATTWlzwg=;
 b=D0+Qdgb0wJMI40BA+uEYDB2P6ae4KozbuZ5K2JQhR9fNK/vvaCLl8k/uzHk+kiFMdb7H
 frtHTtYr0bpz3U0IBPVI0yQiqYkMij/Qoal91w/qxWeeTfyH0L7yu9WYWJMH3RduaEWk
 S6cryHXPNrOrbD1mNOGwPNQlFI6C53VncjhyvgIMu1Jg+xG0WtcFVVuOcaCsVeeVCOiR
 0uhyts6SV9au3nINgAaS/hrT/qrRyKsFOW8eEMnTceJ/nZod58M93wWyEA61QO4+KW5i
 9z5ydpwqezzhj4U7nSkKGL5hsRg1/vAaS0NeoTph0IkgsHmgbps2PLUqi8Ikbl+Z9nUM uA== 
In-Reply-To: <alpine.DEB.2.21.2205012324130.9383@angie.orcam.me.uk>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-pci@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, Arnd Bergmann <arnd@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Wolfgang Grandegger <wg@grandegger.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Ralf Baechle <ralf@linux-mips.org>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, "open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>, "moderated list:INTEL ETHERNET DRIVERS" <intel-wired-lan@lists.osuosl.org>, open

On Sun, 2022-05-01 at 23:48 +0100, Maciej W. Rozycki wrote:
> On Fri, 29 Apr 2022, Niklas Schnelle wrote:
>=20
> > In a future patch HAS_IOPORT=3Dn will result in inb()/outb() and friends
> > not being declared. We thus need to add HAS_IOPORT as dependency for
> > those drivers using them. It also turns out that with HAS_IOPORT handled
> > explicitly HAMRADIO does not need the !S390 dependency and successfully
> > builds the bpqether driver.
> [...]
> > diff --git a/drivers/net/fddi/Kconfig b/drivers/net/fddi/Kconfig
> > index 846bf41c2717..fa3f1e0fe143 100644
> > --- a/drivers/net/fddi/Kconfig
> > +++ b/drivers/net/fddi/Kconfig
> > @@ -29,7 +29,7 @@ config DEFZA
> > =20
> >  config DEFXX
> >  	tristate "Digital DEFTA/DEFEA/DEFPA adapter support"
> > -	depends on FDDI && (PCI || EISA || TC)
> > +	depends on FDDI && (PCI || EISA || TC) && HAS_IOPORT
> >  	help
> >  	  This is support for the DIGITAL series of TURBOchannel (DEFTA),
> >  	  EISA (DEFEA) and PCI (DEFPA) controllers which can connect you
>=20
>  NAK, this has to be sorted out differently (and I think we discussed it =

> before).
>=20
>  The driver works just fine with MMIO where available, so if `inb'/`outb'=
=20
> do get removed, then only parts that rely on port I/O need to be disabled=
. =20
> In fact there's already such provision there in drivers/net/fddi/defxx.c =

> for TURBOchannel systems (CONFIG_TC), which have no port I/O space either:
>=20
> #if defined(CONFIG_EISA) || defined(CONFIG_PCI)
> #define dfx_use_mmio bp->mmio
> #else
> #define dfx_use_mmio true
> #endif
>=20
> so I guess it's just the conditional that will have to be changed to:
>=20
> #ifdef CONFIG_HAS_IOPORT
>=20
> replacing the current explicit bus dependency list.  The compiler will=20
> then optimise away all the port I/O stuff (though I suspect dummy functio=
n=20
> declarations may be required for `inb'/`outb', etc.).
>=20
>  I can verify a suitable change with a TURBOchannel configuration once th=
e=20
> MIPS part has been sorted.
>=20
>   Maciej

With dfx_use_mmio changed as you propose above things compile on s390
which previously ran into missing (now __compile_error()) inl() via
dfx_port_read_long() -> dfx_inl() ->  inl().

Looking at the other uses of dfx_use_mmio I notice however that in
dfx_get_bars(), inb() actually gets called when dfx_use_mmio is true.
This happens if dfx_bus_eisa is also true. Now that variable is just
the cached result of DFX_BUS_EISA(dev) which is defined to 0 if
CONFIG_EISA is unset. I'm not 100% sure if going through a local
variable is still considered trivial enough dead code elimination, at
least it works for me=E2=84=A2. I did also check the GCC docs and they
explicitly say that __attribute__(error) is supposed to be used when
dead code elimination gets rid of the error paths.

I think we also need a "depends on HAS_IOPORT" for "config HAVE_EISA"
just as I'm adding for "config ISA".

