From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: aprsd setup
Date: Sun, 7 Nov 2004 21:20:25 +1100
Message-ID: <20041107102025.GA5684@cloud.net.au>
References: <001301c4c469$d56f7c40$6402a8c0@laptop> <20041107014458.GA3069@cloud.net.au> <001601c4c4b2$36c995a0$6402a8c0@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <001601c4c4b2$36c995a0$6402a8c0@laptop>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

On Sun, Nov 07, 2004 at 11:11:57AM +0100, Thomas M=F8rch wrote:
> Hamish Moffatt wrote:
> >On Sun, Nov 07, 2004 at 02:33:49AM +0100, Thomas - OZ2AFO wrote:
> >>How would one do the right setup of both aprsdigi AND aprsd on the
> >>same PC? (If that's needed to do both my jobs)
> >
> >You can run both just fine. Just run them. This requires that you ar=
e
> >using the linux kernel's AX.25 with an appropriate device such as a
> >TNC in KISS mode etc. (aprsdigi always requires that, while aprsd ca=
n
> >use kernel AX.25 or drive the TNC (NOT in KISS mode) directly.)
>=20
> Kernel ax25 is already running, and with aprsd! What confuses me, is =
that
> apparently both aprsd and aprsdigi  uses the port "default" call (the=
 one
> from axports), as their source call. I can not specify different call=
s (or=20
> ssid's)
> for the different programs. As I understand two programs can not use
> the same ssid / call? Or can they?

They can't for connected traffic (as I understand), but it's no problem
for unconnected/UI traffic. I don't believe you can specify different
calls at all... though my memory is fading a bit in this area!

> I connect to my own server on port 1313 with uiview. My own server is
> connected to seccond.aprs.net on port 23, and to oz3acc.dyndns.org on
> port 1313.
>=20
> If I view the http status, it says that all is connected, even my uiv=
iew.

Does it show any packets counted?

> Should I use another port for "user" connections with ui-view? (It's =
a bit
> confusing with 10 different ports that does allmost the same, but wit=
h a=20
> little
> bit of difference for each of them, specialy when you are new to aprs=
)

I would suggest 14579 perhaps, 1313 is the link port used to connected
aprsd IGATEs together only (if memory serves).

Hamish
--=20
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
