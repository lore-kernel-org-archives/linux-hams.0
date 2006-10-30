From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: gmfsk
Date: Tue, 31 Oct 2006 10:34:13 +1100
Message-ID: <20061030233413.GA2108@cloud.net.au>
References: <4544D1A7.3010103@blueyonder.co.uk> <20061029213157.GA25286@cloud.net.au> <45452E68.9060601@blueyonder.co.uk> <454636E0.6090009@blueyonder.co.uk> <20061030213843.GB25496@cloud.net.au> <1162246448.5345.5.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1162246448.5345.5.camel@oh2bns.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, Oct 31, 2006 at 12:14:07AM +0200, Tomi Manninen wrote:
> On Tue, 2006-10-31 at 08:38 +1100, Hamish Moffatt wrote:
> > I don't think there is a CW decoder anyway.
> 0.7pre1 has one.

Neat!

> > I had more success when I set the sampling rate to 48000. My sound card
> > doesn't really have the lower rates and the sample rate converter inside
> > gMFSK seems to do a better job than the ALSA one which is providing
> > /dev/dsp.
> 
> This is a good suggestion. I've heard lots of complaints about the
> sample rate conversion stuff in ALSA.

ISTR that I could hear clicking in the Tx audio until I changed the
sample rate. No problem with gMFSK's internal converter.

> > Could be that gMFSK requires (inadvertently?) a full duplex sound card
> > which yours is not? Unlikely though.
> 
> It shouldn't. I've tried to make gMFSK as simple as possible here:
> 
> - open card for reading
>   - listen and decode
> - close card
> - open card for writing
>   - send
> - close card
> 
> ... and so on.
> 
> That should be pretty fool proof, but I guess anything is possible.

It also seems unlikely to me that Richard's M-Audio card is half duplex.
More likely something is using the playback device already.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
