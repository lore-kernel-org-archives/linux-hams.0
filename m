From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: Problem...
Date: Tue, 25 Mar 2003 20:45:11 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <03032520451100.00773@unix.pa3gcu>
References: <GMEHKCCPLOCMPOLBMKICCEJNDOAA.hremijn@zeelandnet.nl> <3E8086E6.3000709@ccr.jussieu.fr>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3E8086E6.3000709@ccr.jussieu.fr>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bernard pidoux <pidoux@ccr.jussieu.fr>, Henk Remijn <hremijn@zeelandnet.nl>
Cc: Pontus Falk <pfalk@ax25.org>, linux-hams@vger.kernel.org

On Tuesday 25 March 2003 16:42, bernard pidoux wrote:
> Henk Remijn wrote:
> >Pontus,
> >
> >With lsmod you can check if modules are loaded.
> >
> >1. I would not use 2.4.18, this was is buggy. Try a later kernel.
> >But this has nothing to do with your problem now.

> Here is my own experience (using Linux and AX25 applications for 3 years
> since kernel 2.0.19).

O, i used kernel 2.0.19 6 and one half years ago when it came out, you 
possably mean when you started using it.
I hope i am correct in the 6 + years as i checked on kernel.org, 2.0.19 is 
archived with a date of; Sep 11  1996, i'm getting older.....

> I was not able to achieve a normal functionning of Linux as soon as AX25
> was set up with mkiss connexions with any of 2.4.xx kernels. And I tried
> with different PCs.
> In 2.4 kernel, there are major problems with interruptions (and kernel
> panics after a few minutes or hours) that should be corrected in kernel
> version under development (actually around 2.5.65) leading to a possible
> return to correct functionning (I hope) in 2.2.6 kernel.

I have encountered problems when ifconfig'ing down a kiss interface in 2.4 
kernels, however that has been fixed now, i have tryed 2.4 kernels and my 
feelings are mixed, i certainly have not encountered any interrupt problems 
either with AX25 or Inet networking. Of course i am not saying there are none.

> I strongly suggest you use kernel 2.2.x (with x greater than 19, last is
> 2.2.25) for AX25 purpose.

I still use 2.2.19 with AX25, i have no problem what so ever with it. Or i 
should say the following.
  9:31pm  up 147 days, 18:25,  1 user,  load average: 0.00, 0.00, 0.00 
3 ethernet cards one scc card 3 IPIP links and AFAIK no problems.
The box is certainly not busy, but when it was years back it stayed up untill 
i buggered something up and for easyness sake hit the restset button because 
i was enoyed with myself otheriwse uptimes would have been higher.

> Thats what I am using without any serious problem with AX25 applications
> (two mkiss serial port handling 9600 and 1200 bauds links each, plus an
> ethernet 10 Mb LAN).
> For example,  install Mandrake Linux distro 7.2, then update with 7.2
> update (february 2003 delivery or so) that can be found on any Linux
> distro mirror.
> Then install (optionally) the last 2.2 kernel if you want.

IMHO 2.2.xx has yet to be beaten when it comes to stability.

I do however belive that my learned friend Henk PA5KT uses 2.4.xx kernels on 
his DXcluster gateway and it is always accessable.
The last time i saw him he mentioned he had no such problems with his 2.4 
kernel, now i hope i understood him properly.

>
> Bernard Pidoux, F6BVP
>

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

