From: Dave Platt <dplatt@radagast.org>
Subject: Re: user soundmodem problems on Inspiron 8200 i810 chipset...
Date: Wed, 10 Mar 2004 11:58:20 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040310195820.19217.qmail@radagast.org>
References: <20040310193645.GA3882@braddock.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040310193645.GA3882@braddock.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: braddock@braddock.com
Cc: Linux-Hams@vger.kernel.org

> 
> The only strange thing about that theory (which I tend to agree
> probably is what's going on) is that if I do a 9600 samp/sec capture
> with SOX using the OSS interface, and look at the capture in Octave, I
> don't see the anomaly.  In fact, I can then take the 9600 samp/sec SOX
> capture of APRS input and use it with an unmodified version of
> soundmodem in "file" mode and get perfect copy.

My hunch is that the resampling problem may be triggered by the
way in which the soundmodem code specifies the number of DMA memory
buffers it wishes to use.  I've occasionally noticed problems in
applications (e.g. twpsk) which specify either very large, or
very small numbers of DMA buffer fragments, or very large or very
small fragment sizes.  OSS seems to try harder to guard against
ridiculously large or small fragment sizes or counts, while ALSA
seems to try harder to "do what the user says s/he wants".

It's possible that the fragment sizes or counts being
requested by the soundmodem code are resulting in the driver
running out of buffer space, or otherwise hitting a boundary
condition in its resampling code.

SOX probably doesn't try to specify DMA fragment sizes or
counts, allowing the driver defaults to apply, and these defaults
don't trigger the bug/limitation in the resampling code.

