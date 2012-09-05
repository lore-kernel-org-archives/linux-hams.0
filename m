From: "F3KT" <f3kt@free.fr>
Subject: RE: [xfbb] AX.25 Packet Radio on a RaspBerry Pi : a success
Date: Wed, 5 Sep 2012 11:12:49 +0200
Message-ID: <27C015D224BF4821839181536E7AD64A@R>
References: <500FD014.5090004@free.fr> <5010192A.9060506@upmc.fr> <50101DB2.9020101@sharon.esrac.ele.tue.nl> <CAOnrUC3iavAZB5q9Xy6pxU0N72YcPyPFAkqzDnca11vmvMdFJg@mail.gmail.com> <501110B1.5080202@free.fr> <501D13B8.8070004@free.fr> <501D2C69.80304@free.fr> <yD$XQnFpQmRQFwVt@skywaves.demon.co.uk> <50466721.6000209@embarqmail.com> <oTSREEHcimRQFwWp@skywaves.demon.co.uk> <50466C4B.2010308@upmc.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <50466C4B.2010308@upmc.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Bernard Pidoux' <bernard.pidoux@upmc.fr>, 'Paul Lewis' <paul@skywaves.demon.co.uk>
Cc: 'C Schuman' <k4gbb1@embarqmail.com>, 'f6bvp' <f6bvp@free.fr>, 'List for the LINUX version of FBB' <xfbb@f6fbb.org>, 'Alejandro Santos' <alejolp@alejolp.com.ar>, 'Arno Verhoeven' <pe1icq@sharon.esrac.ele.tue.nl>, 'Lee Woldanski' <ve7fet@tparc.org>, 'linux-hams' <linux-hams@vger.kernel.org>

 Hello,

=46ine job everybody did.
I'll try it in a few .... months.
But this morning Charles's link :
http://k4gbb.no-ip.info/docs/Raspberry.html
Seems not working. May be address has been changed ?

 =20
  Best 73  Michel F3KT
   =20
-----Message d'origine-----
De : Bernard Pidoux [mailto:bernard.pidoux@upmc.fr]=20
Envoy=E9 : mardi 4 septembre 2012 23:02
=C0 : Paul Lewis
Cc : C Schuman; f6bvp; List for the LINUX version of FBB; Alejandro San=
tos;
Arno Verhoeven; Lee Woldanski; F3KT; linux-hams
Objet : Re: [xfbb] AX.25 Packet Radio on a RaspBerry Pi : a success

Hello Paul,

A deb package for Raspberry Pi should be available in a reasonable dela=
y
(...)
Meanwhile, Charley k4gbb has come with a very convenient online html
document to start AX.25 installation on your RPi.

http://k4gbb.no-ip.info/docs/Raspberry.html

73 de Bernard, f6bvp


Le 04/09/2012 22:46, Paul Lewis a =E9crit :
> Ok Charles
>
> I think I would be the only node in the UK using Frac on this test=20
> system :( Another learning curve and challenge..
> 73 Paul g4apl
>
> In message <50466721.6000209@embarqmail.com>, C Schuman=20
> <k4gbb1@embarqmail.com> writes
>> Paul,
>>  I am using the FPAC node. It is based on the ROSE protocol, but=20
>> works well with NetRom and Flex Net. We have approx 40 ROSE nodes=20
>> linked together via AxUDP.
>>
>> <<Charley>>
>>   k4gbb
>>
>> Paul Lewis wrote:
>>> Hello All
>>>
>>> Thanks Bernard and Charles.
>>>
>>> Is there a NODE package for the "Pi" as I have used node(3.3) for a=
=20
>>> decade now. On my main system.
>>> 73 de Paul g4apl
>>>
>>> In message <501D2C69.80304@free.fr>, f6bvp <f6bvp@free.fr> writes
>>>> One suggestion before executing ./Instax25.new script I noticed=20
>>>> that /tmp partition was too small and could be full aborting some=20
>>>> installation process.
>>>> I suggest to unmount this partition :
>>>>
>>>> sudo umount -l /tmp
>>>>
>>>> A /tmp file will remain however and will do it.
>>>>
>>>> 73 de Bernard, f6bvp
>>>>
>>>>
>>>> On 04/08/2012 14:21, f6bvp wrote:
>>>>> Hello all,
>>>>>
>>>>> This is my first debian package !
>>>>>
>>>>>
>>>>>
http://f6bvp.free.fr/logiciels/ax25/linux-image-3.1.9.080312.ax25+_3.1.
>>>>>
>>>>> 9.080312.ax25+-10.00.Custom_armhf.deb
>>>>>
>>>>>
>>>>> This is the raspbian kernel image including AX.25 modules (ax25,=20
>>>>> 6pack, netrom, rose, mkiss,...)
>>>>>
>>>>>  From your RaspBerry Pi you can download it with wget
>>>>>
>>>>> wget
>>>>>
>>>>>
http://f6bvp.free.fr/logiciels/ax25/linux-image-3.1.9.080312.ax25+_3.1.
>>>>>
>>>>> 9.080312.ax25+-10.00.Custom_armhf.deb
>>>>>
>>>>>
>>>>> To install it :
>>>>> sudo dpkg -i
>>>>> linux-image-3.1.9.080312.ax25+_3.1.9.080312.ax25+-10.00.Custom_ar=
m
>>>>> hf.deb
>>>>>
>>>>>
>>>>> Edit /boot/config.txt and add a line at the end with # for more=20
>>>>> options see http://elinux.org/RPi_config.txt kernel=20
>>>>> vmlinuz-3.1.9.080312.ax25+
>>>>>
>>>>> reboot
>>>>>
>>>>> Then download K4GBB install ax25 script for installing ax25=20
>>>>> libraries, tools and apps.
>>>>>
>>>>> sudo wget http://f6bvp.free.fr/logiciels/ax25/Instax25.new
>>>>> sudo chmod +x Instax25.new
>>>>> ./Instax25.new
>>>>>
>>>>> You may download a sample ax25 device init script :
>>>>> sudo wget http://f6bvp.free.fr/logiciels/ax25/rc.ax25
>>>>>
>>>>> and a sample /etc/ax25/ax25ipd.conf sudo wget=20
>>>>> http://f6bvp.free.fr/logiciels/ax25/ax25ipd.conf
>>>>>
>>>>> Then you also need to edit /etc/ax25/axports such this example :
>>>>> sudo wget http://f6bvp.free.fr/logiciels/ax25/axports
>>>>>
>>>>> I may have missed some details.
>>>>>
>>>>> 73 de Bernard, f6bvp
>>>>> _______________________________________________
>>>>> xfbb maillist - xfbb@f6fbb.org
>>>>> http://mailman.f6fbb.org/mailman/listinfo/xfbb
>>>>
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe=20
>>>> linux-hams" in the body of a message to majordomo@vger.kernel.org=20
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
