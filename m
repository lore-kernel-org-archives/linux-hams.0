From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [PATCH] SMP fix for 6pack driver
Date: Thu, 1 Sep 2005 12:45:42 +0100
Message-ID: <20050901114542.GF2876@linux-mips.org>
References: <873botbxim.fsf@barad-dur.escomposlinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <873botbxim.fsf@barad-dur.escomposlinux.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?I=F1aki?= Arenaza <iarenaza@escomposlinux.org>
Cc: linux-hams@vger.kernel.org

On Sun, Aug 28, 2005 at 10:46:09PM +0200, I=F1aki Arenaza wrote:

> > You could try EB6EBU's m6pack which is an application level solutio=
n
> > to the problem.
>=20
> Just a little correction. It's EB2EBU, not EB6EBU (otherwise Google
> will not find my patch against ax25-tools-0.0.8 ;-)

Sorry :-)

> You can get it at:
>=20
>     http://www.escomposlinux.org/iarenaza/hamradio/m6pack/files/ax25-=
tools-0.0.8-m6pack.diff.bz2

I'm still contemplating if this should preferably be done in userspace =
or
in kernelspace ...

  Ralf
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
