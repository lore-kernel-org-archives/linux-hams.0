From: David Ranch <linux-hams@trinnet.net>
Subject: Re: RaspberryPI and soundmodem PTT
Date: Wed, 25 Sep 2013 19:48:42 -0700
Message-ID: <5243A08A.9020607@trinnet.net>
References: <52428f657519e5.11288990@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <52428f657519e5.11288990@wp.pl>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>


Hello Waldek,

The RPi has one built-in serial port but in it's default mode, it only 
supports TX / RX and GND pins.  That won't help you for PTT. Now, what 
you can do is invoke one of the RPi's alternative I/O mappings and at 
that point, you have full access to the flow control pins (specifically 
RTS) that most people use for PTT.  Please note, the RPi is a 3.3v 
device with limited current so you'll probably need a level shifter to 
drive the PTT line on your radio.

    http://lavalink.com/2012/04/more-on-raspberry-pi-serial-ports/

Ps.   In addition to considering Soundmodem, have you heard of 
Direwolf?  http://home.comcast.net/~wb2osz/  This soundcard TNC supports 
is being actively developed, supports multiple parallel decoders for off 
frequency signals, supports multi-bit correction, etc.  None of those 
times is true of Soundmodem.  Oh yeah.. and it has RPi binaries!

--David



On 09/25/2013 12:23 AM, Waldek wrote:
>   Hi
>
> I have looking solution on RaspberryPI with soundmodem how to do PTT if I don't have in my radio VOX. When I have use soundmodem on my laptop with linux kernel 2.x ten years ago but driver soundmodem support PTT via RS-232 which working very well with my IC-W2A. But I don't know how to do this on RPI ?
>   It is need modify soundmodem driver to possible setting the gpio pin for PTT ?? Maybe exist patch for this ?
>   
>   73 Waldek sp2ong
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

