From: Rodolfo Brasnarof <rodob@datafull.com>
Subject: Re: setting input and output levels
Date: Thu, 23 Dec 2004 14:05:14 -0300
Message-ID: <20041223140514.1fe87063.rodob@datafull.com>
References: <41C4B097.5010205@telus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <41C4B097.5010205@telus.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: Gordon Croft <gordon.croft@telus.net>

On Sat, 18 Dec 2004 14:35:03 -0800
Gordon Croft wrote:

> OK, I've got a rather basic question, but I can't seem to find the
> answer...
> 
> How do I set the transmit and receive analog levels on the sound card
> to use it as a sound modem or is it possible?

I is possible, and many are doing this (me included).

> I'm using a sound blaster sound card it says 'SB 4.05 detected OK' in 
> dmsg.  I compiled sound modem support into the kernel (I think) and
> I'm using soundmodemconfig to set it up.

No. The soundmodemconfig utility is the configuration tool for userspace
soundmodem, not the kernel soundmodem module.

 I can copy the traffic on my
> radio through the sound card OK, although I have the output from the
> radio going into the 'mic' input on the sound card instead of the line
> input.  I've even got the PTT working (with some help from people on
> this list, thanks).

The line input should perform better. You need to select the recording
source from a mixer app.

> Now when I try to transmit the radio is keyed but I don't think I'm 
> transmitting anything and I got thinking, how can I adjust the
> transmit, or for that mater, the receive analog levels???

For adjusting the receive level, use the soundmodemconfig tool, which
has a calibration feature. Then adjust for best reception of all other
stations.

I adjust tx level just by ear. Try to make it sound similar to other
reference station (a well working tnc or something). Then if needed
adjust for others to have best reception of you.
