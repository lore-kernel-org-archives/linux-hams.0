From: "Robin Gilks" <g8ecj@gilks.org>
Subject: Re: New on this
Date: Fri, 5 Apr 2013 22:21:20 +1300
Message-ID: <03befb183d4271de26448b168159f7aa.squirrel@gilks.ath.cx>
References: <CA+nFU8R=vmrap7TR8mU3HpqoLiErwYM4yCRZ2rKMexDpnAqNHg@mail.gmail.com>
    <CAHMoZxVuPd9FpZMAH5BeGrGq5qnyL2G9Jjp+hM3C8GFhNHHcoQ@mail.gmail.com>
    <CAHMoZxVwQdBPXPJO_xCgY-z5q2daFn4HB3qTgbDcBwj0i9+4dw@mail.gmail.com>
    <CA+nFU8ThN0wJWFZcRitULy0cpbAoJ83vUJ1_zta0tENGo6PQOA@mail.gmail.com>
Reply-To: g8ecj@gilks.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CA+nFU8ThN0wJWFZcRitULy0cpbAoJ83vUJ1_zta0tENGo6PQOA@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


> Hello echiken
>
> I'll explain me a bit more, because now I am sure that I'm looking for
> the wrong solution:
>
> We are working on a CubeSat project in the University, which is a
> project about creating a small satellite (10x10x10 cm). This small
> size causes that the hardware has to be size-reduced and as least as
> possible. This is the reason why, in the communications part,  we only
> want to use what we have implemented now, and anything else: CC1101
> chipset over RFC-1100H, and do everything else over software.
>
> On the other hand, the Ground Station has its own requirements
> (explained in the first email: TNC31 [or TNC7, but we are trying now
> with 31], scrambling, etc.), and is GENSO compliant (is a project to
> create a CubeSat worldwide network, or something like this, I have not
> searched documentation about GENSO).
>
> And now, we are searching the solution to create AX25 packets and
> process them as if there was a TNC, and then ask CC1101 to send this
> packages (this last thing works, the problem is that the data we send
> now is not AX25 encoded, and the Ground Station doesn't understand
> us). Linux AX25 seemed a good option, but before recompiling the
> kernel, installing and configure, we wanted to know what it does
> exactly, and implementing Linux AX.25, and then creating code to
> scramble and all the other things seems oversized.
>
> Do you know any solution for this?
>
> I have to say too, as you asked, that we are not publishing data by
> now, only a few thesis of the first people working on the project.
>
> Thank you very much for your answers!

Might I suggest a few bits of code I've implemented over the last 15 years
or so?

Starting from more recent offerings, there is my fork of the BeRTOS
operating system at https://github.com/g8ecj/bertos which has an
implementation of all the HDLC and KISS protocols required for AX25. The
high level code is portable to pretty much any processor and the low level
physical interfaces are implemented for Arduino. Check out the HDLC branch
and try creating an example project based on either the KISS TNC or the
APRS TNC examples. The KISS implementation does all the p-persist
processing for multi-user channel access

If you're doing satellite stuff then 9k6 may be the way you'll be going in
which case there is also an example of interfacing to a g4xyw (g3ruh
compatible) 9k6 modem. The details for that you'll find on my website at
http://gilks.ath.cx/tvipug/v3.6/v3.6index.html

Another implementation of KISS can be found in my IPRI project from a few
years back. Also on my web sit at
http://gilks.ath.cx/tvipug/tnc/tncindex.html but written in assembler!!
Bigger AVR CPU were not available then! It might give you some ideas as it
takes SLIP (i.e. serial link IP) in and sends AX25 out - it handles all
the ARP processing, callsigns, digipeaters etc There are any number of
small IP stacks about that would be useful there, much easier to onward
route the data if its already IP, it just gets wrapped up in AX25 :)

Enjoy...


-- 
Robin Gilks zl3rob/g8ecj
Internet: g8ecj@gilks.org    http://www.gilks.org



