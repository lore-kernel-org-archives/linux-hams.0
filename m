From: Erik Jakobsen <erik_ja@mail.tele.dk>
Subject: gMFSK ?
Date: Tue, 08 Jul 2008 21:55:58 +0200
Message-ID: <4873C64E.2000105@mail.tele.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Hi.

I have installed gMFSK on my openSUSE 11.0.

It works nice, and now I want to set up hamlib.

I have tested the connection to the scanport with rigctl and the command IF:

# rigctl -vvvvv -r /dev/ttyS0 -s 9600 -m 204
rigctl, Hamlib version 1.2.7.1
Report bugs to <hamlib-developer@lists.sourceforge.net>

rig:rig_init called
rig: loading backend kenwood
kenwood: _init called
rig_register (213)
rig_register (201)
rig_register (225)
rig_register (203)
rig_register (204)
rig_register (216)
rig_register (224)
rig_register (205)
rig_register (207)
rig_register (209)
rig_register (210)
rig_register (222)
rig_register (214)
rig_register (221)
rig_register (202)
rig_register (211)
rig_register (206)
rig_register (208)
rig_register (215)
rig_register (226)
rig_register (217)
rig_register (220)
rig_register (223)
rig_register (227)
rig_register (228)
rig:rig_open called
TX 3 bytes
0000     49 46 3b       IF;
RX 38 characters
0000     49 46 30 30 30 31 34 30 38 30 37 38 30 20 20 20        
IF00014080780
0010     20 20 20 30 30 39 30 30 30 20 39 30 30 32 30 30           
009000 900200
0020     30 30 30 38 20 3b                                      0008 ;
Opened rig model 204, 'TS-570D'
Backend version: 0.6.1, Status: Stable

Rig command: if
TX 3 bytes
0000     49 46 3b       IF;
RX 38 characters
0000     49 46 30 30 30 31 34 30 38 30 37 38 30 20 20 20        
IF00014080780
0010     20 20 20 30 30 39 30 30 30 20 39 30 30 32 30 30           
009000 900200
0020     30 30 30 38 20 3b                                      0008 ;
TX 4 bytes
0000     46 52 30 3b    FR0;
TX 4 bytes
0000     46 54 30 3b    FT0;
Tx frequency: 14080780

TX 3 bytes
0000     49 46 3b       IF;
RX 38 characters
0000     49 46 30 30 30 31 34 30 38 30 37 38 30 20 20 20        
IF00014080780
0010     20 20 20 30 30 39 30 30 30 20 39 30 30 32 30 30           
009000 900200
0020     30 30 30 38 20 3b                                      0008 ;
Rig command: Frequency: 14080780

Rig command:                                       

In the gMFSK hamlib setup I have this:

Kenwood TS570D
Port /dev/ttyS0
Speed 9600

What more shal I have in here to get that part to work ?.
When I start up gMFSK it complains abot the port settings

Hamlib init: rig_open failed: IO error

What to do here ?

73 de Erik OZ4KK
