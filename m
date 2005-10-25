From: "J. Lance Cotton" <joe@lightningflash.net>
Subject: Soundmodem and sampling rate: force a rate?
Date: Tue, 25 Oct 2005 09:22:36 -0500
Message-ID: <435E3FAC.2080501@lightningflash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

I am trying to get soundmodem (usermode) working with a Soundblaster
Live card on SuSE 9.3 and the commercial OSS driver.

The problem is that apparently the SB card supports only 8k, 11.025k,
12k, ... sampling rates. At 1200bps AFSK, soundmodem demodulator asks
for (or gets) 9600Hz sampling rate.

Something, as far as I can tell, is opening the soundcard for recording at 
9600Hz sample rate, but I've been told that that rate isn't supported by my 
SB Live card. I thought that in that instance, the "next closest" rate would 
be returned instead...

I do not know if this is a problem with the Commercial OSS driver, the SB 
Live card, or soundmodem. I've tried editing the soundcard/audioio.c file to 
"force" other sample rates. It does open the card at the forced rate, but 
the decoding still doe not work reliably. (The problem is exemplified in the 
samples I recorded and put at 
http://www.cmsworldwide.com/Files/soundsamples/index.html )

**Question: Is there any official way to have soundmodem request a 
user-custom sampling rate? Like a hidden config?

Thanks. 73 KJ5O

-- 
J. Lance Cotton, KJ5O
joe@lightningflash.net
http://kj5o.lightningflash.net
Three Step Plan: 1. Take over the world. 2. Get a lot of cookies. 3. Eat
the cookies.

