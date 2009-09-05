From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: AX25 help site
Date: Fri, 4 Sep 2009 18:32:12 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.0909041804320.29631@wapiti.we7u.net>
References: <9923fd660908310727o354e03dqaf90abe05b4ea800@mail.gmail.com> <1251842807.8971.1.camel@w8iss-desktop> <4A9DA743.9090101@radagast.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4A9DA743.9090101@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Dave Platt <dplatt@radagast.org>
Cc: w8iss <w8iss@wideopenwest.com>, Linux-Hams <linux-hams@vger.kernel.org>

On Tue, 1 Sep 2009, Dave Platt wrote:

> Soundmodem's deficiency:  it violates a "SHOULD" clause in the
> AX.25 spec, which says that any idle time between packets SHOULD be
> filled with FLAG octets (i.e. synchronization or idle).

> Mr. Sailer rejected my proposed fix to the soundmodem.  It's
> his feeling that a proper HDLC receiver ought not to mind
> the extraneous zero bits in the packet, and that the TNC-X's
> failure to resynchronize was the real problem.

Zero bits in NRZI encoding cause a square wave to be generated at
the decoding end because each zero causes a transition.  It's
actually EASIER to sync up to zero bits than it is flag bits for the
purposes of synchronous decoding.  Of course if these are happening
in-between packets, the decoder is already sync'ed and doesn't need
extra transistions there.  You're talking about zero-bits
in-between the frames.


> I personally feel that both the TNC-X code, and soundmodem,
> were slightly in violation of good engineering practice
> (i.e. "be conservative in what you send, and liberal in what
> you're able to receive") and that modifying the soundmodem
> code to comply with the "SHOULD" recommendation in the AX.25
> spec would be appropriate.

Some commercial TNC's stuff in extra flags, others stuff in zero
bytes at the start of the transmission.  I haven't investigated the
back-to-back packet interface specifically (not interesting at the
time) but as I recall everything years ago used either one or two
flags between packets, nothing else.

I don't recall any firmware-based TNC's that worried about byte
boundaries and then stuffing in zero bits, which should look to the
decoder like a separate all-zero packet in-between the flags.  It
would be better if it did NOT sync up to byte boundaries in this
manner:  The upper-level protocol has to figure out they are
zero-byte packets and toss them.  It could cause problems in some
instances.

-- 
Curt, WE7U.                         <http://www.eskimo.com/~archer>
    APRS:  Where it's at!                    <http://www.xastir.org>
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
