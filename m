From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: AX.25 Packet Radio on a RaspBerry Pi : a success
Date: Sun, 05 Aug 2012 07:59:49 +1000
Message-ID: <501D9B55.9050608@exemail.com.au>
References: <500FD014.5090004@free.fr> <5010192A.9060506@upmc.fr> <50101DB2.9020101@sharon.esrac.ele.tue.nl> <CAOnrUC3iavAZB5q9Xy6pxU0N72YcPyPFAkqzDnca11vmvMdFJg@mail.gmail.com> <501110B1.5080202@free.fr> <501D13B8.8070004@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <501D13B8.8070004@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: f6bvp <f6bvp@free.fr>
Cc: Alejandro Santos <alejolp@alejolp.com.ar>, Arno Verhoeven <pe1icq@sharon.esrac.ele.tue.nl>, Bernard Pidoux <bernard.pidoux@upmc.fr>, linux-hams <linux-hams@vger.kernel.org>, List for the LINUX version of FBB <xfbb@f6fbb.org>, Lee Woldanski <ve7fet@tparc.org>, C Schuman <k4gbb1@embarqmail.com>, F3KT <f3kt@free.fr>

Hi Bernard, All,

This is great news because I almost wrote to you yesterday to ask if you 
had made a .deb package for your kernel.

My two Raspberry Pi's arrived on Friday (I was told 5 weeks and they 
arrived in 5 days from Element 14!) and I'm gathering the hardware I 
need to get one of them up and running with kernel ax25. One will serve 
as my aprs gateway machine and maybe a fpac node again.

Ray vk2tv


On 04/08/12 22:21, f6bvp wrote:
> Hello all,
>
> This is my first debian package !
>
> http://f6bvp.free.fr/logiciels/ax25/linux-image-3.1.9.080312.ax25+_3.1.9.080312.ax25+-10.00.Custom_armhf.deb 
>
>
> This is the raspbian kernel image including AX.25 modules (ax25, 
> 6pack, netrom, rose, mkiss,...)
>
> From your RaspBerry Pi you can download it with wget
>
> wget 
> http://f6bvp.free.fr/logiciels/ax25/linux-image-3.1.9.080312.ax25+_3.1.9.080312.ax25+-10.00.Custom_armhf.deb
>
> To install it :
> sudo dpkg -i 
> linux-image-3.1.9.080312.ax25+_3.1.9.080312.ax25+-10.00.Custom_armhf.deb
>
> Edit /boot/config.txt and add a line at the end with
> # for more options see http://elinux.org/RPi_config.txt
> kernel vmlinuz-3.1.9.080312.ax25+
>
> reboot
>
> Then download K4GBB install ax25 script for installing ax25 libraries, 
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
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

