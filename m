From: "AE5PL Lists" <HamLists@ametx.com>
Subject: RE: aprsd failure
Date: Fri, 3 Dec 2004 10:57:33 -0600
Message-ID: <478F6623898BBC4DBD692A223D28298A0EF8D3@amewebsrvr.webametx.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

This is because of the DEL character in the Mic-E packets getting mangl=
ed.  I do not know if this is an aprsd problem or a TNC problem.  Howev=
er, if you are running the TNC in KISS mode, then it is an aprsd proble=
m.  If you are using the ax.25 kernel support in Linux, you can use jav=
APRSSrvr which provides much more complete IGate and APRS server capabi=
lities as well as including a complete APRS digipeater capability.

javAPRSSrvr is free for amateur radio use and may be obtained by contac=
ting me directly at pete@ae5pl.net.  Be sure to include your callsign.

73,

Pete Loveall AE5PL
mailto:pete@ae5pl.net=20

> -----Original Message-----
> From: Thomas M=F8rch
> Posted At: Friday, December 03, 2004 10:40 AM
> Subject: aprsd failure
>=20
> Anyone that has experienced that aprsd 2.2.5 is sending=20
> stations far away?
>=20
> I have set it up on our local station in Denmark, and all=20
> station that it hears on RF is sendt to Russia
>=20
> It's about 100 degrees offset on the longitude every time.=20
> The server is running aprsd and aprsdigi.
>=20
> Any one that has a hint to what I should look at?
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
