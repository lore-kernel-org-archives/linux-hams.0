From: brownh@hartford-hwp.com (Haines Brown)
Subject: struggling with gMFSK setup
Date: Sun, 29 Oct 2006 15:50:46 -0500 (EST)
Message-ID: <20061029205046.947DA11F4@teufel.hartford-hwp.com>
Reply-To: "H.Haines Brown" <brownh@hartford-hwp.com>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Despite some generous help, I'm not doing well setting levels for
transmit from my FT-817. I am using a SignaLink interface and am
following the suggestions that came with it. 

When I set gMFSK to Transmit/Tune, I hear a tone. Although neither my
Master volume nor PCM volume are muted, increasing the playback levels
should turn on the SignaLink PTT LED, but that never
happens. Reception is fine. 

I can't use their test for the soundcard because my card does not
support full-duplex. Also, gMFSK says it does not support full duplex
in/out.  

What I'd like to ask about here are my gMFSK preferences. 

Under Devices, Sound, 

      Sound card device: /dev/dsp
      Requested sample rate: 8000 (default) 
      Tx rate offset (ppm): 0 (default)
      Rx rate offset (ppm): 0 

I checked 8-bit sound in/out, and left stereo and full duplex
unchecked.  

Under Devices, PTT, for device I use /dev/ttyS0, and for PTT line
(serial), I have both RTS and DTR checked. I leave unchecked the Use
inverted PTT logic.

Part of my problem is that I have little or no idea how to make these
choices. 
-- 
 
       Haines Brown, KB1GRM
        
	 
        
