From: "Dave Platt" <dplatt@radagast.org>
Subject: Re: ANN: mt63lx version 0.5
Date: 15 Jul 2004 05:26:13 -0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040715052613.28621.qmail@radagast.org>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: chuck@gelm.net, Linux-hams List <linux-hams@vger.kernel.org>
Cc: Dave Platt <dplatt@radagast.org>

> Dave:
> 
>   You make no mention of 'MT63' in your response.
> 
> I have a BuxComm GL?-V which copies PSK31 and other emissions,
> although I have yet to have had anyone acknowledge my
> transmission attempts.  I assume that this device will
> provide acceptable voltages to my SSB rig (Kenwood TS-50).
> This device and the accompanying software seems to receive
> fine on a 266 MHz Pentium II computer.  I assume that the
> CPU speed is less important in transmiting than it is in
> receiving.

In my experience, CPU load during transmitting is usually equal to, or
some moderate amount less than the load during receiving.  I don't
recall ever having seen the CPU demand of transmitting be higher.

>   Perhaps 'PSK31', 'MFSK', or 'gMFSK' implies ,MT63'.
> However I do not recall them being mentioned in the original message
> or attachment.

In my experience, PSK31 and MFSK have CPU demands similar to MT63.

I just tested MT63 specifically on my P233 laptop, using the version
built into the gMFSK program.  Both transmission and reception seem to
use 20-25% of the CPU horsepower (apparently split between the audio
processing and the UI).  I'd guess that even a Pentium 100 might
handle this modulation without overloading, although that'd be running
a bit close to the limits.

> I am still missing software requirements;
> kernel version, gcc, utilities, tools, ...

For one example:  I'm running Debian Linux ("testing" distribution),
gcc 3.3.4, on a 2.4.20 kernel.

From what I've seen, a good percentage of the ham-radio-related
software packages for Linux make use of GNU autoconf, and seem to be
quite adaptable and forgiving about compiler versions, library
versions, and so forth.  You have to meet the prerequisites of any
given project, of course (e.g. you may need a standard FFT library, or
a UI toolkit, or etc).

>   Is 'MT63' a development project or is it really ready for
> 'user' deployment?  i.e. Is it 'alpha', 'beta', or
> stable release?

Can't speak for the author on that one, sorry.  The MT63 code compiled
into gMFSK seems to work, although I haven't tried to make any QSOs
with it yet.

