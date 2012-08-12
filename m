From: "Bernard, f6bvp" <f6bvp@free.fr>
Subject: Re: [xfbb] AX.25 Packet Radio on a RaspBerry Pi : a success
Date: Sun, 12 Aug 2012 14:12:11 +0200
Message-ID: <50279D9B.1020408@free.fr>
References: <1559873781.59617798.1344427808339.JavaMail.root@zimbra2-e1.priv.proxad.net> <5025F7A0.9030306@exemail.com.au> <5027762B.8000105@exemail.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5027762B.8000105@exemail.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Ray Wells <vk2tv@exemail.com.au>
Cc: remi.chateauneu@free.fr, List for the LINUX version of FBB <xfbb@f6fbb.org>, Arno Verhoeven <pe1icq@sharon.esrac.ele.tue.nl>, Alejandro Santos <alejolp@alejolp.com.ar>, linux-hams <linux-hams@vger.kernel.org>, Bernard Pidoux <bernard.pidoux@upmc.fr>

Hi Ray,

Many thanks for your report about soundmodem testing with RPi.
It is not the first report about critical power supply device.
I read that RPi USB was limited to 100 mA, and it was probably at the=20
limit for your sound card.
It would be interesting to know how much current RPi was actually=20
driving with ~100 per cent CPU duty cycle ?

73 de Bernard, f6bvp

Le 12/08/2012 11:23, Ray Wells a =C3=A9crit :
> All,
>
> A little more information based on a bit of unscientific testing toda=
y
> of RPi with soundmodem.
>
> Yesterday I reported that sm was unstable and locked up randomly. I n=
ow
> believe that this may have been a power supply issue. The power suppl=
y
> used (mobile phone) was rated at 700mA, the recommended minimum capac=
ity
> for RPi. The 7 port hub that the UCA202 sound card connected to had i=
ts
> own 2000mA supply.
>
> Today, I tried running the UCA202 directly from the RPi. The UCA202 i=
s
> rated at 100mA, the supposed load capability of RPi. I didn't manage =
to
> decode any packets and, upon tx, sm appeared to lock up.
>
> My next step was to put the UCA202 back onto the USB hub and to suppl=
y
> the RPi from the 2000mA supply. The result is that sm has been decodi=
ng
> packets for well over an hour (at the time of writing this) and will
> happily tx without lock up. It would indeed appear that an adequate
> power supply is an essential component for RPi.
>
> I'm controlling RPi remotely using VNC to provide access to the deskt=
op.
> tightvncserver is consuming about 25% cpu and soundmodem about 74%. T=
he
> result is that cpu load is flat lined at maximum. However, soundmodem
> and RPi appear stable. Ultimately I'll run without the desktop but fo=
r
> now it's essential to ongoing testing.
>
> More to follow, I'm sure.
>
> Ray, vk2tv
>
>
> On 11/08/12 16:11, Ray Wells wrote:
>> All,
>>
>> I'll start by saying that my "shack" is very user unfriendly at the
>> moment, with nowhere to set up test equipment or radios, however, I
>> have managed to decode ax25 (aprs) packets using soundmodem on the
>> Raspberry Pi running Bernard's kernel. Soundmodem is unstable and
>> crashes but that may be due to the Behringer UCA202 sound card I'm
>> using. Others have reported difficulties with the UCA202 in RPi with
>> audio applications and, I haven't yet delved into the sound card
>> configs except to delete a blacklist entry in /etc/modeprobe.d to ge=
t
>> the sound card to accept incoming audio. My tests have been very raw
>> but have confirmed that using a USB sound card with soundmodem on th=
e
>> RPi appears feasible. On tx, I used speaker monitoring of the tx aud=
io
>> as an indication of success. What I heard "sounded" correct for 1k2
>> packet.
>>
>> I will, as time permits, try to make more meaningful tests.
>>
>> Ray vk2tv
>>
>> On 08/08/12 22:10, remi.chateauneu@free.fr wrote:
>>> Hi All,
>>>
>>> Some help about Soundmodem is available here:
>>>
>>> http://www.xastir.org/wiki/HowTo:SoundModem
>>>
>>> Push-to-talk can be activated with Soundmodem original method but
>>> also with the very convenient hamlib library (
>>> http://sourceforge.net/apps/mediawiki/hamlib/index.php?title=3DMain=
_Page )
>>>
>>> Hamlib is used by fldigi on Raslberry , therefore it is seriously
>>> supported.
>>>
>>> ----- Mail original -----
>>> De: "Ray Wells" <vk2tv@exemail.com.au>
>>> =C3=80: "f6bvp" <f6bvp@free.fr>
>>> Cc: "remi chateauneu" <remi.chateauneu@free.fr>, "List for the LINU=
X
>>> version of FBB" <xfbb@f6fbb.org>, "Arno Verhoeven"
>>> <pe1icq@sharon.esrac.ele.tue.nl>, "Alejandro Santos"
>>> <alejolp@alejolp.com.ar>, "linux-hams" <linux-hams@vger.kernel.org>=
,
>>> "Bernard Pidoux" <bernard.pidoux@upmc.fr>
>>> Envoy=C3=A9: Mardi 7 Ao=C3=BBt 2012 10:16:31
>>> Objet: Re: [xfbb] AX.25 Packet Radio on a RaspBerry Pi : a success
>>>
>>> Bernard, Remy, All,
>>>
>>> Now that I have Bernard's kernel loaded on my RPi, and I have a Lin=
ux
>>> compatible USB soundcard (Behringer UCA202), I will try to get it
>>> working with soundmodem by Saturday or Sunday and report back.
>>>
>>> Ray vk2tv
>>>
>>> On 07/08/12 18:03, f6bvp wrote:
>>>> Hello Remy,
>>>>
>>>> I never used soundmodem for I have been a happy user of two 9612+ =
dual
>>>> channel TNCs for years.
>>>>
>>>> However, with RPi there are no serial port and I guess I will have=
 to
>>>> use either an USB to serial adapter or soundmodem.
>>>>
>>>> Meanwhile installing soundmodem performed well.
>>>>
>>>> root@raspberrypi:/home/pi# apt-get install soundmodem
>>>> Lecture des listes de paquets... Fait
>>>> Construction de l'arbre des d=C3=A9pendances
>>>> Lecture des informations d'=C3=A9tat... Fait
>>>> Les paquets suppl=C3=A9mentaires suivants seront install=C3=A9s :
>>>>    libaudiofile1 libhamlib2
>>>> Les NOUVEAUX paquets suivants seront install=C3=A9s :
>>>>    libaudiofile1 libhamlib2 soundmodem
>>>> 0 mis =C3=A0 jour, 3 nouvellement install=C3=A9s, 0 =C3=A0 enlever=
 et 2 non mis =C3=A0
>>>> jour.
>>>> Il est n=C3=A9cessaire de prendre 718 ko dans les archives.
>>>> Apr=C3=A8s cette op=C3=A9ration, 3 131 ko d'espace disque suppl=C3=
=A9mentaires seront
>>>> utilis=C3=A9s.
>>>> Souhaitez-vous continuer [O/n] ? O
>>>> R=C3=A9ception de : 1 http://mirrordirector.raspbian.org/raspbian/
>>>> wheezy/main libaudiofile1 armhf 0.3.4-1 [86,9 kB]
>>>> R=C3=A9ception de : 2 http://mirrordirector.raspbian.org/raspbian/
>>>> wheezy/main libhamlib2 armhf 1.2.15.1-1 [467 kB]
>>>> R=C3=A9ception de : 3 http://mirrordirector.raspbian.org/raspbian/
>>>> wheezy/main soundmodem armhf 0.16-1 [164 kB]
>>>> 718 ko r=C3=A9ceptionn=C3=A9s en 3s (214 ko/s)
>>>> S=C3=A9lection du paquet libaudiofile1:armhf pr=C3=A9c=C3=A9demmen=
t d=C3=A9s=C3=A9lectionn=C3=A9.
>>>> (Lecture de la base de donn=C3=A9es... 58368 fichiers et r=C3=A9pe=
rtoires d=C3=A9j=C3=A0
>>>> install=C3=A9s.)
>>>> D=C3=A9paquetage de libaudiofile1:armhf (=C3=A0 partir de
>>>> .../libaudiofile1_0.3.4-1_armhf.deb) ...
>>>> S=C3=A9lection du paquet libhamlib2 pr=C3=A9c=C3=A9demment d=C3=A9=
s=C3=A9lectionn=C3=A9.
>>>> D=C3=A9paquetage de libhamlib2 (=C3=A0 partir de
>>>> .../libhamlib2_1.2.15.1-1_armhf.deb) ...
>>>> S=C3=A9lection du paquet soundmodem pr=C3=A9c=C3=A9demment d=C3=A9=
s=C3=A9lectionn=C3=A9.
>>>> D=C3=A9paquetage de soundmodem (=C3=A0 partir de
>>>> .../soundmodem_0.16-1_armhf.deb) ...
>>>> Traitement des actions diff=C3=A9r=C3=A9es (=C2=AB triggers =C2=BB=
) pour =C2=AB man-db =C2=BB...
>>>> Param=C3=A9trage de libaudiofile1:armhf (0.3.4-1) ...
>>>> Param=C3=A9trage de libhamlib2 (1.2.15.1-1) ...
>>>> Param=C3=A9trage de soundmodem (0.16-1) ...
>>>> root@raspberrypi:/home/pi#
>>>>
>>>> Now I will need to read the doc or get some direct help to set up =
a
>>>> starting script.
>>>>
>>>> 73 de Bernard, f6bvp
>>>>
>>>>
>>>> On 07/08/2012 00:59, remi.chateauneu@free.fr wrote:
>>>>> Did you try to run soundmodem on Raspberry, please ?
>>>>>
>>>>>
>>>>> ----- Mail original -----
>>>>> De: "Ray Wells"<vk2tv@exemail.com.au>
>>>>> =C3=80: "f6bvp"<f6bvp@free.fr>
>>>>> Cc: "List for the LINUX version of FBB"<xfbb@f6fbb.org>, "Arno
>>>>> Verhoeven"<pe1icq@sharon.esrac.ele.tue.nl>, "C
>>>>> Schuman"<k4gbb1@embarqmail.com>, "Lee Woldanski"<ve7fet@tparc.org=
>,
>>>>> "F3KT"<f3kt@free.fr>, "Alejandro Santos"<alejolp@alejolp.com.ar>,
>>>>> "linux-hams"<linux-hams@vger.kernel.org>, "Bernard
>>>>> Pidoux"<bernard.pidoux@upmc.fr>
>>>>> Envoy=C3=A9: Samedi 4 Ao=C3=BBt 2012 23:59:49
>>>>> Objet: Re: [xfbb] AX.25 Packet Radio on a RaspBerry Pi : a succes=
s
>>>>>
>>>>> Hi Bernard, All,
>>>>>
>>>>> This is great news because I almost wrote to you yesterday to ask
>>>>> if you
>>>>> had made a .deb package for your kernel.
>>>>>
>>>>> My two Raspberry Pi's arrived on Friday (I was told 5 weeks and t=
hey
>>>>> arrived in 5 days from Element 14!) and I'm gathering the hardwar=
e I
>>>>> need to get one of them up and running with kernel ax25. One will
>>>>> serve
>>>>> as my aprs gateway machine and maybe a fpac node again.
>>>>>
>>>>> Ray vk2tv
>>>>>
>>>>>
>>>>> On 04/08/12 22:21, f6bvp wrote:
>>>>>> Hello all,
>>>>>>
>>>>>> This is my first debian package !
>>>>>>
>>>>>> http://f6bvp.free.fr/logiciels/ax25/linux-image-3.1.9.080312.ax2=
5+_3.1.9.080312.ax25+-10.00.Custom_armhf.deb
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> This is the raspbian kernel image including AX.25 modules (ax25,
>>>>>> 6pack, netrom, rose, mkiss,...)
>>>>>>
>>>>>>   From your RaspBerry Pi you can download it with wget
>>>>>>
>>>>>> wget
>>>>>> http://f6bvp.free.fr/logiciels/ax25/linux-image-3.1.9.080312.ax2=
5+_3.1.9.080312.ax25+-10.00.Custom_armhf.deb
>>>>>>
>>>>>>
>>>>>>
>>>>>> To install it :
>>>>>> sudo dpkg -i
>>>>>> linux-image-3.1.9.080312.ax25+_3.1.9.080312.ax25+-10.00.Custom_a=
rmhf.deb
>>>>>>
>>>>>>
>>>>>>
>>>>>> Edit /boot/config.txt and add a line at the end with
>>>>>> # for more options see http://elinux.org/RPi_config.txt
>>>>>> kernel vmlinuz-3.1.9.080312.ax25+
>>>>>>
>>>>>> reboot
>>>>>>
>>>>>> Then download K4GBB install ax25 script for installing ax25
>>>>>> libraries,
>>>>>> tools and apps.
>>>>>>
>>>>>> sudo wget http://f6bvp.free.fr/logiciels/ax25/Instax25.new
>>>>>> sudo chmod +x Instax25.new
>>>>>> ./Instax25.new
>>>>>>
>>>>>> You may download a sample ax25 device init script :
>>>>>> sudo wget http://f6bvp.free.fr/logiciels/ax25/rc.ax25
>>>>>>
>>>>>> and a sample /etc/ax25/ax25ipd.conf
>>>>>> sudo wget http://f6bvp.free.fr/logiciels/ax25/ax25ipd.conf
>>>>>>
>>>>>> Then you also need to edit /etc/ax25/axports
>>>>>> such this example :
>>>>>> sudo wget http://f6bvp.free.fr/logiciels/ax25/axports
>>>>>>
>>>>>> I may have missed some details.
>>>>>>
>>>>>> 73 de Bernard, f6bvp
>>>>>> --
>>>>>> To unsubscribe from this list: send the line "unsubscribe
>>>>>> linux-hams" in
>>>>>> the body of a message to majordomo@vger.kernel.org
>>>>>> More majordomo info at http://vger.kernel.org/majordomo-info.htm=
l
>>>>>>
>>>>> _______________________________________________
>>>>> xfbb maillist  -  xfbb@f6fbb.org
>>>>> http://mailman.f6fbb.org/mailman/listinfo/xfbb
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe
>>>> linux-hams" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-ham=
s" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
