From: Leo Bistmans <on1aad.no.spam@amsat.org>
Subject: Re: Compiling last node version.
Date: Thu, 4 Mar 2004 19:17:58 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040304191758.6d499e0c.on1aad.no.spam@amsat.org>
References: <200403040004.24334@www.cabodesantapola.org>
	<1078392897.1273.11.camel@oh2bns.ampr.org>
	<49408.213.98.118.5.1078394577.squirrel@palotes.com>
	<1078407401.1281.17.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1078407401.1281.17.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tomi Manninen <oh2bns@sral.fi>
Cc: linux-hams@vger.kernel.org

On Thu, 04 Mar 2004 15:36:41 +0200
Tomi Manninen <oh2bns@sral.fi> wrote:

> On Thu, 2004-03-04 at 12:02, Ruben Navarro Huedo wrote:
>=20
> > Do you know about some Debian repository to download libax25-0.0.11
>=20
> No (I don't use debian) but I'm sure someone on the list can help
> you with this.

 Cannot find a backport debian package for it either.   So one can comp=
ile the .0.0.11-2 that is found in unstable or testing.  Compiling it o=
n your local system makes sure there will be no library mismatch.

 1) add deb-src source repository in the /etc/apt/sources.list

  deb-src http://ftp.belnet.be/debian unstable main=20

 2) read them

  apt-get update

 3=E0) fetch the source and compile

  apt-get -b source libax25

 4) if all goes well, install the two generated packages

  dpkg -i libax25_0.0.11-2_i386.deb
  dpkg -i libax25-dev_0.0.11-2_i386.deb

 There might be more paths to do it

 Good Luck, on1aad
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
