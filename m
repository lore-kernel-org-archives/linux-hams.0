From: f6bvp <f6bvp@free.fr>
Subject: Subject:    Re: Using ax25ipd
Date: Thu, 14 Jun 2012 10:28:50 +0200
Message-ID: <4FD9A0C2.6000909@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Hi Charles,

You wrote :

"I've done the soundcard driver. I've done the BPQ driver. I've done 
NET/ROM. I've done a basic node. And now I've done gotten myself stuck! 
:-) I want to use ax25ipd to establish an AXUDP tunnel over the Internet."

Charles, I am sorry that I did not read linux-ham until recently. Then I 
had problems for replying through linux-hams list.

May I suggest you first download patched AX25ipd that includes a 
symbolic link connection capability and an automatic periodical retry 
function for closed links.

This version is included in the following linuxax25 package maintained 
by Lee VE7FET

code.google.com/p/linuxax25/source/checkout

You will find here a link to a script from Charley K4GBB for creating 
pseudo devices that will be attached to the /dev/ptmx end of the tunnel.

http://f6bvp.free.fr/logiciels/ax25/rc.ax25

73 de Bernard, f6bvp
