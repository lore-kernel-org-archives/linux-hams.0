From: folkert <folkert@vanheusden.com>
Subject: Re: icmp
Date: Fri, 1 Apr 2016 21:07:24 +0200
Message-ID: <20160401190724.GD25136@belle.intranet.vanheusden.com>
References: <20160401184226.GC25136@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160401184226.GC25136@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

An other strange thing: I can't have 2 packets in that 2 second
interval. E.g. a traceroute only works if I add -N 1 -w 2.

On Fri, Apr 01, 2016 at 08:42:26PM +0200, folkert wrote:
> Hi,
>=20
> This evening I succeeded in doing ICMP over AX.25 over LoRa(!)!
>=20
> root@savannah:~/data/mkiss_moteino# ping -i 5 192.168.5.1
> PING 192.168.5.1 (192.168.5.1) 56(84) bytes of data.
> 64 bytes from 192.168.5.1: icmp_seq=3D4 ttl=3D64 time=3D4524 ms
> 64 bytes from 192.168.5.1: icmp_seq=3D7 ttl=3D64 time=3D1601 ms
> 64 bytes from 192.168.5.1: icmp_seq=3D8 ttl=3D64 time=3D1601 ms
> 64 bytes from 192.168.5.1: icmp_seq=3D9 ttl=3D64 time=3D1601 ms
> ^C
> --- 192.168.5.1 ping statistics ---
> 9 packets transmitted, 4 received, 55% packet loss, time 40005ms
> rtt min/avg/max/mdev =3D 1601.358/2332.248/4524.246/1265.550 ms
>=20
>=20
> Strange thing is that I need to add a -i something to ping; the regul=
ar
> 1 second ping confuses things (-i 2 also works).
>=20
> Software used: https://github.com/flok99/arduino-kiss
>=20
>=20
> Folkert van Heusden
>=20
> --=20
> ---------------------------------------------------------------------=
-
> Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


=46olkert van Heusden

--=20
MultiTail ist eine flexible Applikation um Logfiles und Kommando
Eingaben zu =FCberpr=FCfen. Inkl. Filter, Farben, Zusammenf=FChren,
Ansichten etc. http://www.vanheusden.com/multitail/
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
