From: "Bernard, f6bvp" <f6bvp@free.fr>
Subject: Re: [xfbb] AX.25 Packet Radio on a RaspBerry Pi : a success
Date: Tue, 02 Oct 2012 14:32:01 +0200
Message-ID: <506ADEC1.6060809@free.fr>
References: <500FD014.5090004@free.fr> <5010192A.9060506@upmc.fr> <50101DB2.9020101@sharon.esrac.ele.tue.nl> <CAOnrUC3iavAZB5q9Xy6pxU0N72YcPyPFAkqzDnca11vmvMdFJg@mail.gmail.com> <501110B1.5080202@free.fr> <501D13B8.8070004@free.fr> <501D2C69.80304@free.fr> <yD$XQnFpQmRQFwVt@skywaves.demon.co.uk> <50466721.6000209@embarqmail.com> <oTSREEHcimRQFwWp@skywaves.demon.co.uk> <504734FD.4030009@embarqmail.com> <4XcVlTClnzRQFwkJ@skywaves.demon.co.uk> <vKlAy5AVauUQFw+E@skywaves.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <vKlAy5AVauUQFw+E@skywaves.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Paul Lewis <paul@skywaves.demon.co.uk>
Cc: C Schuman <k4gbb1@embarqmail.com>, List for the LINUX version of FBB <xfbb@f6fbb.org>, Alejandro Santos <alejolp@alejolp.com.ar>, Arno Verhoeven <pe1icq@sharon.esrac.ele.tue.nl>, Lee Woldanski <ve7fet@tparc.org>, F3KT <f3kt@free.fr>, linux-hams <linux-hams@vger.kernel.org>, Bernard Pidoux <bernard.pidoux@upmc.fr>

Hello All,

In case someone did not notice, Raspbian distros include AX.25 modules=20
since July 2012 version. There were since new updates in august and=20
september 18.
See http://www.raspberrypi.org/downloads

Thus, it is not necessary to download anymore my own Raspbian compile=20
package.

Don't forget to perform "apt-get update" and "apt-get upgrade" from tim=
e=20
to time in order to download package updates for your RPi.

73 de Bernard, f6bvp

Le 14/09/2012 10:11, Paul Lewis a =C3=A9crit :
> Hi Gays
>
> Thought I would give and update
> Have now got the system running as a linuxnode.
> Have not switch on the radio yet connected to a usb serial port
> AX25IPD Ax25 and netrom connections work.
> Telnet to the linuxnode from on the local machine
>
> net44 IP over AX25UDP does not work.
> I have never got this working on my partners when they upgraded to th=
e
> 2.6 kernels and the associated ax25ipd during the last decade.
> So this problem has caught up with me again..
>
> Works fine on my 2.2.26 kernel the version of ax25ipd that I am using
> ax25-apps-0.0.6.2src_f6bvp.tar (installed 4.6.2007)
>
> Will provide feedback in a new thread.
>
>
> Encounter one gotcha though, that got me going for a couple of days. =
Was
> the netrom interfaces were always in use and the nrrattach fails, no
> spare netrom device.
> Also the ttyUSB0 interface was 'grab by the system'
>
> Confirmed netrom, ax25, mkiss modules loaded
> the required alias defined the /etc/modprobe.d
> conf files.
>
> See these referenced during the system boot and message log file.
>
> Traced (ps -ef) to the /etc/default/ifplugd hotplug deamon that auto
> connects 'by default' all interfaces.
> Change the attribute HOTPLUG INTERFACES=3D"all"  to "lo eth0"
>
> and we got control of the system and nrrattach now worked.
> 73 Paul g4apl (gb7cip)
>
>
> In message <4XcVlTClnzRQFwkJ@skywaves.demon.co.uk>, Paul Lewis
> <paul@skywaves.demon.co.uk> writes
>> Hello Charles and the others
>>
>> your feedback is noticed.
>>
>> Yes I do have the source code that I could ftp across and compile.
>>
>> Also your RMS gate on a Raspberry Pi has come up now..
>>
>> Thanks for the support and feedback
>> Paul g4apl
>>
>>
>>
>>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
