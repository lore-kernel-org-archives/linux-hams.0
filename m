From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: Making a call
Date: Sun, 11 Jul 2004 21:14:28 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200407112114.28201.pa3gcu@zeelandnet.nl>
References: <20040711135640.67329.qmail@web41207.mail.yahoo.com>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040711135640.67329.qmail@web41207.mail.yahoo.com>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wijaya <wijaya_mail@yahoo.com>
Cc: linux-hams@vger.kernel.org, linux-ham@trilug.org

On Sunday 11 July 2004 15:56, Wijaya wrote:
> Hi there,
> My problem now solved. Now between tnc (kpc-9612+) could communicate (make
> a call) between each others.
>
> Configuration /etc/ax25/axports before
> axip   RE4SLO          9600    255     2       AXIP Port
>
> after
> axip   RE4SLO          9600    255     2       AXIP Port

I see in this example NO differance, however you showed us your axports before 
in a previous mail and  it was.

axip   RE4SLO          1200    255     2       AXIP Port

So it seems like i said, 'man axports'  (interface speed)...

> Controlling speed from kissattach looks not working properly. I don't know
> why.

Its has always been this way, or at least AFAIK it has been.
G4KLX the man who origanaly wrote the ax25, netrom and rose protocols into 
linux does sometimes show up here, maybe he can explain just why you fell 
into the pithole.

>
> But I've still had problem to make my linux accept and communicate with
> tcp/ip. Now I'm still try to make it work. Wishing all of you giving an
> advice and help.

I think (without being rude) you need to explain your problems beter.

>
> Regards,
>
> Wijaya

-- 
If the Linux community is a bunch of thieves because they
try to imitate windows programs, then the Windows community
is built on organized crime.

Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

