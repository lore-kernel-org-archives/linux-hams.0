From: "ozgun erdogan" <kushcu@hotmail.com>
Subject: binding ax devices to TCP ports?
Date: Tue, 03 Dec 2002 07:36:43 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <BAY1-F1180e5cX65b6b0000705f@hotmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


Hi,

I read the kissattach code as I need to write some code which binds a TCP 
port to an ax network device. That is, TCP packets coming from a specific 
port will be read from ax1. (with listen for example.)

I know some sockets stuff, but am not good in Linux Ham, and couldn't figure 
out how kissattach creates a KISS networks device. I looked through the 
readconfig(char *) function, but that seems to only initialize certain 
parameters. I couldn't figure out how the device is created, nor how the 
serial port is associated with the KISS networks device. I've been surfing 
the web to find some information on creating KISS network devices and how to 
write data to them, but couldn't succeed.

So, could you make any comments on how struct ifreq is used, or the way the 
KISS device is created? (also a link to some documentation would be very 
useful)

Thanks,

Ozgun.


_________________________________________________________________
MSN 8 helps eliminate e-mail viruses. Get 2 months FREE*. 
http://join.msn.com/?page=features/virus

