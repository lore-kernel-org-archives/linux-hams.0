From: Dave Platt <dplatt@radagast.org>
Subject: Re: soundmodem activates PTT on DCD
Date: Fri, 19 Aug 2005 14:18:01 -0700 (PDT)
Message-ID: <20050819211801.2675.qmail@radagast.org>
References: <43064667.5020604@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <43064667.5020604@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kd8atu@gmail.com
Cc: linux-hams@vger.kernel.org

Joe Veldhuis <kd8atu@gmail.com> wrote:
> I have soundmodem working for the most part. It decodes and encodes just
> fine except for one problem: when I enable PTT control through the
> serial port, it keys the rig whenever it starts decoding. This makes it
> impossible to recieve anything, and also jams the signal to some extent.

I ran into this problem a year or so ago, when I bought a Buxcomm RASCAL GLX
soundcard interface.  This interface will activate PTT whenever either
RTS or DCD is asserted on the RS-232 port.

The soundmodem asserts RTS to transmit, and it asserts DTR whenever it
detects carrier.  The symptom is as you indicate - when the beginning of
an incoming packet is detected, DTR is asserted, the rig keys up, and
the incoming packet is chopped off and QRM'ed.  Not good.

The older RASCAL interfaces don't do this - they key PTT only for the
RTS line, and don't exhibit this problem.

> From reading through the archives, it seems that soundmodem sends some
> kind of signal on the serial port when it goes into DCD mode. This is
> probably what is keying the rig. Does anyone have any ideas as to how I
> can stop it from doing that?

There are two ways to deal with the problem, I think:

[1] Change the source code for the soundmodem.

    Edit soundcard/kisspkt.c, find the pktsetdcd function, and change its
    second parameter to 0.  This will ensure that the DTR signal remains
    false at all times, and will avoid accidentally keying the radio
    during reception.

[2] Modify your soundcard-to-rig interface, so that it keys only on
    RTS and not on DTR.  If you have a Rascal GX, you can do this by
    opening it up, holding the PC board with the components upwards,
    transformers and pot away from you, connector near you, and
    clipping one of the leads on the righthand diode (D2) - it's the
    one furthest away from the two transistors.  D2 enables keying on
    DTR, while the lefthand diode D1 enables keying on RTS.

Unfortunately, there does not seem to be any way to control the
DTR feature in the soundmodem, other than to edit the source code.

If you want to get fancy with the Rascal GX:  clip the far end of
D2 (the banded end, the cathode) leaving the lead on the diode as
long as is possible.  Solder to this diode's lead a current-limiting
resistor (1k ohms should do) and then the anode of another LED (use
whatever color you wish).  Return the cathode of the second LED to the
PC board ground trace or to pin 5 of the DB-9 connector/cable.  Mount
the LED so that it shines out through the case's window.

This will provide you with an LED which lights up whenever the soundmodem
signals that it's receiving/decoding a packet.


