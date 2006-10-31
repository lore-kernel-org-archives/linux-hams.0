From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: gmfsk
Date: Tue, 31 Oct 2006 12:26:04 +1100
Message-ID: <20061031012604.GB6698@cloud.net.au>
References: <20061030233413.GA2108@cloud.net.au> <courier.45468D24.00003D73@radagast.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <courier.45468D24.00003D73@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, Oct 30, 2006 at 03:39:16PM -0800, Dave Platt wrote:
> There are a number of ways around this sort of problem.  The
> simplest is to disable the desktop (e.g. KDE or Gnome) sound
> feature entirely, so that it never opens the audio driver.

Good idea. Richard's run lsof and not found anything else using
/dev/dsp, but maybe the sound server is using the ALSA device directly
and that's preventing playback on /dev/dsp.

> This is probably the best approach to use if you're going
> to be using the sound card for ham radio purposes, since
> transmitting UI feedback sounds over the air would be Bad.

A good reason not to use VOX..

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
