From: Berndt Josef Wulf <wulf@ping.net.au>
Subject: Re: [ANN] Hamlib 1.2.3 released
Date: Sat, 20 Nov 2004 17:50:18 +1030
Message-ID: <200411201750.27373.wulf@ping.net.au>
References: <20041119221617.GE3052@charybde.local>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1639047.mMzMnbQnfA";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <hamlib-developer-admin@lists.sourceforge.net>
In-Reply-To: <20041119221617.GE3052@charybde.local>
Sender: hamlib-developer-admin@lists.sourceforge.net
Errors-To: hamlib-developer-admin@lists.sourceforge.net
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/hamlib-developer>,
	<mailto:hamlib-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:hamlib-developer@lists.sourceforge.net>
List-Help: <mailto:hamlib-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/hamlib-developer>,
	<mailto:hamlib-developer-request@lists.sourceforge.net?subject=subscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum=hamlib-developer>
To: Stephane Fillod <f8cfe@free.fr>, Hamlib developers <hamlib-developer@lists.sourceforge.net>, Linux HAMs <Linux-hams@vger.kernel.org>

--nextPart1639047.mMzMnbQnfA
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

G'day,

is there a particular reason why hamlib has bindings such as tcl and perl=20
enabled by default? I believe that it makes hamlib more complex and difficu=
lt=20
to maintain as a package due to the increase of inter-library dependencies=
=20
and bloads a standard installation unnecessarily.

It doesn't seem to make sense that "./configure --help" reports options=20
=2D-with-perl-binding, --with-tcl-binding etc. when it really isn't as they=
 are=20
enabled by default. I had to explicitly add configure arguments=20
=2D-without-<name>-binding in order to stop building these.

Bindings didn't get build by default in previous version.. Am I missing=20
something here?

73, Berndt
VK5ABN

On Saturday 20 November 2004 08:46, Stephane Fillod wrote:
> Good news everyone!
>
> Hamlib-1.2.3 has been released.
>
> Hamlib provides a unified environment for the development of radio and
> rotator control applications. Release 1.2.3 includes many fixes since
> last official version. A strong emphasis has been put on backend
> addition and fixes.
>
>
> Check it out at http://hamlib.org !
>
> New in 1.2.3:
> * frontend API: LEVEL_SQLSTAT marked as deprecated
> * new backends: Racal, V4L radio cards, Watkins-Johnson 8888
> * new models: IC-78, IC-7800, IC-R20, IC-756PROIII
> * fixes: AOR 5k&8k: added S-Meter, 7030: fixed freq,
>          IC-R8500: calibrated S-Meter, legacy Jupiter and many others..
> * port: mingw32 dist with gcc 3.4 version, and stdcall interface
>         to prepare for VisualBasic support.
>
> Download pages are accessible at http://sourceforge.net/projects/hamlib
> i386 rpms and .deb coming soon. Win32 DLL's are already available.
>
>
> Please, test it out and report to hamlib-developer@lists.sourceforge.net
> Developers are also invited to join the Hamlib team by subscribing to
> this mailing list. If your favorite rig is not in the supported list,
> feel free to ask.
>
>
> Many thanks to all the developers and testers who participated
> in this release.
>
> Have fun and let us know!
>
> 73's de Stephane - F8CFE / the Hamlib team
>
>
> -------------------------------------------------------
> This SF.Net email is sponsored by: InterSystems CACHE
> FREE OODBMS DOWNLOAD - A multidimensional database that combines
> robust object and relational technologies, making it a perfect match
> for Java, C++,COM, XML, ODBC and JDBC. www.intersystems.com/match8
> _______________________________________________
> Hamlib-developer mailing list
> Hamlib-developer@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/hamlib-developer

--nextPart1639047.mMzMnbQnfA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (NetBSD)

iD8DBQBBnvA7cUIHpeIRpjERAlAKAJ0aZwfhP1c1NSW7NL8UmtoRnkyN+gCfUTbg
CMfjd8MzOqmoTbhnHxvTV08=
=YPcK
-----END PGP SIGNATURE-----

--nextPart1639047.mMzMnbQnfA--


-------------------------------------------------------
This SF.Net email is sponsored by: InterSystems CACHE
FREE OODBMS DOWNLOAD - A multidimensional database that combines
robust object and relational technologies, making it a perfect match
for Java, C++,COM, XML, ODBC and JDBC. www.intersystems.com/match8
