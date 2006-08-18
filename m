From: "Michel Beaudry" <ve2bcw@gmail.com>
Subject: Re: gMFSK Ptt
Date: Fri, 18 Aug 2006 09:39:39 -0400
Message-ID: <c17fc8440608180639v3dc3e2d0ta739f6a06accc8b2@mail.gmail.com>
References: <c17fc8440608161756x5342651fsacc241dce6c78601@mail.gmail.com>
	 <44E41569.9070801@bfs.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <44E41569.9070801@bfs.de>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Thanks for the reply Walter,

The lp module is not loaded, I tried load and unload the parport
module but always with the same results.
I re-installed the original version of gmfsk and it works fine with
the parallel port.
Must be something with  gmfsk.hkj.51 or the way i compiled it.

73,
Michel
ve2bcw

> hi michel,
> no idea what the problem is but there is a problem
> when you load the lp and parport module.
> perhaps if you 'rmmod lp' you have a better change.
>
> re,
>   wh
>
>
> Michel Beaudry wrote:
> > Hi all,
> >
> > I installed and compiled gmfsk.hkj.51 on Debian testing.
> > The program works ok except for the parallel port ptt
> >
> > I now get the error message device parport0 is not a serial port.
> >
> > Before I was using gmfsk-0.7pre1 on the same machine and the parallel
> > port worked fine.
> > I use the serial port for hamlib.
> >
> > What am I missing to get the parallel port working ?
> >
> > thanks,
> > Michel
> > ve2bcw
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >
>
