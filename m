From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: SIOCSIFFLAGS: Input/output error
Date: Sun, 08 May 2005 21:06:53 +0300
Message-ID: <1115575613.1246.6.camel@oh2bns.ampr.org>
References: <200505072226.11233.phil@spiderweb.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200505072226.11233.phil@spiderweb.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Sat, 2005-05-07 at 15:26, Phil wrote:

> I'm using a USB to serial converter which works without any problems with 
> other serial devices, however, I get the error message shown on the subject 
> line when I attempt to use my Baycom modem. This is the init script that I've 
> used for years, but with /dev/ttyS0 instead of ttyUSB0:

Baycom serial is not a serial device. It uses the serial port in a very 
non-standard way to do "clever" bit banging and emulate synchronous 
serial communication. That is why it only works with ports that are 
100% hardware compatible with the standard PC UART (8250, 16450, 16550).

I think it's pretty safe to say that you will *not* find a USB/serial
converter that would work with the Baycom serial modem and its
kernel driver.

-- 
Tomi Manninen / OH2BNS / KP20JF74

