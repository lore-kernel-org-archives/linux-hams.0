From: Dave Platt <dplatt@radagast.org>
Subject: Re: Which tone comes first?
Date: Sun, 11 Jun 2006 12:30:05 -0700
Message-ID: <courier.448C6F3D.0000325B@radagast.org>
References: <448C6D95.2080007@sharon.esrac.ele.tue.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <448C6D95.2080007@sharon.esrac.ele.tue.nl>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pe1icq@sharon.esrac.ele.tue.nl, linux-hams@vger.kernel.org

> With 1200bd AFSK NRZI a logical 1 is transmitted as a constant tone, and 
> a logical 0 as a change in tone.
> I'm wondering which tone comes first when we start a sequence. Should it 
> start with 1200 Hz or start with 2200 Hz? Or doesn't it make any difference?

It really doesn't matter.  Use whichever you wish, or switch
deterministically or randomly on each individual packet transmssion.
At the receiving end, all "knowledge" of the actual tone being
transmitted is wiped out by the first stage of the NRZI detector,
which simply compares current-tone to previous-tone via an XOR
arrangement.

The only time it _might_ make a difference is if you're using a
sideband transmission system, and want to set up a convention that the
first tone burst is at one frequency or the other so as to allow for
automatic per-packet fine tuning.  I don't know of anyone who actually
does things that way, though.  On FM packet, this doesn't apply, since
the modulation is symmetrical around the carrier frequency.


