From: Bob Morgan <wb5aoh@wb5aoh.dyndns.org>
Subject: soundmodem won't start
Date: Tue, 19 Oct 2004 18:46:46 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <16757.42855.133537.841067@halvor.tensleep.com>
Reply-To: wb5aoh@wb5aoh.dyndns.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>


I have been running ax25 on linux for years through kiss interface
tnc's, but am now getting serious about getting it working through
soundcards, so far just wasting a lot of time.

Config here is SB-Live cards on a few various P-II machines running 2.4
kernels, have ax25, mkiss, emu10k1, ac97_codec etc loaded.
Same problem on more than one similar setup machine.

As root, trying either the afsk modem or the psk modem in the config,
I get past the point of finding the serial port, and always end up
with the diagnostic:

sm[pid]: cannot start audio
[program exits]

Other soundcard apps such as xoscope, xanalyser, qsstv, gpsk31, ohphone run fine.

If I run soundmodem under control of strace, main seems to exit
right after the return of the routine that looks like it is
calling all of the soundcard ioctls, apparently successfully, although
I am recalling this from memory from diagnosing it earlier today.

I really wish there were some documentation to be had.  I just now
after a week of work discovered that soundmodemconfig has some working
scope and spectrum displays, and while soundmodem can't start up,
apparently soundmodemconfig can, and does display believable
waveforms and correct frequency spectra, the cursor displayed freq
does match the service monitor audio generator counter.

Can someone tell me where it is stuck?  I can probably post an strace
of what it is doing a little later if it will do any good.
While I am doing first tests with afsk 1200 to prove it can work,
I am really interested in the two psk modems to see how they perform.

73 de Bob WB5AOH

