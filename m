From: Luc Langehegermann <luc2@lx2gt.lu>
Subject: Re: gmfsk sound error
Date: Fri, 1 Apr 2005 12:57:06 +0200
Message-ID: <200504011257.06489.luc2@lx2gt.lu>
References: <200503291856.10875.phil@spiderweb.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200503291856.10875.phil@spiderweb.com.au>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phil <phil@spiderweb.com.au>
Cc: Linux Hams <linux-hams@vger.kernel.org>

> Hello,

Hello Phil,

>
> I recently installed Mandrake 10.1 on my Asus laptop and although almost
> everything works under Linux (except for the in-built wireless link and the
> in-built camera) none of the Amateur Radio applications that use the sound
> system work.
>
> This is the error message from gMFSK for instance:
> *** opensnd: open: /dev/dsp: Device or resource busy ***
>
> Is there a way to overcome this problem?

This sounds, as if there is another process using the sound device, probably 
an sound daemon (such as artsd)

To find it out, try the following as root: lsof |grep dsp

>
> Soundmodem doesn't produce an error message and appears to function except
> that no sound is generated.

Nevery had really success with soundmodem... Latency of the OSS alsa emulation 
seems too slow for soundmodem at 9k6. 1k2 works fine though.

73, Luc, LX2GT
