From: Pierre-Philippe Coupard <pcoupard@easyconnect.fr>
Subject: Re: Usermode Soundmodem
Date: Tue, 27 Jul 2004 17:36:53 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <41067695.3000101@easyconnect.fr>
References: <20040725183329.90335.qmail@web52604.mail.yahoo.com> <41052A12.7040503@utoronto.ca> <41053BF9.7020401@cs.unibo.it> <41055CA7.2020904@easyconnect.fr> <41066CFF.4070809@cs.unibo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <41066CFF.4070809@cs.unibo.it>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrea Borgia <borgia@cs.unibo.it>
Cc: linux-hams@vger.kernel.org

Andrea Borgia wrote:
> What it your software? I might try it just to see how it fares.

It's CWirc (http://webperso.easyconnect.fr/om.the/web/cwirc/). The 
reason it tends to reveal problems with sound devices is because it 
requires very low latency from them, because latency is quite an issue 
with fast CW'ers, and also because it derives its timing from the 
sound card. As a result, bad sound devices that are okay, or at least 
passable with less demanding programs, may create a number of problems 
with CWirc, most notably sound scratchiness, and strange sync issues 
with gMFSK when the latter is used in CWirc-slave mode. Those problems 
never happen with sound devices other than the ones I cited.

> By the way, gMFSK works flawlessly on this same laptop using Alsa's OSS emulation.

gMFSK has lesser sound buffer size and fragment size requirements than 
CWirc.

> I would like to solve this problem just because I like fixing things, 
> not because I really need the soundmodem to work: I can reach my own 
> dxcluster node by telnet much more conveniently and reliably than over 
> the air.

The problem is in the sound hardware that puts too much burden on the 
driver side to compensate for the chip's cheesiness. It's a typical 
"winmodem" approach to hardware engineering: make the cheapest 
hardware possible and let the driver compensate, at the expense of CPU 
usage and performance.

CWirc already has provisions to alleviate the problem somewhat, by 
installing it suid root so it can renice itself, and if you really 
have to, you can recompile it with a larger sound buffer size, but it 
makes the audio latency unacceptable for high-speed operators. Already 
  as it is, there's a 30ms delay between the moment you press the 
paddle and the moment you hear the beep, and that's enough to make 
keying over 25 wpm significantly harder than with a real transceiver.

73 QRO, Pierre F8EJF
