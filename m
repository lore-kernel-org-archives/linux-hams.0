From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: struggling with gMFSK setup
Date: Sun, 29 Oct 2006 23:52:00 +0200
Message-ID: <1162158720.30446.16.camel@oh2bns.ampr.org>
References: <20061029205046.947DA11F4@teufel.hartford-hwp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20061029205046.947DA11F4@teufel.hartford-hwp.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "H.Haines Brown" <brownh@hartford-hwp.com>
Cc: linux-hams@vger.kernel.org

On Sun, 2006-10-29 at 15:50 -0500, Haines Brown wrote:

> Despite some generous help, I'm not doing well setting levels for
> transmit from my FT-817. I am using a SignaLink interface and am
> following the suggestions that came with it. 

I don't know signalink but it seems it's based on some sort of VOX 
(voice operated relay/transmit) to operate PTT (not a good idea if you
ask me btw).

> When I set gMFSK to Transmit/Tune, I hear a tone. Although neither my
> Master volume nor PCM volume are muted, increasing the playback levels
> should turn on the SignaLink PTT LED, but that never
> happens. Reception is fine. 

If you hear a tone, then gMFSK should be ok. Now you have to figure
out why your signalink doesn't "hear the tone", ie. why doesn't it
trigger PTT for you.

> Under Devices, Sound, 
> 
>       Sound card device: /dev/dsp
>       Requested sample rate: 8000 (default) 
>       Tx rate offset (ppm): 0 (default)
>       Rx rate offset (ppm): 0 
> 
> I checked 8-bit sound in/out, and left stereo and full duplex
> unchecked.  

8-bit sound should not be needed for any modern hardware. If you
don't get any errors then don't check that. (It's a good idea to 
start gMFSK from a command line, ie. type "gmfsk" to an xterm or
equivalent. That way you see if it gives any warning messages etc.)

> Under Devices, PTT, for device I use /dev/ttyS0, and for PTT line
> (serial), I have both RTS and DTR checked. I leave unchecked the Use
> inverted PTT logic.

PTT settings in gMFSK should not be relevant to you as your interface
relies on VOX for PTT. Just set PTT device to "none".

-- 
Tomi Manninen / OH2BNS / KP20JF74


