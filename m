From: Dave Platt <dplatt@radagast.org>
Subject: Re: Clicking from sound card
Date: Wed, 14 Apr 2004 10:44:22 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040414174422.29765.qmail@radagast.org>
References: <200404131833.41119.phil@spiderweb.com.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200404131833.41119.phil@spiderweb.com.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

> I've had limited success with digital modes, such as PSK31, because of a 
> random clicking sound that's very noticeable. It almost sounds like a loose 
> connection, but it's not. The sound card, and PSK31, both work perfectly 
> under Microsoft's Windows.
> 
> I've tried two different Sound Blaster cards and both the OSS and Alsa 
> drivers. The clicking sound is faster with the Alsa driver. The drivers are 
> ES1371 and SND-ENS1371 respectively. I've disabled any services that I 
> thought might be interrupting the sound system but without any noticeable 
> effect.
> 
> The clicking can be heard behind system sounds as well (such as opening or 
> closing a window). MP3 files play without any clicking at all.
> 
> I'm currently operating under Mandrake 9.2 and I had the same clicking under 
> 9.1 so perhaps it's more likely a hardware issue.

The clicking sounds to me like lost data samples, or a data underrun
or overrun.  I can suggest a few areas for possible investigation.

[1] In the past, I've seen some bad interactions between the PCI
    busmastering capabilities of certain motherboard chipsets, and
    various versions of some of the ES137x sound chips.  In some
    cases there was no workaround (it was a low-level timing problem
    at chip reset time, with no way to avoid it other than swapping
    out the sound card for one with a different codec).  In others,
    it could be cured by playing with the BIOS settings for the
    PCI latency (the amount of time that one PCI card is permitted
    to hold the PCI bus busy during a single transaction).

[2] The ES137x busmaster cards do *not* seem to work well if one is
    running on an Athlon CPU, and has enabled the "keep it cool"
    bus disconnection feature (e.g. lxcool or similar).  The amount
    of interrupt latency, and the CPU cache flushing needed when the
    CPU wakes up from idle seem to exceed the ES137x buffering latency.

[3] Some misbehavior was reported recently with another sound chip
    (the onboard Intel 810 AC97 codec, I think) which had to do with
    sample-rate conversion.  Some sound cards are only capable of
    performing D/A or A/D conversions at one or two rates (typically
    44100 and/or 48000) and have to rate-convert the digital data
    for other sample rates.  There appears to be a glitch in the
    sample-rate conversion logic which is part of ALSA's OSS
    emulation for PCM devices, and it causes the sort of clicking
    noises you hear.

[4] Many of the Linux ham-radio sound programs issue an ioctl() call
    to set the size, and number, of DMA buffers to be used by the
    drivers.  This is (I think) done in order to gain control over
    the amount of transmit and receive latency introduced by the
    driver buffering.  I've found that the settings of the size and
    count values sometimes needs to be tweaked for proper operation...
    it can vary depending on which sound card you use, and also on
    whether you're using native OSS drivers or the OSS emulation
    drivers for ALSA.  [The ALSA drivers seem less tolerant of either
    very large or very small buffer counts.]

[5] You mention that the clicking can also be heard behind system
    sounds.  Are you by any chance running a desktop environment
    which has its own "sound daemon"?  If so, you might be running
    into a conflict between the sound daemon, and the PSK31 software...
    if they're both trying to use the sound driver at the same time
    they might be "fighting" over its settings.

