From: wa7oef <wa7oef@wa7oef.net>
Subject: Re: AX25 ssh call just exits
Date: Wed, 07 Apr 2010 01:39:04 -0700
Message-ID: <4BBC44A8.30905@wa7oef.net>
References: <20100407003041.9E5DA660FC@spacedonut.com> <4BBBD618.2050906@wa7oef.net> <20100407074502.GO7246@x-berg.in-berlin.de> <4BBC439A.1010007@wa7oef.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4BBC439A.1010007@wa7oef.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

That fixed it. Works great now. Works with xastir too.
Thanks!
Chuck WA7OEF

Thomas Osterried wrote:
> > Hello,
> >
> > call(1) had a couple of race conditions. It's fixed in the CVS head
> > (http://www.linux-ax25.org/wiki/CVS)
> >
> > Please give it a try and report if it fixes your problem.
> >
> > 73,
> > 	- Thomas  dl9sau
> >
> > On 2010-04-06 17:47:20 -0700, wa7oef <wa7oef@wa7oef.net>
> > wrote in <4BBBD618.2050906@wa7oef.net>:
> >   
> >> Hi
> >> When I ssh into the ham system (CentOS 5.4 KDE ax25 libax25 apps tools)
> >> call a KA node and issue a command, Call just exits the session.
> >> It gives a *** Cleared at the bottom. Anyone know what I'm missing.
> >> Thanks,
> >> Chuck WA7OEF
> >>
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>     
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >   
>
>   

