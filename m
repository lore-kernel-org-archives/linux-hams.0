From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: Re: [xfbb] AX.25 Packet Radio on a RaspBerry Pi : a success
Date: Fri, 14 Sep 2012 09:11:01 +0100
Message-ID: <vKlAy5AVauUQFw+E@skywaves.demon.co.uk>
References: <500FD014.5090004@free.fr> <5010192A.9060506@upmc.fr> <50101DB2.9020101@sharon.esrac.ele.tue.nl> <CAOnrUC3iavAZB5q9Xy6pxU0N72YcPyPFAkqzDnca11vmvMdFJg@mail.gmail.com> <501110B1.5080202@free.fr> <501D13B8.8070004@free.fr> <501D2C69.80304@free.fr> <yD$XQnFpQmRQFwVt@skywaves.demon.co.uk> <50466721.6000209@embarqmail.com> <oTSREEHcimRQFwWp@skywaves.demon.co.uk> <504734FD.4030009@embarqmail.com> <4XcVlTClnzRQFwkJ@skywaves.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4XcVlTClnzRQFwkJ@skywaves.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Paul Lewis <paul@skywaves.demon.co.uk>
Cc: C Schuman <k4gbb1@embarqmail.com>, f6bvp <f6bvp@free.fr>, List for the LINUX version of FBB <xfbb@f6fbb.org>, Alejandro Santos <alejolp@alejolp.com.ar>, Arno Verhoeven <pe1icq@sharon.esrac.ele.tue.nl>, Lee Woldanski <ve7fet@tparc.org>, F3KT <f3kt@free.fr>, linux-hams <linux-hams@vger.kernel.org>, Bernard Pidoux <bernard.pidoux@upmc.fr>

Hi Gays and Gals

Thought I would give and update
Have now got the system running as a linuxnode.
Have not switch on the radio yet connected to a usb serial port
AX25IPD Ax25 and netrom connections work.
Telnet to the linuxnode from on the local machine

net44 IP over AX25UDP does not work.
I have never got this working on my partners when they upgraded to the 
2.6 kernels and the associated ax25ipd during the last decade.
So this problem has caught up with me again..

Works fine on my 2.2.26 kernel the version of ax25ipd that I am using
ax25-apps-0.0.6.2src_f6bvp.tar (installed 4.6.2007)

Will provide feedback in a new thread.


Encounter one gotcha though, that got me going for a couple of days. Was 
the netrom interfaces were always in use and the nrrattach fails, no 
spare netrom device.
Also the ttyUSB0 interface was 'grab by the system'

Confirmed netrom, ax25, mkiss modules loaded
the required alias defined the /etc/modprobe.d
conf files.

See these referenced during the system boot and message log file.

Traced (ps -ef) to the /etc/default/ifplugd hotplug deamon that auto 
connects 'by default' all interfaces.
Change the attribute HOTPLUG INTERFACES="all"  to "lo eth0"

and we got control of the system and nrrattach now worked.
73 Paul g4apl (gb7cip)


In message <4XcVlTClnzRQFwkJ@skywaves.demon.co.uk>, Paul Lewis 
<paul@skywaves.demon.co.uk> writes
>Hello Charles and the others
>
>your feedback is noticed.
>
>Yes I do have the source code that I could ftp across and compile.
>
>Also your RMS gate on a Raspberry Pi has come up now..
>
>Thanks for the support and feedback
>Paul g4apl
>
>
>
>
-- 
paul@skywaves.demon.co.uk
