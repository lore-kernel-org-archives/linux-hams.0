From: ariel mastracchio <ari197516@yahoo.com>
Subject: Re: Soundmodem Not Decoding Real Packets
Date: Sat, 2 Jul 2005 12:03:35 -0700 (PDT)
Message-ID: <20050702190335.12000.qmail@web51004.mail.yahoo.com>
References: <loom.20050702T065537-241@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <loom.20050702T065537-241@post.gmane.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Lassoff <jlassoff@gmail.com>, linux-hams@vger.kernel.org

Hello,
 
  The motherboard i have with onboard sound card
didn't work (it transmit ok, but dont decode packets,
the scope graph show a very small bandwidth with blank
noise) , i have to buy a sound blaste PCI, and work
fine!!

hugs
lu9aum

--- Jonathan Lassoff <jlassoff@gmail.com> wrote:

> Dave Platt <dplatt <at> radagast.org> writes:
> > Hmmm.
> > 
> > Which audio drivers are you using - OSS, or ALSA?
> 
> I've tried both. I'm using the i810_audio module
> with the AC97 codec for an
> on-board sound device on a laptop.
>  
> > I've seen some rather bizarre things with some
> combinations of card,
> > driver, and software setting.  In particular,
> problems can occur if:
> > 
> > [1] The card itself is only capable of supporting
> a small selection of
> >     sampling rates (many AC97 codes seem to want
> to run at 48000
> >     samples/second), and
> > 
> > [2] You set up the sound modem to use the
> "natural" sampling rate for
> >     the modulation in question (e.g. 9600
> samples/second for 1200-baud
> >     packet), and
> 
> I cannot seem to find where this is set. Are the
> specifications for the config
> file somewhere?
> 
> > [3] The soundmodem is configured to use /dev/dsp,
> and
> > 
> > [4] You're using an ALSA driver with OSS
> emulation.
> > 
> > What seems to happen is that the OSS emulation
> layer quite politely
> > lies to the soundmodem, says "Sure, 9600
> samples/second is supported",
> > and then tells the ALSA PCM layer to do
> sample-rate conversion in
> > software.  The ALSA rate converter has some
> problems, and it ends up
> > introducing noise into the received audio signal
> occasionally (usually
> > on internal buffer boundaries, I believe).  The
> noise is sufficient to
> > mess up the audio reception.
> > 
> > The solution to this involves disabling the sample
> rate conversion
> > process.  I _think_ (but am not sure) that the
> best way to do this is
> > to tell the soundmodem to use the ALSA API
> directly, rather than using
> > the OSS emulation via /dev/dsp - recent versions
> of the soundmodem can
> > do this, and are smart enough to use a sampling
> rate that the audio
> > chip supports directly with no conversion being
> required.
> 
> Well, from some of the things you have pointed out,
> I might suspect an audio
> driver issue, but I'm not sure if the ALSA driver is
> using OSS emulation with
> the older i810_audio driver.
> 
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
