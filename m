From: Thomas Sailer <t.sailer@alumni.ethz.ch>
Subject: Re: sound chip/driver issues
Date: Wed, 11 May 2005 22:07:16 +0200
Message-ID: <1115842036.6284.33.camel@gamecube.scs.ch>
References: <1115840632.30713.19.camel@office.n7xy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1115840632.30713.19.camel@office.n7xy.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bob Nielsen <nielsen@oz.net>
Cc: linux-hams@vger.kernel.org

On Wed, 2005-05-11 at 12:43 -0700, Bob Nielsen wrote:

> Are there any issues with the CMI chip which I need to consider?  Would
> it be best to disable the onboard sound and use a PCI sound card?  If
> so, which cards are recommended (I think I have one which uses the same
> CMI chip around somewhere, but I fear it might have the same problem).

What drivers are you using? ALSA?

Are you using an alsa aware mixer program?

Audio loop through muting and recording source selection are different
switches, so are you sure you enabled line-in as recording source? And
did you set the recording level?

Also, there seems to be a problem with alsa's OSS emulation, which tends
to prevent modem applications from working correctly. This results in
abysmal performance of the modem even though the signal seems to be ok.

Tom


