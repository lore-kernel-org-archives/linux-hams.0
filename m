From: C Schuman <k4gbb1@embarqmail.com>
Subject: Re: AX25 in /etc/init.d
Date: Fri, 01 May 2009 18:57:25 -0400
Message-ID: <49FB7E55.8070902@embarqmail.com>
References: <49FA6FB8.1030706@embarqmail.com> <20090501200629.GB4652@flying-gecko.net> <49FB5E22.2070000@embarqmail.com> <20090501214729.GA12084@flying-gecko.net> <49FB79DA.1080503@exemail.com.au>
Reply-To: k4gbb1@embarqmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; d=embarqmail.com; s=s012408; c=relaxed/simple;
	q=dns/txt; i=@embarqmail.com; t=1241218646;
	h=From:Subject:Date:To:MIME-Version:Content-Type;
	bh=+XrbH/+x7yHHy+IQ98Hc1bcGyGA=;
	b=KWCZ8eA5TGUmlUW1YswDxQvQMmCGf9yW+LgWd2Z+tmuBHkpaaBVY62BCTLM50QD3
	8G707R5RCyxkSpsTpPx/16rtcHuJJ/nZbDC8Mda6DEf1zFI+MPkLZdZeTL1zlRT9;
In-Reply-To: <49FB79DA.1080503@exemail.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ray Wells <vk2tv@exemail.com.au>
Cc: Patrick Ouellette <pat@flying-gecko.net>, Linux-Hams <linux-hams@vger.kernel.org>

Ray Wells wrote:
> Patrick Ouellette wrote:
>> On Fri, May 01, 2009 at 04:40:02PM -0400, C Schuman wrote:
>>  
>>>> FWIW, Debian includes a startup script in the ax25-tools package.  
>>>> It sets up
>>>> the mheardd, ax25d, and netromd.
>>>>
>>>> 73,
>>>>
>>>> Pat
>>>>         
>>> Thanks Pat,
>>> Yes, your assumption is correct.
>>>
>>> I use Ubuntu and Debian.  I have never seen any of the Debian 
>>> Startup  scripts for AX.25.
>>> The problem with with most of the supplied or example start scripts 
>>> is  that they never do what you want them to do.
>>> The Linux HAM Radio community are an assorted lot.  I have approx 
>>> 14  Packet Radio servers and no two are the same.
>>> I have been Elmering a number of individuals who are attempting 
>>> their  first installion of Linux. Some just want a RMS Gate.
>>> Others want a BBS, Node and an assortment of other apps.
>>>
>>> My point was not really "We need to add Header Info", but more 
>>> toward  the "We need a more versatile script"
>>> By pointing our start up script at /etc/ax25/ax25-up & down we can 
>>> use a  common script to transition to an uncommon system 
>>> initialization.
>>>
>>>     
>>
>> Well, I just checked, and the most recent ax25-tools does not install
>> the startup script.  There used to be one in the debian source package.
>>
>> Anyway, I agree in principle that ax25 should have startup scripts - BUT
>> as you point out, each system is different.  Several (> 7) years ago I
>> looked at creating comprehensive set up scripts for Debian's ax25 
>> packages
>> and decided there were just too many variables and not enough 
>> interest to
>> make it worth the time.  It was easier and faster to set up the boxes 
>> individually.
>>
>> The upstream ax25 package has *almost* not changed for a very long time.
>> Either it is completely debugged, there is not a bug that hits anyone's
>> "button," or there are not enough users to push for lots of activity 
>> there.
>> (I'm not saying it is unmaintained, but that there has been little 
>> change
>> in both the ax25 apps/tools and the kernel ax25 code for quite some 
>> time.)
>>
>> There is a wiki at www.linux-ax25.org and a few other efforts around.
>>
>> 73, 
>> Pat
>>
>>   
> I understand that fpac cannot be simply stopped and restarted, it 
> needs a reboot. If that is correct, is there any point in an ax25 
> script for stations who use fpac?
>
> Ray vk2tv
>
Ray,
 AX25, FPAC & FBB can all be restarted w/o rebooting.
It's all in the way you construct your stop shut process.
I'll send you a copy of my fpac.sh and my ax25-down.
I have a couple of systems that have uptimes of over 60 days even though 
I have made changes to the configuration and restarted the service.
Once in awhile ROSE will cause a kernel panic on the Stopping and the 
system will reboot on panic. This occurs mainly on the systems with a co 
located BBS.

73
    <<Charley>>
        k4gbb
