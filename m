From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: 300bps Packet (and EHAS) - what is pam, psk, and newpsk,
Date: Sat, 27 Nov 2010 00:10:31 +0200
Message-ID: <4CF03057.7080402@sral.fi>
References: <4CEB5074.2070008@complete.org> <4CEB5C66.1050803@exemail.com.au> <6CE4D96A7B544D30919A49105B458915@LIVINGROOM> <4CEC16EF.8060106@radagast.org> <BD133160888F43CA9735B652903C2FF1@LIVINGROOM> <4CED5B60.5040108@radagast.org> <40C75B79D58C4ECDBC044010559CE8CA@LIVINGROOM> <4CEEB394.3020305@trinnet.net> <CF65928CBF594B608362298FFC1B9470@LIVINGROOM> <4CEF444F.6010308@trinnet.net> <4CEF5A70.4050600@radagast.org> <4CF0040D.3000303@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CF0040D.3000303@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: linux-hams@vger.kernel.org

David Ranch wrote:

> That's a great explanation of FSK though I don't understand why radio=
s=20
> like my FT-950 have separate AFSK and FSK inputs.  I would have assum=
ed=20
> they would have a common input and you select the mode of that input=20
> (AFSK or FSK).  Of course, this assumes that I make the proper=20
> adjustments to my sound card for the deviation, etc.

The "AFSK" input in your radio is more or less just another microphone=20
input and the output just another speaker output. You connect those
to the computer soundcard. During transmit, the radio modulates
the audio signals using whatever modulation is active. FM or USB/LSB.
And of course the other way around on receive.

The "FSK" input in your radio is a digital input. I took a look at the
=46T-950 manual and it says that grounding the input results in the
radio sending a carrier on one frequency and not grounding sends
a carrier on another frequency.

> The two FSK modes I've commonly heard about (being a new HAM) is pack=
et=20
> (I've always done AFSK even at 9600) and RTTY.

You have used the "AFSK" input to do something that the Yeasu
manual describes as "AFSK based data modes". The manual seems to
happily use terms that are at the very least confusing, even
downright wrong if you ask me...

"=93Packet=94 operation also applies to SSB-based AFSK data modes, such=
 as=20
PSK31, etc." -- yeah, right.. :)

>  I can see how FSK can=20
> result in a better transmitted signal as it's really up to the radio =
to=20
> do the transmission and the computer is only telling what it should=20
> eventually send. =20

Yes. But you can really only use the "FSK" mode for RTTY. The "FSK"
input doesn't enable the computer to do any kind or pulse shaping
and that is only usable on RTTY.

> With that said, it seems like AFSK with a properly=20
> tuned sound system (flat frequency response, etc.) should be able to =
do=20
> everything that FSK could do.  Is that an incorrect assumption?

Now as we are actually talking generating RF signals with an
SSB modulator, then you're right. In the ideal world
generating a modulated waveform on audio and feeding it to an
SSB modulator results in a perfect copy of the modulation
mapped on RF. In the real world things aren't quite that
rosy, there are imperfections. But when done with care,
it works good enough.

>  >The modem is actually a binary PAM modem (Pulse Amplitude Modulatio=
n),
>  >ie. it outputs the data as voltage pulses. When these are fed to an=
 FM
>  >modulator, the resulting signal on RF is FSK modulated. Hence the n=
ame.
>  >
>  >Of course there are other features that make this modem G3RUH - lik=
e
>  >the way the data is scrambled before modulation etc.
>=20
> Interesting.. *pulse amplitude*?

Yes. Between the computer and your radio, information is
in this case conveyed in the amplitudes of voltage
pulses. Binary means there are two distinct voltage levels
used, let's say -1V and +1V, and they represent a single bit
of information (0 or 1). In a general case a PAM modulation
may have more levels and one PAM symbol may transmit more
than one bit of information. This kind of modulation
is often used in baseband transmission, for example in
ethernet over twisted pair cables.

It is also important to realize that for example in the
G3UH case, the pulses are not rectangular, they are shaped.
This greatly affects the used bandwidth.

>  I think most HAMs are in agreement=20
> that HF packet doesn't work well for various reasons.  Since you=20
> mentioned "FM", I assume this mode is not suitable for use with SSB o=
n=20
> the HF bands?   Any thoughts on its width of spectrum it uses, etc?

Like I said, feeding PAM to an FM modulator results in (shaped)
=46SK signals over the air and that is the ultimate goal in a
system like "G3RUH packet".

=46eeding this kind of PAM to an SSB modulator would result in
a completely different kind of modulation over the air. Of the
top of my head, I can't say what it would actually be but
most probably nothing useful. I'm quite sure it wouldn't
work at all as like Dave Platt said, this needs a very
low frequency response and the typical ham SSB modulator
cuts at around 300Hz in the low end.

> 1) You mentioned a "DSP56002EVM"... is that a specific DSP chip and t=
his=20
> mode was then ported into Soundmodem running on X86?=20

Yes, the Motorola 56002 was a member of an old DSP chip family
and the DSP56002EVM was an evaluation kit with the dsp chip,
memories, codecs etc.

Pawel wrote the original modem in assembler for the 56002
and I ported it to C to be run on Linux.

> 2) 2500 or 3000?  For an HF mode, that sounds FAST.  which leads me t=
o=20
> my next point..

Yes, it is fairly fast. With FEC the payload data rate drops though.
The best FEC (which I recommend) is 1/3 and then the actual payload
data rate is 833 or 1000 bps.

> 3) This mode is interesting to me and I think I once saw it on the ai=
r. =20
> If there are 15 carriers, how wide is each carrier, and what is the=20
> spacing between them?  What's the total consumed spectrum at say 2500=
?  =20
> It seems that 300BAUD AFSK packet is a bit less than 400Hz.

Carrier spacing is 125Hz at 2500 and thus occupied bandwidth
is about 15 * 125 Hz, ie. little less than 2 kHz.

> 4)You mentioned that you received complaints that this mode didn't=20
> work.  Were those complains on your soundmodem implimentation or on t=
he=20
> MixW version?  Being a Linux only user, I don't care about MixW.  ;-)=
 =20

I think it was mostly from users with MixW. But MixW uses exactly
the same source code and it worked for me quite well (at that time
I had a work laptop that was restricted to M$ only).

> 5) Assuming that my assumption from point #2 above is true and the=20
> Soundmodem implementation works well with  other speeds, if I was to=20
> tune this down to say 900 BAUD to improve the reliability on HF, any=20
> guesses to what it would do to the number of carriers, their spacing,=
=20
> etc? =20

The carrier frequencies, their spacing, the occupied bandwidth, the=20
symbol rate all scale 1:1 with the "bps" setting.

But like I said, don't do that. I really regret that I made
the soundmodem implementation so flexible.

Besides, you are now confusing Baud (ie. symbols per second) with
bits per second. They are not the same. At 2500 bps the newqpsk
modem runs at 83.333 Baud (symbols per second).

>  >--> Dave Platt
>> An alternative might be to use a multi-carrier HF digital
>> mode - one which sends a bunch of different carriers,
>> each modulated at a relatively low rate.  Some of the
>> keyboard-to-keyboard HF digital modes work this way...
>> but I'm not aware of anyone having used those modulations
>> as ways of wrapping an AX.25 or IP packet for HF digital
>> use.
>>  =20
> Correct me if I'm wrong but it sounds like Tomi's  newqpsk mode does=20
> exactly that and should be legal in the US.

I don't remember if there was an agreement over the legality in the US
and obviously that is not very interesting to me :)

However as to IP over AX.25 over newqpsk on HF. Been there, done that,
it was fun. :)

/Tomi

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
