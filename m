From: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Subject: Re: AXIP?
Date: Sat, 05 Jul 2003 13:40:30 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F06B92E.7070307@pi8zaa.ampr.org>
References: <2042.44.140.19.34.1057400138.squirrel@ax25.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <2042.44.140.19.34.1057400138.squirrel@ax25.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; 
To: Pontus Falk <pfalk@ax25.org>
Cc: linux-hams@vger.kernel.org

Pontus Falk wrote:

>Hi!
>
>I'm trying to set up an AXIP link fo a friend of mine, with no success=
=2E..
>
>I'm using 2.4.20. Everyting is running very good, so I guess it is jus=
t a
>matter of configuration.
>
>I've read AX25-HOWTO, but don't get it to work...
>
>Any ideas?
>
>Regards,
>
>Pontus Falk/SM=D8RUX
> =20
>

Hi Pontus,

axipd doesn't handle SSID's very well, so if your using a SSID ID other=
=20
than -0 then this might be the cause why you don't get it to work.

Otherwise, send us is the command lines you use to iniate axip, and the=
=20
axipd.conf file.

--=20
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org=20


-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
