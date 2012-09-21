From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Looking for any active Linpac (Linux based AX.25 Packet radio
 terminal) users
Date: Thu, 20 Sep 2012 23:37:42 -0700
Message-ID: <505C0B36.1010904@trinnet.net>
References: <505AADB2.90603@trinnet.net> <505ACB55.60705@kth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <505ACB55.60705@kth.se>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>


Hello Bjorn,

Centos6 comes with a 2.6.32 kernel and I'm currently running a 3.5.2 
kernel.  I have a friend, KJ6YWD who is running Linpac with Soundmodem 
with great results.

No, soundmodem isn't integrated but in classic Linux fashion, it 
shouldn't be.


I  have BOTH versions compiling.  The only Ncurses-only 0.17pre3 works 
very well (though is has some minor bugs).  It's the 1.0pre3 server 
version either with the Ncurses or Java client that I'm currently having 
issues with.  I've captured the issue straces here:

    http://www.trinityos.com/SCRATCH/Linpac/


If you're interested if giving Linpac a try, use my previously mentioned 
patches though they assume the use of compatibility libraries: 
compat-gcc-34-c++

I understand that the vector.h errors should be avoidable w/o those 
compatibility libraries and one of my posted patch files is supposed to 
rectify the compile errors (commented out in the SPEC file). 
Unfortunately, my patches for all this must be incomplete.  I'd love to 
have someone set me strait so I can remove those compatibility libs.

--David

On 09/20/2012 12:52 AM, Bjorn Pehrson wrote:
> Hi,
> What about proceeding to the 2.6 kernel and integrating soundmodem or
> has that already happened?
> best wishes
> Bjorn/SA0BXI
>
> On 2012-09-20 07:46, David Ranch wrote:
>> Hello Everyone,
>>
>> I was curious if there are any active Linpac users here on the list. I
>> (somewhat) recently took over the project from the previous author and
>> have things working for my uses. I wanted to see what else active
>> packet users would like to see from this project. I'm also curious
>> what versions of code people are using if it's the Ncurses interface
>> or the Java interface.
>>
>> http://linpac.sourceforge.net/
>>
>> Linpac is a fantastic AX.25 terminal program and is very feature rich.
>> It supports multiple concurrent connections, easy Unproto (UI)
>> traffic, local email and FBB forwarding, etc. It's currently working
>> on Centos5/6 and Ubuntu so far and I'm looking for any and all help
>> from people who know aspects of:
>>
>> - C++, Autoconf/Automake, socket programming, Ncurses, Java
>> - testers
>> - documentation
>>
>>
>> Give it a look and I have patches and .spec files ready to go:
>>
>> Patches:
>> http://www.trinityos.com/HAM/CentosDigitalModes/usr/src/redhat/SOURCES/
>> SPECS:
>> http://www.trinityos.com/HAM/CentosDigitalModes/usr/src/redhat/SPECS/linpac.spec
>>
>>
>> 73s
>>
>> --David
>> KI6ZHD
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>> .
>>
