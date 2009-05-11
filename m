From: Bill Shell <n6ws@n6ws.com>
Subject: USB Interface II & Linux
Date: Sun, 10 May 2009 21:14:11 -0700
Message-ID: <4A07A613.1060600@n6ws.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams Mailing list <linux-hams@vger.kernel.org>

All,

I've had some success in using the USB Interface II with my Acer Aspire 
One netbook with Ubuntu 9.04 using fldigi.  I'm still having a problem 
with initialization of the interface.  If I initialize it with the 
microHAM router from an instance of XP in a virtualbox, I'm able to then 
close down XP, start the fldigi app, and have successful communications 
to and through the interface.  If I try it without starting the microHAM 
router under XP it fails to pass data.  Without initialization, I can 
see the data going to the interface, but the interface doesn't respond 
and doesn't pass any data.  It looks as though some initialization needs 
to flow to the interface before it starts allowing communications with 
the radio.  Does anyone have any information on the initialization data 
for the USB Interface II?

Thanks in advance,
Bill
N6WS



