From: Luc Langehegermann <lx2gt@gmx.net>
Subject: Re: Problems to compile modem p3d
Date: Sat, 1 Feb 2003 15:29:03 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200302011529.03496.lx2gt@gmx.net>
References: <200301261711.54428.jonathan.naylor@ggaweb.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200301261711.54428.jonathan.naylor@ggaweb.ch>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: g4klx@qsl.net, Jonathan Naylor <jonathan.naylor@ggaweb.ch>, Linux Hams <linux-hams@vger.kernel.org>

Seems to work for me!

Thanks, Luc

On Sunday 26 January 2003 17:12, Jonathan Naylor wrote:
> Hi Luc et al
>
> I have a quick and dirty patch which generates warnings but allows the
> package to
> compile. I think there is a need for a 0.2 release as newer versions of
> GCC throw
> a lot of warnings when compiling it.
>
> --- diag.c.old  2003-01-26 16:47:22.000000000 +0100
> +++ diag.c      2003-01-26 16:49:01.000000000 +0100
> @@ -123,7 +123,7 @@
>         { 0, 0, 0, 0, },
>          0,
>          NULL, NULL, 0, 0,
> -        { }, { }, PTHREAD_COND_INITIALIZER, PTHREAD_MUTEX_INITIALIZER
> +        0, 0, PTHREAD_COND_INITIALIZER, PTHREAD_MUTEX_INITIALIZER
>  };
>
>  /*
> ----------------------------------------------------------------------
> */
>
> Jonathan  HB9DRD/G4KLX

