From: "Bob Donnell" <kd7nm@pugetsound.net>
Subject: RE: standard_window_size.
Date: Tue, 2 Dec 2008 15:12:47 -0800
Message-ID: <B445944EF6334806BCD4A50D81BC7CFC@arkalmus.com>
References: <90EE0427-2E1B-4C07-9966-B2D79D3F399B@gmail.com> <BC4729C5-6006-40C4-83BC-3858C71E2EE0@tssg.org> <2e19719f0812021350y2855cd0fh4eec6280b8b4f1a8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <2e19719f0812021350y2855cd0fh4eec6280b8b4f1a8@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Bent' <bbagger@gmail.com>, 'John Ronan' <jpronans@gmail.com>, 'Linux-Hams' <linux-hams@vger.kernel.org>

A suggestion too for troubleshooting this, is to have a 3rd station/TNC
monitoring the activity, and logging that information.  That will show the
sequence of actual on-air transmissions.  

One of the generalized problems with using KISS and/or queues that are
isolated from knowing that multi-frame transmissions are occuring is that
the station receiving the I frames usually generates an ack for that single
I frame, and puts it in the transmit queue - without waiting to see if an
additional I frame (or more) in the same sequence that the information
sending station is sending is following.  So when the I frame receiving
station is finally granted access to the channel, all of the individual
queued ack packets (acking one I frame at a time) are transmitted.  The I
frame sending station gets the first ack, notes that it's only acking the
first I frame of a multi-frame window.  It's not any more clever than the
receiving station, and doesn't wait to see if more ack packets are coming,
so it immediately queues up a replacement 2nd (and perhaps more) I frame.
There's no way to flush that queue, so using a larger window size - which
can make things a lot more efficient, has the behavior of a lot of
duplicated frames.

This whole layer 2 acknowledgement problem is one of the reasons that when
we had a very active IP network in the Seattle area, we used datagram mode,
with UI frames at the AX.25 level, almost exclusively.  This moved the retry
timing up to the IP level, where the timing is adaptive, and fairly quickly
the sender learns enough about the channel to not expect ack packets
instantly for each frame.

The real root of the problem is that the AX.25 driver is (in most air
interfaces) too decoupled from the activity on the RF channel.  One of the
ideas I had for trying to address this in the AX.25 stack was to make the
AX.25 driver aware of the channel speed, so that it could adopt sensible
timers for retries and generating ack packets.  That approach could work in
the absence of any information on whether the channel is busy.  

As a more advanced option for serial-port-interfaced TNC's is that I know
that some TNC's can be configured to provide CD information, usually on the
CD line.  That information could be used by the AX.25 driver to pause
timers, as an alternate AX.25 driver attachment option.

This is one of the areas where the 6PACK interface choice shines - almost
all of the intellegence is removed from the TNC, even more so than KISS, and
made a function of the AX.25 driver, providing tight coupling.  The same
should be true of the AX.25 HDLC card driver, but I if I remember right it
too has been decoupled from the AX.25 stack, so it doesn't perform much
better in AX.25 connected mode than a KISS TNC. 

Assuming that the AX.25 driver has actually been modified to ignore
window_size, this decoupled operation might be why a driver maintainer might
have made that choice.

Some of my observations date back to when I was running an W0RLI/G8BPQ BBS
in the early '90's, and discovered that on a very busy channel, I had to set
AX.25 frame acknowledgement timers to as long as 40 seconds, otherwise the
scenario I described would happen, just moving the data from the PBBS to the
NET/ROM node - and it would be a cascading problem, as more packets got
queued up in the TNC for transmission.  If I was present, the whole thing
could be "fixed" temporarily by rebooting the TNC, so it dropped all of the
packets it had queued.

I hope what I've suggested and explained makes sense.

73, Bob, KD7NM

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Bent
Sent: Tuesday, December 02, 2008 1:51 PM
To: John Ronan
Cc: John Ronan; Linux-Hams
Subject: Re: standard_window_size.

Hi John

I decided to take a closer look at your trace, and I interpret it this way:

   EI7IG            EI7IG-8

I  ->  N(R) = 3
                      N(S) = 3  <-  I
                      N(S) = 4  <-  I
RR ->  N(R) = 5
                      N(S) = 5  <-  I
                      N(S) = 5  <-  I
REJ ->  N(R) = 6

In words: EI7IG sends a frame that tells that the next frame expected is no.
3. EI7IG-8 sends frames no. 3 and 4 and they are acked by EI7IG. EI7IG-8 now
sends frame no. 5 and 3 seconds later it resends it for reasons unknown.
This second no. 5 frame is rejected by EI7IG which expect frame no. 6.
having received the first frame no.5.

As far as I can see this does not have much to do with window size.
Why the second frame 5 is not received - and acked - by EI7IG should
probably be answered first.

Please tell if you agree with my interpretation of the exchange.

Best 73 de Bent/OZ6BL
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" in the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html


