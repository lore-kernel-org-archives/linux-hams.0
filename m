From: ariel mastracchio <ari197516@yahoo.com>
Subject: Re: soundmodem / "SIOCSIFFLAGS no such device"
Date: Thu, 20 Feb 2003 05:53:58 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030220135358.58791.qmail@web9602.mail.yahoo.com>
References: <b2veij$79l$1@main.gmane.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <b2veij$79l$1@main.gmane.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-hams@vger.kernel.org

Remi:

   I think you have to install the sound blaster
module first, then uninstall, and then all the
soundmodem stuff, it is for init the sound card...

- ari

--- "R=E9mi@yahoo.com,
UNEXPECTED_DATA_AFTER_ADDRESS@.SYNTAX-ERROR. wrote:
> Hi All !
>=20
> My config is :
> Linux Mandrake 8.2
> Soundcard VIA FM801
> RPM ax25-tools 0.0.8 and ax25-apps.0.0.6
>=20
> For the setup, I first do a 'rmmod' of all modules
> related to the sound
> card.
> Then setserial /dev/ttyS0 uart none port 0 irq 0
>=20
> To find the irq and dma parameters of the sound card
> :
> modprobe -c | grep irq
>=20
> Then:
> modprobe hdlcdrv
> insmod soundmodem mode=3D"sbc:afsk1200" iobase=3D0x220
> irq=3D7 dma=3D1
> sethdlc -p -i sm0 mode sbc:afsk1200 io 0x200 irq 7
> dma 1 serio 0x3f8
>=20
> And the final :
> ifconfig sm0 hw ax25 X1ABC up
>=20
> And it tells me :
> "SIOCSIFFLAGS: No such device"
>=20
> Any idea will be extremely cheerfully welcomed !
>=20
>=20
>=20
>=20
>=20
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at=20
http://vger.kernel.org/majordomo-info.html


=3D=3D=3D=3D=3D
amastr@mail.palermo.edu.ar
lu9aum@amsat.org
lu9aum@lu9aum.ampr.org

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - forms, calculators, tips, more
http://taxes.yahoo.com/
