From: Jeremiah <jjgpg@cet.com>
Subject: Linux NetRom Node Question
Date: Sat, 26 Sep 2009 16:35:07 -0700
Message-ID: <200909261635.07472.jjgpg@cet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

Hello all,

I have been working on setting up a RMS WinLink2000 gateway on Linux for our 
local club. I wanted to set the box up to send out NetRom Broadcasts so it 
would so up on the node list on all the local nodes. I have setup the nrports 
and nrbroadcast files up per the man pages(see config files below), but when 
I run the nrattach command I can't get it to bring up the nr0 interface. It 
gives me no errors when I run nrattach, but when I cat /proc/net/nr_nodes 
afterwards I see no node info. Also if I ifconfig nr0 after running nrattach 
it shows up with no callsign.
Is there something I'm missing?

The box is running openSuse 11.1 with the 2.6.27.25-0.1-pae kernel.

Thanks all and 73's

Jeremiah Puhek
KD7DMP
-------------------------
uname -a
Linux wr7vhf-rms 2.6.27.25-0.1-pae #1 SMP 2009-07-01 15:37:09 +0200 i686 i686 
i386 GNU/Linux
------------------------------------
# /etc/ax25/nrbroadcast
#
# The format of this file is:
#
# ax25_name min_obs def_qual worst_qual verbose
#
pk96    10      192     100     1

---------------------------------------
# /etc/ax25/nrports
#
# The format of this file is:
#
# name callsign alias paclen description
#
winl2k  WR7VHF  WINL2k  236     node for the RMS

----------------------------------------
# /etc/ax25/axports
#
# The format of this file is:
#
# name callsign speed paclen window description
#
pk96    wr7vhf          19200   255     4       BackBone Port

