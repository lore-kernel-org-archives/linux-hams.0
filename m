From: Robert Thoelen <kd1zd@rtcubed.org>
Subject: Re: node software for Linux
Date: Mon, 26 Apr 2010 20:08:15 -0400
Message-ID: <p2j83d6fb251004261708wa7a3c03aif9b0ce2982b7a683@mail.gmail.com>
References: <y2xdf8c8a6d1004251736sb8446a3bka7d66895ae0d71fb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <y2xdf8c8a6d1004251736sb8446a3bka7d66895ae0d71fb@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jim Kusznir <jkusznir@gmail.com>
Cc: linux-hams@vger.kernel.org

Jim,

Check out http://www.rtcubed.org/kd1zd for a copy of UROnode which
will run on Linux 2.6.18.

I've got it working with a local flexnet system here in CT, USA.  Also
I'm trying to link with another system in Kentucky with NET/ROM nodes.
 We are working a few bugs out, but making progress with that.



On Sun, Apr 25, 2010 at 8:36 PM, Jim Kusznir <jkusznir@gmail.com> wrote=
:
> Hi all:
>
> I have my linux system successfully operating the ax25 stack, with
> netrom, etc. =A0I've gotten to the point where I'm looking at
> "replacing" a stack of TNC's running TheNet X1J-4 with a linux box
> controlling radios (still deciding on dropping a KISS rom in the
> TNC's, or replacing them with something else that linux is
> controlling, such as sound cards or baycom modems, etc). =A0My goal i=
s
> to produce a NetRom node-like interface that also has full IP support=
,
> and AXIP capability. =A0Ultimately, I plan on establishing a "high
> speed" (at least 10mbps) IP network, and would like to use this as a
> "backbone" for the existing AX.25 / NetRom network.
>
> In any case, I'm trying to find a suitable node software. =A0I've bee=
n
> having trouble locating a version of "node" that still builds (I'm
> running Gentoo Linux, but would be fine running other linux variants,
> as long as they'll run on ARM (sheeva plug), MIPS (Ubnt hardware), an=
d
> the like.). =A0A local operator pointed me toward uronode, but it see=
ms
> that uronode.net disappeared, and so far I haven't been able to find =
a
> source distribution of that either.
>
> In an ideal world, I'd be able to run something like BPQ on linux, bu=
t
> it appears that also doesn't exist...
>
> So, suggestions?
>
> Thanks!
> --Jim
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Robert Thoelen, III KD1ZD
Pager: (860) 220-4000

Check out the KD1ZD Amateur TCP/IP Radio
page at http://www.rtcubed.org/kd1zd
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
