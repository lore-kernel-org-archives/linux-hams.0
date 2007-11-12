From: Niall Parker <niall@ve7hex.ampr.org>
Subject: dmascc ?
Date: Sun, 11 Nov 2007 23:32:40 -0800
Message-ID: <47380198.7020906@ve7hex.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Hello,

It's been a while since I've tried a new kernel with my PI2 cards and 
just discovered that while the source is still included in 
drivers/net/hamradio/dmascc.c , it isn't possible to select via make 
menuconfig even when CONFIG_EXPERIMENTAL is set.

I hunted through the linux-hams archives and it looks like the code is 
still being updated, is there some other reason why dmascc is no longer 
a config option ?

					... Niall
