From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: Conflicting node name for services
Date: Sun, 22 Dec 2002 01:41:41 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212220138420.3171-100000@oh2bns.ampr.org>
References: <3E042CA1.640F51D6@free.fr>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3E042CA1.640F51D6@free.fr>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?iso-8859-1?Q?G=E9rard?= Parat / F6FGZ <f6fgz@free.fr>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

Hi G=E9rard,

> At least I understood a problem using telnet on node software by OH2B=
NS. There
> was a name conflict using node which may be a generic word. So I chan=
ged the
> following and eveything is working fine now.
>=20
> In /etc/services use the following line:
> netrom          3694/tcp                        # OH2BNS's node softw=
are

Ok, good to know. But just out of curiosity, what service did conflict
with "node" ? My /etc/services from RH8 doesn't show any conflicts...

--=20
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
