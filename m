From: Christian Reynolds <creyn@wi.rr.com>
Subject: IP over Packet Ham Radio
Date: Thu, 10 Oct 2002 11:12:56 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <a05111b01b9cb55f871e3@[10.10.1.6]>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello,

I think I found the right group to ask this question!

I have gone through the Linux-HOWTO concerning setting up ax25 on a 
linux box, and have setup the node software.  I can get two computers 
to talk to each other using:

call  <port> <callsign>

and the node comes up, just like it should, and we are connected. 
 From there, I can do a telnet session into a computer, and run 
axmail, and be moving right along.

Question:  The HOWTO suggests that I should be able to ping along the 
radio network.  I am using IP numbers on the air of 192.168.100.30 
and 192.168.100.40.   The ping requests are transmitted, and the 
other computer does not respond.

Remember, that this system works using the call and linuxnode system...

What I am trying to do is see if I can do a direct telnet from 
192.168.100.30 and have it contact 192.168.100.40.  I see the packets 
going out using the supplied monitor program... I see it calling the 
other box (and hear the chatter over the air on another radio), but 
the TNC will not answer.

I do not have any firewalling software on these two computers running.

I am wondering if there is something in the software that requires me 
to be on the 44.x.x.x network... I am running 192.168...

Any suggestions?

I am heading on a short vacation... if a network diagram would be 
useful, I will prepare one.  The goal is to use this system to send 
in weather reports via internet email using the packet protocols as 
OSI Layer 1.

Thanks!

Christian Reynolds
KC0ARF
-- 

Christian Reynolds
creyn@wi.rr.com
