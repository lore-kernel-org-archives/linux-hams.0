From: Dave Platt <dplatt@radagast.org>
Subject: Re: user soundmodem problems on Inspiron 8200 i810 chipset...
Date: Wed, 10 Mar 2004 13:56:16 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040310215616.19500.qmail@radagast.org>
References: <20040310193645.GA3882@braddock.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040310193645.GA3882@braddock.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: braddock@braddock.com
Cc: Linux-Hams@vger.kernel.org

> The only strange thing about that theory (which I tend to agree
> probably is what's going on) is that if I do a 9600 samp/sec capture
> with SOX using the OSS interface, and look at the capture in Octave, I
> don't see the anomaly.  In fact, I can then take the 9600 samp/sec SOX
> capture of APRS input and use it with an unmodified version of
> soundmodem in "file" mode and get perfect copy.

It might be interesting to look and see what sorts of capture
parameters are actually being set up in the driver by each
of these two cases.

To do this, start a capture (either a SOX recording, or
run soundmodemconfig and open up the diagnostic scope),
and then try:

 cat /proc/asound/card0/pcm0c/sub0/hw_params

On my system (running the 1.0.2c ALSA drivers), this
shows a bunch of interesting information, including the
sample format. number of channels, native capture rate
(both as an integer, and as a numerator/denominator ratio
which I imagine is based on the hardware clock rate and
a divisor), buffer and period size, and processing tick
time.  It then provides much the same information for
the OSS compatibility layer.

If you can grab, and then post the results of this
for the SOX and soundmodem situations, it might give
further information about what might be making the
resampler go kerSPRUNG.
