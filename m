From: C Schuman <k4gbb1@embarqmail.com>
Subject: Re: [xfbb] AX.25 Packet Radio on a RaspBerry Pi : a success
Date: Tue, 04 Sep 2012 16:40:01 -0400
Message-ID: <50466721.6000209@embarqmail.com>
References: <500FD014.5090004@free.fr> <5010192A.9060506@upmc.fr> <50101DB2.9020101@sharon.esrac.ele.tue.nl> <CAOnrUC3iavAZB5q9Xy6pxU0N72YcPyPFAkqzDnca11vmvMdFJg@mail.gmail.com> <501110B1.5080202@free.fr> <501D13B8.8070004@free.fr> <501D2C69.80304@free.fr> <yD$XQnFpQmRQFwVt@skywaves.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; d=embarqmail.com; s=s012408; c=relaxed/simple;
	q=dns/txt; i=@embarqmail.com; t=1346791204;
	h=From:Subject:Date:To:MIME-Version:Content-Type;
	bh=8pf2y0t9hr9ugIbraoz6bP9XtaY=;
	b=IzxfHDls5puMTG7IPxWl+fRsNQtCpKknYF1bq34eDT3r8xETDztJ0nR6RwkIgicJ
	e/ibdK7xHfu8xXEbzj4gxE4tPJFO6icOAA/mziOD52tjL2Ufq/JjcJjCTbmZKRSN;
In-Reply-To: <yD$XQnFpQmRQFwVt@skywaves.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Lewis <paul@skywaves.demon.co.uk>
Cc: f6bvp <f6bvp@free.fr>, List for the LINUX version of FBB <xfbb@f6fbb.org>, Alejandro Santos <alejolp@alejolp.com.ar>, Arno Verhoeven <pe1icq@sharon.esrac.ele.tue.nl>, Lee Woldanski <ve7fet@tparc.org>, F3KT <f3kt@free.fr>, linux-hams <linux-hams@vger.kernel.org>, Bernard Pidoux <bernard.pidoux@upmc.fr>

Paul,
  I am using the FPAC node. It is based on the ROSE protocol,
but works well with NetRom and Flex Net. We have approx 40 ROSE nodes
linked together via AxUDP.

<<Charley>>
   k4gbb

Paul Lewis wrote:
> Hello All
> 
> Thanks Bernard and Charles.
> 
> Is there a NODE package for the "Pi" as I have used node(3.3) for a
> decade now. On my main system.
> 73 de Paul g4apl
> 
> In message <501D2C69.80304@free.fr>, f6bvp <f6bvp@free.fr> writes
>> One suggestion before executing ./Instax25.new script
>> I noticed that /tmp partition was too small and could be full aborting
>> some installation process.
>> I suggest to unmount this partition :
>>
>> sudo umount -l /tmp
>>
>> A /tmp file will remain however and will do it.
>>
>> 73 de Bernard, f6bvp
>>
>>
>> On 04/08/2012 14:21, f6bvp wrote:
>>> Hello all,
>>>
>>> This is my first debian package !
>>>
>>>
>>> http://f6bvp.free.fr/logiciels/ax25/linux-image-3.1.9.080312.ax25+_3.1.
>>> 9.080312.ax25+-10.00.Custom_armhf.deb
>>>
>>>
>>> This is the raspbian kernel image including AX.25 modules (ax25, 6pack,
>>> netrom, rose, mkiss,...)
>>>
>>>  From your RaspBerry Pi you can download it with wget
>>>
>>> wget
>>>
>>> http://f6bvp.free.fr/logiciels/ax25/linux-image-3.1.9.080312.ax25+_3.1.
>>> 9.080312.ax25+-10.00.Custom_armhf.deb
>>>
>>>
>>> To install it :
>>> sudo dpkg -i
>>> linux-image-3.1.9.080312.ax25+_3.1.9.080312.ax25+-10.00.Custom_armhf.deb
>>>
>>> Edit /boot/config.txt and add a line at the end with
>>> # for more options see http://elinux.org/RPi_config.txt
>>> kernel vmlinuz-3.1.9.080312.ax25+
>>>
>>> reboot
>>>
>>> Then download K4GBB install ax25 script for installing ax25 libraries,
>>> tools and apps.
>>>
>>> sudo wget http://f6bvp.free.fr/logiciels/ax25/Instax25.new
>>> sudo chmod +x Instax25.new
>>> ./Instax25.new
>>>
>>> You may download a sample ax25 device init script :
>>> sudo wget http://f6bvp.free.fr/logiciels/ax25/rc.ax25
>>>
>>> and a sample /etc/ax25/ax25ipd.conf
>>> sudo wget http://f6bvp.free.fr/logiciels/ax25/ax25ipd.conf
>>>
>>> Then you also need to edit /etc/ax25/axports
>>> such this example :
>>> sudo wget http://f6bvp.free.fr/logiciels/ax25/axports
>>>
>>> I may have missed some details.
>>>
>>> 73 de Bernard, f6bvp
>>> _______________________________________________
>>> xfbb maillist - xfbb@f6fbb.org
>>> http://mailman.f6fbb.org/mailman/listinfo/xfbb
>>
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
