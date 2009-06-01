From: Dave Platt <dplatt@radagast.org>
Subject: Re: /dev/dsp busy
Date: Sun, 31 May 2009 20:29:16 -0700
Message-ID: <4A234B0C.6010608@radagast.org>
References: <200906011059.15279.phillor@telstra.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200906011059.15279.phillor@telstra.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Phil <phillor@telstra.com>
Cc: linux-hams@vger.kernel.org

Phil wrote:
> Thank you for reading this.
> 
> I've recently upgraded to Mandriva 2009.1 and now none of my 
> Amateur Radio applications will run because /dev/dsp is busy. Yet, 
> "fuser -v dev/dsp" shows that nothing is using the resource.
> 
> I've disabled Pulse Audio in case that was a problem and I don't have 
> any sound applications sitting on the task bar. I had this problem four 
> years ago and that was due to a music player sitting on the task bar.
> 
> The driver in use is: "intel HDA (snd_hda_intel [ALSA])"
> 
> Can anyone offer any suggestions?

It's possible that something is using the ALSA sound
resource path (which is the baseline audio implementation
in modern Linux kernels - the old OSS sound drivers are
deprecated, and /dev/dsp is usually implemented as an ALSA
compatibility driver).

Try "lsof | grep dev/snd" to see what (if anything) is using
the ALSA sound pseudodevices.

Another possibility is that the problem isn't /dev/dsp itself...
rather, it may be that some resource needed by the kernel
to support the sound device is busy (e.g. IRQ or DMA conflict).
I wouldn't think that would be the case with the Intel HDA,
but it's possible that your motherboard BIOS has mapped it
onto the same IRQ which is being used by another device
whose driver doesn't know how to share.

