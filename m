From: barry <barry_linux@rogers.com>
Subject: Unwanted Broadcast
Date: Sat, 28 Sep 2002 21:05:37 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200209282105.37374.barry_linux@rogers.com>
Reply-To: barry_linux@rogers.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Hi, I have installed ax25-apps-0.0.6 axt25-tools-0.0.8 and libax25-0.0.=
10 on=20
kernel 2.4.19 (manfrake 9.0 install)

Ihave FBB,NODE,CLX and CONVERS all running OK.

There are two TNC's connected, one on port AX0 the other on AX1.

Port AX0 rgularly send broadcasts (see below) AX1 does not. As far as I=
 can=20
see both AX0 and AX1 have been defined the same. Any suggestions how to=
=20
prevent this. They are only short packets (except when I restart the ma=
chine,=20
especially after a few hours of it being down), but they shouldn't be t=
here

Thanks=20

Barry


ax0: fm VE3NAV to VE3PZ ctl SABM+
ax0: fm VE3NAV to VE3PZ ctl SABM+
ax0: fm VE3NAV-4 to QST ctl UI pid=3DCC(IP) len 251
IP: len 251 44.135.97.17->44.255.255.255 ihl 20 ttl 64 DF prot UDP
UDP: len 231 netbios-dgm->netbios-dgm Data 223
0000  ..'=B2,.a....=D1.. EMEJEOFFFICACACACACACACACACACAAA. ENEEELEHFCEP=
=46FF
0040  ACACACACACACACABO.=FFSMB%..............................7.........=
=2E
0080  .........7.V.........H.\MAILSLOT\BROWSE..m.=FC..LINUX............=
=2E
00C0  ......U=AASamba Server 2.2.6pre2.
ax0: fm VE3NAV-4 to QST ctl UI pid=3DCC(IP) len 234
IP: len 234 44.135.97.17->44.255.255.255 ihl 20 ttl 64 DF prot UDP
UDP: len 214 netbios-dgm->netbios-dgm Data 206
0000  ..'=B3,.a....=C0.. EMEJEOFFFICACACACACACACACACACAAA. ABACFPFPENFD=
ECF
0040  CEPFHFDEFFPFPACAB.=FFSMB%..............................&.........=
=2E
0080  .........&.V.........7.\MAILSLOT\BROWSE..m.=FC..MDKGROUP.........=
=2E
00C0  ......U=AALINUX.
ax0: fm VE3NAV to VE3PZ ctl SABM+ =20
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
