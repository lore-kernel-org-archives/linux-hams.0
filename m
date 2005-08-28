From: Salvador Caballe <ea3bkz@amsat.org>
Subject: Baycom serial bad TX with kernel 2.6.12.5
Date: Sun, 28 Aug 2005 12:44:50 +0200
Message-ID: <200508281244.50349.ea3bkz@amsat.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams@vger.kernel.org

I just updated my linux box to kernel 2.6.12.5 (kernel.org)
but i have problems with baycom serial driver:

RX works OK, but TX data is not decoded by other stations 
tested  with baycom_ser_fdx and baycom_ser_hdx drivers,
I also check with long txtail and txdelay settings.


The same hardware runs ok with kernel 2.4.27

I found several 2.6 kernel  patches in the list , but seems not for baycom 
serial problems.

best 73
Salvador
EA3BKZ

-- 

 

