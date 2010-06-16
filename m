From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: Linux Packet Interface Hardware
Date: Wed, 16 Jun 2010 16:33:33 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1006161618320.23730@wapiti.we7u.net>
References: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com> <4C183169.3060206@radagast.org> <alpine.LNX.2.00.1006160534330.14107@wapiti.we7u.net> <4C195062.7050401@radagast.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :in-reply-to:message-id:references:user-agent:mime-version
         :content-type;
        bh=k3+u5xbTZ3DtSkHKNt7SmWzDxiaCM9cxKY4u3j2/290=;
        b=nIAm77u/RCEswElmtTjW+EyI3SU9c3GTIb/9jKVdDz2jc9wYexwbDeLGpZVntZKHKg
         RZ/WHDVoVqpnUAs5R+A44MslVVu1vSfa89NP7lpW4Yl97oxT5jPuuZmTfD5ZuniQcWYu
         Uu7xF7qe9Z/CNmBPIpQLSPQUamdcsxMin8NR8=
In-Reply-To: <4C195062.7050401@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Dave Platt <dplatt@radagast.org>
Cc: linux-hams@vger.kernel.org

On Wed, 16 Jun 2010, Dave Platt wrote:

> I've read opinions by people who said that old-style crystal-
> based radios are a better choice for running a 9600 bit/second
> backbone than modern synthesized radios are.  Maybe this is why?

Certainly can be a big factor.


> I do know that our local guys have had difficulty getting good,
> predictable performance out of the 9600 bit/second backbone they
> have been trying to set up.  Our first assumptions were that
> the main problems have been noise, multipath, and intermod...
> but maybe transmitter frequency stability is also complicating
> matters.  I'll mention this to Michael.

Should be easy to test by putting various audio frequencies in to
the modulator and verifying whether the PLL tracks with them or
allows the radio to shift frequency properly with the modulation.
Or phase, if you're phase modulating it.  Starting to get way out of
my realm of expertise though!


>> Note that the 0 bits are a disadvantage for the reasons mentioned,
>> but they're an advantage for the purpose of getting more clock
>> transitions to sync up with at the receive side.  If it weren't for
>> the extra short packet in there that some devices create it would be
>> much better to have a sequence of 0-bits than flags.  This is
>> especially important for the first part of a transmission when the
>> receiver is attempting to sync up to the transmit clock:  With
>> 0-bits you can often use a shorter TXD at the transmit side yet
>> still get the receiver to sync before the data starts across.  It
>> might also be important in lower S/N conditions.
>
> Hmmm... that's an argument I haven't seen proposed in the X.25 or
> AX.25 literature.

The thoughts come from a project I did in 1985 with a RS Micro Color
Computer and an XR-2211 on an interrupt pin, decoding 300/600/1200
baud packet (w/o a TNC).  Said computer had 6803 processor at
0.79MHz (TV colorburst Xtal / 4).  Was fun, but figured out I locked
faster with 0 bits than with a flag and had to figure out why.  Also
did full CRC-16 checking with above scheme.  I saw at the time that
some TNC's were sending flags and some zero bytes during the TXD
period.


> During the initial part of transmission (before the first frame)
> I could well see it... send a continuous stream of 0-bits during
> the TXDELAY period (to allow for the modem-level clock
> synchronization), then send one or two FLAGs to sync up the
> HDLC bitstream.  Dunno about in between frames, though.

If I remember the spec correctly (have the printed version at home)
0 bytes like that aren't allowed between frames, and a single flag
can delineate two data frames.  Don't know whether most TNC's can
handle that last.  Or soundmodem.  Or AGWPE & friends.


> When I figured out that the soundmodem and my TNC-X weren't
> playing well together, I looked into the soundmodem code and
> figured out a couple of possible fixes.  One is to modify
> soundmodem's HDLC encoder and bit-stuffer so that it doesn't
> generated invalid (runt) frames.

> Another possible approach would be to give soundmodem the ability
> to generate a somewhat more complex start-of-frame sequence...
> perhaps a programmable number of zero-bytes followed by a programmable
> number of FLAGs.  This would allow TNCs with marginal firmware (or
> operating under noisy conditions) a better chance to re-synchronize
> at the beginning of the next frame.

Check the spec.  I think it says flags only between frames, which
doesn't give you as good a chance to resync.

-- 
Curt, WE7U.                         <http://www.eskimo.com/~archer>
    APRS:  Where it's at!                    <http://www.xastir.org>
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
