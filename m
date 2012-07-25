From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: AX.25 Packet Radio on a RaspBerry Pi : a success
Date: Wed, 25 Jul 2012 18:04:58 +0200
Message-ID: <5010192A.9060506@upmc.fr>
References: <500FD014.5090004@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <500FD014.5090004@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>, List for the LINUX version of FBB <xfbb@f6fbb.org>

Hello all,

I succeeded the compilation of a dedicated Raspbian 3.1.9+ kernel with
packet radio modules (ax25, 6pack, kiss, Rose, NetRom).
I just followed instructions given in Debian paragraph of
http://elinux.org/RPi_Kernel_Compilation
Compilation took the whole night but it did not hurt as I was sleeping !
I then installed a ROSE node switch FPAC on my RPi.
Then I will move my co located F6BVP BBS into it.
F6BVP node can be reached via FPAC Rose network and it will soon be 
available through ssh.
As for now lighttpd is running a web page advertizing RPi at
http://f6bvp.org:8080

73 de Bernard, f6bvp


