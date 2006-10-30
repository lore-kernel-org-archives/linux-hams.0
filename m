From: richard <richard.bown@blueyonder.co.uk>
Subject: Re: gmfsk
Date: Mon, 30 Oct 2006 23:44:22 +0000
Message-ID: <45468E56.1090903@blueyonder.co.uk>
References: <4544D1A7.3010103@blueyonder.co.uk>	 <20061029213157.GA25286@cloud.net.au> <45452E68.9060601@blueyonder.co.uk>	 <454636E0.6090009@blueyonder.co.uk>  <20061030213843.GB25496@cloud.net.au> <1162246448.5345.5.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1162246448.5345.5.camel@oh2bns.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Tomi Manninen wrote:
> On Tue, 2006-10-31 at 08:38 +1100, Hamish Moffatt wrote:
>
>   
>> I don't think there is a CW decoder anyway.
>>     
>
> 0.7pre1 has one.
>   
Now I know about the permissions problem, I've noticed it decodes well 
at 38wpm.
Not that many can read at that speed, definitely not me :)
>   
>> I had more success when I set the sampling rate to 48000. My sound card
>> doesn't really have the lower rates and the sample rate converter inside
>> gMFSK seems to do a better job than the ALSA one which is providing
>> /dev/dsp.
>>     
>
> This is a good suggestion. I've heard lots of complaints about the
> sample rate conversion stuff in ALSA.
>
>   
>>> What is giving me a real problem is that if I go to TX I get the box up 
>>> with:-
>>> "sound_open_for_write:opensnd: /dev/dsp: Deviceor resource busy"
>>>       
>> Could be that gMFSK requires (inadvertently?) a full duplex sound card
>> which yours is not? Unlikely though.
>>     
Is'nt the delta 66 capable of full duplex ?
>
> It shouldn't. I've tried to make gMFSK as simple as possible here:
>
> - open card for reading
>   - listen and decode
> - close card
> - open card for writing
>   - send
> - close card
>
> ... and so on.
>
> That should be pretty fool proof, but I guess anything is possible.
>
>   
It might be foolproof, but not quite proof against me.
Another thing I've found, after loading FFTW Wisdom it now allows two 
failure in TX mode to write to /dev/dsp
before the waterfall goes extra fast and no input signal is seen or 
decoded..
That could be a bug as Hamish suggested

If I can get the permissions sorted, its working, but at the moment only 
if run by root..

Richard



