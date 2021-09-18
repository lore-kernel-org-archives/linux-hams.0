From: David Ranch <linux-hams@trinnet.net>
Subject: Re: unknown kiss packet: 0x80 0x9e
Date: Sat, 18 Sep 2021 09:58:04 -0700
Message-ID: <3be878a4-d1ef-1179-cf53-bed047c23a99@trinnet.net>
References: <654f3a4d-6420-4fba-e6d9-5693a67f6459@blackspace.at>
 <47ff7a73-dbe7-fcf3-f99f-36e63d709520@trinnet.net>
 <0ef34530-6a91-c3e2-4f52-18eb3546eeff@blackspace.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <0ef34530-6a91-c3e2-4f52-18eb3546eeff@blackspace.at>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Hello Roland,


> I tried it and have to agree, that it really performs well and it has
> the FX25 implementation, however it lacks features I'd like to use i.e.
> multibaud mode.

Ok.. the choice is yours but when you're only getting about a 60% decode 
rate compared to Direwolf, you're loosing a lot of packets on a single 
baud rate let alone multiple.


>> or even G8BPQ's port of UZ7HO's "soundmodem" will offer better
>> decoding rates, stability, etc.
>
> Did'nt hear about this modem. Can you put me a pointer pls?

Please search for "UZ7HO soundmodem" and it will come right up.  It's a 
Windows only program written in Delphi but it's written and tested to 
work with WINE.


As a correction, G8BPQ's TNCPi9k6's Teensy TNC doesn't use UZ7HO's 
soundmodem code but instead, he ported Thomas Sailer's soundmodem code 
his TNCPi9k6 hardware TNC.

https://www.cantab.net/users/john.wiseman/Documents/TeensyTNC.txt


> Btw.: What I like about soundmodem is it clean design and good
> integration into the linux stack. Using direwolf needs a little more
> "hacking" to use it as a TNC for the linux stack. But of course it does
> work.

I started with Thomas Sailer's soundmodem softTNC and Linux and now use 
WB2OSZ's Direwolf.  Setting up both soft-tncs is a bit different but I 
wouldn't say that one is more difficult than the other.  If you'd like 
to see some examples, I have an Rpi-centric document here:

    https://www.trinityos.com/HAM/CentosDigitalModes/RPi/rpi4-setup.html

--David
KI6ZHD
