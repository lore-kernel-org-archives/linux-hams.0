From: braddock@braddock.com
Subject: Re: user soundmodem problems on Inspiron 8200 i810 chipset...
Date: Wed, 10 Mar 2004 17:41:11 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040310234111.GA19788@braddock.com>
References: <20040310193645.GA3882@braddock.com> <20040310215616.19500.qmail@radagast.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040310215616.19500.qmail@radagast.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Platt <dplatt@radagast.org>
Cc: Linux-Hams@vger.kernel.org

On Wed, Mar 10, 2004 at 01:56:16PM -0800, Dave Platt wrote:
>  cat /proc/asound/card0/pcm0c/sub0/hw_params
> 
> If you can grab, and then post the results of this
> for the SOX and soundmodem situations, it might give

What a great little /proc tidbit.  

After looking at the hw_params stuff, I slightly modified my sox line
to capture 16-bit samples instead of 8-bit to better match soundmodem
(which captures in 16-bit).

sox -V -w -r 9600 -t ossdsp /dev/dsp -t wav -w -u -r 9600 /tmp/output6.wav

I recorded some APRS activity with this, then verified that soundmodem
in "file" mode would copy it from the captured wave file.  Worked
fine, I didn't see our anomaly.  I captured the /proc/../hw_params
data from this sox call, and from soundmodem (without my
sample rate hack), which showed the anomaly.  

The period/frame parameters vary by an order of magnitude between
them.  I don't know how to change these in sox, so I can't give a
better match (I'd LOVE to be able to reproduce the anomaly in sox so
we could file a reproducable bug report with the ALSA folks).

Here is /proc/../hw_params for the SOX call:
access: RW_INTERLEAVED
format: S16_LE
subformat: STD
channels: 2
rate: 48000 (48000/1)
period_size: 5115
buffer_size: 10230
tick_time: 10000
OSS format: S16_LE
OSS channels: 1
OSS rate: 9600
OSS period bytes: 2048
OSS periods: 2
OSS period frames: 5115

Here is /proc/../hw_params for soundmodemconfig in 1200 bps afsk scope mode:
access: RW_INTERLEAVED
format: S16_LE
subformat: STD
channels: 2
rate: 48000 (48000/1)
period_size: 639
buffer_size: 10224
tick_time: 10000
OSS format: S16_LE
OSS channels: 1
OSS rate: 9600
OSS period bytes: 256
OSS periods: 16
OSS period frames: 639

So, if someone tells me how to modify the period and buffer sizes in
soundmodem, I'll experiment and see if I can make the problem go away.

	-braddock


