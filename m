From: Lance Cotton <joe@lightningflash.net>
Subject: Re: BayPac BP-1 Modem and Linux
Date: Fri, 20 Jul 2007 21:34:27 -0500
Message-ID: <46A170B3.60302@lightningflash.net>
References: <0JLI003UK9USAD00@bgmpomr1.sasknet.sk.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <0JLI003UK9USAD00@bgmpomr1.sasknet.sk.ca>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Doug <appld@sasktel.net>
Cc: linux-hams@vger.kernel.org

Doug wrote:
> Is there anyway to connect a BayPac BP-1 modem to a linux system. I seem 
> to find drivers
> for only the epp and usb variety. I need a modem to check my port 
> configiration via the
> "LISTEN" command and I have run out unless I shut down the cluster and 
> the bbs.
> Fbb is not loaded onto the system just yet. This is a new system (Mepis 
> 6.5) and nothing
> else is loaded on to it yet except the ax25 stuff. The BP-1 is a serial 
> device.

Do you have the kernel modules baycom_ser_fdx and/or baycom_ser_hdx ? 
Those should be the kernel modules for baycom serial-port devices -- fdx 
is full duplex and should work for all but the stubborn UARTs.

I don't have experience with the BP-1, but I have successfully loaded 
the parallel-port PICPAR (Tiger BP-96 modem) with the kernel module 
baycom_par

-Lance KJ5O

