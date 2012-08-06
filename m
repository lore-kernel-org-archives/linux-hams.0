From: remi.chateauneu@free.fr
Subject: Re: [xfbb] AX.25 Packet Radio on a RaspBerry Pi : a success
Date: Tue, 7 Aug 2012 00:59:54 +0200 (CEST)
Message-ID: <825918264.55071112.1344293994188.JavaMail.root@zimbra2-e1.priv.proxad.net>
References: <501D9B55.9050608@exemail.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <501D9B55.9050608@exemail.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: List for the LINUX version of FBB <xfbb@f6fbb.org>
Cc: Arno Verhoeven <pe1icq@sharon.esrac.ele.tue.nl>, C Schuman <k4gbb1@embarqmail.com>, Lee Woldanski <ve7fet@tparc.org>, F3KT <f3kt@free.fr>, Alejandro Santos <alejolp@alejolp.com.ar>, linux-hams <linux-hams@vger.kernel.org>, Bernard Pidoux <bernard.pidoux@upmc.fr>, f6bvp <f6bvp@free.fr>

Did you try to run soundmodem on Raspberry, please ?


----- Mail original -----
De: "Ray Wells" <vk2tv@exemail.com.au>
=C3=80: "f6bvp" <f6bvp@free.fr>
Cc: "List for the LINUX version of FBB" <xfbb@f6fbb.org>, "Arno Verhoev=
en" <pe1icq@sharon.esrac.ele.tue.nl>, "C Schuman" <k4gbb1@embarqmail.co=
m>, "Lee Woldanski" <ve7fet@tparc.org>, "F3KT" <f3kt@free.fr>, "Alejand=
ro Santos" <alejolp@alejolp.com.ar>, "linux-hams" <linux-hams@vger.kern=
el.org>, "Bernard Pidoux" <bernard.pidoux@upmc.fr>
Envoy=C3=A9: Samedi 4 Ao=C3=BBt 2012 23:59:49
Objet: Re: [xfbb] AX.25 Packet Radio on a RaspBerry Pi : a success

Hi Bernard, All,

This is great news because I almost wrote to you yesterday to ask if yo=
u=20
had made a .deb package for your kernel.

My two Raspberry Pi's arrived on Friday (I was told 5 weeks and they=20
arrived in 5 days from Element 14!) and I'm gathering the hardware I=20
need to get one of them up and running with kernel ax25. One will serve=
=20
as my aprs gateway machine and maybe a fpac node again.

Ray vk2tv


On 04/08/12 22:21, f6bvp wrote:
> Hello all,
>
> This is my first debian package !
>
> http://f6bvp.free.fr/logiciels/ax25/linux-image-3.1.9.080312.ax25+_3.=
1.9.080312.ax25+-10.00.Custom_armhf.deb=20
>
>
> This is the raspbian kernel image including AX.25 modules (ax25,=20
> 6pack, netrom, rose, mkiss,...)
>
> From your RaspBerry Pi you can download it with wget
>
> wget=20
> http://f6bvp.free.fr/logiciels/ax25/linux-image-3.1.9.080312.ax25+_3.=
1.9.080312.ax25+-10.00.Custom_armhf.deb
>
> To install it :
> sudo dpkg -i=20
> linux-image-3.1.9.080312.ax25+_3.1.9.080312.ax25+-10.00.Custom_armhf.=
deb
>
> Edit /boot/config.txt and add a line at the end with
> # for more options see http://elinux.org/RPi_config.txt
> kernel vmlinuz-3.1.9.080312.ax25+
>
> reboot
>
> Then download K4GBB install ax25 script for installing ax25 libraries=
,=20
> tools and apps.
>
> sudo wget http://f6bvp.free.fr/logiciels/ax25/Instax25.new
> sudo chmod +x Instax25.new
> ./Instax25.new
>
> You may download a sample ax25 device init script :
> sudo wget http://f6bvp.free.fr/logiciels/ax25/rc.ax25
>
> and a sample /etc/ax25/ax25ipd.conf
> sudo wget http://f6bvp.free.fr/logiciels/ax25/ax25ipd.conf
>
> Then you also need to edit /etc/ax25/axports
> such this example :
> sudo wget http://f6bvp.free.fr/logiciels/ax25/axports
>
> I may have missed some details.
>
> 73 de Bernard, f6bvp
> --=20
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

_______________________________________________
xfbb maillist  -  xfbb@f6fbb.org
http://mailman.f6fbb.org/mailman/listinfo/xfbb
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
