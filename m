From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: hamlib not compiling well
Date: Thu, 8 Jul 2004 08:11:05 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200407080811.05522.pa3gcu@zeelandnet.nl>
References: <1223.192.168.1.117.1089178842.squirrel@gateway> <200407071710.47138.pa3gcu@zeelandnet.nl> <2498.192.168.1.117.1089215964.squirrel@gateway>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <2498.192.168.1.117.1089215964.squirrel@gateway>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: w9ya@arrl.net
Cc: linux-hams@vger.kernel.org

On Wednesday 07 July 2004 17:59, w9ya@arrl.net wrote:
> >> I am running into a problem that I have not seen before. There are
> >> files being created but they are without the ".so"in the file name=
, I
> >> tried adding "--enable-shared" to the configure, but this did not
> >> work, nor have I ever required this.
> >
> > After installing libs one needs to use 'ldconfig' to configure dyna=
mic
> > linker =A0run time bindings, as show in the manual page of ldconfig=
=2E
> > I presume this is your problem.
>
> Um, perhaps I was not clear about this. If that is my fault, I am sor=
ry.
>
> This is prior to installing the libs.

Whatever, but i have just retrived hamlib-1.1.4.tar.bz2 decompressed it=
 and=20
simply did;

=2E/configure
make
make install

Things look ok to me. .so files do get created in subdirs, make install=
=20
installs everything in /usr/local/lib and seeminly links things as well=
=2E

> Bob
> w9ya

--=20
If the Linux community is a bunch of thieves because they
try to imitate windows programs, then the Windows community
is built on organized crime.

Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
