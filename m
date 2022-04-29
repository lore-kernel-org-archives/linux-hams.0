From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [RFC v2 21/39] net: add HAS_IOPORT dependencies
Date: Fri, 29 Apr 2022 16:13:18 +0200
Message-ID: <20220429141318.qonhkqar2nwyub7d@pengutronix.de>
References: <20220429135108.2781579-1-schnelle@linux.ibm.com>
 <20220429135108.2781579-36-schnelle@linux.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lqcj2mbryc4mt5il"
Return-path: <linux-can-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220429135108.2781579-36-schnelle@linux.ibm.com>
List-ID: <linux-hams.vger.kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-pci@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Wolfgang Grandegger <wg@grandegger.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Ralf Baechle <ralf@linux-mips.org>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, "open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>, "moderated list:INTEL ETHERNET DRIVERS" <intel-wired-lan@lists.osuosl.org>, "open list:AX.25 NETWORK LAYER" <linux-hams@vger.kern>


--lqcj2mbryc4mt5il
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 29.04.2022 15:50:33, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=3Dn will result in inb()/outb() and friends
> not being declared. We thus need to add HAS_IOPORT as dependency for
> those drivers using them. It also turns out that with HAS_IOPORT handled
> explicitly HAMRADIO does not need the !S390 dependency and successfully
> builds the bpqether driver.
>=20
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>  drivers/net/can/cc770/Kconfig      | 1 +
>  drivers/net/can/sja1000/Kconfig    | 1 +

For drivers/net/can:

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--lqcj2mbryc4mt5il
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmJr8nsACgkQrX5LkNig
010rRQf+I21I3qExctz2dzFcblEyXWU6OZwWbigahGhoVi7VXxh/udlftKM5SSh+
Cbv6NDOt9GxEP3/0Y4muCTq4Xg9jQenFXBGXRT89GaRIDiiAT11MOJ/e6YCiAtBq
yHx8f04ddLmYcRFLdgZS5GvWd8/5Ji6XKBdPf3hE5KgYjEhrGNEGWFQgne10eP2c
WqxPPa+kql2KQ2lDKUY6QcNpdhcug0PxAGJL9gnatBMVQGlwotjP/kpeKK7/7LVX
11FA2bCHvNSpqljEGADPjl73qQsnsY9TgauxzytBOgrmDginWo2AmeJ0Pu8KbP5k
bcb5RRiJNIkv36dBdpipE0wixsnf5A==
=iK8a
-----END PGP SIGNATURE-----

--lqcj2mbryc4mt5il--
