From: Folkert van Heusden <folkert@vanheusden.com>
Subject: testing if connection with baycom modem works
Date: Sun, 4 Mar 2007 20:31:02 +0100
Message-ID: <20070304193047.GP10782@vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org
Cc: sailer@ife.ee.ethz.ch, henk.termeer@gmail.com

Hi,

I have a baycom-modem connected to a serial-port and a 27mc radio.
Now after some patching of the baycom_ser_hdx driver (it did now
allow port addresses above > 0x1000) this runs without errors:

/bin/setserial /dev/ttyS3 uart none
/sbin/modprobe baycom_ser_hdx mode=3D"ser12*" iobase=3D0xb808 irq=3D15
/usr/bin/sethdlc -i bcsh0 -p mode "ser12*" io 0xb808 irq 15

dmesg then says:
[5390108.456669] baycom_ser_hdx: (C) 1996-2000 Thomas Sailer, HB9JNX/AE=
4WA
[5390108.456675] baycom_ser_hdx: version 0.10 compiled 20:14:52 Mar  4 =
2007

and sethdlc output is:
/usr/bin/sethdlc: Version 0.5; (C) 1996-1997 by Thomas Sailer HB9JNX/AE=
4WA
driver name: baycom_ser_hdx
current parameters: mode ser12* io 0xb808 irq 15
new parameters:     mode ser12* io 0xb808 irq 15

I then do:
ifconfig bcsh0 10.0.0.1 netmask 255.0.0.0 hw ax25 fvh123-1 up multicast
ifconfig bcsh0 broadcast 10.255.255.255 netmask 255.0.0.0

and after that I do ping 10.0.0.8 as a test.
Now the radio doesn't switch between receive and transmit every time it
is supposed to send data. Also I added to the 'ser12_tx' function a
prinkt-statement which is supposed to show a message when the pc is
sending via that device: no output there.

So it seems something down the line is incorrect.

How can I debug these problems?

I verified that the rs232 cable is correct (all 9 pins are connected).


=46olkert van Heusden

--=20
MultiTail er et flexible tool for =E5 kontrolere Logfiles og commandoer=
=2E
Med filtrer, farger, sammenf=F8ringer, forskeliger ansikter etc.
http://www.vanheusden.com/multitail/
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
