From: "Manfred Haertel, DB3HM" <Manfred.Haertel@rz-online.de>
Subject: Re: axctl utility
Date: Tue, 09 Sep 2003 20:39:36 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F5E1E68.4050004@rz-online.de>
References: <3F5CE356.3050702@rz-online.de> <1063054828.1357.133.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1063054828.1357.133.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams@vger.kernel.org

Tomi Manninen wrote:

> The ioctl call is passing a "struct ax25_ctl_struct" to the kernel. T=
hat
> structure has the fields digi_count and digi_addr (see netax25/axlib.=
h)
> that should probably be filled in. The argument parsing should be
> modified to accept a digi path in addition to to dest call (maybe use
> ax25_aton() to fill in a temporary "struct full_sockaddr_ax25" and co=
py
> the digi stuff from there to the ax25_ctl_struct).

Hmm, I tried adding the following lines before the ioctl() call:

ax25_ctl.digi_count =3D 1;
if (ax25_aton_entry(mydigi, (char *)&ax25_ctl.digi_addr[0]) =3D=3D -1)
         return 1;

but I still get the "Transport endpoint is not connected" message... :-=
(

It seems that there is no problem with ax25_aton_entry(), the error=20
message comes from the ioctl() call...

--=20
Manfred H=E4rtel, DB3HM    mailto:Manfred.Haertel@rz-online.de
                          http://rz-home.de/mhaertel

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
