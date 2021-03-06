From: David Ranch <linux-hams@trinnet.net>
Subject: Linux AX.25 stack now toxic for connected packet connections with
 Ubuntu 20.04 / 5.8.0-44-generic #50
Date: Sat, 6 Mar 2021 13:45:56 -0800
Message-ID: <32262788-02bf-5a92-dff6-75b916390108@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>

Hello Everyone,

I wanted to check with the larger community to see if others are 
experiencing system crashes when making connected AX.25 sessions. I have 
confirmed that this is NOT an RFI thing and sending unconnected (UI) 
transmissions (beacons) small or large is fine, and even initiating the 
beginning of connected session to a non-existent remote station callsign 
is OK with axcall, linpac, etc.  The issue is that once a valid AX.25 
connection is established, I begin to receive data from the remote 
station and then seemingly when my station is to send an ACK packet, the 
machine locks hard.  No segmentation failure, no kernel panic, the 
Gnome3 display stays up but the screen no longer updates , nothing in 
the logs and even stops pinging from a different machine on the LAN.  
The machine is 100% crashed and this is 100% reproducible.

Is anyone else seeing this?

    $ uname -a
    Linux hampacket3 *5.8.0-44-generic #50*~20.04.1-Ubuntu SMP Wed Feb 
10 21:07:30 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux


Any recommendations on how to get some sort of details out of my system 
about this crash would be helpful.

--David
KI6ZHD
