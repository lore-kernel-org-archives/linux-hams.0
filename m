From: brownh@hartford-hwp.com (Haines Brown)
Subject: ALSA audio levels for digital modes
Date: Thu, 26 Oct 2006 15:52:53 -0400 (EDT)
Message-ID: <20061026195253.D58AC990@teufel.hartford-hwp.com>
Reply-To: "H.Haines Brown" <brownh@hartford-hwp.com>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Directions for tuning audio levels for digital modes seem to have
little relation with my alsamixer options. I have no experience with
ham radio. 

I can receive signals on 20 meters PSK31 with my Audigy sound card,
SignaLink interface, and FT-817 transceiver. I plug the received
signal from the SignaLink into the Audigy's Mike input and adjust the
Capture Make to get a decent waterfall with signals. 

However, I find that Playback Mike +20 dB boost has a big effect on the
waterfall. How can Playback Mike level affect the level of signal
input? "Playback" sound like it refers to signal output. 

To tune for transmit, I've attached a dummy load to my FT-817 and
turn transmit power to a minimum (0.5W). 

To configure transmit volume level, I'm told to mute the Playback
Mike. I can set the Playback Mike gain to zero, but there's no "mute"
for the Playback Mike. To configure transmission, should I also cut
out the +20 dB playback boost?

The directions say to set Playback Master Volume to about 75%, and
make sure "Wave Volume" is not muted. What is the equivalent of "wave
volume" in ALSA? Regardless of what Playback control I increase, I the
PTT LED never goes on.

Next, I am supposed to set my digital software to "Tune". My gMFSK
does not have a tune, but I can change it to transmit mode. Is this
the same thing? I suspect so, but wanted to be sure. 

Next, I am supposed to advance my "Wave Volume" control until
SignaLink's PTT LED goes on. However, no Playback control that I
advance seems to have this effect.

Haines Brown KB1GRM
 
