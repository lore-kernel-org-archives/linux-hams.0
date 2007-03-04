From: Folkert van Heusden <folkert@vanheusden.com>
Subject: Re: testing if connection with baycom modem works
Date: Sun, 4 Mar 2007 21:29:16 +0100
Message-ID: <20070304202916.GR10782@vanheusden.com>
References: <20070304193047.GP10782@vanheusden.com>
	<20070304195117.GQ10782@vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20070304195117.GQ10782@vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org
Cc: sailer@ife.ee.ethz.ch, henk.termeer@gmail.com

Ok, I tried baycom_ser_fdx and this one seems to work!!
That is: when I ping, I see the radio going to 'tx'-status.
Now only I have to find someone living near me (Gouda/The Netherlands)
who can verify that my radio indeed is transmitting (need to find the
squelch level and the volume of the radio) :-)
Oh and I need to find a traffic dumper capable of dumping data link typ=
e
3.

On Sun, Mar 04, 2007 at 08:51:17PM +0100, Folkert van Heusden wrote:
> To the function ser12_interrupt I added the following printk-statemen=
t:
>=20
>         baycom_int_freq(bc);
>         do {
> printk(KERN_INFO "interrupt %d: %d\n", irq, iir & 6); /* THIS ONE */
>                 switch (iir & 6) {
>                 case 6:
>=20
> Now all I see in dmesg is:
>=20
> [5391104.760314] baycom_ser_hdx: (C) 1996-2000 Thomas Sailer, HB9JNX/=
AE4WA
> [5391104.760322] baycom_ser_hdx: version 0.10 compiled 20:45:04 Mar  =
4 2007
> [5391105.157757] baycom_ser_hdx: found 4 net devices
> [5391110.879166] interrupt 15: 2
> [5391110.879198] receive data blabla 1  <-- *1
> [5391110.879235] baycom_ser_hdx: ser12 at iobase 0xb808 irq 15 uart 1=
6550A
> [5391110.889758] ADDRCONF(NETDEV_CHANGE): bcsh0: link becomes ready
>=20
> *1: I added also a prinkt-statement to ser12_rx to see if anything co=
mes in
> and ditto to ser12_tx.
> And even when I ping no more extra debugging comes into dmesg. Also w=
ith or
> without audio from the radio going trough the baycom-modem: no receiv=
e,
> interrupt or transmit message passes by in dmesg.
>=20
> Anyone got an idea what is going wrong here?
>=20
>=20
> On Sun, Mar 04, 2007 at 08:31:02PM +0100, Folkert van Heusden wrote:
> > Hi,
> >=20
> > I have a baycom-modem connected to a serial-port and a 27mc radio.
> > Now after some patching of the baycom_ser_hdx driver (it did now
> > allow port addresses above > 0x1000) this runs without errors:
> >=20
> > /bin/setserial /dev/ttyS3 uart none
> > /sbin/modprobe baycom_ser_hdx mode=3D"ser12*" iobase=3D0xb808 irq=3D=
15
> > /usr/bin/sethdlc -i bcsh0 -p mode "ser12*" io 0xb808 irq 15
> >=20
> > dmesg then says:
> > [5390108.456669] baycom_ser_hdx: (C) 1996-2000 Thomas Sailer, HB9JN=
X/AE4WA
> > [5390108.456675] baycom_ser_hdx: version 0.10 compiled 20:14:52 Mar=
  4 2007
> >=20
> > and sethdlc output is:
> > /usr/bin/sethdlc: Version 0.5; (C) 1996-1997 by Thomas Sailer HB9JN=
X/AE4WA
> > driver name: baycom_ser_hdx
> > current parameters: mode ser12* io 0xb808 irq 15
> > new parameters:     mode ser12* io 0xb808 irq 15
> >=20
> > I then do:
> > ifconfig bcsh0 10.0.0.1 netmask 255.0.0.0 hw ax25 fvh123-1 up multi=
cast
> > ifconfig bcsh0 broadcast 10.255.255.255 netmask 255.0.0.0
> >=20
> > and after that I do ping 10.0.0.8 as a test.
> > Now the radio doesn't switch between receive and transmit every tim=
e it
> > is supposed to send data. Also I added to the 'ser12_tx' function a
> > prinkt-statement which is supposed to show a message when the pc is
> > sending via that device: no output there.
> >=20
> > So it seems something down the line is incorrect.
> >=20
> > How can I debug these problems?
> >=20
> > I verified that the rs232 cable is correct (all 9 pins are connecte=
d).
> >=20
> >=20
> > Folkert van Heusden
> >=20
> > --=20
> > MultiTail er et flexible tool for =E5 kontrolere Logfiles og comman=
doer.
> > Med filtrer, farger, sammenf=F8ringer, forskeliger ansikter etc.
> > http://www.vanheusden.com/multitail/
> > -------------------------------------------------------------------=
---
> > Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
>=20
>=20
> Folkert van Heusden
>=20
> --=20
> www.vanheusden.com/multitail - multitail is tail on steroids. multipl=
e
>                windows, filtering, coloring, anything you can think o=
f
> ---------------------------------------------------------------------=
-
> Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com


=46olkert van Heusden

--=20
To MultiTail einai ena polymorfiko ergaleio gia ta logfiles kai tin
eksodo twn entolwn. Prosferei: filtrarisma, xrwmatismo, sygxwneysi,
diaforetikes provoles. http://www.vanheusden.com/multitail/
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
