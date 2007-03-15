From: "J. Lance Cotton" <joe@lightningflash.net>
Subject: Re: Problems using MKISS
Date: Thu, 15 Mar 2007 09:12:58 -0500
Message-ID: <45F9546A.1050803@lightningflash.net>
References: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com>	 <45F8566D.10206@wa7v.com>	 <dd22fa9c0703141323g3e5568dekba6c57a5586d4f6e@mail.gmail.com>	 <1173962835.1770.27.camel@CO> <dd22fa9c0703150638t3c99b86o4a7958d394333486@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <dd22fa9c0703150638t3c99b86o4a7958d394333486@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stephen Brown Jr <stephen.brown75@gmail.com>
Cc: linux-hams@vger.kernel.org

on 3/15/2007 8:38 AM Stephen Brown Jr said the following:
> How would I get more than one app to talk to a single tty, ttyS4 in my
> case, this is the port the TNC is connected to. This is the part of
> the puzzle I seem to be missing......

When you "kissattach" to ttyS4, a network device (ax0 or similar) is 
created. Like the "ethernet device", eth0, access is not exclusive.

The AX.25 network device ax0 is then associated with the appropriate entry 
in /etc/axports. Multiple apps can access the device this way. You don't 
have to split the streams up.

This is as I understand it -- I may be wrong.

-Lance KJ5O

-- 
J. Lance Cotton, KJ5O
joe@lightningflash.net
http://kj5o.lightningflash.net
Three Step Plan: 1. Take over the world. 2. Get a lot of cookies. 3. Eat the 
cookies.

