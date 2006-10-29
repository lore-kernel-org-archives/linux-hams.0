From: richard <richard.bown@blueyonder.co.uk>
Subject: Re: gmfsk
Date: Sun, 29 Oct 2006 22:42:48 +0000
Message-ID: <45452E68.9060601@blueyonder.co.uk>
References: <4544D1A7.3010103@blueyonder.co.uk> <20061029213157.GA25286@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20061029213157.GA25286@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hamish Moffatt wrote:
> On Sun, Oct 29, 2006 at 04:07:03PM +0000, richard wrote:
>   
>> Cant seem to get audio routed to GMFSK , it compiled OK as far as I 
>> know, no errors .
>> In settings , selecting device /dev/dsp  /dev/dsp1 /dev/dsp2 doesn't 
>> route audio to the program.
>> I've determined that /dev/dsp2 is the mic input off the webcam, so that 
>> can be ignored.
>>     
>
> Is /dev/dsp actually the ALSA emulation, ie you are using ALSA natively?
> Can you send the results of "aplay -l" so we can see how ALSA has
> detected your devices?
>   
I've got the internal card disabled in the bios now.
[ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: M66 [M Audio Delta 66], device 0: ICE1712 multi [ICE1712 multi]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
<snip>
>> Is this behaviour I'm seeing on GMFSK normal , ie displaying garbage on 
>> /dev/dsp1  ??
>>     
>
> Not sure what you mean by garbage?
>   
If I leave the mode in MSK16 or CW there is always a waveform shown,
even when there is no input.
With all the connections to the inputs on the break out box
disconnected, the waterfall is plain grey, yet there
is a noisy waveform and the percentage indicator is showing 10% .
I've had a look at the noise floor in winrad and I cant see anything
which would cause this.

I've noted /dev/dsp is  busy if put in transmit mode.
ps ax showed artsd running, but killing it makes no difference to the
device busy message..

Connecting an audio source with a 1KHz tone ,shows a line in the right
place on the waterfall display

<another snip>
> Is that the configuration you want? I don't think there is any support
> in gMFSK for input and output on different devices. Your setup sounds
> unusual (perhaps unusually complicated?).
>   
No I don't need input and out on different cards, just something that
decodes

It could also be I'm at the bottom of the learning curve with this package.

TIA
73  Richard



