From: "Dave Platt" <dplatt@radagast.org>
Subject: Re: PowerMac 8500 packet troubles
Date: 24 Jul 2004 19:37:14 -0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040724193714.23424.qmail@radagast.org>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Mock <kd6pag@qsl.net>, linux-hams@vger.kernel.org

> I'm trying to get 9.6kb packet running either on a PowerMac 8500 (with
> G3 upgrade) or Sony VAIO R505EL (P-III), preferably both.  I'm stuck on
> either at the moment.  Here's the PowerMac problem.
> 
> The PowerMac 8500 has several audio inputs (as it's an AV machine).
> Under MacOS 8.6, i can select the 'Mic', 'Line', or video (i think)
> inputs.  The 'Mic' input has much too much gain and cannot be directly
> connected to an HT.  [I would need to make a special cable up, as even
> when i put attenuator on the HT end (as is needed for 9.6kb packet for
> bthe Sony), there is full scale noise (hum?)  with the volume off.]  

If it's hum, this suggests to me that you've got a ground loop between
the Mac and the radio.  It's often necessary to use an audio interface
which has transformer isolation for both audio paths, and
opto-isolation for the PTT path, to break this ground loop and
eliminate the hum.  The RigBlaster Nomic, the Buxcomm RASCAL, and any
number of junkbox/homebrew designs can do the trick.

> Under MacOS, i can put the HT into the 'Line In' input and indeed, it
> comes up with a reasonable level when monitoring is enabled.  I don't
> have any MacOS packet code, so i can't verift that works, but there
> seems to be no reason it won't.
> 
> Under LINUX, the same problem appears for the 'Mic' input.  Alas, the
> 'Line' input doesn't seem to do anything.

That's unfortunate.  Using a MIC input to the Mac or PC is really a
last-choice alternative, in my experience... you have to throw away a
bunch of the signal with an attenuator, just so that the MIC input can
gain-boost it back up.  Added noise is almost inevitable.

> 2. If that seems impossible, does anyone have a suitable analog circuit to
>    transform an HT's output into a level suitable for the 'Mic' input (and
>    still be capable of 9.6kb packet)?

If you know the audio levels, you can use a simple two-resistor pad to
attenuate the level.  I'd start with a 10k0 resistor in series with
the audio signal, and then try various resistors shunted between the
Mac side of this resistor and ground.  A 1k0 shunt resistor would give
you an 11:1 voltage ratio, or a bit more than 20 dB of attenuation.

You could also try a 4k7 or 10k0 audio-taper potentiometer, to allow
for easier adjustment.  Radio Shack probably has 'em.  

> 3. Will 9.6kb packet work at all in 'sound card' mode on a PowerMac 8500
>    and a 9.6kb capable HT (Kenwood TH-F6A).


