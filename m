From: Darren Long <darren.long@mac.com>
Subject: Puzzled by AX.25 socket state problem
Date: Tue, 12 Feb 2008 22:36:00 +0000
Message-ID: <D0E6D043-89CD-4A0B-81CF-94139F0B4419@mac.com>
Mime-Version: 1.0 (Apple Message framework v919.2)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-hams@vger.kernel.org

Hi all,

I've implemented an AX.25 connected mode  'convergence layer'  for the  
Delay Tolerant Networking reference implementation (see dtnrg.org).   
I'd like to submit it upstream soon, but I've observed some quirks in  
testing that I'd like to understand better.

My implementation of the AX.25 Connected mode convergence layer  
(ax25cm-CL)  uses Linux support for AX.25 sockets and has been mostly  
tested using a PK-232 (KISS mode)  with a hard-wired loop-back cable,  
although a little OTA testing has been done elsewhere with no  
detrimental reports.

The quirk I'm observing has symptoms which prevent subsequent  
communications between two SSIDs on the same host.  The problem shows  
up in netstat output as a socket in the listening state, but unusually  
it has call/SSID in both source and dest fields, which strikes me as  
being an anomaly.  This entry in netstat output is in addition to the  
original listening socket, from which the connection threads with  
their own connected sockets are spawned.

When further attempts are made to set up a connection between the two  
call/SSIDs, an "Address already in use" error occurs. Note please that  
the error message is from recollection, not verbatim, as I don't have  
access to the TNC at the moment.

Can anyone shed any light on this behaviour.  I've noticed similar  
error messages when dabbling with Bluetooth connections under  
circumstances where I already have an rfcomm connection established  
and erroneously try to bring up another identical one.  This makes me  
wonder if there is a  resource leak for an AX.25 socket in my ax25cm- 
CL implementation, when a connection 'closes' due to errors.  In my  
loopback testing, I get quite a few errors, which seem to be mitigated  
somewhat by adjustment of the timing parameters.

FYI, the test system with the PK-232 is running Ubuntu 7.10.

Any help would be appreciated.

Cheers,

Darren, G0HWW


