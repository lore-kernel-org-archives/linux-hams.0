From: Bob Nielsen <nielsen@oz.net>
Subject: Re: BayPac BP-1 Modem and Linux
Date: Fri, 20 Jul 2007 19:48:47 -0700
Message-ID: <A6FEE2F8-48F7-4994-8B3D-447C0DD66221@oz.net>
References: <0JLI003UK9USAD00@bgmpomr1.sasknet.sk.ca>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <0JLI003UK9USAD00@bgmpomr1.sasknet.sk.ca>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-hams@vger.kernel.org


On Jul 20, 2007, at 6:37 PM, Doug wrote:

> Is there anyway to connect a BayPac BP-1 modem to a linux system. I  
> seem to find drivers
> for only the epp and usb variety. I need a modem to check my port  
> configiration via the
> "LISTEN" command and I have run out unless I shut down the cluster  
> and the bbs.
> Fbb is not loaded onto the system just yet. This is a new system  
> (Mepis 6.5) and nothing
> else is loaded on to it yet except the ax25 stuff. The BP-1 is a  
> serial device.

My Ubuntu 7.04 stock kernel includes the baycom_ser_hdx.ko module.   
If this one isn't included with Mepis, you need to recompile the  
kernel and make sure the configuration file includes:

CONFIG_BAYCOM_SER_HDX=m (or y)

Bob, N7XY

