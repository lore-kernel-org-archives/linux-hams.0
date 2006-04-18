From: Jeremiah <jjgpg@cet.com>
Subject: error when trying to run kissattach on 2.6.13-15.8 Suse Kernel
Date: Mon, 17 Apr 2006 20:21:01 -0700
Message-ID: <200604172021.01888.jjgpg@cet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello all,

I get an error when trying to start up kissattach on my Suse 10 box.
I'm running the Suse 2.6.13-15.8 kernel, no changes made to it. 

When I run
"kissattach /dev/ttyS0 vhf 10.0.0.1"
I get back
"kissattach: Error setting line discipline: TIOCSETD: No such device
Are you sure you have enabled MKISS support in the kernel
or, if you made it a module, that the module is loaded?"

I get no other error other than suse complaning that I didn't configure and 
AX0 port. 
Any ideas, Do I need to patch?

I do have the AX.25 stuff downloaded from suse linux ham YAST source.

Any input would be of help.

Thanks

Jeremiah
KD7DMP
