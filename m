From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: =?iso-8859-1?Q?Re=A0=3A?= Baycom USCC noise
Date: Wed, 29 Oct 2003 12:00:09 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031029110009.GC1434@tangerine.coulon.evette>
References: <200310291150.12893.oyvind@cs.uit.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200310291150.12893.oyvind@cs.uit.no> (from oyvind@cs.uit.no on mer, oct 29, 2003 at 11:50:12 +0100)
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="Flowed	DelSp=Yes"
To: =?iso-8859-1?Q?=D8yvind?= Hanssen <oyvind@cs.uit.no>
Cc: linux-hams@vger.kernel.org

Hi,

This is what I get with a DRSI card (1200bps) :
[jean-luc@tangerine] ~ $ sccstat scc0

Parameters:

speed       : 1200 baud
txdelay     : 18
persist     : 64
slottime    : 8
txtail      : 8
fulldup     : 0
waittime    : 12
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
Sent       :     674  RxOver :     0  RxInts :   271307  Size    :  384
Received   :    2312  TxUnder:     0  TxInts :    16175  NoSpace :    0
RxErrors   :   28054                  ExInts :   168026
TxErrors   :       0                  SpInts :    12003
Tx State   :    idle

I think _this_ is harmless... Everything is decoded fine with my drsi  
card.

--
Regards and 73
			- f5ibh - Jean-Luc 
