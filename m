From: Ted Gervais <ve1drg@av.eastlink.ca>
Subject: kissnetd/net2kiss etc..
Date: Mon, 13 Feb 2006 16:26:06 -0400 (AST)
Message-ID: <Pine.LNX.4.63.0602131614510.7359@ve1drg.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

I wonder if someone might have a solution to my query here. I have the 
ax25 utils installed and working with a vhf port configured and is being 
used by my FBB bbs.  My tnc is a kantronics KPC-9612+ and I am only using 
the vhf (1200baud) port.

The predicment is that I also want to use this same tnc to serve a jnos 
installation and I have the notion that I can share this (vhf) between the 
ax25 utils and Jnos using something like 'net2kiss' or 'kissnetd' etc..

I wonder if anyone has been successful in doing this and if so could pass 
along their solution.  But first of all here is my ax25 setup showing how 
it is enabled through the utilities:

# vhf port is on ax1
/usr/sbin/mkiss -s 9600 /dev/ttyS1 /dev/ptyb1 /dev/ptyb2
/usr/sbin/kissattach -l -m 256 /dev/ttyb1 vhf 44.135.34.201
/usr/sbin/kissattach -l -m 256 /dev/ttyb2 uhf 44.135.34.201

How is kissnetd attached to that?
And if net2kiss is the solution is it used like this:
net2kiss -i ax1 /dev/ptyq3....with jnos using /dev/ttyq3 ??
For jnos this doesn't work, by the way..

Any thoughts would be appreciated..


---
Ted Gervais
Coldbrook, Nova Scotia
Canada. (ve1drg)
