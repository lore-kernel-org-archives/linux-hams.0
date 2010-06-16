From: Jim Kusznir <jkusznir@gmail.com>
Subject: Re: Linux Packet Interface Hardware
Date: Wed, 16 Jun 2010 09:16:29 -0700
Message-ID: <AANLkTikS7GnQ4hyLpIEk62IF43pX_NVvl_E1GhNwH9C9@mail.gmail.com>
References: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com>
	<4C183169.3060206@radagast.org>
	<alpine.LNX.2.00.1006160534330.14107@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=wsdze6YMmbvyUFUpGqQ8uqDyh8D8niHS8Eseabf97f4=;
        b=L8ifSYxmrFiswpdHrfHw+lA4JR7livJoHq5pzuI2gqIJpFz4wpUv1UPVMAssYrH60Q
         +RS7s8rfQ9HiS3ipZv6ZNGoO87FfQ4gjmyBzZCh4/jzhtqIn4ENcKUIC6Sl/jjxAnOjJ
         LSuUpoRIO32NP1bQCpof2ll3M8jNAAmn3HHwA=
In-Reply-To: <alpine.LNX.2.00.1006160534330.14107@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Thanks everyone, lots of good info!

A few questions:

I've seen a few references to 6-pack, and know that its a "special
firmware" that one would load on the TNCs...But I can't seem to find
that firmware anywhere.  Does anyone know where I can actually get it,
and find info about what TNCs it supports?

It seems that for hardware available today, the recommendation for
infrastructure use is to use a TNC in KISS or 6-pack mode.  I've been
using one at home in KISS mode for a while, and I've been noticing
what I think now is the T1 timer problem, and its been causing very
frustrating and massive reduction in throughput on my local 9k6
channel, even though my radio and the node are the only two on
frequency!  I often see my system try and send retransmits before the
first packet ever even makes it out the radio (but on the other hand,
I also think my TNC is sitting on packets way too long -- PacComm
Spirit-2).  I am contemplating replacing the firmware chip with a
KISS-only or 6-pack firmware chip and see what that does, if I can
find one for this TNC.

As to new installations, does anyone recommend a 9k6 TNC for a good
cost/performance metric that can be used with linux effectively?  It
should be external, as the embedded hardware I'm likely to run it on
will not have PCI slots, and definitely will NOT have ISA slots.

I like the ideas about a BPQether USB device; from the description,
though I gather one has not been made to date?  I'm curious, and I'll
keep this in mind for a potential CE/EE project here (School of EECS,
WSU and the W7YH Amateur Radio Club).

The information on sound modems is well taken; I think I'll limit that
deployment to end-user stations in my planning.

Thanks all for the ideas/input.  I think the BPQether driver best fits
what I was hoping to find, except for the fact that it doesn't exist
off-the-shelf yet....

--Jim

On Wed, Jun 16, 2010 at 5:45 AM, Curt, WE7U <curt.we7u@gmail.com> wrote=
:
>
> LOTS of good info Dave! =A0A couple of minor comments:
>
> On Tue, 15 Jun 2010, Dave Platt wrote:
>
>> For 9600-baud... well, you'd be on more uncertain territory there.
>> I don't think the 9600-baud FSK support in the soundmodem has been
>> used anywhere near as much as the 1200-baud support, and I haven't
>> heard anything about its actual performance. =A0I understand that
>> 9600 FSK requires very flat frequency response of the data channel
>> (down to fairly near DC), and simple USB-audio adapters designed
>> for driving headphones may roll off at too high a frequency due
>> to too-small DC-blocking capacitors.
>
> Another thing to watch is whether the PLL in the transmitter you're
> using tries to compensate for the low-frequency audio. =A0Many
> PLL-based radios will try to do this, screwing up the transmission.
> I used to have a 9600 baud modem hooked to an ICOM IC-27A and it
> definitely had that problem. =A0Even some "9600-baud ready" radios
> with the modem connector on the back might have this sort of
> problem.
>
>
>> The actual behavior of the soundmodem is to send one flag at the
>> end of the current frame, then insert between zero and seven 0-bits,
>> and then send another flag to begin transmission of the next frame.
>
> Note that the 0 bits are a disadvantage for the reasons mentioned,
> but they're an advantage for the purpose of getting more clock
> transitions to sync up with at the receive side. =A0If it weren't for
> the extra short packet in there that some devices create it would be
> much better to have a sequence of 0-bits than flags. =A0This is
> especially important for the first part of a transmission when the
> receiver is attempting to sync up to the transmit clock: =A0With
> 0-bits you can often use a shorter TXD at the transmit side yet
> still get the receiver to sync before the data starts across. =A0It
> might also be important in lower S/N conditions.
>
> --
> Curt, WE7U. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <http://w=
ww.eskimo.com/~archer>
> =A0 APRS: =A0Where it's at! =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<h=
ttp://www.xastir.org>
> =A0Lotto: =A0A tax on people who are bad at math. - unknown
> Windows: =A0Microsoft's tax on computer illiterates. - WE7U.
> The world DOES revolve around me: =A0I picked the coordinate system!"
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
