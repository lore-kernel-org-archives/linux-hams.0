From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: AX25 ssh call just exits
Date: Wed, 7 Apr 2010 09:45:02 +0200
Message-ID: <20100407074502.GO7246@x-berg.in-berlin.de>
References: <20100407003041.9E5DA660FC@spacedonut.com> <4BBBD618.2050906@wa7oef.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4BBBD618.2050906@wa7oef.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wa7oef <wa7oef@wa7oef.net>
Cc: linux-hams@vger.kernel.org

Hello,

call(1) had a couple of race conditions. It's fixed in the CVS head
(http://www.linux-ax25.org/wiki/CVS)

Please give it a try and report if it fixes your problem.

73,
	- Thomas  dl9sau

On 2010-04-06 17:47:20 -0700, wa7oef <wa7oef@wa7oef.net>
wrote in <4BBBD618.2050906@wa7oef.net>:
> Hi
> When I ssh into the ham system (CentOS 5.4 KDE ax25 libax25 apps tools)
> call a KA node and issue a command, Call just exits the session.
> It gives a *** Cleared at the bottom. Anyone know what I'm missing.
> Thanks,
> Chuck WA7OEF
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
