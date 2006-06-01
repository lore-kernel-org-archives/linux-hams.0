From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: callsign limit
Date: Thu, 1 Jun 2006 07:31:54 -0700 (PDT)
Message-ID: <Pine.SUN.4.58.0606010723410.10879@eskimo.com>
References: <200605310927.56706.vk3heg@iinet.net.au> <20060531093716.GA21395@cloud.net.au>
 <620c90570605310403o1e4b94bcgf4ab922ef26983e4@mail.gmail.com>
 <20060531111919.GA22980@cloud.net.au> <20060601014047.GB27504@linux-mips.org>
 <447ED7B2.3070701@sktc.net>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <447ED7B2.3070701@sktc.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David D. Hagood" <wowbagger@sktc.net>
Cc: Ralf Baechle DL5RB <ralf@linux-mips.org>, linux-hams@vger.kernel.org

On Thu, 1 Jun 2006, David D. Hagood wrote:

> Since a callsign is always from the set [A-Z0-9] (36 chars, 5.2 bits of
> data per character for a naive encoding) could you not simple encode the
> callsign of an otherwise too-long call as 6 bits per character packed
> into the octets, with a specific leading character to indicate
> compression (e.g. '?') - yielding about 8 chars/call.

Are we still talking about AX.25 here?  This is from the AX.25
version 2.0 spec, published in 1984:

"The characters of the call sign should be standard seven-bit ASCII
(upper case only) placed in the leftmost seven bits of the octet to
make room for the address extension bit. If the call sign contains
fewer than six characters, it should be padded with ASCII spaces
between the last call sign character and the SSID octet."

So...  We only have 7 bits to play with, not 8.  I suspect that we
could still play some games though and compress the callsign into
the 42 bits available, plus up to 4 more bits for the SSID if we
wanted to mess with that.  Many people like to have more than one
station on the same frequency though (as I do with APRS), so messing
with the SSID too much would be problematic.  Perhaps one bit could
be borrowed from there leaving 8 possible SSID's per station instead
of 16?

There are also two reserved bits in the SSID byte.  I didn't check
the later version 2.2 spec (which isn't implemented anywhere as far
as I know) to see if they decided to use those two bits.  There may
be some other reserved bits further down the header to use as well.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
