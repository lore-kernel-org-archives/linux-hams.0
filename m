From: "Manfred Haertel, DB3HM" <Manfred.Haertel@rz-online.de>
Subject: Re: Soundmodem - suppresing initial xmit
Date: Sun, 18 Nov 2007 08:23:11 +0100
Message-ID: <473FE85F.5070702@rz-online.de>
References: <20071116163231.GA9559@reid1.localdomain> <20071118035958.GA17161@reid1.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20071118035958.GA17161@reid1.localdomain>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Linux-hams List <linux-hams@vger.kernel.org>

don wrote:
> Thanks for the replies on my soundmodem question.  However I don't th=
ink
> they covered what is happening.
>=20
> Here is what comes out whenever I start soundmodem:
>=20
> ---------------------------------------------------------------------=
--
> Tx: fm W7DMR-0 to QST-0 UI  pid=3DCC
> E..~..@....r.............j..............._services._dns-sd._udp.local=
=2E..........._workstation._tcp.#.4...........reidmob1 [].4

This looks like the "Multicast DNS daemon". It broadcasts on every
network device which is available. In most cases you don't need this
deaemon and can safeley remove it from the startup ("insserv -r mdnsd")=
=2E

--=20
Manfred H=E4rtel, DB3HM    mailto:Manfred.Haertel@rz-online.de
                          http://rz-home.de/mhaertel

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
