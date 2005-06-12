From: "Manfred Haertel, DB3HM" <Manfred.Haertel@rz-online.de>
Subject: Re: Problems in my ax25 interface.
Date: Sun, 12 Jun 2005 08:25:05 +0200
Message-ID: <42ABD541.7020903@rz-online.de>
References: <200506112158.32378.ct1drb@iol.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200506112158.32378.ct1drb@iol.pt>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Linux-hams List <linux-hams@vger.kernel.org>

David Quental wrote:

> All runs fine, but, lately I added the samba service. Now in my liste=
n (where=20
> I can see traffic) I saw a lot of ip frames sending to the 1k2 device=
 (I=20
> changed order in /etc/ax/ax25-up and now 1k2 device is in first place=
) and if=20
> I do rcax25 stop all system freezes.

The IP frames are most probably caused by mdnsd, the Multicast DNS=20
Daemon, which uses all (broadcast?) interfaces by default. If you don't=
=20
need it really, shut it down (rcmdnsd stop).

--=20
Manfred H=E4rtel, DB3HM    mailto:Manfred.Haertel@rz-online.de
                          http://rz-home.de/mhaertel
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
