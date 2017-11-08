From: f6bvp <f6bvp@free.fr>
Subject: Re: [PATCH v3 0/2] refactor code and mark expected switch fall-throughs
Date: Wed, 8 Nov 2017 23:02:17 +0100
Message-ID: <8C2772CF-503A-4BA1-945B-4D4BCC5BA5FB@free.fr>
References: <b0e6de21-b258-dc78-4710-a61b81ec419c@trinnet.net> <20171027144853.Horde.ExzHfROE4gaCiHalihXFClP@gator4166.hostgator.com> <e5c376f0-fdd0-78a7-a40f-0b990cff0023@trinnet.net> <20171029.104541.1487088453362795756.davem@davemloft.net> <f0f38830-badd-1859-a9ba-5ac5452f8847@trinnet.net>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <f0f38830-badd-1859-a9ba-5ac5452f8847@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Ranch <linux-hams@trinnet.net>
Cc: David Miller <davem@davemloft.net>, garsilva@embeddedor.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org, wharms@bfs.de, hal@kd.net.au, thomas@osterried.de

Hi all,
I just want to report that I applied the NetRom patch to most recent kernel=
. NetRom does not seem to be affected and connexion is doing well between m=
y FPAC node f6bvp and f3kt.

73 de Bernard f6bvp

Sent from my iPhone

> Le 29 oct. 2017 =A8=A4 05:15, David Ranch <linux-hams@trinnet.net> a =A8=
=A6crit :
>=20
>=20
> Hello David,
>=20
> Thanks for the reply.  I completely admit that there aren't many changes =
going into this section of code.  Unfortunately, we've had some nasty break=
s that took quite a long while to get fixed.
>=20
> Can you point me in the direction of this kbuild test robot (URLs, etc) s=
o I can better understand if it makes sense to add tests there?  For exampl=
e, do you know if it's "changed based" so only certain tests will run if gi=
ven files are updated?
>=20
> --David
> KI6ZHD
>=20
>=20
>> On 10/28/2017 06:45 PM, David Miller wrote:
>> From: David Ranch <linux-hams@trinnet.net>
>> Date: Sat, 28 Oct 2017 10:53:24 -0700
>>=20
>>> Does anyone else have thoughts on this topic?
>>=20
>> I think you are making a mountain out of a mole hill.
>>=20
>> If you care so much about this, set things up so that entities such as
>> the kbuild test robot run whatever tests you think are necessary.
>>=20
>> Otherwise, continually test the stack yourself and report any
>> regressions here as fast as you can.
>>=20
>> If soemone can't be bothered to verify or test someone's change in 2
>> or 3 days, except in extreme circumstances, I absolutely refuse to
>> burdon the submitter and let their patches rot in the queue.
>>=20
>> That's unacceptable.
>>=20
>> That's the proper way to deal with this, without unreasonably
>> burdoning people who just want to keep the code across the tree modern
>> and more up to date.
>>=20
>> Thank you.

