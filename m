From: =?iso-8859-1?q?=D8yvind=20Hanssen?= <oyvind@cs.uit.no>
Subject: Baycom USCC noise
Date: Wed, 29 Oct 2003 11:50:12 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200310291150.12893.oyvind@cs.uit.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

We are using a Baycom USCC card with DF9IC modem with
a T7F radio. It works ok, but since the radio is not squelched
there is a high number of rx interrupts and error rx packets. 

Also, some bad packets seems to slip through. Much garbage is 
seen in the mheard list. 

Is this normal? Is there a way to workaround this? 

73 de LA7ECA

The sccstat returns (for instance): 
speed       : 9600 baud
txdelay     : 5
persist     : 64
slottime    : 8
txtail      : 8
fulldup     : 0
waittime    : 2
mintime     : 3 sec
maxkeyup    : 7 sec
idletime    : 3 sec
maxdefer    : 120 sec
group       : 0x00
txoff       : off
softdcd     : off

Status:

HDLC                  Z8530           Interrupts         Buffers
-----------------------------------------------------------------------
Sent       :  147746  RxOver :     0  RxInts : 30689899  Size    :  384
Received   :  212184  TxUnder:     0  TxInts :  4982360  NoSpace :    0
RxErrors   : 1804229                  ExInts :  7823901
TxErrors   :       0                  SpInts :  1006105
Tx State   :    busy

