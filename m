From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: AX.25 kernel module development
Date: Tue, 8 Apr 2003 14:30:14 +0100
Sender: linux-hams-owner@localhost
Message-ID: <20030408143014.B30053@pull.privacy.nb.ca>
References: <200304081436.15919.oyvind@cs.uit.no>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200304081436.15919.oyvind@cs.uit.no>; from oyvind@cs.uit.no on Tue, Apr 08, 2003 at 02:36:15PM +0200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?=D8yvind_Hanssen?= <oyvind@cs.uit.no>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On Tue, Apr 08, 2003 at 02:36:15PM +0200, =D8yvind Hanssen wrote:
> Please excuse me if this has been discussed before..=20
>=20
> attempt to rewrite the kernel stack as well (?) And it seems to be so=
me=20
> uncertainty wrt. what is happening in Linux 2.5 (?)

Some (all?) of Ralf's patches are in the 2.5.x (~66), and the rest of h=
is
work is available via bitkeeper.

> What about keeping the core AX.25 stuff and drivers in kernel but spl=
it it
> out from the mainstream Linux codebase and do the development in a se=
parate
> project instead; like e.g. the ALSA project has done until now? I gue=
ss=20

Gak, no please. ALSA has stablized and intergrated into 2.5 kernel for =
a
reason. There is no need for a massive disruption of the AX.25 protocol=
(s)
and drivers, they are simple and small compared to the rest of the kern=
el.

Considering that a growing number of users (percentage wise) seem to
find building a custom stock kernel a challenge that they would rather
avoid, making the build process more complex would be a major stumbling
block for these users who are finding it hard enough. Plus, given how
little the amateur radio section is actually changed, I think it would
simply be creating work.

If there were more than the 2-3 people working on the kernel(ax25) code
and more than ~5 drivers being developed I might consider it worthwhile=
=2E

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
