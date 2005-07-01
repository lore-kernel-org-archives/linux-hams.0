From: Jonathan Lassoff <jlassoff@gmail.com>
Subject: Re: Soundmodem Not Decoding Real Packets
Date: Fri, 1 Jul 2005 23:56:54 +0000 (UTC)
Message-ID: <loom.20050702T015133-109@post.gmane.org>
References: <loom.20050701T095736-780@post.gmane.org> <20050701184203.2013.qmail@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Dave Platt <dplatt <at> radagast.org> writes:

> In my experience, the user-mode soundmodem code does a very fine job of
> decoding AX.25 packets, and it does so even if the radio is operated
> "open squelch".  In fact, in many areas it is a preferred practice for
> packet nodes to be run with the receive squelch open - this allows
> the TNC or other modem to synchronize very rapidly at the beginning
> of each packet, without a long wait for the radio to detect carrier
> energy and open its squelch.  This, then, allows the nodes in the
> area to use a shorter beginning-of-packet synchronization burst, and
> increase the useful data throughput of the packet channel.
> [...]
> In your situation, I'd look at several things:
> 
> -  Audio levels, as you suggest.  Take a look at the audio coming
>    out of your radio when it's receiving a clean packet - use
>    an oscilloscope.  Check for clipping (a "flat-top" appearance)
>    in the waveform.  If you see it, turn the radio's audio-output
>    control down until it goes away.
> [...]
> Also, check the quality of the signal from the sending station.  It's
> not unusual for TNCs or soundmodems or audio interfaces or radios to
> be misadjusted, causing any of several problems:
> [...]
> My own guess is that that Thomas Sailer's soundmodem code is not
> the cause of your problem.  I've found it to be quite good indeed
> at receiving packet.

I did find out that the audio output from my radio was a bit high.
I don't have an oscilloscope to play with, so I just used audacity to see the
audio while recording it. I trimmed it down so that everything is there. I'm
still having the same problem though. I have also been trying to decode packets
off of APRS here in California on 144.390 to no avail. I also tried the decoding
process with squelch open. I'm not really sure what is going on here. I also
tried twiddling with the audio levels on my input channel in a mixer program.
Any crafty diagnostic ideas?

Jonathan (KG6THI)

