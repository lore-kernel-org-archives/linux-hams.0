From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Trying to get Ax25 running.
Date: Fri, 15 Oct 2004 20:15:26 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1097860526.1293.7.camel@oh2bns.ampr.org>
References: <620c9057041013094421cbf279@mail.gmail.com>
	 <20041014025505.66938.qmail@web40824.mail.yahoo.com>
	 <620c9057041014060070eeccf6@mail.gmail.com>
	 <200410141313.i9EDDoah001022@yagi.h-net.msu.edu>
	 <620c9057041015095771b236e0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c9057041015095771b236e0@mail.gmail.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Fri, 2004-10-15 at 19:57, Chuck Hast wrote:

> I have used the AX25 config tool to configure this stuff. I am trying
> to set up things to run
> mkiss, but I can not quite figure out where to put the -c so that
> mkiss will use the crc check.

mkiss and mkiss are not the same... :)

The manual page you obviously have been reading, is for a user mode
tool that can be used to connect one or more kissattached kernel
interfaces to one serial port running one or more TNC's with
multidrop-kiss, crc-check etc. extended KISS modes.

The mkiss that you load with modprobe/insmod is a kernel module
that provides the kernel services that kissattach needs when you
make kernel KISS interfaces.

-- 
Tomi Manninen / OH2BNS / KP20ME04

