From: Phil <phil@spiderweb.com.au>
Subject: Re: gmfsk sound error
Date: Sat, 2 Apr 2005 18:16:17 +1000
Message-ID: <200504021816.17341.phil@spiderweb.com.au>
References: <200503291856.10875.phil@spiderweb.com.au> <200504011257.06489.luc2@lx2gt.lu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200504011257.06489.luc2@lx2gt.lu>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>

On Fri, 1 Apr 2005 08:57 pm, Luc Langehegermann wrote:
> > Hello,
>
> Hello Phil,
>
> > I recently installed Mandrake 10.1 on my Asus laptop and although almost
> > everything works under Linux (except for the in-built wireless link and
> > the in-built camera) none of the Amateur Radio applications that use the
> > sound system work.
> >
> > This is the error message from gMFSK for instance:
> > *** opensnd: open: /dev/dsp: Device or resource busy ***
> >
> > Is there a way to overcome this problem?
>
> This sounds, as if there is another process using the sound device,
> probably an sound daemon (such as artsd)
>
> To find it out, try the following as root: lsof |grep dsp
>

Thanks for the reply Luc.

The above command doesn't list any processes at all, so it looks like no 
others are sharing thesound system. Also, I had stopped any services that I 
thought might be related to the sound system but without any noticeable 
effect; I still get the same error message.

Does anyone else use gMFSK under Mandrake 10.1 on a laptop?

-- 
Regards,
Phil.
