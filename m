From: "Manfred Haertel, DB3HM" <Manfred.Haertel@rz-online.de>
Subject: Incoming AX.25 connections
Date: Sun, 30 Nov 2003 20:27:01 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3FCA4485.6030804@rz-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams@vger.kernel.org

If I do not have any AX.25 listener running (no ax25d and no LinKT boun=
d=20
to some SSID on my system) and somebody tries to connect to my system,=20
it seems, that Linux accepts this socket, as it sends an outgoing UA to=
=20
the incoming SABM.

On the other hand, as there is no listener, the caller is connected to=20
"nothing" on my system (just to the kernel). I can't talk to him.

Is this correct?

If it is, is there any system call to "connect" to the incoming=20
connection afterwards?

Thanks in advance for any help.

--=20
Manfred H=E4rtel, DB3HM    mailto:Manfred.Haertel@rz-online.de
                          http://rz-home.de/mhaertel

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
