From: "Riley Williams" <rhw@InfraDead.Org>
Subject: Re: no data from user-mode soundmodem
Date: Mon, 2 Sep 2002 23:30:27 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <003101c252d0$6248ab40$5ffca8c0@UFP.CX>
References: <NCBBKMFJEOGLLIAIAGGJIECDFDAA.dlr@cs.pdx.edu>
Reply-To: "Riley Williams" <Riley@Williams.Name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Roloff <dlr@cs.pdx.edu>
Cc: Linux Ham Radio <linux-hams@vger.kernel.org>

Hi Daniel.

>>>> I have successfully gotten the user-mode soundmodem working on
>>>> two Linux systems, but a third one has me stumped. The systems
are
>>>> all very similar. For two of them, I had to install the alsa
sound
>>>> drivers to get the i810 audio to work, but after doing that, one
>>>> of the systems seems to be working fine.  (So far, I have only
tried
>>>> receiving packet data.) The other system brings up the sm0 device
>>>> (as reported by ifconfig), but never receives any packets. But
>>>> using soundmodemconfig shows audio getting to the modem and
>>>> DCD being detected. Also, using soundmodem -v255 shows DCD
>>>> being set appropriately. Neither soundmodem or soundmodemconfig
>>>> fully decode any packets though, (i.e.. nothing is printed to
stdout, or
>>>> to the diagnostic modem text window).
>>>>
>>>> In kisspkt.c, pktput is called, as is hdlc_receive, but that's as
>>>> far as I got with my debug attempt.

>>> I was able to get a little farther with debugging this and it
seems
>>> that the received packets are not passing the check_crc_ccitt
>>> call. I commented this call out and data is being received, but it
>>> is about half garbage.

>> The purpose of the check_crc_ccitt call is to detect and reject
>> packets that have been mangled, and that is apparently what is
>> happening to your packets, so check_crc_ccitt is correctly
>> rejecting them. That states that whatever the problem is, it
>> precedes that call.

>>> I do not know what is causing this because the receiver audio
>>> (through the soundcard) sounds good and looks good on the
>>> soundmodemconfig diagnostic tools. I'll be investigating it some
>>> more though.

>> To check your station out, temporarily rewire your soundcard so the
>> transmitted audio is fed straight back into the receiver.

> I haven't solved the problem yet, but here's an update. I didn't try
the
> audio loopback test mentioned above, but I did feed the output from
> another computer's soundcard (running soundmodem) into the non-
> working soundmodem.

> When I did this, the troublesome soundmodem would decode about
> 1/3 of the packets sent to it. This is better than what it does over
the
> radio, but not acceptable, as the signal from the other computer is
> probably very good.

One obvious possibility is that the soundcard is receiving either too
strong or too weak a signal from the receiver, which is always
possible when the source is from a different device than the soundcard
in question. The audio loopback usually eliminates that particular
possibility since the line out and line in sockets are usually both
designed for the same signal level.

> I should also mention that I have tried 3 different receivers and
> they all work fine when connected to other computers and their
> soundcards. But none of them work on this one computer.

That in itself almost certainly indicates a hardware problem in that
computer.

> The software is very similar on all the systems and even the
> hardware is similar. (All Pentium IIIs and similar sound chips.)
> The non working system is the fastest and is the only desktop
> (about 1000 MHz).

Neither the speed nor the fact that it is a desktop is likely to be
relevant here.

> I have not tried transmitting anything yet, but I was able to send
> the audio from the troublesome system to one of the working
> systems and it was reliably decoded.

That almost certainly indicates a problem with the receive hardware in
the soundcard.

> So I would think there must be some problem with the soundcard in
> the desktop system, though it seems to work properly in other uses.

You have to remember that applications like this are probably the most
taxing that one can ask of a soundcard - to produce a signal that is
to be electronically "read" at the other end. Most soundcards are
primarily designed for the human ear, and that  is generally a lot
more tolerant of mis-shaped waveforms than any electronic device. As
radio hams, we are generally demanding perfect sine waves for the
output, not just the smoothed square waves that some cheapo sound
cards produce.

Best wishes from Riley.


---
This outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.381 / Virus Database: 214 - Release Date: 04/Aug/2002

