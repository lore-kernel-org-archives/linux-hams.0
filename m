From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: [HELP] Sound card as TNC, Kernel 2.4.22, Intel board
Date: Thu, 30 Oct 2003 14:31:44 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200310301331.44299.pa3gcu@zeelandnet.nl>
References: <Pine.LNX.4.44.0310301707300.23550-100000@zl2bsj.ampr.org> <Pine.LNX.4.58.0310300558060.9042@debian.ehrlichtronics.com>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0310300558060.9042@debian.ehrlichtronics.com>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Scott Ehrlich <scott@ehrlichtronics.com>
Cc: linux-hams@vger.kernel.org

On Thursday 30 October 2003 11:58, Scott Ehrlich wrote:
> It actually does not exist:
>
> sudo /sbin/ifconfig ax25 up
> ax25: ERROR while getting interface flags: No such device
>
> sudo /sbin/ifconfig ax.25 up
> ax.25: ERROR while getting interface flags: No such device
>
> This is why I seek help in trying to make it appear.

Considering the way you are doing your configuration it shows you have not 
really consulted any documentation, considering this fact i would like to 
point you to the AX-25-HOWTO (without meaning to be rude of course).

MOst likly places to find that are;
/usr/doc/Linux-HOWTOs/AX25-HOWTO (slackware)
/usr/share/doc/ most other systems.

Or if you cant find it;
http://www.linuxdocs.org/HOWTOs/AX25-HOWTO.html

It is said to be rather outdated, however it will certainly give you a good 
start to understanding how linux and AX25 work.

Of course others may be able to help you with the soundmodem stuff first hand, 
sorry i cant i dont and never have used it.

> Scott

-- 
If the Linux community is a bunch of theives because they
try to imitate windows programs, then the Windows community
is built on organized crime.

Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/



