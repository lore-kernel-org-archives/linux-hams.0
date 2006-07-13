From: Bernd Eckenfels <be-mail2006@lina.inka.de>
Subject: Re: netstat with rose support?
Date: Thu, 13 Jul 2006 14:28:24 +0200
Message-ID: <20060713122824.GA4729@lina.inka.de>
References: <620c90570607112014j5857afecs2e4a69eb4b1bc2e7@mail.gmail.com> <20060712231643.GA16205@linux-mips.org> <620c90570607130408w44cc5d59n508ab8268db24021@mail.gmail.com> <20060713112041.GA20294@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060713112041.GA20294@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Chuck Hast <wchast@gmail.com>, linux-hams <linux-hams@vger.kernel.org>

On Thu, Jul 13, 2006 at 12:20:41PM +0100, Ralf Baechle wrote:
> > Thank you for this information, does this mean that if I re-compile
> > the net-tools
> > all I need to do is enable ROSE? If so I guess I will have to try t=
o do it,
> > unless of course there is a binary which I can download somewhere.
>=20
> Yes, you just need to recompile net-tools.

I think the reason why rose is not enabled by default is because there =
are
some header files (kernel, libc, other package - cant remeber) which ar=
e not
available on all distributions.

This used to be also the case for AX25, but that changed with recent li=
bcs.

Running configure is enough to enable ROSE support. If your system miss=
es
some headers in that case, let me know so i can document this.

Gruss
Bernd
--=20
  (OO)     -- Bernd_Eckenfels@M=F6rscher_Strasse_8.76185Karlsruhe.de --
 ( .. )    ecki@{inka.de,linux.de,debian.org}  http://www.eckes.org/
  o--o   1024D/E383CD7E  eckes@IRCNet  v:+497211603874  f:+497211515161=
29
(O____O)  When cryptography is outlawed, bayl bhgynjf jvyy unir cevinpl=
!
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
