From: Dave Platt <dplatt@radagast.org>
Subject: Re: soundmodem TX on HF again
Date: Sat, 04 Dec 2010 10:05:08 -0800
Message-ID: <4CFA82D4.9030300@radagast.org>
References: <4CFA6753.1010105@complete.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CFA6753.1010105@complete.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Goerzen <jgoerzen@complete.org>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On 12/04/2010 08:07 AM, John Goerzen wrote:
> Hi folks,
> 
> Well I've got soundmodem 300 baud working, sortof, with 900Hz and 1100Hz.
> 
> I'm using it on HF.  I seem to copy other stations just fine, but they
> have difficulty copying me.  They can, sometimes, but it is hard going
> and lots of retrans on my end.
> 
> On the output side, I've tried running loud volume and quieter volume.
> K7TMG suggested that I set the power on the rig to 100W, then reduce the
> audio volume to it until it is transmitting with only 50W.  That maybe
> helped marginally.
> 
> Any other suggestions on what I could do to improve the TX side of
> soundmodem on HF?

Several suggestions:

(1) Use a standard oscilloscope, and take look at the waveforms
    of the signals you are generating from your sound card's
    line outputs.

    I found that on one of my laptops, trying to generate full-
    amplitude signals was "flat-topping" the audio waveform...
    it was being clipped quite badly.  Turning down the sound
    card "master" volume reduced the amplitude but did not
    eliminate the flat-topping... turning down the individual
    "PCM volume fixed the problem entirely.

    This was clearly a design flaw in the sound "card" in the
    Dell laptop... other sound interfaces did not exhibit
    the problem.

(2) Check the voltage levels of the signals going into the
    HF rig's input (auxiliary or mic) - you may be overdriving
    the input, or there might be a DC offset on the signal for
    some reason.  You may need a DC-blocking capacitor or
    a resistive padder to match the levels required.

(3) Use an RF monitor of some sort (either a monitor scope
    such as an old Heathkit HO-10, or an oscilloscope)
    to take a look at your RF envelope and make sure it
    is clean and not distorted.

(4) Have a friend some distance away take a look at your
    signal on a "digital modes" program's waterfall
    display... make sure the distance between the tones is
    correct, and make sure you aren't "splattering" due
    to distortion somewhere along the way.

(5) If you aren't using a transformer-isolated audio
    interface between PC and radio, try one... if you
    are, try adding a few ferrites around the cable to the
    radio.   You might be getting transmitter RF coupling
    back in the the audio, which would cause distortion and
    mess up the waveform.

