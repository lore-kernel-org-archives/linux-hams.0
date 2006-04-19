From: Jeremiah <jjgpg@cet.com>
Subject: Re: error when trying to run kissattach on 2.6.13-15.8 Suse Kernel
Date: Wed, 19 Apr 2006 04:59:26 -0700
Message-ID: <200604190459.27032.jjgpg@cet.com>
References: <200604172021.01888.jjgpg@cet.com> <000701c6629a$f803c4c0$e14689d8@oem7paq6co5hph>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <000701c6629a$f803c4c0$e14689d8@oem7paq6co5hph>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vavra <wb8zrl@avalon.net>, linux-hams@vger.kernel.org

On Monday 17 April 2006 20:47, you wrote:
> Did you check to see if MKISS is loaded, assuming you made it a module?
> lsmod        should list the loaded modules.
>
>        Tom     WB8ZRL
>
>
> ----- Original Message -----
> From: "Jeremiah" <jjgpg@cet.com>
> To: <linux-hams@vger.kernel.org>
> Sent: Tuesday, April 18, 2006 3:21 AM
> Subject: error when trying to run kissattach on 2.6.13-15.8 Suse Kernel
>
> > Hello all,
> >
> > I get an error when trying to start up kissattach on my Suse 10 box.
> > I'm running the Suse 2.6.13-15.8 kernel, no changes made to it.
> >
> > When I run
> > "kissattach /dev/ttyS0 vhf 10.0.0.1"
> > I get back
> > "kissattach: Error setting line discipline: TIOCSETD: No such device
> > Are you sure you have enabled MKISS support in the kernel
> > or, if you made it a module, that the module is loaded?"
> >
> > I get no other error other than suse complaning that I didn't configure
>
> and
>
> > AX0 port.
> > Any ideas, Do I need to patch?
> >
> > I do have the AX.25 stuff downloaded from suse linux ham YAST source.
> >
> > Any input would be of help.
> >
> > Thanks
> >
> > Jeremiah
> > KD7DMP
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
Yep, I made sure that Mkiss and ax25 are getting loaded, and they are. I 
should have knowen better then to leave that out of my posting, lol

Jeremiah
KD7DMP
