From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Using ax25ipd
Date: Thu, 24 May 2012 16:59:50 -0700
Message-ID: <4FBECB76.60109@trinnet.net>
References: <4FBEB9ED.3050805@boling.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4FBEB9ED.3050805@boling.us>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Here are my notes I wrote down to get this working in a very manual 
fashion   Should be too hard to automate this in a script (see the URL 
below)

--David


09/04/2011

http://wiki.complete.org/LinuxPacketRadio#ax25ipd-1

   - requires changes to ax25-apps too --

1. Update /etc/ax25/axports and define the ipct port

2. /usr/sbin/kissnetd -p2 &
    - Please record the FIRST port and SECOND port out of that list
      for follow-on commands

3. /usr/sbin/kissattach -l /dev/pts/7 ipct 44.4.10.40
    - In this example, /dev/pts/7 camesfrom the output of the kissnetd
      command above.  44.4.10.40 is my AMPR IP address

4. From the output of command in step 2, take the SECOND port given (not the
    first port) and put that into /etc/ax25/ax25ipd.conf for the 
"device" line

5. run /usr/sbin/ax25ipd

6. Per db0fhn security, you MUST log into Echolink via the same egress IP
    address (easily done via NAT) as this AXUDP connection.

7. Connect to the remote station:

    call ipct db0fhn


