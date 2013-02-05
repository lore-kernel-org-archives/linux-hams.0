From: SP1LOP <SP1LOP.Janusz@mail.sp1lop.ampr.org>
Subject: Debian-Cart I/O-modem Baycom - PROBLEM
Date: Tue, 05 Feb 2013 09:36:06 +0100
Message-ID: <5110C476.4060807@mail.sp1lop.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-hams@vger.kernel.org

POL: Potrzebuje pomocy. Mam komputer z 2 modemami Baycom
      Linux Debian 6.0.6, Kernel 2.6.35.. Sterownik: Baycom_ser-fdx
ENG: I need help. I have a computer with two modems Baycom
      Debian Linux 6.0.6, Kernel 2.6.35, driver: baycom_ser-fdx
------
POL: U=C5=BCywam modem=C3=B3w Baycom, pod=C5=82=C4=85czone do karty I/O=
 PCI
      Modemy odbieraj=C4=85 (Rx) poprawnie stacje ale nie nadaj=C4=85 (=
not Tx)
ENG: I use Baycom modems, connected to the I/O PCI
      Modems receive (Rx) channels correctly but are not suitable (not =
Tx)
------
POL: A to konfiguracja karty I/O z komendy lspci -vvv
ENG: And this is the configuration I/O card with the command lspci-vvv
=2E..
15:06.0 Serial controller: NetMos Technology PCI 9845 Multi-I/O Control=
ler (rev=20
01) (prog-if 02 [16550])
         Subsystem: LSI Logic / Symbios Logic 0P6S (6 port 16550a seria=
l card)
         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- Pa=
rErr-=20
Stepping- SERR+ FastB2B- DisINTx-
         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAb=
ort-=20
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Interrupt: pin A routed to IRQ 132
         Region 0: I/O ports at 8cf8 [size=3D8]
         Region 1: I/O ports at 8ce8 [size=3D8]
         Region 2: I/O ports at 8cd8 [size=3D8]
         Region 3: I/O ports at 8cc8 [size=3D8]
         Region 4: I/O ports at 8cb8 [size=3D8]
         Region 5: I/O ports at 8ca0 [size=3D16]
         Kernel driver in use: serial
---
POL: oraz dane z /var/log/dmesg
ENG: and data from /var/log/dmesg
=2E..
15:06.0 Serial controller: NetMos Technology PCI 9845 Multi-I/O Control=
ler (rev 01)

[    1.574194] Linux agpgart interface v0.103
[    1.574477] Serial: 8250/16550 driver, 8 ports, IRQ sharing enabled
[    1.576605] serial 00:06: activated
[    1.576953] 00:06: ttyS4 at I/O 0x108 (irq =3D 12) is a 16550A
[    1.577147] serial 0000:15:06.0: PCI INT A -> GSI 132 (level, low) -=
> IRQ 132
[    1.577352] 0000:15:06.0: ttyS5 at I/O 0x8cf8 (irq =3D 132) is a 165=
50A
[    1.577590] 0000:15:06.0: ttyS6 at I/O 0x8ce8 (irq =3D 132) is a 165=
50A
[    1.577822] 0000:15:06.0: ttyS7 at I/O 0x8cd8 (irq =3D 132) is a 165=
50A
[    1.578054] 0000:15:06.0: ttyS0 at I/O 0x8cc8 (irq =3D 132) is a 165=
50A
[    1.578288] 0000:15:06.0: ttyS1 at I/O 0x8cb8 (irq =3D 132) is a 165=
50A
[    1.578522] 0000:15:06.0: ttyS2 at I/O 0x8ca0 (irq =3D 132) is a 165=
50A

Please help, how to configure the modem connected to the I / O card sui=
t (Tx)

--=20

                        73 de Janusz / SP1LOP
=3D=3D=3D=3D=3D Janusz J. Przybylski, SP1LOP =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Poland AMPRNet Co-ordinator [44.165/16] from Mar 2003
Internet: SP1LOP.Janusz@mail.sp1lop.ampr.org
WWW     : http://www.sp1lop.ampr.org
RBI PZK : http://www.rbi.ampr.org
------------------------------------------------------
Packiet : SP1LOP @ SR1BSZ.SZ.POL.EU
AmprNet : sp1lop@szczecin.ampr.org
Sysop   : SR1BSZ-5 AmprNet Gate, SR1BSZ-8 BBS
           SR1DSZ Digi Packet Radio,
           SR1NRE APRS, SR1WXZ WX, SR1DXZ DXC
           T2POLNW APRS Server Tier 2 Group
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D


--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
