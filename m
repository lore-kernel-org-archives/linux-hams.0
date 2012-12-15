From: Matt VK2RQ <matt.vk2rq@gmail.com>
Subject: Re: ax.25 localhost?
Date: Sat, 15 Dec 2012 15:44:58 +1100
Message-ID: <D0195002-701A-4075-88AE-112281619159@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:content-type:content-transfer-encoding:subject:message-id:date
         :to:mime-version:x-mailer;
        bh=YzJUSIHBbEvl2qmiSM9NxndEj7U/bQOFenpxbArvGyw=;
        b=B/tGaEIWimOroLpC47BV2woDFDsiW2AQqqMQUL0F0hZY54McHbrOnWlTy2kqfLOZt8
         k4hqSsvRKR9KBo4ZqVpXZ08wu3uNRqKo9m0laXpR3JgbA/VZHtxtjHfKvvNHPB7Lyw+J
         i3Ew9byOMw7uV8PgdhEnzcJMwFPSpIqKBXKP4RTD/ugDqhdzh6GWhSJtRoXFU3Mv6b8v
         L6tQF49SShvDOjJxNiA1SLKmyNmaR+wwH6B/4rBNejGPO2UiJZEe3jNjU82ESHgYQtXo
         iMwnV4rpDrmrcRxTPUmW5lj9cUAoGAf+nSGW6OieWbN32ZgnPUrl6Qrt3bkRODRddc19
         wVUA==
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

> > is it not possible to an 'axcall' to a call on the local system?
> 
> 
> What kind of AX.25 device are you having axcall use?  My experience is
> that BPQ Ethernet won't do anything unless it actually hits an Ethernet
> device, so I usually use a virtual machine for testing that way.  You
> could probably set up an AXIP/AXUDP tunnel, but I've never tried it.

That is exactly what I have been doing. I have a main AX.25 AXUDP device
which I use to connect to other systems over the local LAN or internet.
I then created a second AX.25 AXUDP device on my local machine,
and set up the main AXUDP device to route UDP traffic to this second
AXUDP device for the callsigns of the BBS, node, etc. running on this
same machine. I then configured the BBS, ax25d, etc. to listen to the AX.25
device associated with this second AXUDP instance. When I want to
connect to the BBS, node, etc. on my own machine, I just call out on
the main AXUDP device, and the BBS/node/etc. receives the connection
via the AX.25 interface associated to the second AXUDP instance.

You can also this with back-to-back AX.25 devices connected via a
pseudo terminal pair, but I prefer to use AX25UDP so that
when I call out, I always use the same AXUDP device,
regardless of whether I am connecting to my own machine or 
someone else's.

73, Matt VK2RQ.
