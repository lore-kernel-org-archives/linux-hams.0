From: John Mock <kd6pag@qsl.net>
Subject: PowerMac 8500 packet troubles
Date: Sat, 24 Jul 2004 12:25:14 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E1BoS8w-0006bB-00@penngrove.fdns.net>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I'm trying to get 9.6kb packet running either on a PowerMac 8500 (with
G3 upgrade) or Sony VAIO R505EL (P-III), preferably both.  I'm stuck on
either at the moment.  Here's the PowerMac problem.

The PowerMac 8500 has several audio inputs (as it's an AV machine).
Under MacOS 8.6, i can select the 'Mic', 'Line', or video (i think)
inputs.  The 'Mic' input has much too much gain and cannot be directly
connected to an HT.  [I would need to make a special cable up, as even
when i put attenuator on the HT end (as is needed for 9.6kb packet for
bthe Sony), there is full scale noise (hum?)  with the volume off.]  

Under MacOS, i can put the HT into the 'Line In' input and indeed, it
comes up with a reasonable level when monitoring is enabled.  I don't
have any MacOS packet code, so i can't verift that works, but there
seems to be no reason it won't.

Under LINUX, the same problem appears for the 'Mic' input.  Alas, the
'Line' input doesn't seem to do anything.  I made a vague attempt at
staring at the mixer-related parts of the driver in the kernel, but i
didn't see anything obviously wrong.  I'm running LINUX 2.4.21 (with
support added for a couple local I/O devices and using 'dmasound_pmac'
audio driver) and it also loses on a vanilla LINUX 2.6.7 [.config's
posted upon request].

1. Does anyone know how to make the 'LINE' input work under LINUX on the 
   PowerMac 8500?

2. If that seems impossible, does anyone have a suitable analog circuit to
   transform an HT's output into a level suitable for the 'Mic' input (and
   still be capable of 9.6kb packet)?

3. Will 9.6kb packet work at all in 'sound card' mode on a PowerMac 8500
   and a 9.6kb capable HT (Kenwood TH-F6A).

Thank you for your patience and assistance.

		         -- KD6PAG  (Networking Old-Timer, Satellite QRPer)


[Note: I never send unsolicited binary attachments and if you receive anything
purportedly from <kd6pag@qsl.net> that isn't signed with my callsign, then it
probably isn't from me.]
