From: <Morgan.Wemanis@mark.se>
Subject: SV: IMPORTANT: LinuxNode v0.3.2
Date: Tue, 9 Sep 2003 17:13:08 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <15F2A301AB74C44A995781A937567A7C010A6E52@markadmex01.adm.mark.se>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
content-class: urn:content-classes:message
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cathrynm@junglevision.com
Cc: linux-hams@vger.kernel.org

I'm using 2.2.x kernel with LinuxNode 0.3.2 w/o problem.

And im quite sure that i needed to upgrade to libax25 0.0.11..
http://ax25.sourceforge.net/

73 de Morgan, sm6tky

-----Ursprungligt meddelande-----
=46r=E5n: Cathryn Mataga [mailto:cathrynm@junglevision.com]
Skickat: den 9 september 2003 14:49
Till: unlisted-recipients=20
Kopia: linux-hams@vger.kernel.org
=C4mne: Re: IMPORTANT: LinuxNode v0.3.2




Tomi Manninen wrote:
> Hello all,
>=20
> I just uploaded a new version of LinuxNode to:
>=20
>   http://hes.iki.fi/pub/ham/unix/linux/ax25/
>=20
> You'll find a source tar.gz, a source RPM and a binary RPM
> (compiled on RedHat 9).
>=20
> This version contains fixes for *SERIOUS* security flaws (read
> "remote root"). Upgrading all systems immediately is highly
> recommended!!!
>=20
> Thanks to Morgan, SM6TKY for pointing out the flaws and helping
> in fixing them!
>=20

I'm trying to compile 0.3.2 on Redhat 6.2.  I get this error.

/usr/local/include/netax25/axlib.h:49: parse error before `null_ax25_ad=
dress'
/usr/local/include/netax25/axlib.h:49: warning: data definition has no =
type or storage class
/usr/local/include/netax25/axlib.h:67: warning: `struct full_sockaddr_a=
x25' declared inside parameter list
/usr/local/include/netax25/axlib.h:67: warning: its scope is only this =
definition or declaration,
/usr/local/include/netax25/axlib.h:67: warning: which is probably not w=
hat you want.
/usr/local/include/netax25/axlib.h:74: warning: `struct full_sockaddr_a=
x25' declared inside parameter list
/usr/local/include/netax25/axlib.h:88: parse error before `*'
/usr/local/include/netax25/axlib.h:95: parse error before `*'
/usr/local/include/netax25/axlib.h:101: parse error before `*'
/usr/local/include/netax25/axlib.h:107: parse error before `*'



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
