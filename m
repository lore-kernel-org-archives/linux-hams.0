From: Jacques Chion <Jacques.Chion@wanadoo.fr>
Subject: Re: Another mkiss patch (was: Re: AX-25 software that works on Fedora
 Core 4?)
Date: Wed, 24 Aug 2005 20:51:07 +0200 (CEST)
Message-ID: <Pine.LNX.4.44.0508242047490.5368-100000@cwoux2.cerise.fr>
References: <20050824105117.GA2783@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050824105117.GA2783@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Le Aug 24, Ralf Baechle =E9crivait :

> On Tue, Aug 23, 2005 at 09:17:02PM +0200, Jacques Chion wrote:
>=20
> > > > If i do the command "ifconfig", i have the interface sm0 with t=
he HWaddr LINUX-1 instead of my callsign F6CWO.
> > > > this can be corrected with the command ifconfig sm0 hw ax25 F6C=
WO up
> > > > and all is working fine. I don't see from where is coming this =
LINUX-1.
> > >=20
> > > LINUX-1 is the driver's builtin default MAC address.
> > >=20
> >=20
> > I will search what is wrong on my box. Sure it's something stupid :=
)
>=20
> I did setup soundmodem myself last night and was able to reproduce th=
e
> fault.  The problem is being caused by soundmodem passng slightly dif=
ferent
> arguments to the failing ioctl than kissattach and the drivers strict
> sanity checks did reject that.  I changed that and it's working now.
>=20
> Latest version attached below.  This I hope is going to be the final
> version of this patch.
>=20
This is the last version of the patch !!
Birds are singing, sun is shining, women are pretty and sooundmodem is =
working well, without problems.
All tant thanks to Ralf !
So thank you very much to have spent your time with this problem, and c=
ongratulations.

Best 73.

Jim F6CWO



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
