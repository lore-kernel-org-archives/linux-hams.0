From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: =?iso-8859-1?Q?Re=A0:_New_stable_version_Linux_kernel_2=2E6=2E1_is_out?=
Date: Sat, 10 Jan 2004 19:27:36 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040110192736.A9978@pull.privacy.nb.ca>
References: <400045AB.4050403@geofizyka.pl> <20040110200607.I211@jeroen.pe1rxq.ampr.org> <20040110191328.GE951@tangerine.coulon.evette>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040110191328.GE951@tangerine.coulon.evette>; from jean-luc.coulon@wanadoo.fr on Sat, Jan 10, 2004 at 08:13:28PM +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Cc: linux-hams@vger.kernel.org

On Sat, Jan 10, 2004 at 08:13:28PM +0100, Jean-Luc Coulon (f5ibh) wrote=
:
> Le 10.01.2004 20:06, Jeroen Vreeken a =E9crit=A0:
> >On 2004.01.10 19:34:19 +0100 sp2ong@geofizyka.pl wrote:
> >> I have download lastest stable linux kernel 2.6.1 if this version
> >> contain all current patches for AX.25 stack?
> >
> >For the ax.25 stack yes, but the scc and mkiss patches are not yet i=
n.
> >
>=20
> Well, I tried to apply the scc patch to the 2.6.1 and it does not app=
ly ...
>=20
> [root@tangerine] /usr/src/linux # patch < /home/jean-luc/scc-linux-2.=
6.0.rxq.=20
> diff -p1
> patching file drivers/net/hamradio/scc.c
> Reversed (or previously applied) patch detected!  Assume -R? [n]

I haven't checked, but it is quite possibly that it was a reversed patc=
h.
Try saying 'y' here.

-ve3tix
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
