From: "Andrew Errington" <a.errington@lancaster.ac.uk>
Subject: Re: USB sound adapter for use with Tom's soundmodem?
Date: Sat, 13 Dec 2008 17:19:11 +1300 (NZDT)
Message-ID: <4388.219.89.148.235.1229141951.squirrel@webmail02.lancs.ac.uk>
References: <49432397.8060304@weca.org>
    <courier.4943332E.0000255C@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <courier.4943332E.0000255C@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

Spookily enough I have been thinking exactly the same thing.

The real cheap USB audio devices seem to work in Linux.  They're less than
NZ$10 in New Zealand, but I don't actually have one yet.

Here's a report of someone successfully using one in Linux, with a picture
to show the particular model (there are many USB audio adaptors, but that
particular plastic moulding style seems common):

http://www.hermann-uwe.de/photoblog/3d-sound-usb-audio-device

Here's some further information on actually getting the driver running:

http://www.hermann-uwe.de/blog/playing-audio-on-the-nslu2

And here's some general discussion of some different USB audio devices and
issues:

http://www.nslu2-linux.org/wiki/HowTo/SlugAsAudioPlayer

Maybe the sampling rate mismatch will be an issue with these devices too.

:(

The discussion is targeted at the LinkSys NSLU2 device, but I think the
information can be extrapolated to Linux in general.

My particular interest is in the LEDs on the USB thingummybob.  If they
can be programmed easily then the audio adapter could become a self
contained audio in/out/PTT device (with the LED line controlling a
transistor or something for PTT).  I don't yet have a unit to experiment
with (despite them being very cheap) but I think the idea has merit.  If
someone else wants to dabble...

73,

Andrew
ZL3AME


On Sat, December 13, 2008 16:59, Dave Platt wrote:
>> Can anyone recommend a USB sound adapter for use with Tom's soundmodem?
>>  I'm building an aprsdigi with a newer server I was given that has no
>> motherboard sound and no PCI slots (and no parallel port to do an easy
>> PTT with either:-(  I see there's a few choices out there and was
>> hoping one of you had already found one that you could recommend.
>> Thanks.
>>
>
> I've just been spending some time trying to get the SignaLink USB to
> work with the soundmodem.  Have run into a few problems, think I understand
> their cause, and am working on fixes.
>
> First problem noted:  the AFSK modem would not even start to receive
> when using soundmodemconfig.  The ALSA audio glue complained about the RX
> and TX sample rates being different (and the code has a comment in it to
> the effect of "Make different-rate configurations work, or take them
> out.")
>
> The cause:  apparently, the TI USB sound chip in this device publishes
> a different set of sample rates as being available for its input and output
> endpoints.  When the device is opened using the "hw:" ALSA specifier (as
> is suggested by the setup dialog), only the actual adapter sample rates
> are available, and since none of them happens to match the sample rate
> that the Soundmodem asks for, the closest-available rates are offered to
> the soundmodem.  These offered rates are different and the Soundmodem
> balks.
>
> Workaround:  type in "plughw:1,0" as the device to use.  The "plughw:"
> module will do software sample-rate conversion when necessary, and in this
> case it allows the Soundmodem to use the sample rate it wants. The same
> rate is used for both the RX and TX channels, and all is well.
>
> At this point, incoming AFSK packets started being decoded reliably
> (as long as the receiver squelch was opened).
>
>
> [Possible alternative - use the ALSA/OSS emulation module, the
> SoundModem OSS interface, and open /dev/dsp1.  I don't recommend
> this, as I've observed numerous problems and data glitches in the OSS
> emulation sample rate converter.]
>
> Second problem noted:  the soundmodem app would either stop receiving
> and transmitting, or exit abruptly with a "closed pipe" error.
>
> The cause:  the ALSA drivers will report a "closed pipe" any time the
> internal audio state machine goes into the XRUN state, which occurs if
> there's a buffer overflow (on receive) or underflow (on transmit). This
> apparently can occur due to timing / race conditions during TX/RX
> turnaround.  It's necessary to restart the TX or RX channel with a
> "prepare" call, and it appears that the Soundmodem code doesn't do
> this if an EPIPE error occurs... instead, it bails out and dies.
>
> I haven't yet modified the Soundmodem code to do what's necessary but
> I don't think it'll be difficult.
>
>
> I've had good results with the SignaLink USB using other sound
> packages, for PSK31 and other digital modes, and I believe it'll work well
> for AFSK packet once the driver-interface glitches are dealt with.
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html
>
>


