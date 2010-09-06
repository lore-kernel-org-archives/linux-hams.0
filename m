From: Kamal Mostafa <kamal@whence.com>
Subject: Re: [ANN] Hamlib 1.2.12 released
Date: Sun, 05 Sep 2010 17:58:36 -0700
Message-ID: <1283734716.2702.69.camel@fourier>
References: <20100904095235.GJ17318@charybde.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-EBSIf9U4GsDE+J9Z5B6T"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20100904095235.GJ17318@charybde.local>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Hamlib developers <hamlib-developer@lists.sourceforge.net>
Cc: ubuntu-hams@lists.launchpad.net, Linux-hams@vger.kernel.org


--=-EBSIf9U4GsDE+J9Z5B6T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hamlib 1.2.12 has been packaged and uploaded for Debian (unstable):
http://packages.qa.debian.org/h/hamlib.html
However it will not make it into the imminent Debian Squeeze release.

Hamlib 1.2.12 will appear in the upcoming Ubuntu Maverick release.
Unofficial packages for the current Ubuntu Lucid release are also
available:
https://launchpad.net/~ubuntu-hams/+archive/ppa


Note to USB kit radio users:
The Debian and Ubuntu hamlib 1.2.12 packages include a new udev entry
which eliminates the need to use 'sudo' with the USB kit radios that
have an embedded FTDI or VOTI AVRusb controller (elektor507,
si570avrusb, dwt) and probably also for people using some USB serial
converter cables/dongles:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D595525


73 de KA6MAL

 -Kamal


On Sat, 2010-09-04 at 11:52 +0200, Stephane Fillod wrote:
> Good news everyone!
>=20
> Hamlib-1.2.12 has been released.
>=20
> Hamlib provides a unified environment for the development of radio
> and rotator control applications. The release 1.2.12 includes many
> improvements since last official version.
>=20
> The wiki site is available at http://apps.sourceforge.net/mediawiki/hamli=
b/
>=20
> Version 1.2.12
> * New models: PCR-2500, RX331, TRP 8255 S R
> * New rotator backends: DF9GR's ERC
> * Fixes and features: Paragon, TS-690S, FT-920, FT-990, FT-2000,
>             Elektor SDR-USB, IC-7000, IC-7700, AR-8200, AR-8600
>=20
> Download page is accessible at http://sourceforge.net/projects/hamlib,
> rpms, .deb and Win32 DLL's coming soon.
>=20
> Please, check it out and report to hamlib-developer@lists.sourceforge.net
> If your favorite rig is not in the supported list, feel free to ask.
> We need more beta-testers, so all the backends can reach the stable
> and fully supported state.
>=20
> Many thanks to all the developers and testers who participated
> in this release. Contributors and backend maintainers are listed in
> the AUTHORS file.
>=20
> Have fun and let us know!
>=20
> 73 de Stephane - F8CFE & the Hamlib team


--=-EBSIf9U4GsDE+J9Z5B6T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAABAgAGBQJMhDy7AAoJEOf3EFVUCeQiQTQQAILm+uqwX7As7Ev7RFPsXER2
eyCwAJy0cprtOBmjYwAqDCbbVvc9p6eH5Jk/XFBJKPWWU+F9ut1ZM0KIeam7ueB6
ik0cyb4OGlgwWDtlyhSCySLbojb35Dxx+Jj4ELu6Md43V87WhiB0Q7wVzWSOhU4G
Kt6twsH+lsiHBTygssOCAET6OeTEJEwtH/9dJkSCuIyXPljW5XUmjZDcHo9KeJAi
TmpvesUu5M/WVFJDuxgCeKdg6n4ka86AqTCxm7l6Es30xl83aPhySOyoxKNlW8Y8
8hmIYeuNFzj4Tm1R18hLqJ1z7Bm8RCjeUe1ZLMCthbhu544cvxB1qVC731FcGooV
B5dx7nOeHY0n07wrvauQPY0gutXbzVEbNvi4vvZp82PV1dWLkT7jrbwZvr5g7S8F
tFADYonOm6gxi0y1ljg3bGMStsyaW0JNZO0NqaGuoERD3Y4NF9BIzLhxT5RFYyW/
tGXH++SObPeKSi0xoLzROeG5u3DwYZRtvOKLb0FmdMR22lQnTgfH5lWL6gYoITEx
7ycfbkldEDhBQUX237qY0bj3Oa0tpERqIw5BokoUxaKzrNH1eF5A7yLKBNmM1iVI
oQn48WtUZhVCi1pxOOpsRS3PP1t1ofZhHwgWDt7cRGuivn5QEzmIX0rYMywn5E3S
epRfgT8Jsz4gQkESuntK
=Dpf8
-----END PGP SIGNATURE-----

--=-EBSIf9U4GsDE+J9Z5B6T--
