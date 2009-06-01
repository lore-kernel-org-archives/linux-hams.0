From: Phil <phillor@telstra.com>
Subject: Re: /dev/dsp busy
Date: Mon, 1 Jun 2009 14:50:38 +1000
Message-ID: <200906011450.38388.phillor@telstra.com>
References: <200906011059.15279.phillor@telstra.com> <4A234B0C.6010608@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4A234B0C.6010608@radagast.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Monday 01 June 2009 13:29:16 Dave Platt wrote:
<cut>
>
> It's possible that something is using the ALSA sound
> resource path (which is the baseline audio implementation
> in modern Linux kernels - the old OSS sound drivers are
> deprecated, and /dev/dsp is usually implemented as an ALSA
> compatibility driver).
>
> Try "lsof | grep dev/snd" to see what (if anything) is using
> the ALSA sound pseudodevices.
>

Thanks for your prompt reply Dave.

The problem was Pulse Audio, as I suspected. It wasn't enough to just  
disable pulse audio in the sound settings, I had to kill the resulting PID.

Now another problem has surfaced; there is a ticking sound in the 
background of the transmitted sound. Again, this is a problem that I 
had previously encountered and the cure was to buy a different sound 
card. However, this option is not viable in the case of a laptop.

I don't know what effect this ticking sound will have on my transmitted  
signal (I've recently returned to Amateur Radio after a lengthy break 
and need to construct a suitable lead) but I'm sure that I can do without 
it.

Again, can anyone offer any suggestions?

-- 
Regards,
Phil
