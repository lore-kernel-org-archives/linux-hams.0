From: Gordon Croft <gordon.croft@telus.net>
Subject: PTT problem
Date: Sun, 07 Nov 2004 14:57:34 -0800
Message-ID: <418EA85E.6050706@telus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-ham <linux-hams@vger.kernel.org>

Hello list,
I'm new to packet radio and am not as good at circuit design as I should 
be!!:)

I've built a circuit to interface the serial port RTS signal to the 
radio PTT line.
The radio is an old ICOM IC-20 and I checked to make sure it has a 
positive voltage (+12V) on the PTT line .  If I ground the PTT lead, it 
keys the transmitter, so I think the radio is working correctly.

The circuit I built uses an opto Isolator (NTE3040).
I tried to send the circuit lay-out but the server rejected my message...

When I check the current flow on the PTT side of the opto isolator with 
the computer trying to key the transmitter, I see about 14 mA and the 
transmitter on the radio does not operate.  If I just connect the PTT 
line to ground through the ammeter, I see about 125 mA and the 
transmitter does send.  Is it possible that the opto isolator is 
presenting too high a resistance and there's not enough current flow to 
activate the transmitter?  If so, how could I correct the problem?

