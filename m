From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: gmfsk
Date: Mon, 30 Oct 2006 08:31:57 +1100
Message-ID: <20061029213157.GA25286@cloud.net.au>
References: <4544D1A7.3010103@blueyonder.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4544D1A7.3010103@blueyonder.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sun, Oct 29, 2006 at 04:07:03PM +0000, richard wrote:
> Cant seem to get audio routed to GMFSK , it compiled OK as far as I 
> know, no errors .
> In settings , selecting device /dev/dsp  /dev/dsp1 /dev/dsp2 doesn't 
> route audio to the program.
> I've determined that /dev/dsp2 is the mic input off the webcam, so that 
> can be ignored.

Is /dev/dsp actually the ALSA emulation, ie you are using ALSA natively?
Can you send the results of "aplay -l" so we can see how ALSA has
detected your devices?

> There never seems to be any input directed  from /dev/dsp, bur /dev/dsp1 
> has an input even when everything has been muted.
> I've had problems trying to get the sound from the TV card which is hard 
> wired to AUX i/p on the mobo to route through the digital mixer
> to get routed out of the delta 66 breakout box to a diddy little hifi 
> system in the shack. So I'm aware that the two cards don't talk to each 
> other very well.

There's no way that sound can get from one card to the other via the
mixer alone. Either you need a cable from a line-out to a line-in, or
you need a program to copy samples from one card to the other. I think
this is irrelevant to your use of gMFSK though.

> Is this behaviour I'm seeing on GMFSK normal , ie displaying garbage on 
> /dev/dsp1  ??

Not sure what you mean by garbage?

> Yet I can run winrad using wine to use the delta66 card as the input and 
> the VIA 8253 as the output device

Is that the configuration you want? I don't think there is any support
in gMFSK for input and output on different devices. Your setup sounds
unusual (perhaps unusually complicated?).

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
