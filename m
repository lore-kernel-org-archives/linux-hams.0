From: Dave Platt <dplatt@radagast.org>
Subject: Re: Xastir Development Snapshot + Soundmodem/AX.25 HOWTO's
Date: Thu, 21 May 2009 10:47:13 -0700
Message-ID: <4A1593A1.4000806@radagast.org>
References: <alpine.LNX.2.00.0905210902280.12303@wapiti.we7u.net> <4A1585AA.5000300@columbia.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4A1585AA.5000300@columbia.edu>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alan Crosswell <alan@columbia.edu>
Cc: "Curt, WE7U" <archer@eskimo.com>, linux-hams@vger.kernel.org, linux-hams-using-ax25@yahoogroups.com


> Somewhat OT: but has anyone successfully used a USB sound "card" with
> soundmodem?

I've been able to make a soundmodem 1200-baud connection using a
SignaLink USB (setting the soundmodem PTT to /dev/null, since
the SignaLink USB has its own vox-driven PTT circuit).

Some tricks:

-  If possible, use the direct ALSA "hw:" interface, and set
    the soundmodem's sample rate equal to one of the "native"
    rates supported by your USB sound card.  This ensures that
    no DSP- or CPU-based sample rate conversion needs to be
    done.

-  With some USB sound cards this may not be possible... there
    are those which have *different* sample rate sets for input
    and output, and might not even have a single rate in common
    which works in both directions.  In this case, specify the
    ALSA "plughw:" interface, so that ALSA's sample-rate conversion
    plugin does the necessary rate conversions... it seems to work
    quite well.

-  Do *not* use the OSS compatibility driver for ALSA (e.g.
    the /dev/dsp interface).  Although this driver does
    attempt to perform sample-rate conversion, it doesn't do
    so at all well... I've seen periodic dropouts in the
    incoming data (sequences of sample values of zero) whenever
    the buffer wraps around.  This really mucks up digital
    modes!

-  Make sure you've got the most recent version of the
    soundmodem code (it looks as if it's up to version
    0.13).  There were some important patches to ALSA
    support a few months ago, which eliminate a bunch of
    errors and freezes during TX/RX switching... versions
    0.10 and earlier did not work well with ALSA USB.



