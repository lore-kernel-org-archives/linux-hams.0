From: SM3SGP <sm3sgp@kkn.net>
Subject: Baycom ser12, DCD, duplex(?) problem
Date: Tue, 4 Mar 2003 14:17:54 -0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200303041517.h24FHtC18390@c213-100-163-83.swipnet.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hej,

I am trying to get my Baycom serial 1200bd modem to work properly on my 
2.4-18 machine. (Redhat 7.2 (I think) 500Mhz)

I have configured an tested both the baycom_ser_hdx and fdx drivers, but same 
result.

The modem does not care if the channel is busy and transmit over other 
stations. Except from that, all seams to be OK. I have tesed with a lot of 
differnet setting, but so far the PTT goes on and the modem starts to 
transmit without waiting for a clear channel.

How I start the modem:

setserial /dev/ttyS0 uart none
modeprobe baycom_ser_fdx
sethdlc -p -i bcsf0 mode "ser12*" io 0x3f8 irq 4
sethdlc -i bcsf0 -a txd 300 txt 50 slot 100 ppersist 40 half

ifconfig bcsf0 hw ax25 sm3sgp up

Are there any more tests I can do? Anyone out there still running Baycom 
serial 1200bd modems and Linux?

73 de Gus, SM3SGP

sk3w.shacknet.nu 8000 Spider


