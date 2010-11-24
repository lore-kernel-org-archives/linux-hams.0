From: Dave Platt <dplatt@radagast.org>
Subject: Re: 300bps Packet
Date: Wed, 24 Nov 2010 10:37:20 -0800
Message-ID: <4CED5B60.5040108@radagast.org>
References: <4CEB5074.2070008@complete.org> <4CEB5C66.1050803@exemail.com.au> <6CE4D96A7B544D30919A49105B458915@LIVINGROOM> <4CEC16EF.8060106@radagast.org> <BD133160888F43CA9735B652903C2FF1@LIVINGROOM>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <BD133160888F43CA9735B652903C2FF1@LIVINGROOM>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Tsutsumi Family wrote:
> Dave,
> 
> Thank you for providing the tutorial of SM source codes.
> 
> As one of ways to solve 300bps SSB operation without any code change, you
> are suggesting to use the frequency setting of f0 and f1 to less than 4 x
> 300bps =1,200 Hz such as 800Hz and 1,000Hz, not conventional 2,100Hz and
> 2,300Hz.
> 
> Correct?

Correct - I think this ought to work.  As long as you don't pick
frequencies so low that your audio connection (PC to rig) is
rolling off the amplitude (due to e.g. transformer isolation
in the audio path) this approach should let you generate a pair
of tones with a suitable separation.

You'll just need to tune your sideband rig a bit differently than
if you were using a traditional "hard" TNC with its receive filters
tuned for a 2200 Hz channel center.  Just tune to match up the
tone you hear during reception, with the tone that your PC generates
during transmission... it'll be an octave or so lower than the usual
pitch but it should work.



