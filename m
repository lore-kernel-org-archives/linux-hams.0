From: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [RFC v2 21/39] net: add HAS_IOPORT dependencies
Date: Tue, 3 May 2022 14:36:21 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2205031359490.64520@angie.orcam.me.uk>
References: <20220429135108.2781579-1-schnelle@linux.ibm.com>  <20220429135108.2781579-36-schnelle@linux.ibm.com>  <alpine.DEB.2.21.2205012324130.9383@angie.orcam.me.uk> <867e70df01fc938abf93ffa15a3f1989a8fb136b.camel@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <867e70df01fc938abf93ffa15a3f1989a8fb136b.camel@linux.ibm.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-pci@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, Arnd Bergmann <arnd@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Wolfgang Grandegger <wg@grandegger.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Ralf Baechle <ralf@linux-mips.org>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, "open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>, "moderated list:INTEL ETHERNET DRIVERS" <intel-wired-lan@lists.osuosl.org>, open

On Tue, 3 May 2022, Niklas Schnelle wrote:

> >  The driver works just fine with MMIO where available, so if `inb'/`out=
b'=20
> > do get removed, then only parts that rely on port I/O need to be disabl=
ed. =20
> > In fact there's already such provision there in drivers/net/fddi/defxx.=
c=20
> > for TURBOchannel systems (CONFIG_TC), which have no port I/O space eith=
er:
> >=20
> > #if defined(CONFIG_EISA) || defined(CONFIG_PCI)
> > #define dfx_use_mmio bp->mmio
> > #else
> > #define dfx_use_mmio true
> > #endif
> >=20
> > so I guess it's just the conditional that will have to be changed to:
> >=20
> > #ifdef CONFIG_HAS_IOPORT
> >=20
> > replacing the current explicit bus dependency list.  The compiler will =

> > then optimise away all the port I/O stuff (though I suspect dummy funct=
ion=20
> > declarations may be required for `inb'/`outb', etc.).
[...]
> With dfx_use_mmio changed as you propose above things compile on s390
> which previously ran into missing (now __compile_error()) inl() via
> dfx_port_read_long() -> dfx_inl() ->  inl().

 Great, thanks for checking!  And I note referring `__compile_error' is=20
roughly equivalent to a dummy declaration, so you've got that part sorted.

> Looking at the other uses of dfx_use_mmio I notice however that in
> dfx_get_bars(), inb() actually gets called when dfx_use_mmio is true.
> This happens if dfx_bus_eisa is also true. Now that variable is just
> the cached result of DFX_BUS_EISA(dev) which is defined to 0 if
> CONFIG_EISA is unset. I'm not 100% sure if going through a local
> variable is still considered trivial enough dead code elimination, at
> least it works for me=E2=84=A2. I did also check the GCC docs and they
> explicitly say that __attribute__(error) is supposed to be used when
> dead code elimination gets rid of the error paths.

 Yeah, dead code elimination is supposed to handle such cases.  The local
automatic variable is essentially a syntactic feature not to use the same=20
expression inline over and over throughout a function (for clarity the=20
variable should probably be declared `const', but that is not essential)=20
and it is up to the compiler whether to reuse the value previously=20
calculated or to re-evaluate the expression.

> I think we also need a "depends on HAS_IOPORT" for "config HAVE_EISA"
> just as I'm adding for "config ISA".

 Oh absolutely!  There's the slot-specific port I/O space that is used to=20
identify EISA option cards in device discovery, so no EISA device will=20
ever work without port I/O.  Have a look at `decode_eisa_sig' in=20
drivers/eisa/eisa-bus.c for the very obvious code.  Note that some ISA=20
cards can be configured to appear as EISA devices as well (I have a 3c509B =

Ethernet NIC set up that way).

  Maciej
