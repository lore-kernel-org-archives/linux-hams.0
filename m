From: WJuergens@t-online.de (Wolf-Ruediger Juergens)
Subject: Re: ANN: gMFSK v0.6beta1
Date: Sun, 26 Oct 2003 11:12:56 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200310261112.57045.wjuergens@t-online.de>
References: <1067119345.1305.73.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1067119345.1305.73.camel@oh2bns.ampr.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi Tomi, all,

Tomi Manninen wrote:
> I have just made available the first beta of gMFSK version 0.6.

Many thanks for your this fantastic program.
I've downloaded the tarball and it compiled flawless under Suse 9.0.
It's running seamless on the KDE Desktop.

>  - Feldhell TX works. Full international character set support.

That's the best news at least for me ;-)
Only one glitch, changing the feldhell font, I have to restart the program 
to use the selected font. 

>  - The FFT library (FFTW) now uses "wisdom" to optimize CPU consumption.
>    User will notice that the first time a modem is used, there will be
>    a few seconds delay.

The decoding of PSK is much better now (less bogus chars) than with KPSK.

I'm using the nice logging program jLog from LA3HM, but it has of course no 
support for the logging feature of gmfsk. So I will program some java 
classes to support the IPC logging feature. Maybe he can use the classes 
and integrate them in jLog. 

Thanks again for your work, Tomi.

73 Wolf, DL2WRJ
-- 
Old programmers never die.  They just branch to a new address.
(/usr/games/fortunes)
