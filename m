From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Re: gmfsk sound error
Date: Mon, 4 Apr 2005 09:14:37 +1200
Message-ID: <200504040914.38819.w.knol@niwa.co.nz>
References: <200503291856.10875.phil@spiderweb.com.au> <200504011257.06489.luc2@lx2gt.lu> <200504021816.17341.phil@spiderweb.com.au>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200504021816.17341.phil@spiderweb.com.au>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>


> > > This is the error message from gMFSK for instance:
> > > *** opensnd: open: /dev/dsp: Device or resource busy ***
<snip>
> > This sounds, as if there is another process using the sound
> > device, probably an sound daemon (such as artsd)
> >
> > To find it out, try the following as root: lsof |grep dsp
<snip>
> The above command doesn't list any processes at all, so it looks
> like no others are sharing thesound system. Also, I had stopped any
> services that I thought might be related to the sound system but
> without any noticeable effect; I still get the same error message.

You must have missed something. Some sound servers release the sound 
system after n seconds of idle time.

Suggest you run up a bare-bones desktop without a sound server, e.g. 
iceWM. Try re-starting the sound sytem: 

su -c "service sound restart"

> Does anyone else use gMFSK under Mandrake 10.1 on a laptop?

Mdk 10.0 with an Asus A2D notebook. I've never had any hassles with 
gMFSK.


Wilbert.

