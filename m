From: "David Hambly" <webmissile@hotmail.com>
Subject: HFTerm, F6FBB, FPAC and NetRom
Date: Sat, 06 Nov 2004 16:20:26 +0000
Message-ID: <BAY17-F365p1Fjxe0ym00034bad@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Folks,

I am using HFTerm (soundcard PacTOR 1) with F6FBB, HFTerm telnets into 
LinFBB using port 6300, this provides a soundcard PacTOR BBS.

What I am trying to figure out is:

How to add NetRom to this config so when a new F6FBB mailbox pops up it is 
added to the routing automagically.

I assume that I would need to add another port to F6FBB (perhaps AXIP), make 
an ax25 device and set up a gateway from the newly set up port to the telnet 
port.  Currently, if I try ifconfig, it only shows the lo interface at 
127.0.0.1, this does seem to carry the packets to and from LinFBB.

I am pretty new to all this.  I have FPAC but still not sure about the 
axports config yet and want to keep the output low (just quick login in 
expert mode).

It's kinda weird because HFTerm uses /dev/dsp and is not really a device 
itself.  Not sure how to set axports if I don't actually have a device to 
attach; Is there a way to set up a virtual device that would share the 
telnet port (6300)?  Like I said, I'm pretty new, swimming in documentation, 
trying to wrap my mind around this stuff.

I also could use help setting up the forwarding but for now NetRom is step 
one.

73
Dave

_________________________________________________________________
On the road to retirement? Check out MSN Life Events for advice on how to 
get there! http://lifeevents.msn.com/category.aspx?cid=Retirement

