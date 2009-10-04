From: Jeremiah <jjgpg@cet.com>
Subject: Linux NetRom Node Question
Date: Sun, 4 Oct 2009 11:46:35 -0700
Message-ID: <200910041146.35375.jjgpg@cet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

Hello all,

I am still working on setting up our RMS to send out NetRom Broadcasts. I have 
added a "dummy" entry into the nrports file for connection outbound from the 
node. I also corrected the entry for the RMS. Running nrattach it comes back 
with "NET/ROM port winl2k bound to device nr0", but it never shows up when I 
run ifconfig. There are no errors in the system logs when I run nrattach. 
Does anyone have an example nrports file they would be willing to share? I'm 
a bit stuck on this because the nr0 interface does not come up and the system 
gives me no errors in /var/log/messages.



Thanks

Jeremiah 
KD7DMP

nrports-------------
# /etc/ax25/nrports
#
# The format of this file is:
#
# name callsign alias paclen description
#
switch  WR7VHF-14       #WINL2k 235     dummy for the RMS
winl2k  WR7VHF-10       WINL2K  235     RMS

nrbroadcast------------
# /etc/ax25/nrbroadcast
#
# The format of this file is:
#
# ax25_name min_obs def_qual worst_qual verbose
#
pk96    5       250     100     0

axports-----------
# /etc/ax25/axports
#
# The format of this file is:
#
# name callsign speed paclen window description
#
pk96    wr7vhf          19200   255     4       BackBone Port

