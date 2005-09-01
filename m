From: Chuck Hast <wchast@gmail.com>
Subject: Re: [PATCH] SMP fix for 6pack driver
Date: Thu, 1 Sep 2005 07:47:46 -0500
Message-ID: <620c905705090105472209fc41@mail.gmail.com>
References: <873botbxim.fsf@barad-dur.escomposlinux.org>
	 <20050901114542.GF2876@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050901114542.GF2876@linux-mips.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: =?ISO-8859-1?Q?I=F1aki_Arenaza?= <iarenaza@escomposlinux.org>, linux-hams@vger.kernel.org

On 9/1/05, Ralf Baechle DL5RB <ralf@linux-mips.org> wrote:
> On Sun, Aug 28, 2005 at 10:46:09PM +0200, I=F1aki Arenaza wrote:
>=20
> > > You could try EB6EBU's m6pack which is an application level solut=
ion
> > > to the problem.
> >
> > Just a little correction. It's EB2EBU, not EB6EBU (otherwise Google
> > will not find my patch against ax25-tools-0.0.8 ;-)
>=20
> Sorry :-)
>=20
> > You can get it at:
> >
> >     http://www.escomposlinux.org/iarenaza/hamradio/m6pack/files/ax2=
5-tools-0.0.8-m6pack.diff.bz2
>=20
> I'm still contemplating if this should preferably be done in userspac=
e or
> in kernelspace ...
>=20

Is there anymore on making 6pack operate in multi-tnc mode as is done w=
ith the
dos drivers? We certainly can use that, I wish I could work on it, but
I fear I do not
know enough to do anything there.=20


--=20
Chuck Hast=20
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my goin=
g
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
