From: "Tsutsumi Family" <oakie@kamakuranet.ne.jp>
Subject: RE: 300bps Packet
Date: Wed, 24 Nov 2010 19:31:25 +0900
Message-ID: <BD133160888F43CA9735B652903C2FF1@LIVINGROOM>
References: <4CEB5074.2070008@complete.org> <4CEB5C66.1050803@exemail.com.au> <6CE4D96A7B544D30919A49105B458915@LIVINGROOM> <4CEC16EF.8060106@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CEC16EF.8060106@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Dave Platt' <dplatt@radagast.org>, linux-hams@vger.kernel.org

Dave,

Thank you for providing the tutorial of SM source codes.

As one of ways to solve 300bps SSB operation without any code change, you
are suggesting to use the frequency setting of f0 and f1 to less than 4 x
300bps =1,200 Hz such as 800Hz and 1,000Hz, not conventional 2,100Hz and
2,300Hz.

Correct?

Regards,

take

de JA5AEA

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Dave Platt
Sent: Wednesday, November 24, 2010 4:33 AM
To: linux-hams@vger.kernel.org
Subject: Re: 300bps Packet

Tsutsumi Family wrote:
> John,
> 
> My experience is the same and it can transmit two tones at 400 bps lowest.
> 
> I wish to analyze the source codes but have not yet done due to my
software
> capability limitation.

It looks to me as if the immediate cause of this may lie in the
following code in afsk/modem.c:

        if (params[0]) {
                s->bps = strtoul(params[0], NULL, 0);
                if (s->bps < 100)
                        s->bps = 100;
                if (s->bps > 9600)
                        s->bps= 9600;
        } else
                s->bps = 1200;
        if (params[1]) {
                s->f0 = strtoul(params[1], NULL, 0);
                if (s->f0 > s->bps * 4)
                        s->f0 = s->bps * 4;
        } else
                s->f0 = 1200;
        if (params[2]) {
                s->f1 = strtoul(params[2], NULL, 0);
                if (s->f1 > s->bps * 4)
                        s->f1 = s->bps * 4;
        } else
                s->f1 = 2200;
        s->notdiff = params[3] ? !strtoul(params[3], NULL, 0) : 0;
        *samplerate = 8 * s->bps;

The modem-configuration code appears to be insisting that the
frequencies being used, must be no less than four times the
bit-rate.  The audio sample-generation rate is then set to
8x the bit-rate.

I *think* this is being done, in order to limit the number
of times that the loop down in "modsendbits" must iterate
for each individual bit-symbol being transmitted... looks
like no more than two audio output samples are being
generated per bit.

As a result of this approach, if you try to set the bit
rate to below 575 bits/second, the upper frequency (f1)
can no longer be sustained at 2200 Hz... the software starts
to decrease it.  At 300 bits/second, it ends up being
reduced all the way down to 1200 Hz (4 * 300) and you end
up transmitting a monotone.

For the transmit side of things, you could probably fix
this by changing the logic in this section.  If one were
to disable the logic which selectively reduces s->f0 and
s->f1, one would need to change the final calculation
of *samplerate, and increase the sample rate actually
being used.

It looks to me as if a similar - and probably much hairier -
set of changes would be needed to the demodulator code
further down in this file.  The demodulator is setting
up and using a set of digital filters, through which the
incoming samples are being fed.  You'd need to make changes
to run the receiver/demodulator at a higher sampling rate,
with longer filters, and more samples being captured prior
to being fed into the demodulator filter chain.

So, making this sort of change would be a job for someone
willing to dig through the DSP logic in the modulator and
demodulator, and generalize it a bit (and quite possibly
reduce its performance in the interest of generality).

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

