From: Doug <appld@sasktel.net>
Subject: Re: BayPac BP-1 Modem and Linux
Date: Sat, 21 Jul 2007 10:09:23 -0600
Message-ID: <0JLJ00AFHE7WFX50@bgmpomr2.sasknet.sk.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

At 08:34 PM 20/07/2007, you wrote:
>Doug wrote:
>>Is there anyway to connect a BayPac BP-1 modem to a linux system. I 
>>seem to find drivers
>>for only the epp and usb variety. I need a modem to check my port 
>>configiration via the
>>"LISTEN" command and I have run out unless I shut down the cluster 
>>and the bbs.
>>Fbb is not loaded onto the system just yet. This is a new system 
>>(Mepis 6.5) and nothing
>>else is loaded on to it yet except the ax25 stuff. The BP-1 is a 
>>serial device.
>
>Do you have the kernel modules baycom_ser_fdx and/or baycom_ser_hdx 
>? Those should be the kernel modules for baycom serial-port devices 
>-- fdx is full duplex and should work for all but the stubborn UARTs.
>
>I don't have experience with the BP-1, but I have successfully 
>loaded the parallel-port PICPAR (Tiger BP-96 modem) with the kernel 
>module baycom_par
>
>-Lance KJ5O
>
>-----------------

Lance they do not appear to be in the depository for Mepis. I just 
don't want to start recompiling kernels and
I think possibly those two drivers might need some kernel work. But I 
will look for those and see what I have to
do. I have never used the BP-1 before but I just happened to have one 
on the shelf. This is my first attempt at
getting a packet system going on anything but a Red Hat package... 
With the depository, it looked so simple!!

Thanks very much,

Doug VE5DA



