From: Gavin Rogers <grogers@vk6hgr.echidna.id.au>
Subject: annoying ax25ipd problem
Date: Mon, 14 Apr 2003 16:04:53 +0800
Sender: linux-hams-owner@localhost
Message-ID: <5.1.0.14.2.20030414155514.01a782f0@202.74.170.196>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi All.

I'm having a problem with ax25ipd which I'm hoping someone can help me with.

A few of my AXUDP partners are on dial up links and their connections go 
down every so often. I have scripts in place on my gateway to make sure 
that the UDP packets destined for these people ends up in the right place.

The problem is, that the scripts are only run every few minutes and their 
dyndns.org (etc) entries take time to update, so there are times where my 
system does not know the correct IP for the AXUDP system.

In the mean time, the IP address that used to be allocated to that amateur 
is taken by someone else. This tickles a bug in AX25ipd - if, while sending 
AXUDP packets, the response is "connection refused", then ax25ipd will 
crash completely. This, in turn, exposes a bug in FBB, which will crash as 
it tries to open the now non-existent axip port.

I'm using ax25ipd version:

starbase:/etc# /usr/sbin/ax25ipd -v

ax25ipd Version 1.0.2 / 0.0.6
Copyright 1991, Michael Westerhof, Sun Microsystems, Inc.
This software may be freely used, distributed, or modified, providing
this header is not removed

Apart from writing a hack script to ensure that ax25ipd is always running 
(and restart it if it isn't), does anyone know how I can get around this 
problem?

Many thanks.


Regards,
Gavin Rogers

-- 
Amateur radio station VK6HGR
http://vk6hgr.ampr.org/

Email : grogers@vk6hgr.echidna.id.au
Ampr  : grogers@vk6hgr.ampr.org
Packet: vk6hgr@vk6hgr.#per.#wa.aus.oc

