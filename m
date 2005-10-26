From: David Rivenburg <driven@onr.com>
Subject: Re: Soundmodem and sampling rate: force a rate?
Date: Wed, 26 Oct 2005 00:46:48 -0500
Message-ID: <435F1848.9060201@onr.com>
References: <435E3FAC.2080501@lightningflash.net>
Reply-To: driven@onr.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <435E3FAC.2080501@lightningflash.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "J. Lance Cotton" <joe@lightningflash.net>, linux-hams@vger.kernel.org

J. Lance Cotton wrote:
> I am trying to get soundmodem (usermode) working with a Soundblaster
> Live card on SuSE 9.3 and the commercial OSS driver.
> 
> The problem is that apparently the SB card supports only 8k, 11.025k,
> 12k, ... sampling rates. At 1200bps AFSK, soundmodem demodulator asks
> for (or gets) 9600Hz sampling rate.
> 
> Something, as far as I can tell, is opening the soundcard for recording 
> at 9600Hz sample rate, but I've been told that that rate isn't supported 
> by my SB Live card. I thought that in that instance, the "next closest" 
> rate would be returned instead...
> 
> I do not know if this is a problem with the Commercial OSS driver, the 
> SB Live card, or soundmodem. I've tried editing the soundcard/audioio.c 
> file to "force" other sample rates. It does open the card at the forced 
> rate, but the decoding still doe not work reliably. (The problem is 
> exemplified in the samples I recorded and put at 
> http://www.cmsworldwide.com/Files/soundsamples/index.html )
> 
> **Question: Is there any official way to have soundmodem request a 
> user-custom sampling rate? Like a hidden config?
> 
> Thanks. 73 KJ5O
> 


I came across a similar thing.  Looking at the soundmodemconfig scope 
function I saw horizontal lines in the waveform - this is clearly 
impossible for an AC coupled signal so I suspected that 9600 was not a 
valid sample rate for my audio codec.  Here is what I did to fix it:


in line 233 of soundcard/main.c change

unsigned int samplerate = 5000, mode;
to
unsigned int samplerate = 11025, mode;


then in line 710 of configapp/src/diag.c change

diagstate.samplerate = 5000;
to
diagstate.samplerate = 11025;


Even though the sample rate is set to 5000 there is a selection routine 
in audioio.c that steps it up to 9600.  I tried editing the valid sample 
rate list there but it still used 9600.

After making the above changes I have not had any trouble at all with 
soundmodem.  Not that there aren't any, but I don't know of another way 
to force a sample rate.

Hope this helps.

Dave
AD5OO
