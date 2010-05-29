From: David Ranch <linux-hams@trinnet.net>
Subject: Adding kernel support for a US Interface Navigator USB sound device
Date: Fri, 28 May 2010 17:28:48 -0700
Message-ID: <4C005FC0.4010508@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Hello Everyone,

Some time ago, I wrote up a HOWTO on getting a US Interface Navigator 
working on Centos5 for FLdigi:

   
http://www.ecst.csuchico.edu/~dranch/HAM/US-INTERFACE/us-interface-navigator-and-linux.html


It works like a charm and I submitted my very minor ftdi_sio driver 
changes to the FTDI maintainer but I never heard back from him.  I was 
curious if there was someone on this list that could help me get the USB 
ID changes checked into the mainline kernel:

http://www.ecst.csuchico.edu/~dranch/HAM/US-INTERFACE/ftdi_sio.c.diff
http://www.ecst.csuchico.edu/~dranch/HAM/US-INTERFACE/ftdi_sio.h.diff


--David
