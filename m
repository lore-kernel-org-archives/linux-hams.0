From: <BobDonnell@arkalmus.com>
Subject: RE: Pc/rig interface for packet
Date: Thu, 1 May 2003 13:38:09 -0700
Sender: linux-hams-owner@localhost
Message-ID: <096FB52976B50F458D5977CC9B40C9D9011396@Exchange.arkalmus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
content-class: urn:content-classes:message
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mm@UDel.Edu, linux-hams@vger.kernel.org

Hi Mike,

My two cents worth:

I prefer the Baycom modem approach, if where you're headed is the
1200-baud packet world.

My thinking:

Baycom needs a single cable connection to your PC.  The DB9 or DB25
connector is rugged, has a reasonably high resistance to being pulled
out of the connector, and can be screwed down, if needed.  This cable
connection carries only data.  The modem 'steals' operating power from
the serial data port.  This might not work well with some laptops, but
generally works fine for desktop PC's.  Many radios provide receive
audio on the microphone connector, and some even provide that audio at a
fixed level, so the position of the volume control is not important.
Some even provide unsquelched audio, which is even better.  Even better
is if your radio has a data connector, that definitely provides the
connections you need, all on one connector.  You can create a fairly
short radio cable, reducing your susceptibility to RF fields, and all of
the audio and PTT functions are handled at the modem, reducing your
likelihood of a ground loop affecting transmitted audio.  You'd see an
AC ground loop if the chassis of your radio is at a significantly
different potential than the PC.  This should be solved pretty easily by
running a substantial ground wire between the PC case and the radio
case.

By contrast, using a soundcard interface requires 3 cables from the PC -
one for audio it, one for audio out, and one connected to either a
serial or parallel port for controlling PTT.  The serial or parallel
connection benefits in the same way as the Baycom - fair resistance to
accidental removal, can be screwed down.  The audio connections to the
sound card are a whole different ball game though - they're easy to pull
out, don't have any standard way to be retained, and the tension on the
connection points of the plug/socket interface suffer from low tension,
such that a poor connection to either the 'hot' or 'ground' connections
is very possible.  Additionally, typically the sound card connections
are not screwed to the backplane of the computer - they are frequently
supported only by being soldered to the PC board.  This problem is even
worse if you want to try to use a laptop.  I've not confirmed this, but
I bet there's not much RF susceptibility suppression on a typical sound
card, either.  So if you have long leads between the soundcard interface
box and either the radio or the computer, each of those wires represents
an antenna that can pick up RF and get it to a place where it might be
rectified and affect your transmitted signal quality.  Fully isolating
the sets of wires helps shrink the size of the antenna somewhat.

The sound card interface gives you the potential to play with modes that
can only be supported that way.

Hope that provides food for thought.

73, Bob, KD7NM
-------------------------------------------------
Robert Donnell, KD7NM
14507 Madison Way
Lynnwood, WA  98037
Ph: 425-741-0999
Mailto:kd7nm@pugetsound.net
-------------------------------------------------



>-----Original Message-----
>From: linux-hams-owner@tpa4.isomedia.com
>[mailto:linux-hams-owner@tpa4.isomedia.com]On Behalf Of Mike Markowski
>Sent: Thursday, May 01, 2003 11:01 AM
>To: Linux Hams
>Subject: Pc/rig interface for packet
>
>
>Thanks, everyone, for your helpful responses of a couple weeks ago.
>I've now got my rig talking to my laptop via hamlib - I love xlog's
>use of hamlib!
>
>I had other things occupying time for the last couple weeks but
>now want to get back to getting a packet radio set-up up &
>running.  The user mode soundmodem & kernel (2.4.20) w/mkiss
>support is now compiled, though I haven't finished going through
>the HOWTO to get everything else set up - that AX.25 HOWTO seems
>to go on and on...  :-o  I haven't bothered finishing it yet
>because I still have to make a cable, which brings me to my
>question.
>
>For the rig/pc cable do you have opinions of the two choices I'm
>aware of:
>
>   * Use a simple idea like
>     http://www.baycom.org/~tom/pcf/ptt_circ/ptt.html
>
>   * Buy the Rascal kit (US $20) at
>     http://www.packetradio.com/psk31.html
>
>Would electrically isolating the Tx/Rx/PTT signals like in the Rascal
>kit make a significant difference?  I read that the isolation is
>important if you want to use packet on HF.
>
>	Thanks!
>	Mike   AB3AP
>-
>To unsubscribe from this list: send the line "unsubscribe 
>linux-hams" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
