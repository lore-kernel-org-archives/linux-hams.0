From: "Rodolfo Brasnarof" <rodob@ciudad.com.ar>
Subject: Re: New to the list...
Date: Thu, 26 Jun 2003 23:15:20 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3EFB7E88.18236.2616E@localhost>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA6nohIbvp0RGXqACAx8VP1sKAAAAQAAAAu+l99CL0ZkWOoxTNvpJsHwEAAAAA@bh90210.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA6nohIbvp0RGXqACAx8VP1sKAAAAQAAAAu+l99CL0ZkWOoxTNvpJsHwEAAAAA@bh90210.net>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: stuart@bh90210.net

---
On 24 Jun 2003 at 7:28, IT3 Stuart B. Tener, USNR wrote:

> and I am trying to get AX.25 + Linux working, so here we go. By
> the way in case it interests anyone I have read the AX.25 FAQ
> (did not understand all of it, but I did read it). I think the
> FAQ is very poorly organized but in terms of the technical data,
> I understand it.

Perhaps you should try the AX.25-HOWTO first.

>  If my goal is to configure TCP/IP over a soundcard modem using
> Linux, what do I need to get working (using the AX.25 FAQ as a
> guide)? For example it is my understanding using a TNC, you would
> put the TNC into KISS mode to allow TCP/IP to avoid the AX.25
> level. Then setup (in the old days) KA9Q to do the TCP/IP stack.
> 
>  The first thing I would like to accomplish is making the PC act
>  as
> an AX.25 TNC using the soundcard. Once this works (for basic
> packet operation) then I would like to configure the system to:
> 
>  (a) Run TCP/IP, using the soundcard as the modem
>  (b) Run TCP/IP, using an external TNC in KISS mode (on
>  /dev/ttyS0)
> 
>  I did the modprobe of soundmodem, and then tried to issue the
> sethdlc command, but after doing so I got "no such address or
> device" when I did an "ifconfig sm0 up".

Well, what kind is your soundcard? Notice that the kernel 
soundmodem (the module you're trying) only supports Sound 
Blaster o Windows Sound System compatible cards. Many new 
cards are not suported by it.

But haven't you heard about the userspace soundmodem? It is 
not a kernel module, it's a usermode program, it's easier to 
configure, and (the most important thing) it handles the 
soundcard through OSS, so it works with virtualy every 
soundcard supported by OSS.

>  How can I verify what the IO, DMA and IRQ of the sound card is,
>  if
> it is built into the motherboard, and the BIOS offers now way to
> set those for the card?
> 
>  Other than the soundcard not being set right by sethdlc, I am
>  lost
> as to what is wrong. Any assistance you can offer would be well
> appreciated.

It's likely that your onboard soundcard will not work at all 
with the kernel soundmodem.

Try usermode soundmodem, and tell us.

