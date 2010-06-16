From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: Linux Packet Interface Hardware
Date: Wed, 16 Jun 2010 05:45:52 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1006160534330.14107@wapiti.we7u.net>
References: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com> <4C183169.3060206@radagast.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :in-reply-to:message-id:references:user-agent:mime-version
         :content-type;
        bh=NpkmkT2w8qYP/9rQo2Wo2QWxWqDVFZ5lCBGCvK7LXI0=;
        b=LzjVH1v/5v1Qfe4Bf9PhLwW4ZRqCTJ/48LN8hXKW1KOQDQRacm6jF+E8wX4Mr1Sgi/
         NLcGPlSp5ObB2Je1+fSllldKr4d9qiVvH6hQZd7Cm8EjE6Cany1CY77i3LgPorfQjaSp
         zHtWH3O5GNFV6AABimBzXL22OYjKFJLQ1jaBQ=
In-Reply-To: <4C183169.3060206@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Dave Platt <dplatt@radagast.org>
Cc: linux-hams@vger.kernel.org


LOTS of good info Dave!  A couple of minor comments:

On Tue, 15 Jun 2010, Dave Platt wrote:

> For 9600-baud... well, you'd be on more uncertain territory there.
> I don't think the 9600-baud FSK support in the soundmodem has been
> used anywhere near as much as the 1200-baud support, and I haven't
> heard anything about its actual performance.  I understand that
> 9600 FSK requires very flat frequency response of the data channel
> (down to fairly near DC), and simple USB-audio adapters designed
> for driving headphones may roll off at too high a frequency due
> to too-small DC-blocking capacitors.

Another thing to watch is whether the PLL in the transmitter you're
using tries to compensate for the low-frequency audio.  Many
PLL-based radios will try to do this, screwing up the transmission.
I used to have a 9600 baud modem hooked to an ICOM IC-27A and it
definitely had that problem.  Even some "9600-baud ready" radios
with the modem connector on the back might have this sort of
problem.


> The actual behavior of the soundmodem is to send one flag at the
> end of the current frame, then insert between zero and seven 0-bits,
> and then send another flag to begin transmission of the next frame.

Note that the 0 bits are a disadvantage for the reasons mentioned,
but they're an advantage for the purpose of getting more clock
transitions to sync up with at the receive side.  If it weren't for
the extra short packet in there that some devices create it would be
much better to have a sequence of 0-bits than flags.  This is
especially important for the first part of a transmission when the
receiver is attempting to sync up to the transmit clock:  With
0-bits you can often use a shorter TXD at the transmit side yet
still get the receiver to sync before the data starts across.  It
might also be important in lower S/N conditions.

-- 
Curt, WE7U.                         <http://www.eskimo.com/~archer>
    APRS:  Where it's at!                    <http://www.xastir.org>
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
