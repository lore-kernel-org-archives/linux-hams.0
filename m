From: Kristoff Bonne <kristoff.bonne@skypro.be>
Subject: problem serial/USB stick and Xaster
Date: Tue, 10 Aug 2010 23:23:27 +0200
Message-ID: <4C61C34F.7050704@skypro.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Hi,

I do not know if this is the correct ML for this, so feel free to let me 
know if there is a better place for this.


For a ubuntu netbook (acer aspire one), I bought a cheap serial-to-USB 
stick (company = "digitus", lsusb says this: "Bus 003 Device 002: ID 
0403:6001 Future Technology Devices International, Ltd FT232 USB-Serial 
(UART) IC").

It shows itself as "/dev/ttyUSB0" on my box (ubuntu 10.06 netbook release).


However, I have a strange problem.
- When I use minicom to connect to my TNC2 using that USB device, all 
works OK "device = /dev/ttyUSB0, setting = 9600/7/E/1"

- However, when I try to use it with Xaster (APRS software) I get all 
kinds of rubbish on the input.

The packets input gives this:
  1:TNC-> 5SxECH=     ws OFF
  1:TNC-> c5d:BA
  1:TNC-> ON
  1:TNC-> ZWx>PEVERYjLxc5d:?    ad
  1:TNC-> c5d:ONen\KY>APUI+rJmN

The setting is exactly the same as when using minicom (which does work OK).


I tried this with another PC (HP laptop) which does have a normal 
serial-port (something that is becoming a rare :-) ), with ubuntu 10.06, 
I have the same problem:

- minicom works OK (both with the normal serial port and with the USB-stick)
- Xastir with the USB-stick gives rubish
- Xastir with normal serial port works OK.


Is anybody familiar with a "known issue" with Xastir about this?



Cheerio! Kr. Bonne.
