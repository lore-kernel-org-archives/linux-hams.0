From: Richard Adams <pa3gcu@zeelandnet.nl>
Subject: Re: trouble with ax25ipd
Date: Mon, 15 Apr 2002 19:01:38 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <02041519013800.03682@unix.pa3gcu>
References: <Pine.LNX.4.33.0204151837460.2097-100000@localhost.localdomain>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0204151837460.2097-100000@localhost.localdomain>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ricardo Saiz Villoria <ea1apm@amsat.org>, linux-hams <linux-hams@vger.kernel.org>

On Monday 15 April 2002 17:27, Ricardo Saiz Villoria wrote:
> Hello
>
> I'm trying to set up a link between a linux machine and another one
> running flexnet. The system is RedHat 7.2 with the following utilities
> installed:

> socket udp 93
> mode tnc
> beacon after 360
> btext ax25ip - PRUEBA
> device /dev/ptyp0
^^^^^^^^^^^^^^^

Should that not be /dev/ttyp0 ????
First one needs to open the master device then the slave device.

> Then I run kissattach:
>
> /usr/sbin/kissattach /dev/ptyp0 axip 44.133.36.1
> AX.25 port axip bound to device ax1
>
> And then /usr/sbin/ax25ipd
>
> ax25ipd Version 1.0.2 / 0.0.4
> Copyright 1991, Michael Westerhof, Sun Microsystems, Inc.
> This software may be freely used, distributed, or modified, providing
> this header is not removed
>
> Current configuration:
>
>   socket     udp on port 93
>   mode       tnc
>   device     /dev/ptyp0
>   speed      38400
>   beacon     after 360
>   btext      ax25ip - PRUEBA
>   loglevel   2
> 1 active routes.
>   EA1APM        192.168.1.6     udp     93      3
> 0 parameters
> opening tty device: Input/output error
>
> I've tried with different pipes, and the result is the same. Any help will
> be appreciated, I'm willing to make it work.
>
> Thanks in advance
>
> --
> Ricardo Saiz Villoria EA1APM
> AX.25:  ea1apm@ea1rkv.eapo.esp.eu
> WEB:    http://www.qsl.net/ea1apm
> E-MAIL: mailto:ea1apm@amsat.org
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

