From: Gavin Rogers <grogers@vk6hgr.echidna.id.au>
Subject: ax25d and callsign*
Date: Mon, 29 Sep 2003 00:18:09 +0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <5.2.1.1.2.20030929001043.01b50860@joan.greenwood.wa.edu.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi All.

I'm running ax25d 0.0.8 on a 2.4.21 kernel and I can't get ax25d to accept 
connections based on the specified callsign being in the digipeater field 
as it is in the HOWTO. i.e.:

[VK6HGR-7* VIA loop]
default * * * * * *  - root  /usr/sbin/rsuplnk rsuplnk  rose


loop is an RS232 loopback KISS port, which otherwise works fine.

I expect to be able to use call like this to establish a connection to a 
ROSE network using:

call loop vk6bbr vk6hgr-7 5050 963909

But rsuplnk is never run and even if I change the command in ax25d that 
command never appears to be executed.

Any ideas? Is this functionality still in the kernel?

73
Gavin

---
Amateur radio station VK6HGR
http://vk6hgr.ampr.org/

Email : grogers@vk6hgr.echidna.id.au
Packet: vk6hgr@vk6hgr.#per.#wa.aus.oc

