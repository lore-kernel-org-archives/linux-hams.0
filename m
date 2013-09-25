From: Waldek <sp2ong@wp.pl>
Subject: Problem with flexd and Xnet Node
Date: Wed, 25 Sep 2013 07:11:19 +0200
Message-ID: <52427077ee1c72.57557303@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1380085880; bh=BUMCU8gzhCPS53yf3FGWg6+vBtyyWdeFOkFBDPhasvA=;
          h=From:To:Subject;
          b=w8RkPaS7nkQlOT9vsox0meKom9e67c07wcDcSKk5P64LbRbHDSnjEsaseGUkVU411
           N7bMs+mMaXyImsGJGwy5x9k6T3H6nrOi2wIR9LaheyA2rMwA/HmbSvoPepr1BbAuU6
           eYJc02Zzt3juBW08OkHkaE+6fjnyq8JdHiwBaRZk=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


Hi,

I have use RaspberryPI to setup local AX25 Node base on linux kernel tools

I have use flexd program which is part of URONode or FPACNode and I have setup flexd.conf with follow

MyCall	 SP2ONG-11  # SP2ONG-2 is may call for NodeID
PollInterval	300
# sr1dsz my XNet flex neighbor sr1dsz don't use SSID
FlexGate	sr1dsz  
MyGate sr1dsz
MyRange	 0-0

and add in uronode.routes

route sr1bsz polnet axudp d 'XNet Flexnet node'

When I have start flexd I have see in mointor

axudp: fm SP2ONG-11 to SR1DSZ ctl SABM+ 15:57:35
axudp: fm SR1DSZ to SP2ONG-11 ctl UA- 15:57:36
axudp: fm SR1DSZ to SP2ONG-11 ctl I00^ pid=CE(FLEXNET) len 5 15:57:36
FlexNet: Link setup - max SSID 0  30 25 21 0d
axudp: fm SR1DSZ to SP2ONG-11 ctl I00+ pid=CE(FLEXNET) len 5 15:57:37
FlexNet: Link setup - max SSID 0  30 25 21 0d
axudp: fm SP2ONG-11 to SR1DSZ ctl REJ1- 15:57:37
axudp: fm SR1DSZ to SP2ONG-11 ctl I01^ pid=CE(FLEXNET) len 5 15:57:52
FlexNet: Link setup - max SSID 0  30 25 21 0d
axudp: fm SR1DSZ to SP2ONG-11 ctl I01+ pid=CE(FLEXNET) len 5 15:57:54
FlexNet: Link setup - max SSID 0  30 25 21 0d
axudp: fm SP2ONG-11 to SR1DSZ ctl REJ2- 15:57:54

When I have in URONode with command 'D' I have only one record:

SR1DSZ  3-0      0 

Why sr1dsz don't send my your destination ??? flexd working with XNet Node ???

73 Waldek sp2ong



