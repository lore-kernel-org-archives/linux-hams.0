From: Joe Veldhuis <electrode@garandnet.net>
Subject: Re: soundmodem won't decode 300 baud signals?
Date: Sun, 06 Aug 2006 10:25:04 -0400
Message-ID: <44D5FBC0.7010504@garandnet.net>
References: <courier.44D13059.000019AF@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <courier.44D13059.000019AF@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

I tried tuning 100 Hz up and down in 10 Hz steps from what should have
put the bounds of the signal at 900 and 1100 Hz and was not able to
decode even 10db+S9 300 baud signals at any point.

I would speculate that soundmodem's decoder is unable to cope with the
background noise present in sideband mode, but it decodes both 300 and
1200 baud signals just fine through a microphone held up to the speaker
of another computer running the same software, and that's quite a bit
noisier than a strong sideband signal.

Anyone have any other ideas?

-Joe, KD8ATU

Dave Platt wrote:
> You might want to fiddle with your rig's RIT function, while
> trying to receive/demodulate an HF packet signal.  Adjust the
> tuning in increments of as small as you can - 10 Hz or so at
> a time - and see if there's a point at which the demodulator
> manages to lock onto the signal and give you a recognizable
> bitstream.
