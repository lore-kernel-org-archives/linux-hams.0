From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: 300bps Packet (and EHAS) - what is pam, psk, and newpsk,
Date: Sun, 28 Nov 2010 06:50:59 +1100
Message-ID: <4CF16123.4050006@exemail.com.au>
References: <4CEB5074.2070008@complete.org> <4CEB5C66.1050803@exemail.com.au> <6CE4D96A7B544D30919A49105B458915@LIVINGROOM> <4CEC16EF.8060106@radagast.org> <BD133160888F43CA9735B652903C2FF1@LIVINGROOM> <4CED5B60.5040108@radagast.org> <40C75B79D58C4ECDBC044010559CE8CA@LIVINGROOM> <4CEEB394.3020305@trinnet.net> <CF65928CBF594B608362298FFC1B9470@LIVINGROOM> <4CEF444F.6010308@trinnet.net> <4CEF5A70.4050600@radagast.org> <4CF0040D.3000303@trinnet.net> <4CF03057.7080402@sral.fi> <4CF1403E.5080303@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CF1403E.5080303@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: David Ranch <linux-hams@trinnet.net>
Cc: Tomi Manninen <oh2bns@sral.fi>, linux-hams@vger.kernel.org

Dave,

You might look for two articles by James Miller, G3RUH, '9600 Baud=20
Packet Radio Modem Design' and 'The Shape Of Bits To Come', which=20
describes various modulation methods and their bandwidth.

I have the article in an ARRL publication called 'Packet: Speed, More=20
Speed & Applications'. However, both articles reference ftp.amsat.org=20
where they can be found at  /amsat/articles/g3ruh/a109.zip and =20
/amsat/articles/g3ruh/a108.zip respectively.

Ray vk2tv

On 28/11/10 04:30, David Ranch wrote:
>
> Hello Tomi,
>
>> You have used the "AFSK" input to do something that the Yeasu
>> manual describes as "AFSK based data modes". The manual seems to
>> happily use terms that are at the very least confusing, even
>> downright wrong if you ask me...
> Oh yes, and a lot of documentation out there online and in the books=20
> has lots of conflicting information.
>> "=93Packet=94 operation also applies to SSB-based AFSK data modes, s=
uch=20
>> as PSK31, etc." -- yeah, right.. :)
> Well, on the FT-950, the dedicated button for RTTY is enables the FSK=
=20
> inputs and also activates some specific narrow filters and=20
> processing.  The PACKET button activates the AFSK inputs but also=20
> enables different specific filters and processing.  I do realize that=
=20
> Packet can be FSK but it's not on this radio.
>
>> It is also important to realize that for example in the
>> G3UH case, the pulses are not rectangular, they are shaped.
>> This greatly affects the used bandwidth.
> You've mentioned a few times of how the G3UH does unique things such=20
> as scrambling and now waveform shaping.  I'm going to have to look=20
> around to see if I can find some documentation on all this that=20
> doesn't quickly go into hardcore math.  I've always loved the concept=
=20
> of signal processing but I don't know if my brain can handle it.
>
>
>>
>>>  I think most HAMs are in agreement that HF packet doesn't work wel=
l=20
>>> for various reasons.  Since you mentioned "FM", I assume this mode=20
>>> is not suitable for use with SSB on the HF bands?   Any thoughts on=
=20
>>> its width of spectrum it uses, etc?
>>
>> Like I said, feeding PAM to an FM modulator results in (shaped)
>> FSK signals over the air and that is the ultimate goal in a
>> system like "G3RUH packet".
>>
>> Feeding this kind of PAM to an SSB modulator would result in
>> a completely different kind of modulation over the air. Of the
>> top of my head, I can't say what it would actually be but
>> most probably nothing useful. I'm quite sure it wouldn't
>> work at all as like Dave Platt said, this needs a very
>> low frequency response and the typical ham SSB modulator
>> cuts at around 300Hz in the low end.
>
> Ahhh... understood and from this thread, I never realized that a=20
> souncard mode needs to be specifically designed for say SSB vs. FM.  =
I=20
> naively thought that the modulation would only impact the noise=20
> immunity, spectrum used (and the resulting power) use, etc.  The=20
> concept that an digital waveform from a soundcard sent into a SSB vs=20
> FM modulator and the results being very different is a foreign concep=
t=20
> to me.  I'm going to have to read up on this... interesting!
>
>>
>>> 1) You mentioned a "DSP56002EVM"... is that a specific DSP chip and=
=20
>>> this mode was then ported into Soundmodem running on X86?=20
>>
>> Yes, the Motorola 56002 was a member of an old DSP chip family
>> and the DSP56002EVM was an evaluation kit with the dsp chip,
>> memories, codecs etc.
>>
>> Pawel wrote the original modem in assembler for the 56002
>> and I ported it to C to be run on Linux.
>
> You know, I was optimizing my Linux packet system startup scripts=20
> yesterday (=20
> http://www.trinityos.com/HAM/CentosDigitalModes/usr/local/sbin/packet=
rig.sh=20
> ) and when playing around with the Linux AX.25 "kissparms" program, I=
=20
> noticed that the man page states:
> --=20
>       -e FEC error correction level
>                   Sets the FEC error correction level in a DSP card=20
> based modem  (KISS  parameter  8).  Larger
>                   correction  level means better noise resistance, bu=
t=20
> slower throughput on a good connection.
>                   This is an experimental feature found in a QPSK=20
> modem for the Motorola DSP56001  based  DSP4
>                   and EVM cards only.
> --=20
>
> Maybe this support is derived from some of the work you and Pawel did=
?
>
>
>
>>
>>> 3) This mode is interesting to me and I think I once saw it on the=20
>>> air.  If there are 15 carriers, how wide is each carrier, and what=20
>>> is the spacing between them?  What's the total consumed spectrum at=
=20
>>> say 2500?   It seems that 300BAUD AFSK packet is a bit less than 40=
0Hz.
>>
>> Carrier spacing is 125Hz at 2500 and thus occupied bandwidth
>> is about 15 * 125 Hz, ie. little less than 2 kHz.
> Right.. and what I expected you to say.  That's a chunk of bandwidth=20
> and I was hoping that if I was to lower the speed, maybe I could lowe=
r=20
> the BW but it doesn't sound like the mode supports that approach. =20
> Again, my goal would be to use a FEC-enabled mode for AX.25 that woul=
d=20
> give an effective 300BAUD throughput.  Even if I was to dig through=20
> your code, hacked out a few carriers,  I highly doubt the mode would=20
> find any real traction.  It seems most hams have a general disdain fo=
r=20
> packet though I think it's fantastic (though slow).
>
>
>> The carrier frequencies, their spacing, the occupied bandwidth, the=20
>> symbol rate all scale 1:1 with the "bps" setting.
>>
>> But like I said, don't do that. I really regret that I made
>> the soundmodem implementation so flexible.
> QSL and when I try this out (if I can find any other HAMs to maybe=20
> test this with), I'll keep this in mind.
>
>
>> Besides, you are now confusing Baud (ie. symbols per second) with
>> bits per second. They are not the same. At 2500 bps the newqpsk
>> modem runs at 83.333 Baud (symbols per second).
> Right, and I know better.  Sorry.
>
>
>
>> However as to IP over AX.25 over newqpsk on HF. Been there, done tha=
t,
>> it was fun. :)
> So, if that was been there, done that.  What's fun for you now?  =20
> Maybe data and CODEC2 over GMSK?  Maybe WinMor?
>
>
> --David
> --=20
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
