From: Jean-Luc <jean-luc.coulon@wanadoo.fr>
Subject: linux 2.5.70 and drsi card
Date: Wed, 04 Jun 2003 21:44:09 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3EDE4C09.8010906@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi,

I'm trying to run ax25 with the 2.5 kernel.
I've a DRSI card (uses the scc drivers).

With linux 2.5 (2.5.70), I get the following error while trying to 
initialize the card

[root@debian-f5ibh] ~ # sccinit
scc0: data port = 0x303  control port = 0x302 -- missing
scc1: data port = 0x301  control port = 0x300 -- missing
SIOCSCCINI: : Invalid argument

Any idea?

----
Regards and 73
	jean-Luc - f5ibh

