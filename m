From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: gmfsk
Date: Tue, 31 Oct 2006 08:38:44 +1100
Message-ID: <20061030213843.GB25496@cloud.net.au>
References: <4544D1A7.3010103@blueyonder.co.uk> <20061029213157.GA25286@cloud.net.au> <45452E68.9060601@blueyonder.co.uk> <454636E0.6090009@blueyonder.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <454636E0.6090009@blueyonder.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, Oct 30, 2006 at 05:31:12PM +0000, richard wrote:
> I'm gradually getting hold of whats happening, I have managed to decode 
> bpsk31, rtty looks garbidge still, and cw is much the same.

If RTTY is garbage you might have it reversed. You need to be on LSB
with the "REV" box unchecked, or USB with the "REV" box checked.

I don't think there is a CW decoder anyway.

I had more success when I set the sampling rate to 48000. My sound card
doesn't really have the lower rates and the sample rate converter inside
gMFSK seems to do a better job than the ALSA one which is providing
/dev/dsp.

> What is giving me a real problem is that if I go to TX I get the box up 
> with:-
> "sound_open_for_write:opensnd: /dev/dsp: Deviceor resource busy"

Could be that gMFSK requires (inadvertently?) a full duplex sound card
which yours is not? Unlikely though.

At any command prompt, can you output to the device? just
cat /dev/random > /dev/dsp

You should hear garbage.

> If I then click on the RX box the waterfall display speed increases 2 to 
> 3 times faster than the previous working RX session, and the
> RX window gets gradually filled with random letters.

That sounds like a bug.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
