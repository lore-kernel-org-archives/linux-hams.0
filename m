From: Scott Ehrlich <scott@ehrlichtronics.com>
Subject: Re: =?iso-8859-1?B?UmWg?= =?iso-8859-1?Q?=3A?= Help, not rudeness,
 requested
Date: Tue, 4 Nov 2003 14:20:51 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0311041419190.22150@debian.ehrlichtronics.com>
References: <Pine.LNX.4.58.0311040841580.19958@debian.ehrlichtronics.com>
 <20031104140305.GE1477@tangerine.coulon.evette>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20031104140305.GE1477@tangerine.coulon.evette>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Cc: linux-hams@vger.kernel.org

Greetings:

Well aware of the dev drivers :-)

I neglected to say I had enabled them during make menuconfig, but still
saw no sign of soundmodem support in Amateur Radio support.  I'll check
out the baycom stuff when I get back home.

Thanks.

Scott


On Tue, 4 Nov 2003, Jean-Luc Coulon (f5ibh) wrote:

> The options "hidden" by menuconfig predepends on other options.
> Generally you have first to enable :
> From "main menu"
>  Code maturity level options  --->
> [*] Prompt for development and/or incomplete code/drivers
>
> --
> Regards and 73
> 		- f5ibh - Jean-Luc
>
> Le 04.11.2003 14:53, Scott Ehrlich a =E9crit=A0:
> > My last round of messages to this list asking for help compiling
> > ax25/soundcard support for the kernel was met with some unwarranted
> > hostility.
> >
> > Here are the facts, as opposed to assumptions based on
> > misinterpretation
> > of my emails.
> >
> > I downloaded the 2.4.22 kernel from kernel.org.
> >
> > I had an ssh session open to the Debian woody box since it was
> > running
> > an
> > older kernel to at least get it up and running.  In a web browser, =
I
> > had
> > several pages open to show me how to compile in ax25 sound support.
> >
> > I configured the kernel (I've compiled and patched many kernels ove=
r
> > the
> > years, so I am a veteran) and looked for all the kernel options the
> > respective web pages showed.  Some of those options just were not
> > listed,
> > and I could find none mentioning anything about patches that might =
be
> > needed.
> >
> > I then dove into the .config directly and found some compile option=
s
> > never
> > shown under make menuconfig, and toggled those manually.   I did ge=
t
> > further, but eventually gave up and reinstalled Win98.  I really
> > wanted
> > Linux so I could monitor activity remotely from work.   I've now go=
ne
> > back
> > to Linux.
> >
> > The intention of an email list is to foster support and help for li=
st
> > members.  If this were a development or hackers list, then it might
> > be
> > wiser to direct me to a "help" or "general" or "discussion" version
> > of
> > the
> > list.  But the list name says linux-hams, and that is exactly what =
my
> > catagory is.
> >
> > I don't expect any apologies for those who flamed me.  But what I
> > would at
> > least appreciate are .config files from version 2.4.22 kernels for
> > those
> > who have successfully done the trick of ax25 with soundcard stuff a=
ll
> > working under Debian woody.
> >
> > Thanks.
> >
> > Scott, WY1Z
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-ham=
s"
> > in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
