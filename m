From: "Manfred Haertel, DB3HM" <Manfred.Haertel@rz-online.de>
Subject: axctl utility
Date: Mon, 08 Sep 2003 22:15:18 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F5CE356.3050702@rz-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams@vger.kernel.org

When I try to use the axctl utility on an AX.25 connection that runs=20
over a digipeater, I get an error message:

axctl: SIOAX25CTLCON: Transport endpoint is not connected

This is because there is no direct connection between the source and
the destination call sign and it seems as if there is no way to specify
a digipeater on the command line.

I have read the source of the utility, it's actually very simple, just
passes the parameters to an ioctl call with SIOCAX25CTLCON as the secon=
d
parameter.

Is there a chance to specify a digipeater in the ioctl() call? I have=20
not found a documentation of this call yet.

Thanks for any help!

73 de DB3HM

--=20
Manfred H=E4rtel, DB3HM    mailto:Manfred.Haertel@rz-online.de
                          http://rz-home.de/mhaertel

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
