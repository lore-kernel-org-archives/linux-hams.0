From: f6bvp <f6bvp@free.fr>
Subject: Re: [xfbb] AX.25 Packet Radio on a RaspBerry Pi : a success
Date: Tue, 07 Aug 2012 10:03:09 +0200
Message-ID: <5020CBBD.6090104@free.fr>
References: <825918264.55071112.1344293994188.JavaMail.root@zimbra2-e1.priv.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <825918264.55071112.1344293994188.JavaMail.root@zimbra2-e1.priv.proxad.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: remi.chateauneu@free.fr
Cc: List for the LINUX version of FBB <xfbb@f6fbb.org>, Arno Verhoeven <pe1icq@sharon.esrac.ele.tue.nl>, Alejandro Santos <alejolp@alejolp.com.ar>, linux-hams <linux-hams@vger.kernel.org>, Bernard Pidoux <bernard.pidoux@upmc.fr>

Hello Remy,

I never used soundmodem for I have been a happy user of two 9612+ dual=20
channel TNCs for years.

However, with RPi there are no serial port and I guess I will have to=20
use either an USB to serial adapter or soundmodem.

Meanwhile installing soundmodem performed well.

root@raspberrypi:/home/pi# apt-get install soundmodem
Lecture des listes de paquets... Fait
Construction de l'arbre des d=C3=A9pendances
Lecture des informations d'=C3=A9tat... Fait
Les paquets suppl=C3=A9mentaires suivants seront install=C3=A9s :
   libaudiofile1 libhamlib2
Les NOUVEAUX paquets suivants seront install=C3=A9s :
   libaudiofile1 libhamlib2 soundmodem
0 mis =C3=A0 jour, 3 nouvellement install=C3=A9s, 0 =C3=A0 enlever et 2=
 non mis =C3=A0 jour.
Il est n=C3=A9cessaire de prendre 718 ko dans les archives.
Apr=C3=A8s cette op=C3=A9ration, 3 131 ko d'espace disque suppl=C3=A9me=
ntaires seront=20
utilis=C3=A9s.
Souhaitez-vous continuer [O/n] ? O
R=C3=A9ception de : 1 http://mirrordirector.raspbian.org/raspbian/=20
wheezy/main libaudiofile1 armhf 0.3.4-1 [86,9 kB]
R=C3=A9ception de : 2 http://mirrordirector.raspbian.org/raspbian/=20
wheezy/main libhamlib2 armhf 1.2.15.1-1 [467 kB]
R=C3=A9ception de : 3 http://mirrordirector.raspbian.org/raspbian/=20
wheezy/main soundmodem armhf 0.16-1 [164 kB]
718 ko r=C3=A9ceptionn=C3=A9s en 3s (214 ko/s)
S=C3=A9lection du paquet libaudiofile1:armhf pr=C3=A9c=C3=A9demment d=C3=
=A9s=C3=A9lectionn=C3=A9.
(Lecture de la base de donn=C3=A9es... 58368 fichiers et r=C3=A9pertoir=
es d=C3=A9j=C3=A0=20
install=C3=A9s.)
D=C3=A9paquetage de libaudiofile1:armhf (=C3=A0 partir de=20
=2E../libaudiofile1_0.3.4-1_armhf.deb) ...
S=C3=A9lection du paquet libhamlib2 pr=C3=A9c=C3=A9demment d=C3=A9s=C3=A9=
lectionn=C3=A9.
D=C3=A9paquetage de libhamlib2 (=C3=A0 partir de=20
=2E../libhamlib2_1.2.15.1-1_armhf.deb) ...
S=C3=A9lection du paquet soundmodem pr=C3=A9c=C3=A9demment d=C3=A9s=C3=A9=
lectionn=C3=A9.
D=C3=A9paquetage de soundmodem (=C3=A0 partir de .../soundmodem_0.16-1_=
armhf.deb) ...
Traitement des actions diff=C3=A9r=C3=A9es (=C2=AB triggers =C2=BB) pou=
r =C2=AB man-db =C2=BB...
Param=C3=A9trage de libaudiofile1:armhf (0.3.4-1) ...
Param=C3=A9trage de libhamlib2 (1.2.15.1-1) ...
Param=C3=A9trage de soundmodem (0.16-1) ...
root@raspberrypi:/home/pi#

Now I will need to read the doc or get some direct help to set up a=20
starting script.

73 de Bernard, f6bvp


On 07/08/2012 00:59, remi.chateauneu@free.fr wrote:
> Did you try to run soundmodem on Raspberry, please ?
>
>
> ----- Mail original -----
> De: "Ray Wells"<vk2tv@exemail.com.au>
> =C3=80: "f6bvp"<f6bvp@free.fr>
> Cc: "List for the LINUX version of FBB"<xfbb@f6fbb.org>, "Arno Verhoe=
ven"<pe1icq@sharon.esrac.ele.tue.nl>, "C Schuman"<k4gbb1@embarqmail.com=
>, "Lee Woldanski"<ve7fet@tparc.org>, "F3KT"<f3kt@free.fr>, "Alejandro =
Santos"<alejolp@alejolp.com.ar>, "linux-hams"<linux-hams@vger.kernel.or=
g>, "Bernard Pidoux"<bernard.pidoux@upmc.fr>
> Envoy=C3=A9: Samedi 4 Ao=C3=BBt 2012 23:59:49
> Objet: Re: [xfbb] AX.25 Packet Radio on a RaspBerry Pi : a success
>
> Hi Bernard, All,
>
> This is great news because I almost wrote to you yesterday to ask if =
you
> had made a .deb package for your kernel.
>
> My two Raspberry Pi's arrived on Friday (I was told 5 weeks and they
> arrived in 5 days from Element 14!) and I'm gathering the hardware I
> need to get one of them up and running with kernel ax25. One will ser=
ve
> as my aprs gateway machine and maybe a fpac node again.
>
> Ray vk2tv
>
>
> On 04/08/12 22:21, f6bvp wrote:
>> Hello all,
>>
>> This is my first debian package !
>>
>> http://f6bvp.free.fr/logiciels/ax25/linux-image-3.1.9.080312.ax25+_3=
=2E1.9.080312.ax25+-10.00.Custom_armhf.deb
>>
>>
>> This is the raspbian kernel image including AX.25 modules (ax25,
>> 6pack, netrom, rose, mkiss,...)
>>
>>  From your RaspBerry Pi you can download it with wget
>>
>> wget
>> http://f6bvp.free.fr/logiciels/ax25/linux-image-3.1.9.080312.ax25+_3=
=2E1.9.080312.ax25+-10.00.Custom_armhf.deb
>>
>> To install it :
>> sudo dpkg -i
>> linux-image-3.1.9.080312.ax25+_3.1.9.080312.ax25+-10.00.Custom_armhf=
=2Edeb
>>
>> Edit /boot/config.txt and add a line at the end with
>> # for more options see http://elinux.org/RPi_config.txt
>> kernel vmlinuz-3.1.9.080312.ax25+
>>
>> reboot
>>
>> Then download K4GBB install ax25 script for installing ax25 librarie=
s,
>> tools and apps.
>>
>> sudo wget http://f6bvp.free.fr/logiciels/ax25/Instax25.new
>> sudo chmod +x Instax25.new
>> ./Instax25.new
>>
>> You may download a sample ax25 device init script :
>> sudo wget http://f6bvp.free.fr/logiciels/ax25/rc.ax25
>>
>> and a sample /etc/ax25/ax25ipd.conf
>> sudo wget http://f6bvp.free.fr/logiciels/ax25/ax25ipd.conf
>>
>> Then you also need to edit /etc/ax25/axports
>> such this example :
>> sudo wget http://f6bvp.free.fr/logiciels/ax25/axports
>>
>> I may have missed some details.
>>
>> 73 de Bernard, f6bvp
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
> _______________________________________________
> xfbb maillist  -  xfbb@f6fbb.org
> http://mailman.f6fbb.org/mailman/listinfo/xfbb

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
