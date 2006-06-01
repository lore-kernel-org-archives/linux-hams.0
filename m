From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: callsign limit
Date: Thu, 1 Jun 2006 14:25:00 +0100
Message-ID: <20060601132500.GA10812@linux-mips.org>
References: <200605310927.56706.vk3heg@iinet.net.au> <20060531093716.GA21395@cloud.net.au> <620c90570605310403o1e4b94bcgf4ab922ef26983e4@mail.gmail.com> <20060531111919.GA22980@cloud.net.au> <20060601014047.GB27504@linux-mips.org> <447ED7B2.3070701@sktc.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <447ED7B2.3070701@sktc.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David D. Hagood" <wowbagger@sktc.net>
Cc: linux-hams@vger.kernel.org

On Thu, Jun 01, 2006 at 07:04:02AM -0500, David D. Hagood wrote:

> Ralf Baechle DL5RB wrote:
> >One of my crazier ideas to deal with the issue of the longer callsigns
> >was using a hash value instead.  The probability of colissions is low but
> >how to do the reverse mapping from hash to callsign ...
> 
> Since a callsign is always from the set [A-Z0-9] (36 chars, 5.2 bits of 
> data per character for a naive encoding) could you not simple encode the 
> callsign of an otherwise too-long call as 6 bits per character packed 
> into the octets, with a specific leading character to indicate 
> compression (e.g. '?') - yielding about 8 chars/call.

That is a modest proposal which gives you a little bit of extra headroom.
But the WRC03 rules set no limit for callsigns length.  And, let's face it,
the current format of AX.25 MAC addresses sucks anyway, 7 bytes with
various other junk thrown in just because space was available make
processing more complicated than needed.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
