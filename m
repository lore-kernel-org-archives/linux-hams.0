From: BentBagger@netscape.net (Bent Bagger)
Subject: Soundmodem gives error message: cannot start audio
Date: Mon, 03 Feb 2003 10:58:25 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <60D10534.44D9CC45.0AAC1079@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-Hams <linux-hams@vger.kernel.org>

I am having problems with the user space sound modem 'soundmodem'. When=
 I
start it using this configuration file:

<?xml version=3D"1.0"?>
<modem>
  <configuration name=3D"slug">
    <channel name=3D"Channel 0">
      <mod mode=3D"afsk" bps=3D"1200" f0=3D"1200" f1=3D"2200"/>
      <demod mode=3D"afsk" bps=3D"1200" f0=3D"1200" f1=3D"2200"/>
      <pkt mode=3D"MKISS" ifname=3D"ax0" hwaddr=3D"OZ6BL" ip=3D"44.145.=
40.3" netmask=3D"255.255.255.0" broadcast=3D"44.145.40.255"/>
    </channel>
    <chaccess txdelay=3D"350" slottime=3D"100" ppersist=3D"40" fulldup=3D=
"0" txtail=3D"10"/>
    <audio type=3D"soundcard" device=3D"/dev/dsp" halfdup=3D"1"/>
    <ptt file=3D"/dev/ttyS0"/>
  </configuration>
</modem>

(tnx CT1FOX) I get this error message:

sm[PID]: cannot start audio

I cannot find any documention handling error messages. What does it mea=
n=20
and what can I do to get around it?

Best 73 de Bent/OZ6BL

--=20
Bent Bagger, OZ6BL
Birker=F8d
Danmark    (JO65EU)


__________________________________________________________________
The NEW Netscape 7.0 browser is now available. Upgrade now! http://chan=
nels.netscape.com/ns/browsers/download.jsp=20

Get your own FREE, personal Netscape Mail account today at http://webma=
il.netscape.com/
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
