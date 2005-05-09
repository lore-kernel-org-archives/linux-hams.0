From: Niall Parker <niall@ve7hex.ampr.org>
Subject: Re: SIOCSIFFLAGS: Input/output error
Date: Sun, 08 May 2005 20:21:48 -0700
Message-ID: <427ED74C.2040300@ve7hex.ampr.org>
References: <200505072226.11233.phil@spiderweb.com.au> <1115575613.1246.6.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1115575613.1246.6.camel@oh2bns.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux-hams List <linux-hams@vger.kernel.org>

Tomi Manninen wrote:
> On Sat, 2005-05-07 at 15:26, Phil wrote:
> 
> 
>>I'm using a USB to serial converter which works without any problems with 
>>other serial devices, however, I get the error message shown on the subject 
>>line when I attempt to use my Baycom modem. This is the init script that I've 
>>used for years, but with /dev/ttyS0 instead of ttyUSB0:
>
 > [...]
 >
> I think it's pretty safe to say that you will *not* find a USB/serial
> converter that would work with the Baycom serial modem and its
> kernel driver.

Another option that might work better than a USB/serial convertor would 
be a serial PCMCIA interface, they are more likely to be compatible at a 
hardware level.

					... Niall

