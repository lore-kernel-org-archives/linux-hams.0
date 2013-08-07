From: Sascha Alexander Jopen <jopen@informatik.uni-bonn.de>
Subject: Wireshark/Packet Socket Duplicate Frames
Date: Wed, 07 Aug 2013 10:37:44 +0200
Message-ID: <52020758.10207@informatik.uni-bonn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hey,

i'm trying to work with linux packet sockets to receive and send raw
AX.25 frames. When i use sockets bound to AX.25 frames only, everything
works as expected. However, when i a raw packet socket requesting all
possible frame types like so

  socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL))

i receive two frames for each incoming physical frame. Both frames seem
to be identical and i can not distinguish one frome the other.
As wireshark uses the same mechanisms through libpcap, one can see the
same phenomenon there, too. For each incoming frame, two frames are
displayed. Even the listen tool from ax25-apps shows this behaviour when
called with -a.
At the network layer only a single ip packet is emitted, so i'm actually
receiving only a single frame, not two.

Because i currently do not have the necessary radio equipment, i
connected two PCs via a crosslinked serial cable. Both ends are sending
KISS/AX.25 frames. However, this should not be the source of the
duplicates, shouldn't it?

So the basic question here is, does anybody else see this behaviour?
If so, is this behaviour intended?

Thanks in advance,
Sascha

-- 
Dipl.-Inform. Sascha Jopen

University of Bonn                     Tel.:   +49-228-73-54219
Institute of Computer Science 4        Fax:    +49-228-73-4571
Friedrich-Ebert-Allee 144              E-mail: jopen@cs.uni-bonn.de
D-53113 Bonn, Germany
