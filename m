From: richard <richard.bown@blueyonder.co.uk>
Subject: Re: permissions
Date: Tue, 31 Oct 2006 10:50:44 +0000
Message-ID: <45472A84.6000709@blueyonder.co.uk>
References: <454655BC.30606@blueyonder.co.uk> <20061030213355.GA25496@cloud.net.au> <45469110.4070108@blueyonder.co.uk> <20061031012432.GA6698@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20061031012432.GA6698@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hamish Moffatt <hamish@cloud.net.au>
Cc: linux-hams@vger.kernel.org

Hamish Moffatt wrote:
> On Mon, Oct 30, 2006 at 11:56:00PM +0000, richard wrote:
>   
>>> Still, the error "Device or resource busy" means that something is using
>>> the device, not that you don't have permission to access it (which would
>>> just be "Permission denied.") As root you might try using lsof to find
>>> out which program is using it
>>>
>>> eg "lsof /dev/dsp
>>>  
>>>       
>> I let gmfsk fail and produce the error message then ran the following:-
>> [root@gb7tf Desktop]# lsof /dev/dsp
>> [root@gb7tf Desktop]# lsof|grep /dev/dsp
>>     
>
> Maybe something is using the underlying ALSA device which is blocking
> /dev/dsp. lsof | grep /dev/snd ?
>
>
> Hamish
>   
Its only the mixer app Hamish
mixer_app  6382 richard-g8jvm   17u      CHR      116,0                
7895 /dev/snd/controlC0

I've also tried recompiling gmfsk as me and not as root
-rwxr-xr-x 1 root root 1283122 Oct 31 09:06 gmfsk*
-rwxr-xr-x 1 root root 1453277 Oct 23 12:17 gpredict*
-rwxr-xr-x 1 root root  822682 Oct 20 14:46 xlog*

Added the line that Al suggested in rc.local
chmod 666 /dev/dsp /dev/audio /dev/mixer /dev/cdrom

no immediate effect, but worked after rebooting, so it looks like the 
permissions
are only read at startup on the above files, which is a bit strange as 
normally you can change file permissions
on the hoof and take immediate effect.
Must be some Mandriva security measure that been added in MDV2007.

Thanks for all the help

73 Richard


