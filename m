From: Steve Lampereur <kb9mwr@yahoo.com>
Subject: Re: 802.11b wireless lan equipment and ham radio ?
Date: Tue, 16 Jul 2002 10:16:30 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200207161516.g6GFGUj28670@faulkner.netnet.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

>Howdy:
>
> Wouldn't it be great if there was a firmware flash that
>would set several (11 or more) channels inside 2390 - 2450 MHz.
>Or, at least, redefining channels 7 - 11 inside 2390-2350 MHz.
>Assuming that, some day, somewhere, interference will exist
>with part 15 users.
>
>Chuck nc8q

Sure would be.  In theory someone with enough knowledge could 
come up with something like this as all 802.11b devices use the
same Prism chipset.  What would be even better is if the 
manufacures offered this firmware flash to hams who requested 
it.  A few manufactures do this to some extent but worry about
their Part 15 certification.  But maybe if a group like TAPR 
talked to these manufactures this firmware flash could happen?

Problem is 2400-2450 is shared with Part 15.  2390-2400 isn't 
enough for even one DSSS channel as they are 22 MHz wide.  In
theory if you opperate under Part 97 you are given some 
protection from all the other wireless stuff that is classified
as Part 15.  See and old message of mine: 
http://www.qsl.net/kb9mwr/projects/wireless/confused.txt
But then again under Part 97 you allowed more radiated power,
so you might be able to overcome this interference.

Overview:
http://www.qsl.net/kb9mwr/projects/wireless/Ham_Ethernet_GBPPR.pdf

>
>Steve Lampereur wrote:
>> 
>> Actually most of the Part 15 users with external antennas are in violation of
>> Sec. 15.204  External radio frequency power amplifiers and antenna
>> modifications.
>> 
>> Reclassifying by simply calling it Part 97 and opperating within the first 6
>> channels provides a legal way around this.
>
> ...and actually having a part 97 license... ;-

Alot of hams are using this technology but under Part 15.  I also assumed 
everyone on this (linux-hams) list is licensed.  

