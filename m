From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: callsign limit
Date: Thu, 1 Jun 2006 16:08:54 +0100
Message-ID: <20060601150854.GA19527@linux-mips.org>
References: <200605310927.56706.vk3heg@iinet.net.au> <20060531093716.GA21395@cloud.net.au> <620c90570605310403o1e4b94bcgf4ab922ef26983e4@mail.gmail.com> <20060531111919.GA22980@cloud.net.au> <20060601014047.GB27504@linux-mips.org> <447ED7B2.3070701@sktc.net> <Pine.SUN.4.58.0606010723410.10879@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.SUN.4.58.0606010723410.10879@eskimo.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Curt, WE7U" <archer@eskimo.com>
Cc: "David D. Hagood" <wowbagger@sktc.net>, linux-hams@vger.kernel.org

On Thu, Jun 01, 2006 at 07:31:54AM -0700, Curt, WE7U wrote:

> Are we still talking about AX.25 here?  This is from the AX.25
> version 2.0 spec, published in 1984:

May it rest in peace.  V2.2 dated 1997 is the latest.

> "The characters of the call sign should be standard seven-bit ASCII
> (upper case only) placed in the leftmost seven bits of the octet to
> make room for the address extension bit. If the call sign contains
> fewer than six characters, it should be padded with ASCII spaces
> between the last call sign character and the SSID octet."
> 
> So...  We only have 7 bits to play with, not 8.  I suspect that we
> could still play some games though and compress the callsign into
> the 42 bits available, plus up to 4 more bits for the SSID if we
> wanted to mess with that.  Many people like to have more than one
> station on the same frequency though (as I do with APRS), so messing
> with the SSID too much would be problematic.  Perhaps one bit could
> be borrowed from there leaving 8 possible SSID's per station instead
> of 16?
> 
> There are also two reserved bits in the SSID byte.  I didn't check
> the later version 2.2 spec (which isn't implemented anywhere as far
> as I know) to see if they decided to use those two bits.  There may
> be some other reserved bits further down the header to use as well.

DAMA packs some information into the the unused bits of the SSID field.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
