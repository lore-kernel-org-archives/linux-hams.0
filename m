From: Dennis Boone <drb@msu.edu>
Subject: Re: kenwood TM700
Date: Mon, 11 Oct 2004 11:32:29 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200410111532.i9BFWT25012630@yagi.h-net.msu.edu>
References: <200410111700.29340.alexandre.chappaz@data-tools.com>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Mon, 11 Oct 2004 17:00:29 +0200.)
             <200410111700.29340.alexandre.chappaz@data-tools.com> 
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > For the moment the TNC-radios are discussing in an half duplex mode
 > - that means one radio emmits a packet and stops, the second radio
 > receives the packet and answers and so on and so on... My problem
 > is that in that case, the maximum speed is only one packet ever half
 > second is emmited. This is due (to me) to the time the radio emettor
 > needs to bring the power up and running for emitting the packet. The
 > problem is that once the packet is sent, the radio stops the emission,
 > that means it has to start up again for the next packet. I didn't
 > find any mode for telling the emetor to stay up even if there's no
 > packet to transmit.......

I've been told that the D7 radios limit window size to 1 frame.
This may or may not be true of the D700.

You probably want to experiment with the MAXFRAME command to enlarge
the window size.  Apparently the command exists on the D7, but does
nothing, so your mileage may vary.

You may also wish to check the TXDELAY setting, which comes set at
500 ms from the factory, though the radio works fine at 200-300 ms.

To the best of my knowledge, there's no way to get the radios to
transmit if there's no packet in the transmit queue.  This would
cause problems due to the way channel busy is detected.

Dennis Boone
KB8ZQZ
