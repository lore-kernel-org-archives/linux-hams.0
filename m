From: "Michael Hart" <mhart@terrigal.net.au>
Subject: Re: ax25
Date: Mon, 23 Sep 2002 00:10:21 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <001301c26241$cbb617e0$0500a8c0@terrigal.net.au>
References: <Pine.LNX.4.33.0208252310120.1012-100000@n1uan.ampr.org> <05f301c24cd4$401e4ae0$0500a8c0@terrigal.net.au> <00ae01c26228$443a98e0$0500a8c0@terrigal.net.au> <02092212212904.18645@unix.pa3gcu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

----- Original Message -----
From: pa3gcu <pa3gcu@zeelandnet.nl>
To: Michael Hart <mhart@terrigal.net.au>; <linux-hams@vger.kernel.org>
Sent: Sunday, September 22, 2002 10:21 PM
Subject: Re: ax25


> On Sunday 22 September 2002 11:07, Michael Hart wrote:
> > ----- Original Message -----
> > From: Michael Hart <mhart@terrigal.net.au>
> > To: <linux-hams@vger.kernel.org>
> > Sent: Monday, August 26, 2002 5:43 PM
> > Subject: ax25
> >
> > > Hi everyone,
> > >
> > > I have RedHat 7.3 and the kernel version is 2.4.18
> >
> > Well I have now managed to get the ax25 tools utils and libs to compile.
> >
> > My trouble is now I cannot find any of the devices that are described in
> > the ax25 howto.
> >
> > my /proc/sys/net does not include an ax25 subdirectory (i.e. ax25 is not
> > running) and ifconfig confirms this.  I have compiled it into the kernel
> > but it doesn't seem to start.  I have edited my /etc/modules.conf file
as
> > described in the howto but still cannot find /dev/bc0 (even though I
have
> > selected it in the kernel compile)
> >
> > I cannot set anything up if they are not there.
>
> They will not be there untill you configure an interface.
>
> I have never used a baycom style modem so i cant help you, however the one
> thing i do (think) i know is that the use of "bcX" is now depreciated,
they
> now have another name.
>
> >
> > I don't know where to start.
> >
> > michael
> > vk2jxi
> >
> --
> Regards Richard
> pa3gcu@zeelandnet.nl
> http://people.zeelandnet.nl/pa3gcu/
>

Thanks Richard,

I guess if /dev/bcX is no longer used then I have an old AX25-HowTo.  What I
need is a pointer to the latest AX25howto I guess

michael (vk2jxi)




