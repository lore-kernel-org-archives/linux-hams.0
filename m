From: bernard pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: Problem...
Date: Tue, 25 Mar 2003 17:42:14 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E8086E6.3000709@ccr.jussieu.fr>
References: <GMEHKCCPLOCMPOLBMKICCEJNDOAA.hremijn@zeelandnet.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <GMEHKCCPLOCMPOLBMKICCEJNDOAA.hremijn@zeelandnet.nl>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Henk Remijn <hremijn@zeelandnet.nl>
Cc: Pontus Falk <pfalk@ax25.org>, linux-hams@vger.kernel.org

Henk Remijn wrote:

>Pontus,
>
>With lsmod you can check if modules are loaded.
>
>1. I would not use 2.4.18, this was is buggy. Try a later kernel.
>But this has nothing to do with your problem now.
>
>2. Try to build as much drivers as modules, especially the ham radio ones.
>
>If nothing is going to work, you might consider switching to debian. This
>distro has ham-radio enabled by default. No kernel recompiling necessary.
>
>73, Henk PA5KT
>
>  
>
>>-----Original Message-----
>>From: linux-hams-owner@vger.kernel.org
>>[mailto:linux-hams-owner@vger.kernel.org]On Behalf Of pa3gcu
>>Sent: dinsdag 18 maart 2003 16:50
>>To: Pontus Falk
>>Cc: linux-hams@vger.kernel.org
>>Subject: Re: Problem...
>>
>>
>>On Monday 17 March 2003 22:09, Pontus Falk wrote:
>>
>>    
>>
>>>>cat /usr/src/linux/.config | grep MKISS
>>>>You should get CONFIG_MKISS=m or CONFIG_MKISS=y if you get
>>>># CONFIG_MKISS is not set
>>>>that means you dont have mkiss at all.
>>>>        
>>>>
>>>Yes, I have CONFIG_MKISS=y in /usr/src/linux/.config. But, I have
>>>CONFIG_HAMRADIO=m if that is any problem. I don't know where to set this
>>>to y in menuconfig... When I try to set it manually and recompile the
>>>kernel I get an error message...
>>>      
>>>
>>Why not do it the other way round, compile tham all as modules.
>>
>>    
>>
>>>Pontus
>>>
>>>      
>>>
>>--
>>Regards Richard
>>pa3gcu@zeelandnet.nl
>>http://people.zeelandnet.nl/pa3gcu/
>>
>>    
>>

Here is my own experience (using Linux and AX25 applications for 3 years 
since kernel 2.0.19).
I was not able to achieve a normal functionning of Linux as soon as AX25 
was set up with mkiss connexions with any of 2.4.xx kernels. And I tried 
with different PCs.
In 2.4 kernel, there are major problems with interruptions (and kernel 
panics after a few minutes or hours) that should be corrected in kernel 
version under development (actually around 2.5.65) leading to a possible 
return to correct functionning (I hope) in 2.2.6 kernel.
I strongly suggest you use kernel 2.2.x (with x greater than 19, last is 
2.2.25) for AX25 purpose.
Thats what I am using without any serious problem with AX25 applications 
(two mkiss serial port handling 9600 and 1200 bauds links each, plus an 
ethernet 10 Mb LAN).
For example,  install Mandrake Linux distro 7.2, then update with 7.2 
update (february 2003 delivery or so) that can be found on any Linux 
distro mirror.
Then install (optionally) the last 2.2 kernel if you want.

Bernard Pidoux, F6BVP


