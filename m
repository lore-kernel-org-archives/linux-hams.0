From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: ax25
Date: Sun, 22 Sep 2002 12:21:29 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <02092212212904.18645@unix.pa3gcu>
References: <Pine.LNX.4.33.0208252310120.1012-100000@n1uan.ampr.org> <05f301c24cd4$401e4ae0$0500a8c0@terrigal.net.au> <00ae01c26228$443a98e0$0500a8c0@terrigal.net.au>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <00ae01c26228$443a98e0$0500a8c0@terrigal.net.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Hart <mhart@terrigal.net.au>, linux-hams@vger.kernel.org

On Sunday 22 September 2002 11:07, Michael Hart wrote:
> ----- Original Message -----
> From: Michael Hart <mhart@terrigal.net.au>
> To: <linux-hams@vger.kernel.org>
> Sent: Monday, August 26, 2002 5:43 PM
> Subject: ax25
>
> > Hi everyone,
> >
> > I have RedHat 7.3 and the kernel version is 2.4.18
>
> Well I have now managed to get the ax25 tools utils and libs to compile.
>
> My trouble is now I cannot find any of the devices that are described in
> the ax25 howto.
>
> my /proc/sys/net does not include an ax25 subdirectory (i.e. ax25 is not
> running) and ifconfig confirms this.  I have compiled it into the kernel
> but it doesn't seem to start.  I have edited my /etc/modules.conf file as
> described in the howto but still cannot find /dev/bc0 (even though I have
> selected it in the kernel compile)
>
> I cannot set anything up if they are not there.

They will not be there untill you configure an interface.

I have never used a baycom style modem so i cant help you, however the one 
thing i do (think) i know is that the use of "bcX" is now depreciated, they 
now have another name.

>
> I don't know where to start.
>
> michael
> vk2jxi
>
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

