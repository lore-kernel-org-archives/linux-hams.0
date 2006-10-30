From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: gmfsk
Date: Tue, 31 Oct 2006 00:14:07 +0200
Message-ID: <1162246448.5345.5.camel@oh2bns.ampr.org>
References: <4544D1A7.3010103@blueyonder.co.uk>
	 <20061029213157.GA25286@cloud.net.au> <45452E68.9060601@blueyonder.co.uk>
	 <454636E0.6090009@blueyonder.co.uk>  <20061030213843.GB25496@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20061030213843.GB25496@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hamish Moffatt <hamish@cloud.net.au>
Cc: linux-hams@vger.kernel.org

On Tue, 2006-10-31 at 08:38 +1100, Hamish Moffatt wrote:

> I don't think there is a CW decoder anyway.

0.7pre1 has one.

> I had more success when I set the sampling rate to 48000. My sound card
> doesn't really have the lower rates and the sample rate converter inside
> gMFSK seems to do a better job than the ALSA one which is providing
> /dev/dsp.

This is a good suggestion. I've heard lots of complaints about the
sample rate conversion stuff in ALSA.

> > What is giving me a real problem is that if I go to TX I get the box up 
> > with:-
> > "sound_open_for_write:opensnd: /dev/dsp: Deviceor resource busy"
> 
> Could be that gMFSK requires (inadvertently?) a full duplex sound card
> which yours is not? Unlikely though.

It shouldn't. I've tried to make gMFSK as simple as possible here:

- open card for reading
  - listen and decode
- close card
- open card for writing
  - send
- close card

... and so on.

That should be pretty fool proof, but I guess anything is possible.

-- 
Tomi Manninen / OH2BNS / KP20JF74


