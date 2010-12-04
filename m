From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: soundmodem TX on HF again
Date: Sun, 05 Dec 2010 08:20:46 +1100
Message-ID: <4CFAB0AE.4080200@exemail.com.au>
References: <4CFA6753.1010105@complete.org> <4CFA82D4.9030300@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CFA82D4.9030300@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Platt <dplatt@radagast.org>
Cc: John Goerzen <jgoerzen@complete.org>, Linux-Hams <linux-hams@vger.kernel.org>

On 05/12/10 05:05, Dave Platt wrote:
> On 12/04/2010 08:07 AM, John Goerzen wrote:
>    
>> Hi folks,
>>
>> Well I've got soundmodem 300 baud working, sortof, with 900Hz and 1100Hz.
>>
>> I'm using it on HF.  I seem to copy other stations just fine, but they
>> have difficulty copying me.  They can, sometimes, but it is hard going
>> and lots of retrans on my end.
>>
>> On the output side, I've tried running loud volume and quieter volume.
>> K7TMG suggested that I set the power on the rig to 100W, then reduce the
>> audio volume to it until it is transmitting with only 50W.  That maybe
>> helped marginally.
>>
>> Any other suggestions on what I could do to improve the TX side of
>> soundmodem on HF?
>>      
> Several suggestions:
>
> (1) Use a standard oscilloscope, and take look at the waveforms
>      of the signals you are generating from your sound card's
>      line outputs.
>
>      I found that on one of my laptops, trying to generate full-
>      amplitude signals was "flat-topping" the audio waveform...
>      it was being clipped quite badly.  Turning down the sound
>      card "master" volume reduced the amplitude but did not
>      eliminate the flat-topping... turning down the individual
>      "PCM volume fixed the problem entirely.
>
>      This was clearly a design flaw in the sound "card" in the
>      Dell laptop... other sound interfaces did not exhibit
>      the problem.
>
> (2) Check the voltage levels of the signals going into the
>      HF rig's input (auxiliary or mic) - you may be overdriving
>      the input, or there might be a DC offset on the signal for
>      some reason.  You may need a DC-blocking capacitor or
>      a resistive padder to match the levels required.
>
> (3) Use an RF monitor of some sort (either a monitor scope
>      such as an old Heathkit HO-10, or an oscilloscope)
>      to take a look at your RF envelope and make sure it
>      is clean and not distorted.
>
> (4) Have a friend some distance away take a look at your
>      signal on a "digital modes" program's waterfall
>      display... make sure the distance between the tones is
>      correct, and make sure you aren't "splattering" due
>      to distortion somewhere along the way.
>
> (5) If you aren't using a transformer-isolated audio
>      interface between PC and radio, try one... if you
>      are, try adding a few ferrites around the cable to the
>      radio.   You might be getting transmitter RF coupling
>      back in the the audio, which would cause distortion and
>      mess up the waveform.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>    
Just a few jottings.

I've been running 0k3 packet for about 14 years (BBS for 13), using both 
TNC's and a Baycom USCC>4 card. I've NOT used Soundmodem however, I 
expect my finding will be just a relevant, being that they are 'mode' 
specific, not modem specific.

One TNC parameter that doesn't get much mention (except in old 
documents) is txtail, which holds the tx up to ensure the last packet is 
FULLY sent. I spent ages trying to figure out why I couldn't connect 
reliably to remote stations. txtail is the -l parameter for KISS TNC's 
and I use a value of 40 for HF. If I set txtail to zero I can be assured 
of unreliable (if any) connections to remote stations. Some (old) 
documentation suggests txtail is deprecated but it's still available in 
kernel ax25.

I DO NOT know if txtail is an available parameter in Soundmodem, having 
never used it.

Also, don't overlook slow PTT. One old HF rig I had here needed TXD of 
450mS.

Clipped audio from excessive PCM level is more specific to cheap 
domestic sound cards than it is to laptops or any specific brand. My 
professional card (for serious audio work) cannot even be forced into 
that condition.

There is NO substitute for an oscilloscope (a software CRO is ok) when 
looking for audio related problems. That picture is worth a thousand 
head scratches.

RF feedback can be a serious issue on HF, hence the advice in (5) above 
to isolate and filter. If you can listen to your signal, it will sound 
quite different to other signals if RF is getting into the tx audio.

Reducing audio drive also reduces RF level for SSB and this can be a 
useful aid when looking at RF feedback as a potential problem.

Not related to the current problem but, HF packet suffers less retry-out 
events if FRACK is set above 10, I use around 13 (seconds). I found it 
greatly improved circuit reliability.

Ray vk2tv
