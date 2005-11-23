From: Chuck Hast <wchast@gmail.com>
Subject: Re: YAM/Tekk help
Date: Wed, 23 Nov 2005 10:38:46 -0500
Message-ID: <620c90570511230738r65e534d9v62927d7bcf5e6f8a@mail.gmail.com>
References: <20051116151748.GN3241@goldengate.vpizza.org>
	 <4382C162.7090202@onr.com> <20051123140152.GC2699@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20051123140152.GC2699@linux-mips.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: ad5oo@arrl.net, linux-hams@vger.kernel.org, Jim Meehan <jmeehan@vpizza.org>

On 11/23/05, Ralf Baechle DL5RB <ralf@linux-mips.org> wrote:
> On Tue, Nov 22, 2005 at 12:57:38AM -0600, David Rivenburg wrote:
>
> > Only 3-4%?  That's actually pretty good.  Reliable 9600 baud packet is
> > practically nonexistant without using hardware specifically designed for
> > 9600 baud baseband fsk.  I am not aware of any commercial radio or tnc
> > that is.  They may *try* to do 9600, and even have modest success with
> > it, but they are flawed from the start and cannot be counted on for
> > reliable operation.
>
> I've made pretty positive experience with the PR-430 radio (available
> through www.wimo.com).  They're not cheap but the combination of a TNC
> and a radio virtually eleminates the delicate adjustment procedure
> otherwise needed for 9k6 and the 12ms RX -> TX and 10ms TX -> RX switching
> times means this radio isn't a hazard to the whole network.
>
> Downside - the radio is running a variant of the 6pack protocol that needs
> extensive changes to the Linux 6pack driver; while I do have such a
> driver it's not yet in the shape for going to kernel.org ...
>

Ralf,
What is the freq coverage of the radio? I know it is somewhere around 430 Mhz,
but in this country we have a lot of packet up in the 440 region. If
the radio goes
up there that is good. The price for the radio alone was not all that
bad at 195 Euros.

The other factor is that we also have packet radio on 145 Mhz and 220 Mhz, so
radios are needed for those bands. This is where the Tait radios come in, they
are about double the price, but the 8100 series radios will do data very well,
indeed the radio was designed for data and voice with data taking a
high priority.

Tait is supposed to be looking at bringing out a 900Mhz version of that radio
also, that will open that band up to us here (Region II has 900 Mhz as a ISM
and amateur radio band, Region I it is used for GSM)

I have been testing them here in Tampa and am very impressed with the radio.



--
Chuck Hast
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
