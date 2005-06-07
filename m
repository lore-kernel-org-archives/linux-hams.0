From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Re: kissattach and kernel 2.6
Date: Tue, 7 Jun 2005 18:05:42 +1200
Message-ID: <200506071805.42869.w.knol@niwa.co.nz>
References: <32946.83.73.68.20.1117910443.squirrel@www.amsat.dk>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <32946.83.73.68.20.1117910443.squirrel@www.amsat.dk>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


> What I have is this: My distribution is SUSE 9.2 with a 2.6.8
> kernel. The AX.25 tools are version 0.0.8 and the AX.25-apps are
> 0.0.6. My modem is a DSP-12 in kiss mode attached to /dev/ttyS0. My
> PC has a Pentium 4 and I normally run a SMP version, but since I
> learned that e.g. mkiss doesn't work with SMP, I use a mono-CPU
> version ('default' in SUSE terms). I can configue an ax0 interface
> with kissattach ('kissattach -l /dev/ttyS0 asy 44.145.40.3'), but I
> can't get listen to display any packets, in fact 'ifconfig' doesn't
> show any packets received.

This is probably not of much help...but AX.25 works perfectly with 
kernel 2.6.3-7mdk (Mandrake 10.0 Community), tested only with the 
serial full-duplex 1k2 baycom driver . It is rock-solid and goes for 
months. I should mention I don't use NET/ROM.

I am contemplating an upgrade to Debian 3.1 in a week or so...I guess 
I will find out whether AX.25 support is broken post- 2.6.3 ...

Wilbert, ZL2BSJ
