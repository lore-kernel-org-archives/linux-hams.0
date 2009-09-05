From: Dave Platt <dplatt@radagast.org>
Subject: Re: AX25 help site
Date: Sat, 05 Sep 2009 11:14:16 -0700
Message-ID: <4AA2AA78.5000605@radagast.org>
References: <9923fd660908310727o354e03dqaf90abe05b4ea800@mail.gmail.com> <1251842807.8971.1.camel@w8iss-desktop> <4A9DA743.9090101@radagast.org> <20090905160400.GH3807@mea-ext.zmailer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20090905160400.GH3807@mea-ext.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matti Aarnio <matti.aarnio@zmailer.org>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

Matti Aarnio wrote:
> On Tue, Sep 01, 2009 at 03:59:15PM -0700, Dave Platt wrote:
> ...
>>     The soundmodem will transmit the required
>> number of complete bytes, padding out the last encoded byte with
>> zero bits, before it encodes and sends the FLAG which starts the next
>> packet.  As a result, a back-to-back packet transmission looks like
>>
>>    FLAG-packet1-FLAG-zeros-FLAG-packet2-FLAG
> 
> The modulation leader (synch-up) is best sent as all zeros,
> but inter-packet gaps should be subsequent FLAGs.
> Of course a real receiver notes that "a back to back frame,
> but it has bad CRC, discard it."

Correct.  The receiver is required (a "MUST" in the spec) to
detect and discard any frame which is either too short, has a
bad CRC, or is not an integral number of bytes (after the
HDLC de-stuffing is performed).

A fully-robust receiver will reject the few extra zero-bits
of zero that the soundmodem may insert, for all three reasons...
this "frame" is too short, an odd number of bits, and has no
valid CRC.  Three thumbs-down ought to be enough :-)

The initial version of the TNC-X firmware was "confused" by
the extra zero bits, and didn't resynchronize immediately with
the second FLAG. It did reject the short "packet" as having a
bad CRC, but its loss of sync meant that it didn't parse the
second packet at all.

I believe that this shortfall has been corrected (or at least
greatly improved) in the current TNC-X firmware.

>    zeros - FLAG - packet1 - FLAG (- FLAG ...) packet2 - FLAG - FLAG...

Agreed - that's the way it's best done, I think.

> And by the way, things are not at byte-boundaries after transmission,
> but they should be back again after HDLC de-stuffing.

Yes - if they aren't, then the resulting packets are bad, and the
spec says that they must be discarded.

