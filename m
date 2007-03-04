From: Folkert van Heusden <folkert@vanheusden.com>
Subject: Re: testing if connection with baycom modem works
Date: Sun, 4 Mar 2007 20:51:17 +0100
Message-ID: <20070304195117.GQ10782@vanheusden.com>
References: <20070304193047.GP10782@vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20070304193047.GP10782@vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org
Cc: sailer@ife.ee.ethz.ch, henk.termeer@gmail.com

To the function ser12_interrupt I added the following printk-statement:

        baycom_int_freq(bc);
        do {
printk(KERN_INFO "interrupt %d: %d\n", irq, iir & 6); /* THIS ONE */
                switch (iir & 6) {
                case 6:

Now all I see in dmesg is:

[5391104.760314] baycom_ser_hdx: (C) 1996-2000 Thomas Sailer, HB9JNX/AE=
4WA
[5391104.760322] baycom_ser_hdx: version 0.10 compiled 20:45:04 Mar  4 =
2007
[5391105.157757] baycom_ser_hdx: found 4 net devices
[5391110.879166] interrupt 15: 2
[5391110.879198] receive data blabla 1  <-- *1
[5391110.879235] baycom_ser_hdx: ser12 at iobase 0xb808 irq 15 uart 165=
50A
[5391110.889758] ADDRCONF(NETDEV_CHANGE): bcsh0: link becomes ready

*1: I added also a prinkt-statement to ser12_rx to see if anything come=
s in
and ditto to ser12_tx.
And even when I ping no more extra debugging comes into dmesg. Also wit=
h or
without audio from the radio going trough the baycom-modem: no receive,
interrupt or transmit message passes by in dmesg.

Anyone got an idea what is going wrong here?


On Sun, Mar 04, 2007 at 08:31:02PM +0100, Folkert van Heusden wrote:
> Hi,
>=20
> I have a baycom-modem connected to a serial-port and a 27mc radio.
> Now after some patching of the baycom_ser_hdx driver (it did now
> allow port addresses above > 0x1000) this runs without errors:
>=20
> /bin/setserial /dev/ttyS3 uart none
> /sbin/modprobe baycom_ser_hdx mode=3D"ser12*" iobase=3D0xb808 irq=3D1=
5
> /usr/bin/sethdlc -i bcsh0 -p mode "ser12*" io 0xb808 irq 15
>=20
> dmesg then says:
> [5390108.456669] baycom_ser_hdx: (C) 1996-2000 Thomas Sailer, HB9JNX/=
AE4WA
> [5390108.456675] baycom_ser_hdx: version 0.10 compiled 20:14:52 Mar  =
4 2007
>=20
> and sethdlc output is:
> /usr/bin/sethdlc: Version 0.5; (C) 1996-1997 by Thomas Sailer HB9JNX/=
AE4WA
> driver name: baycom_ser_hdx
> current parameters: mode ser12* io 0xb808 irq 15
> new parameters:     mode ser12* io 0xb808 irq 15
>=20
> I then do:
> ifconfig bcsh0 10.0.0.1 netmask 255.0.0.0 hw ax25 fvh123-1 up multica=
st
> ifconfig bcsh0 broadcast 10.255.255.255 netmask 255.0.0.0
>=20
> and after that I do ping 10.0.0.8 as a test.
> Now the radio doesn't switch between receive and transmit every time =
it
> is supposed to send data. Also I added to the 'ser12_tx' function a
> prinkt-statement which is supposed to show a message when the pc is
> sending via that device: no output there.
>=20
> So it seems something down the line is incorrect.
>=20
> How can I debug these problems?
>=20
> I verified that the rs232 cable is correct (all 9 pins are connected)=
=2E
>=20
>=20
> Folkert van Heusden
>=20
> --=20
> MultiTail er et flexible tool for =E5 kontrolere Logfiles og commando=
er.
> Med filtrer, farger, sammenf=F8ringer, forskeliger ansikter etc.
> http://www.vanheusden.com/multitail/
> ---------------------------------------------------------------------=
-
> Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com


=46olkert van Heusden

--=20
www.vanheusden.com/multitail - multitail is tail on steroids. multiple
               windows, filtering, coloring, anything you can think of
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
