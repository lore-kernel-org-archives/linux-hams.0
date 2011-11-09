From: "Marco Di Martino (IW2OHX)" <iw2ohx@iw2ohx.net>
Subject: Re: Compiling FBB
Date: Wed, 09 Nov 2011 10:36:46 +0100
Message-ID: <4EBA49AE.9090005@iw2ohx.net>
References: <4E93FBEC.7050907@free.fr> <4E98B35E.1050602@eunet.rs> <4E993C82.2090601@free.fr> <4EA0EEE4.7050502@trinnet.net> <20111021120359.GO8243@x-berg.in-berlin.de> <20111108200524.GE30829@flying-gecko.net> <4EB9D5D6.50509@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4EB9D5D6.50509@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Ranch <linux-hams@trinnet.net>
Cc: Patrick Ouellette <pouelle@debian.org>, Thomas Osterried <thomas@x-berg.in-berlin.de>, "Bernard, f6bvp" <f6bvp@free.fr>, ralf@linux-mips.org, linux-hams <linux-hams@vger.kernel.org>, kd1zd@rtcubed.org

Hi David,

thanks for the info.
I'm going to test unode at iw2ohx.ampr.org (telnet iw2ohx.ampr.org).
I searched for years a replacement of node. A part security issues, I had
problem with process node that sometimes eat a lot of CPU expecially 
when someone
doesn't close connection with "B" command. I hope this problem was fixed 
in Unode.

I appreciated flexd implementation, I teste it years ago with AWZNode.

I hope to post feedback here after configuring unode in my ham linux box.

Bye
Marco
iw2ohx

On 11/09/2011 02:22 AM, David Ranch wrote:
>
> Hello Patrick,
>
> Thanks for willing to take this back on!  One thing to regarding the 
> node binary. The old "Linux Node" software evidently has several major 
> security vulnerabilities in it that were resolved in a fork called 
> Uronode.  See the Unode release nodes below for more details.
>
> The HAM that wrote Uronode  has seemingly dropped of the map as all 
> his domains no longer work, etc.  A different HAM (KD1ZD) has reposted 
> that work as a new fork called Unode.   I would argue that the 
> original Linux node software should be patched to be secure or better 
> yet, be DROPPED from the ax25 suite in favor of this new Unode 
> software which is "more" secure, has some additional features, etc.
>
>    https://github.com/kd1zd/Unode
>
> Just my $0.02
>
> --David
> KI6ZHD
>
>
> Patrick Ouellette wrote:
>> On Fri, Oct 21, 2011 at 02:04:00PM +0200, Thomas Osterried wrote:
>>> On 2011-10-20 21:02:44 -0700, David Ranch <linux-hams@trinnet.net>
>>> wrote in <4EA0EEE4.7050502@trinnet.net>:
>>>> Hello Bernard, Ralf, Thomas,
>>>>
>>>> I've been meaning to ask this question for a while now:  Do you know
>>>> why the official version of the ax25 apps/libs/tools hasn't been
>>>> updated in ages?
>>> Unfortunately, there's no debian-developer who regulary builds new
>>> packages from the CVS head of ax25-apps, -tools and libax25.
>>
>> I used maintain ax25 for Debian to a long time ago.  Apparently I 
>> will be picking up support in Debian again since no one else seems to 
>> want to and the
>> "team maintainer" concept has fallen apart.
>> The first order of business I have to attend to is the apparent need 
>> to rename
>> the node package and binary to ax25-node.
>>
>> www.linux-ax25.org is apparently down right now?
>>
>> (the Google repo mentioned is: http://code.google.com/p/linuxax25/ )
>>
>> 73,
>>
>> Pat
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
---
Marco Di Martino
Via Attimo, 18 - Bollate (MI)
Mobile: +393285373364
e-mail: iw2ohx@iw2ohx.net
-
Amateur Radio: I W 2 O H X
Homepage Inet: www.iw2ohx.net
Homepage Ampr: iw2ohx.ampr.org
LinuxNode: telnet://iw2ohx.ampr.org/
(X)net: telnet://iw2ohx-2.ampr.org/
Packet Mail : IW2OHX @ IW2OHX.ILOM.ITA.EU
Ampr Mail: iw2ohx@iw2ohx.ampr.org
---

