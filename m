From: Riley Williams <rhw@InfraDead.Org>
Subject: RE: no data from user-mode soundmodem
Date: Mon, 26 Aug 2002 05:45:50 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0208260517330.8397-100000@Consulate.UFP.CX>
References: <NCBBKMFJEOGLLIAIAGGJCEBHFDAA.dlr@cs.pdx.edu>
Reply-To: Riley Williams <Riley@Williams.Name>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <NCBBKMFJEOGLLIAIAGGJCEBHFDAA.dlr@cs.pdx.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Roloff <dlr@cs.pdx.edu>
Cc: Linux Ham Radio <linux-hams@vger.kernel.org>

Hi Daniel.

>> I have successfully gotten the user-mode soundmodem working on two
>> linux systems, but a third one has me stumped. The systems are all
>> very similar. For two of them, I had to install the alsa sound
>> drivers to get the i810 audio to work, but after doing that, one of
>> the systems seems to be working fine.  (So far, I have only tried
>> receiving packet data.) The other system brings up the sm0 device
>> (as reported by ifconfig), but never receives any packets. But using
>> soundmodemconfig shows audio getting to the modem and DCD being
>> detected.  Also, using soundmodem -v255 shows DCD being set
>> appropriately. Neither soundmodem or soundmodemconfig fully decode
>> any packets though, (ie. nothing is printed to stdout, or to the
>> diagnostic modem text window).
>>
>> In kisspkt.c, pktput is called, as is hdlc_receive, but that's as
>> far as I got with my debug attempt.

> I was able to get a little farther with debugging this and it seems
> that the received packets are not passing the check_crc_ccitt call.
> I commented this call out and data is being received, but it is
> about half garbage.

The purpose of the check_crc_ccitt call is to detect and reject packets
that have been mangled, and that is apparently what is happenning to
your packets, so check_crc_ccitt is correctly rejecting them. That
states that whatever the problem is, it precedes that call.

> I do not know what is causing this because the receiver audio
> (through the soundcard) sounds good and looks good on the
> soundmodemconfig diagnostic tools. I'll be investigating it some
> more though.

To check your station out, temporarily rewire your soundcard so the
transmitted audio is fed straight back into the receiver.

 * If this results in your transmitted packets not being decoded
   properly, then the problem is either in the soundcard itself
   (some soundcards can't transmit and receive simoultaneously)
   or in the code after that.

 * If the packets are decoded properly, then the problem is external
   to the soundcard.

In my experience, most problems with packet radio stations are external
to the computer, and such problems can be any of the following:

 1. Signal bad as transmitted. Basically, the station transmitting
    the signal is transmitting garbage.

    This is quite common whilst a packet station is being set up,
    and also results from either equipment failure at the station,
    or from tuning into a non-packet data mode by mistake.

 2. Signal collision. Basically, two stations transmitting at the
    same time, with the result that their signals overlap and can't
    be separated. It's quite possible that those two stations can't
    hear each other, but you can hear both of them.

    In my experience, this is by far the commonest problem, and it
    is unfortunately an in-built part of the "joys" of packet radio.
    This is what DAMA is supposed to solve.

 3. Receiver problems. Basically, the signal is clean, but your
    receiver setup is mangling it.

    One common cause of this is for a 9600 Baud (or faster) signal to
    be received via the standard earphone socket, where the compander
    has mangled it for you. Another is for the signal from the receiver
    to be either too weak or too strong for the soundcard or TNC.

Problem (3) is the only one that you can do anything about on your own,
but you need to eliminate (1) and (2) as well.

Best wishes from Riley G7GOD / KB8PPG

