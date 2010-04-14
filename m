From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: Problems with nrattach
Date: Wed, 14 Apr 2010 11:16:32 +0200
Message-ID: <20100414091632.GR7246@x-berg.in-berlin.de>
References: <g2n83d6fb251004131859w55f96e8cga36a794e5b3cbc0f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <g2n83d6fb251004131859w55f96e8cga36a794e5b3cbc0f@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Robert Thoelen <kd1zd@rtcubed.org>
Cc: linux-hams@vger.kernel.org

Hello,

the problem is already fixed in the CVS upstream version.
Sorry again for the inconvenience. I introduced this problem a while ag=
o.

73,
	- Thomas  dl9sau

On 2010-04-13 21:59:13 -0400, Robert Thoelen <kd1zd@rtcubed.org>
wrote in <g2n83d6fb251004131859w55f96e8cga36a794e5b3cbc0f@mail.gmail.co=
m>:
> I'm having problems with nrattach and kernel 2.6.18.
>=20
> I have done a modprobe netrom, and an lsmod shows the netrom module
> linked to the ax25 module.
>=20
> My nrports and nrbroadcast files are set up.
>=20
> When I run nrattach, it says the nr0 port is assigned, but nothing
> shows up in the ifconfig list. =A0Also, re-running nrattach shows it
> trying to attach to nr0, indicating that the previous command did not
> work.
>=20
> I can't find any other error messages which would point me to what is
> going wrong.
>=20
> I'm using ax25-tools-0.0-10-rc2, and libax25-0.0.12-rc2.
>=20
> Any suggestions on what could be going wrong?
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
