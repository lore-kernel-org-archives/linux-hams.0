From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: Re: error when trying to run kissattach on 2.6.13-15.8 Suse Kernel
Date: Wed, 19 Apr 2006 08:28:09 -0400
Message-ID: <002701c663ac$b82dc590$650ea8c0@LoJackOne.LoJack.com>
References: <000701c66340$8cacf600$3849a8c0@lan.w1nr.net> <200604190504.26842.jjgpg@cet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Jeremiah <jjgpg@cet.com>
Cc: linux-hams@vger.kernel.org

Kernel versions that I know about:

2.6.14 is broken.
2.6.15.2 Was patched.
2.6.16.x is good (from RC1).

Note these are the official release numbers from kernel.org.  They are not 
the same sub version numbers that SuSE uses.  Assuming SuSE picked up the 
standard 2.6.16 sources, the 10.1 release should be just fine.

Mike, W1NR

----- Original Message ----- 
From: "Jeremiah" <jjgpg@cet.com>
To: "Mike McCarthy, W1NR" <lists@w1nr.net>
Cc: <linux-hams@vger.kernel.org>
Sent: Wednesday, April 19, 2006 8:04 AM
Subject: Re: error when trying to run kissattach on 2.6.13-15.8 Suse Kernel


>I didn't know about that one, cool. Now is that bleeding edge kernels, or 
>do
> they have stable builds on there too??
>
> Do you know what kernel ax25 is working on??
>
> thanks
> Jeremiah
> KD7DMP
>
> On Tuesday 18 April 2006 16:33, Mike McCarthy, W1NR wrote:
>> There is one other possible cure I forgot to mention...
>> Point a YaST install source to
>> ftp://ftp.esat.net/mirrors/ftp.suse.com/pub/projects/kernel/kotd/i386/HEAD/
>> and try the "kotd - kernel of the day"
>>
>> Mike, W1NR
>>
>>
>> -----Original Message-----
>> From: linux-hams-owner@vger.kernel.org
>> [mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Mike McCarthy, 
>> W1NR
>> Sent: Tuesday, April 18, 2006 7:52 AM
>> To: Jeremiah; linux-hams@vger.kernel.org
>> Subject: Re: error when trying to run kissattach on 2.6.13-15.8 Suse 
>> Kernel
>>
>> It is broken and I don't know of a reliable patch other than getting the
>> latest kernel from kernel.org.  You have 3 choices.
>>
>> 1. Back off to SuSE 9.3.
>> 2. Try SuSE 10.1 RC1 (See www.opensuse.org) 3. Update the kernel to 
>> 2.6.16
>> from kernel.org sources.
>>
>> Mike, W1NR
>>
>> ----- Original Message -----
>> From: "Jeremiah" <jjgpg@cet.com>
>> To: <linux-hams@vger.kernel.org>
>> Sent: Monday, April 17, 2006 11:21 PM
>> Subject: error when trying to run kissattach on 2.6.13-15.8 Suse Kernel
>>
>> > Hello all,
>> >
>> > I get an error when trying to start up kissattach on my Suse 10 box.
>> > I'm running the Suse 2.6.13-15.8 kernel, no changes made to it.
>> >
>> > When I run
>> > "kissattach /dev/ttyS0 vhf 10.0.0.1"
>> > I get back
>> > "kissattach: Error setting line discipline: TIOCSETD: No such device
>> > Are you sure you have enabled MKISS support in the kernel
>> > or, if you made it a module, that the module is loaded?"
>> >
>> > I get no other error other than suse complaning that I didn't configure
>> > and
>> > AX0 port.
>> > Any ideas, Do I need to patch?
>> >
>> > I do have the AX.25 stuff downloaded from suse linux ham YAST source.
>> >
>> > Any input would be of help.
>> >
>> > Thanks
>> >
>> > Jeremiah
>> > KD7DMP
>> > -
>> > To unsubscribe from this list: send the line "unsubscribe linux-hams" 
>> > in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>> -
>> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.h
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

