From: ariel mastracchio <ari197516@yahoo.com>
Subject: Re: Baycom ser12, DCD, duplex(?) problem (soundmodem too)
Date: Thu, 6 Mar 2003 06:22:13 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030306142213.96405.qmail@web9603.mail.yahoo.com>
References: <200303041517.h24FHtC18390@c213-100-163-83.swipnet.se>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200303041517.h24FHtC18390@c213-100-163-83.swipnet.se>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi!

   I have the same problem but with soundmodem. I have
put the led in the DCD parallel port, during a
transmision in the channel the led blink, dont keep on
during all the transmition, then the ptt go on and
transmit over the othe ham.... the packet and decoded
good.

This is a sound blaster+slakware 7.2+pentiun 100Mhz.

thanks to all...

-ari


--- SM3SGP <sm3sgp@kkn.net> wrote:
> Hej,
> 
> I am trying to get my Baycom serial 1200bd modem to
> work properly on my 
> 2.4-18 machine. (Redhat 7.2 (I think) 500Mhz)
> 
> I have configured an tested both the baycom_ser_hdx
> and fdx drivers, but same 
> result.
> 
> The modem does not care if the channel is busy and
> transmit over other 
> stations. Except from that, all seams to be OK. I
> have tesed with a lot of 
> differnet setting, but so far the PTT goes on and
> the modem starts to 
> transmit without waiting for a clear channel.
> 
> How I start the modem:
> 
> setserial /dev/ttyS0 uart none
> modeprobe baycom_ser_fdx
> sethdlc -p -i bcsf0 mode "ser12*" io 0x3f8 irq 4
> sethdlc -i bcsf0 -a txd 300 txt 50 slot 100 ppersist
> 40 half
> 
> ifconfig bcsf0 hw ax25 sm3sgp up
> 
> Are there any more tests I can do? Anyone out there
> still running Baycom 
> serial 1200bd modems and Linux?
> 
> 73 de Gus, SM3SGP
> 
> sk3w.shacknet.nu 8000 Spider
> 
> 
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
http://vger.kernel.org/majordomo-info.html


=====
amastr@mail.palermo.edu.ar
lu9aum@amsat.org
lu9aum@lu9aum.ampr.org

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - forms, calculators, tips, more
http://taxes.yahoo.com/
